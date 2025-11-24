function user_job_setup()
	-- Options: Override default values
	state.HybridMode:options('Normal')
    state.IdleMode:options('Normal')
	state.CastingMode:options('Normal')
	state.Weapons:options('Tizona','TizonaAcc','Clubsmelee','Nuke')

	autows = 'Expiacion'
	autofood = 'Soy Ramen'

	gear.obi_nuke_waist = "Orpheus's Sash"
	gear.obi_cure_waist = "Flume Belt +1"
	gear.obi_cure_back = "Tempered Cape +1"


	-- Additional local binds
	send_command('bind ^f gs c toggle AutoWSMode')
	send_command('bind !f gs c cycle weapons')
	send_command('bind numpad1 mount "Noble Chocobo"')

	select_default_macro_book()
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------


	sets.buff['Burst Affinity'] = {feet="Hashishin Basmak +2"}
	sets.buff['Chain Affinity'] = {head="Hashishin Kavuk +2"}
	sets.buff.Convergence = {}
	sets.buff.Diffusion = {feet="Luhlaza Charuqs +3"}
	sets.buff.Enchainment = {body="Luhlaza Jubbah +3"}
	sets.buff.Efflux = {legs="Hashishin Tayt +2"}

	sets.buff.Doom = set_combine(sets.buff.Doom, {
		neck="Nicander's Necklace",
		waist="Gishdubar Sash",
		left_ring="Blenmot's Ring +1",
		right_ring="Blenmot's Ring +1",
	})

	sets.precast.JA['Azure Lore'] = {hands="Luh. Bazubands +3"}

	sets.precast.FC = {
		ammo="Staunch Tathlum +1",
		head="Pinga Crown +1",
		body="Pinga Tunic +1",
		hands="Pinga Mittens +1",
		legs="Pinga Pants +1",
		feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},
		neck="Loricate Torque +1",
		waist="Flume Belt +1",
		left_ear="Genmei Earring",
		right_ear="Etiolation Earring",
		left_ring="Defending Ring",
		right_ring=" Kishar Ring",
		back={ name="Rosmerta's Cape", augments={'"Fast Cast"+10',}},
	}

	sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {body="Hashishin Mintan +2"})


	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
		ammo="Crepuscular Pebble",
		head="Hashishin Kavuk +2",
		body="Assim. Jubbah +3",
		hands="Jhakri Cuffs +2",
		legs="Luhlaza Shalwar +3",
		feet="Luhlaza Charuqs +3",
		neck={ name="Mirage Stole +2", augments={'Path: A',}},
		waist="Sailfi Belt +1",
		left_ear="Ishvara Earring",
		right_ear="Moonshade Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Sroda Ring",
		back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
	}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Requiescat'] = {
		ammo="Coiste Bodhar",
		head="Luh. Keffiyeh +3",
		body="Luhlaza Jubbah +3",
		hands="Luh. Bazubands +3",
		legs="Luhlaza Shalwar +3",
		feet="Luhlaza Charuqs +3",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Regal Earring",
		right_ear="Moonshade Earring",
		left_ring="Metamor. Ring +1",
		right_ring="Sroda Ring",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}

	sets.precast.WS['Realmrazer'] = sets.precast.WS['Requiescat']

	sets.precast.WS['Chant du Cygne'] = {
		ammo="Coiste Bodhar",
		head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
		body="Luhlaza Jubbah +3",
		hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
		legs="Luhlaza Shalwar +3",
		feet="Thereoid Greaves",
		neck={ name="Mirage Stole +2", augments={'Path: A',}},
		waist="Fotia Belt",
		left_ear="Telos Earring",
		right_ear="Moonshade Earring",
		left_ring="Begrudging Ring",
		right_ring="Chirich Ring +1",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Crit.hit rate+10',}},
	}

	sets.precast.WS['Vorpal Blade'] = sets.precast.WS['Chant du Cygne']

	sets.precast.WS['Savage Blade'] = sets.precast.WS

	sets.precast.WS['Expiacion'] = sets.precast.WS

	sets.precast.WS['Sanguine Blade'] = {
		ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",
		body="Hashishin Mintan +2",
		hands="Jhakri Cuffs +2",
		legs="Luhlaza Shalwar +3",
		feet="Hashishin Basmak +2",
		neck="Sanctity Necklace",
		waist="Orpheus's Sash",
		left_ear="Regal Earring",
		right_ear="Moonshade Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Archon Ring",
		back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
}

	sets.precast.WS['Burning Blade'] = set_combine(sets.precast.WS['Sanguine Blade'], {right_ring="Shiva's Ring +1", head="Hashishin Kavuk +2"})

	sets.precast.WS['Red Lotus Blade'] = set_combine(sets.precast.WS['Sanguine Blade'], {right_ring="Shiva's Ring +1", head="Hashishin Kavuk +2"})

	sets.precast.WS['Shining Blade'] = set_combine(sets.precast.WS['Sanguine Blade'], {right_ring="Shiva's Ring +1", head="Hashishin Kavuk +2"})

	sets.precast.WS['Seraph Blade'] = set_combine(sets.precast.WS['Sanguine Blade'], {right_ring="Shiva's Ring +1", head="Hashishin Kavuk +2"})

	sets.precast.WS['Shining Strike'] = set_combine(sets.precast.WS['Sanguine Blade'], {right_ring="Shiva's Ring +1", head="Hashishin Kavuk +2"})

	sets.precast.WS['Seraph Strike'] = set_combine(sets.precast.WS['Sanguine Blade'], {right_ring="Shiva's Ring +1", head="Hashishin Kavuk +2"})

	sets.precast.WS['Flash Nova'] = set_combine(sets.precast.WS['Sanguine Blade'], {right_ring="Shiva's Ring +1", head="Hashishin Kavuk +2"})



	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Cessance Earring",ear2="Brutal Earring"}

	-- Midcast Sets
	sets.midcast.FastRecast = {
		ammo="Sapience Orb",
		head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
		body="Pinga Tunic +1",
		hands="Pinga Mittens +1",
		legs="Pinga Pants +1",
		feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},
		neck="Incanter's Torque",
		left_ear="Etiolation Earring",
		left_ring="Prolix Ring",
		right_ring="Kishar Ring",
		back={ name="Rosmerta's Cape", augments={'"Fast Cast"+10',}},
	}

	sets.midcast['Blue Magic'] = {}

	sets.midcast['Blue Magic'].Physical = {
		ammo="Ginsen",
		head="Luh. Keffiyeh +3",
		body="Luhlaza Jubbah +3",
		hands="Luh. Bazubands +3",
		legs="Luhlaza Shalwar +3",
		feet="Luhlaza Charuqs +3",
		neck={ name="Mirage Stole +2", augments={'Path: A',}},
		waist="Sailfi Belt +1",
		left_ear="Telos Earring",
		right_ear="Cessance Earring",
		left_ring="Ilabrat Ring",
		right_ring="Petrov Ring",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}

	sets.midcast['Blue Magic'].PhysicalStr = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalDex = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalVit = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalAgi = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalInt = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalMnd = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalChr = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalHP = set_combine(sets.midcast['Blue Magic'].Physical, {})


	sets.midcast['Blue Magic'].Magical = {
		ammo="Pemphredo Tathlum",
		head="Hashishin Kavuk +2",
		body="Hashishin Mintan +2",
		hands="Hashi. Bazu. +2",
		legs="Hashishin Tayt +2",
		feet="Hashishin Basmak +2",
		neck="Sanctity Necklace",
		waist=gear.ElementalObi,
		left_ear="Regal Earring",
		right_ear="Friomisi Earring",
		left_ring="Metamor. Ring +1",
		right_ring="Shiva Ring +1",
		back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
	}

	sets.MagicBurst = set_combine(sets.midcast['Blue Magic'].Magical, {
		hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		neck="Warder's Charm +1",
		left_ring="Locus Ring",
		right_ring="Mujin Band",
	})
					 

	sets.midcast['Blue Magic'].MagicAccuracy = {
		ammo="Pemphredo Tathlum",
		head="Hashishin Kavuk +2",
		body="Hashishin Mintan +2",
		hands="Hashi. Bazu. +2",
		legs="Hashishin Tayt +2",
		feet="Malignance Boots",
		neck="Mirage Stole +2",
		waist="Luminary Sash",
		left_ear="Regal Earring",
		right_ear="Gwati Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Cornflower Cape"
	}

	sets.midcast['Enfeebling Magic'] = sets.midcast['Blue Magic'].MagicAccuracy

	sets.midcast['Dark Magic'] = sets.midcast['Blue Magic'].MagicAccuracy


	sets.midcast['Enhancing Magic'] = {
		head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +8',}},
		body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +8',}},
		hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +9',}},
		legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +9',}},
		feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +8',}},
		neck="Incanter's Torque",
		waist="Olympus Sash",
		left_ear="Andoaa Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Merciful Cape",
	}
		
	sets.midcast['Phalanx'] = {
		main="Sakpata's Sword",
		ammo="Staunch Tathlum +1",
		head={ name="Taeon Chapeau", augments={'"Snapshot"+4','Phalanx +3',}},
		body={ name="Taeon Tabard", augments={'"Fast Cast"+5','Phalanx +3',}},
		hands={ name="Taeon Gloves", augments={'Phalanx +3',}},
		legs={ name="Taeon Tights", augments={'Spell interruption rate down -9%','Phalanx +3',}},
		feet={ name="Taeon Boots", augments={'Phalanx +3',}},
		neck="Incanter's Torque",
		waist="Olympus Sash",
		left_ear="Genmei Earring",
		right_ear="Andoaa Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Merciful Cape",
	}

	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1", waist="Gishdubar Sash", back="Grapevine Cape"})

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1", legs="Shedir Seraweels", waist="Emphatikos Rope"})

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget", ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})

	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'])
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})

	sets.midcast['Divine Magic'] =	sets.midcast['Blue Magic'].Magical

	sets.midcast['Elemental Magic'] = sets.midcast['Blue Magic'].Magical



	sets.midcast.Helix = sets.midcast['Blue Magic'].Magical


	sets.element.Dark = {head="Pixie Hairpin +1",ring2="Archon Ring"}
	sets.element.Light = {} --ring2="Weatherspoon Ring"

	sets.midcast.Cure = {
		ammo="Staunch Tathlum +1",
		head="Pinga Crown +1",
		body="Pinga Tunic +1",
		hands="Pinga Mittens +1",
		legs="Pinga Pants +1",
		feet="Pinga Pumps",
		neck="Incanter's Torque",
		back=gear.nuke_jse_back,
		waist=gear.ElementalObi,
		left_ear="Mendi. Earring",
		right_ear="Etiolation Earring",
		left_ring="Stikini Ring +1",
		right_ring="Naji's Loop",
	}

	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {})

	-- Breath Spells --

	sets.midcast['Blue Magic'].Breath = sets.midcast['Blue Magic'].Magical

	-- Physical Added Effect Spells most notably "Stun" spells --

	sets.midcast['Blue Magic'].Stun = {
		ammo="Pemphredo Tathlum",
		head="Hashishin Kavuk +2",
		body="Hashishin Mintan +2",
		hands="Hashi. Bazu. +2",
		legs="Hashishin Tayt +2",
		feet="Malignance Boots",
		neck={ name="Mirage Stole +2", augments={'Path: A',}},
		waist="Eschan Stone",
		left_ear="Telos Earring",
		right_ear="Regal Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
	}

	-- Other Specific Spells --

	sets.midcast['Blue Magic']['White Wind'] = {
		ammo="Staunch Tathlum +1",
		head="Pinga Crown +1",
		body="Pinga Tunic +1",
		hands="Pinga Mittens +1",
		legs="Pinga Pants +1",
		feet="Pinga Pumps",
		neck="Incanter's Torque",
		waist=gear.ElementalObi,
		left_ear="Mendi. Earring",
		right_ear="Etiolation Earring",
		left_ring="Stikini Ring +1",
		right_ring="Naji's Loop",
		back="Moonlight Cape",
	}

	sets.midcast['Blue Magic']['Healing Breeze'] = sets.midcast['Blue Magic']['White Wind']

	sets.midcast['Blue Magic'].Healing = {
		ammo="Staunch Tathlum +1",
		head="Pinga Crown +1",
		body="Pinga Tunic +1",
		hands="Pinga Mittens +1",
		legs="Pinga Pants +1",
		feet="Pinga Pumps",
		neck="Incanter's Torque",
		back=gear.nuke_jse_back,
		waist=gear.ElementalObi,
		left_ear="Mendi. Earring",
		right_ear="Etiolation Earring",
		left_ring="Stikini Ring +1",
		right_ring="Naji's Loop",

	}

	sets.midcast['Blue Magic'].SkillBasedBuff = {
		ammo="Staunch Tathlum +1",
		head="Luh. Keffiyeh +3",
		body="Assim. Jubbah +3",
		hands="Hashi. Bazu. +2",
		legs="Pinga Pants +1",
		feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},
		neck="Mirage Stole +2",
		waist="Flume Belt +1",
		left_ear="Genmei Earring",
		right_ear="Etiolation Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Cornflower Cape", augments={'MP+23','DEX+1','Blue Magic skill +9',}},
	}

	sets.midcast['Blue Magic'].Buff = {
		ammo="Staunch Tathlum +1",
		head="Pinga Crown +1",
		body="Pinga Tunic +1",
		hands="Hashi. Bazu. +2",
		legs="Pinga Pants +1",
		feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},
		neck="Loricate Torque +1",
		waist="Flume Belt +1",
		left_ear="Genmei Earring",
		right_ear="Etiolation Earring",
		left_ring="Defending Ring",
		right_ring="Gelatinous Ring +1",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}

	sets.midcast['Blue Magic']['Battery Charge'] = {head="Amalric Coif +1", waist="Gishdubar Sash", back="Grapevine Cape"}





	sets.latent_refresh = {waist="Fucho-no-obi"}

	-- lol
	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.Learning = {hands="Assim. Bazu. +3"}
	-- lol

	sets.idle = {
		ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",
		body="Hashishin Mintan +2",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Warder's Charm +1",
		waist="Carrier's Sash",
		left_ear="Genmei Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}

	sets.Kiting = {ring2="Shneddick Ring"}

	sets.TreasureHunter = {
		ammo="Perfect Lucky Egg",
		feet={ name="Herculean Boots", augments={'"Avatar perpetuation cost" -1','Mag. Acc.+14','"Treasure Hunter"+2','Accuracy+7 Attack+7',}},
		waist="Chaac Belt",
	}

	sets.midcast['Enervation'] = set_combine(sets.midcast['Blue Magic'].MagicAccuracy, {
		ammo="Perfect Lucky Egg",
		feet={ name="Herculean Boots", augments={'"Avatar perpetuation cost" -1','Mag. Acc.+14','"Treasure Hunter"+2','Accuracy+7 Attack+7',}},
		waist="Chaac Belt",
	})
	

	sets.weapons.Tizona = {main="Tizona",sub="Machaera +2"}
	sets.weapons.TizonaAcc = {main="Tizona",sub="Sakpata's Sword"}
	sets.weapons.Clubsmelee = {main="Maxentius",sub="Machaera +2"}
	sets.weapons.Nuke = {Main="Maxentius",Sub="Sakpata's Sword"}

	sets.weapons.lowlevel = {main="Blizzard Brand +1",sub="Soulflayer's Wand"}


	sets.engaged = {
		ammo="Coiste Bodhar",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck={ name="Mirage Stole +2", augments={'Path: A',}},
		waist="Reiki Yotai",
		left_ear="Telos Earring",
		right_ear="Eabani Earring",
		left_ring="Defending Ring",
		right_ring="Chirich Ring +1",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}



	sets.engaged.AM = set_combine(sets.engaged, {back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},})



	sets.Phalanx_Received = {
		head={ name="Taeon Chapeau", augments={'"Snapshot"+4','Phalanx +3',}},
		body={ name="Taeon Tabard", augments={'"Fast Cast"+5','Phalanx +3',}},
		hands={ name="Taeon Gloves", augments={'Phalanx +3',}},
		legs={ name="Taeon Tights", augments={'Spell interruption rate down -9%','Phalanx +3',}},
		feet={ name="Taeon Boots", augments={'Phalanx +3',}},
	}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
		set_macro_page(1, 1)
end


-- function job_post_midcast(spell, action, spellMap, eventArgs)
-- if spell.element == world.weather_element or spell.element == world.day_element then
--	equip({waist="Hachirin-no-Obi"})
--	end
--
--	if spell.skill == 'Blue Magic' and buffactive['Diffusion'] then
--		equip({feet="Luhlaza Charuqs +3"})
--		end
--end
