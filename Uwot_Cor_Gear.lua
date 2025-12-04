-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
	state.OffenseMode:options('Normal','Acc')
	state.RangedMode:options('Normal', 'Acc')
	state.WeaponskillMode:options('Match','Acc','Proc')
	state.CastingMode:options('Normal','Fodder','Proc')
	state.IdleMode:options('Normal', 'PDT', 'Refresh')
	state.HybridMode:options('Normal','DT')
	state.Weapons:options('DualSavage','DualEvisceration','DualLeadenMelee','DualAeolian','DualLeadenRanged','DualRanged','Savage','Evisceration','Ranged')

	autows_list = {['Evisceration']='Evisceration',['Savage']='Savage Blade',['Ranged']='Last Stand',['DualSavage']='Savage Blade',['DualEvisceration']='Evisceration',['DualLeadenRanged']='Leaden Salute',['DualLeadenMelee']='Leaden Salute',['DualAeolian']='Aeolian Edge',['DualRanged']='Last Stand'}

	state.CompensatorMode:options('Always','300','1000','Never')

	gear.RAbullet = "Chrono Bullet"
	gear.WSbullet = "Chrono Bullet"
	gear.MAbullet = "Chrono Bullet" --For MAB WS, do not put single-use bullets here.
	gear.QDbullet = "Animikii Bullet"
	options.ammo_warning_limit = 15
	--Ikenga_vest_bonus = 190  -- It is 190 at R20. Uncomment if you need to manually adjust because you are using below R20

	-- Additional local binds


	send_command('bind numpad0 ja Double-Up <me>')
	send_command('bind !f gs c cycle weapons')
	send_command('bind ^` gs c cycle OffenseMode')

	send_command('bind %~` gs c toggle rnghelper')
	send_command('bind ^f gs c toggle AutoWSMode')
	send_command('bind %~f gs c toggle autobuffmode')
	send_command('bind numpad7 gs c toggle autoremovedoommode')

	send_command('bind numpad1 mount "Noble Chocobo"')

	select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------

	sets.weapons.DualSavage = {main="Naegling",sub="Blurred Knife +1",range="Anarchy +3"}
	sets.weapons.DualEvisceration = {main="Tauret",sub="Blurred Knife +1",range="Anarchy +3"}
	sets.weapons.DualLeadenMelee = {main={ name="Rostam", augments={'Path: A',}},sub="Blurred Knife +1",range="Fomalhaut"}
	sets.weapons.DualAeolian = {main={ name="Rostam", augments={'Path: A',}},sub="Blurred Knife +1",range="Anarchy +3"}

	sets.weapons.DualLeadenRanged = {main={ name="Rostam", augments={'Path: A',}},sub={ name="Rostam", augments={'Path: C',}},range="Fomalhaut"}
	sets.weapons.DualRanged = {main={ name="Rostam", augments={'Path: A',}},sub={ name="Rostam", augments={'Path: C',}},range="Fomalhaut"}

	sets.weapons.Savage = {main="Naegling",sub="Nusku Shield",range="Anarchy +3"}
	sets.weapons.Evisceration = {main="Tauret",sub="Nusku Shield",range="Anarchy +3"}
	sets.weapons.Ranged = {main={ name="Rostam", augments={'Path: A',}},sub="Nusku Shield",range="Fomalhaut"}

	sets.precast.JA['Triple Shot'] = {body="Chasseur's Frac +1"}
	sets.precast.JA['Snake Eye'] = {legs="Lanun Trews +3"}
	sets.precast.JA['Wild Card'] = {feet="Lanun Bottes +3"}
	sets.precast.JA['Random Deal'] = {body="Lanun Frac +3"}
	sets.precast.JA['Double Up'] = {main={ name="Rostam", augments={'Path: C',}},}
	sets.precast.FoldDoubleBust = {hands="Lanun Gants +3"}

	sets.precast.CorsairRoll = {
		main={ name="Rostam", augments={'Path: C',}},
		range="Compensator",
		head="Lanun Tricorne +3",
		body="Nyame Mail",
		hands="Chasseur's Gants +1",
		legs="Desultor Tassets",
		feet="Nyame Sollerets",
		neck="Regal Necklace",
		waist="Carrier's Sash",
		left_ear="Etiolation Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Murky Ring",
		right_ring="Defending Ring",
		back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10','Phys. dmg. taken-10%',}},
	}


	sets.precast.LuzafRing = {ring2="Luzaf's Ring"}

	sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Chas. Culottes +1"})
	sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Chass. Bottes +1"})
	sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Chass. Tricorne +1"})
	sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur's Frac +1"})
	sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Chasseur's Gants +1"})
	sets.precast.CorsairRoll["Bolter's Roll"] = set_combine(sets.precast.CorsairRoll, {})
	sets.precast.CorsairRoll.Recast = {}
	sets.precast.CorsairRoll.Weak = {}

	--Standard TP Generating Shot
	sets.precast.CorsairShot = {
		ammo="Animikii Bullet",
		head="Nyame Helm",
		body="Lanun Frac +3",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Lanun Bottes +3",
		neck={ name="Comm. Charm +2", augments={'Path: A',}},
		waist="Eschan Stone",
		left_ear="Friomisi Earring",
		right_ear="Hecate's Earring",
		left_ring="Crepuscular Ring",
		right_ring="Dingir Ring",
		back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
	}

	--Macc Shot for Sleep/Dispel
	sets.precast.CorsairShot['Light Shot'] = {
		ammo="Animikii Bullet",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck={ name="Comm. Charm +2", augments={'Path: A',}},
		waist="Eschan Stone",
		left_ear="Telos Earring",
		right_ear="Gwati Earring",
		left_ring="Crepuscular Ring",
		right_ring="Metamor. Ring +1",
		back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
	}

	sets.precast.CorsairShot['Dark Shot'] = set_combine(sets.precast.CorsairShot['Light Shot'], {})
	


	-- Fast cast sets for spells

	sets.precast.FC = {
		head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
		body={ name="Taeon Tabard", augments={'"Fast Cast"+5','Phalanx +3',}},
		hands={ name="Leyline Gloves", augments={'Accuracy+14','Mag. Acc.+13','"Mag.Atk.Bns."+13','"Fast Cast"+2',}},
		legs={ name="Herculean Trousers", augments={'Mag. Acc.+24','"Fast Cast"+5',}},
		feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},
		neck="Orunmila's Torque",
		right_ear="Etiolation Earring",
		left_ring="Lebeche Ring",
		right_ring="Kishar Ring",
	}


	sets.precast.RA = {
		ammo="Chrono Bullet",
		head={ name="Taeon Chapeau", augments={'"Snapshot"+4','Phalanx +3',}},
		body="Laksa. Frac +3",
		hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
		feet="Meg. Jam. +2",
		neck={ name="Comm. Charm +2", augments={'Path: A',}},
		waist="Impulse Belt",
		left_ring="Crepuscular Ring",
		back={ name="Camulus's Mantle", augments={'"Snapshot"+10',}},
	}

	sets.precast.RA.Flurry = set_combine(sets.precast.RA, {})
	sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {})


	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
		head="Meghanada Visor +2",
		body="Laksa. Frac +3",
		hands="Meg. Gloves +2",
		legs="Meg. Chausses +2",
		feet="Lanun Bottes +3",
		neck={ name="Comm. Charm +2", augments={'Path: A',}},
		waist="Sailfi Belt +1",
		left_ear="Moonshade Earring",
		right_ear="Ishvara Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Sroda Ring",
		back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}

	sets.precast.WS['Evisceration'] = {
		head="Blistering Sallet +1",
		body="Meg. Cuirie +2",
		hands="Mummu Wrists +2",
		legs="Meg. Chausses +2",
		feet="Mummu Gamash. +2",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Moonshade Earring",
		right_ear="Mache Earring +1",
		left_ring="Ilabrat Ring",
		right_ring="Begrudging Ring",
		back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}

	sets.precast.WS['Last Stand'] = {
		ammo="Chrono Bullet",
		head="Lanun Tricorne +3",
		body="Laksa. Frac +3",
		hands="Meg. Gloves +2",
		legs="Meg. Chausses +2",
		feet="Lanun Bottes +3",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Moonshade Earring",
		right_ear="Ishvara Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Dingir Ring",
		back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
	}

	sets.precast.WS['Leaden Salute'] = {
		ammo="Chrono Bullet",
		head="Nyame Helm",
		body="Lanun Frac +3",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Lanun Bottes +3",
		neck={ name="Comm. Charm +2", augments={'Path: A',}},
		waist="Eschan Stone",
		left_ear="Moonshade Earring",
		right_ear="Friomisi Earring",
		left_ring="Archon Ring",
		right_ring="Dingir Ring",
		back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
	}

	sets.precast.WS['Wildfire'] = {
		ammo="Chrono Bullet",
		head="Nyame Helm",
		body="Lanun Frac +3",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Lanun Bottes +3",
		neck={ name="Comm. Charm +2", augments={'Path: A',}},
		waist="Eschan Stone",
		left_ear="Hecate's Earring",
		right_ear="Friomisi Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Dingir Ring",
		back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
	}

	sets.precast.WS['Aeolian Edge'] = {
		head="Nyame Helm",
		body="Lanun Frac +3",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Lanun Bottes +3",
		neck={ name="Comm. Charm +2", augments={'Path: A',}},
		waist="Eschan Stone",
		left_ear="Moonshade Earring",
		right_ear="Friomisi Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Dingir Ring",
		back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
	}


	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}

	-- Midcast Sets
	sets.midcast.FastRecast = {}

	-- Specific spells

	sets.midcast.Cure = {}

	sets.midcast.Utsusemi = sets.midcast.FastRecast

	-- Ranged gear
	sets.midcast.RA = {
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Iskur Gorget",
		waist="Yemaya Belt",
		left_ear="Dedition Earring",
		right_ear="Telos Earring",
		left_ring="Crepuscular Ring",
		right_ring="Dingir Ring",
		back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10','Phys. dmg. taken-10%',}},
	}

	sets.buff['Triple Shot'] = {
		body="Chasseur's Frac +1"
	}



	sets.buff.Doom = set_combine(sets.buff.Doom, {})



	-- Idle sets
	sets.idle = {
		ammo="Chrono Bullet",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Warder's Charm +1",
		waist="Chrono Bullet Pouch",
		left_ear="Genmei Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Murky Ring",
		right_ring="Shneddick Ring",
		back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}

	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})

	-- Weapons sets






	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee group
	sets.engaged = {
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Iskur Gorget",
		waist="Sailfi Belt +1",
		left_ear="Dedition Earring",
		right_ear="Telos Earring",
		left_ring="Murky Ring",
		right_ring="Chirich Ring +1",
		back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}

	sets.engaged.DW = {
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Iskur Gorget",
		waist="Reiki Yotai",
		left_ear="Eabani Earring",
		right_ear="Telos Earring",
		left_ring="Murky Ring",
		right_ring="Chirich Ring +1",
		back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
		set_macro_page(1, 6)
end

