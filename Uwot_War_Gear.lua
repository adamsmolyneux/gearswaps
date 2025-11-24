function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc')
    state.WeaponskillMode:options('Match')
    state.PhysicalDefenseMode:options('PDT', 'PDTReraise')
    state.MagicalDefenseMode:options('MDT', 'MDTReraise')
	state.ResistDefenseMode:options('MEVA')


	state.Weapons:options('Chango','Sword','Club','Polearm','Greatsword')

	autows_list = {['Chango']="Upheaval", ['Sword']="Savage Blade", ['Club']="Judgment", ['Polearm']="Impulse Drive", ['Greatsword']="Resolution"}

	send_command('bind ^f gs c toggle AutoWSMode')
	send_command('bind !f gs c cycle weapons')
	send_command('bind numpad1 mount "Noble Chocobo"')
	send_command('bind ^` gs c cycle OffenseMode')

	select_default_macro_book()
end

function init_gear_sets()

	-- Weapons sets
	sets.weapons.Chango = {main="Chango",sub="Utu Grip"}
	sets.weapons.Sword = {main="Naegling",sub="Blurred Shield +1"}
	sets.weapons.Club = {main="Loxotic Mace +1",sub="Blurred Shield"}
	sets.weapons.Polearm = {main="Shining One",sub="Utu Grip"}
	sets.weapons.Greatsword = {main="Montante +1",sub="Utu Grip"}

	
	sets.Enmity = {
		ammo="Sapience Orb",
		head="Halitus Helm",
		body={ name="Souv. Cuirass +1", augments={'HP+65','STR+12','Accuracy+13',}},
		hands="Sakpata's Gauntlets",
		legs="Sakpata's Cuisses",
		feet="Sakpata's Leggings",
		neck="Unmoving Collar",
		waist="Flume Belt +1",
		left_ear="Cryptic Earring",
		left_ring="Defending Ring",
		right_ring="Gelatinous Ring +1",
		back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}
	sets.Knockback = {}
	sets.passive.Twilight = {}
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Berserk'] = {back="Cichol's Mantle", feet="Agoge Calligae +1"}
	sets.precast.JA['Warcry'] = {head="Agoge Mask +3"}
	sets.precast.JA['Defender'] = {}
	sets.precast.JA['Aggressor'] = {head="Pummeler's Mask +1"}
	sets.precast.JA['Mighty Strikes'] = {}
	sets.precast.JA["Warrior's Charge"] = {}
	sets.precast.JA['Tomahawk'] = {ammo="Thr. Tomahawk", feet="Agoge Calligae +1"}
	sets.precast.JA['Retaliation'] = {}
	sets.precast.JA['Restraint'] = {}
	sets.precast.JA['Blood Rage'] = {body="Boii Lorica +2"}
	sets.precast.JA['Brazen Rush'] = {}
	sets.precast.JA['Provoke'] = set_combine(sets.Enmity,{})
                   


	sets.precast.FC = {}
	
	sets.precast.WS = {
		ammo="Knobkierrie",
		head="Agoge Mask +3",
		body="Pumm. Lorica +3",
		hands="Boii Mufflers +2",
		legs="Sakpata's Cuisses",
		feet="Sulev. Leggings +2",
		neck={ name="War. Beads +2", augments={'Path: A',}},
		waist="Sailfi Belt +1",
		left_ear="Thrud Earring",
		right_ear="Moonshade Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}

	sets.precast.WS["Upheaval"] ={
		ammo="Knobkierrie",
		head="Agoge Mask +3",
		body="Pumm. Lorica +3",
		hands="Boii Mufflers +2",
		legs="Sakpata's Cuisses",
		feet="Sulev. Leggings +2",
		neck={ name="War. Beads +2", augments={'Path: A',}},
		waist="Sailfi Belt +1",
		left_ear="Thrud Earring",
		right_ear="Moonshade Earring",
		left_ring="Gelatinous Ring +1",
		right_ring="Niqmaddu Ring",
		back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}

	sets.precast.WS["Ukko's Fury"] = {
		ammo="Knobkierrie",
		head="Agoge Mask +3",
		body="Hjarrandi Breast.",
		hands="Flam. Manopolas +2",
		legs="Sakpata's Cuisses",
		feet="Sakpata's Leggings",
		neck={ name="War. Beads +2", augments={'Path: A',}},
		waist="Sailfi Belt +1",
		left_ear="Thrud Earring",
		right_ear="Moonshade Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}

	sets.precast.WS["Full Break"] = {
		ammo="Pemphredo Tathlum",
		head="Sakpata's Helm",
		body="Sakpata's Plate",
		hands="Sakpata's Gauntlets",
		legs="Sakpata's Cuisses",
		feet="Sakpata's Leggings",
		neck="Sanctity Necklace",
		waist="Eschan Stone",
		left_ear="Gwati Earring",
		right_ear="Moonshade Earring",
		left_ring="Metamor. Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}

	sets.precast.WS['Armor Break'] = sets.precast.WS['Full Break']
	sets.precast.WS['Weapon Break'] = sets.precast.WS['Full Break']
	sets.precast.WS['Shield Break'] = sets.precast.WS['Full Break']

	sets.precast.WS["Resolution"] = {
		ammo="Coiste Bodhar",
		head="Sakpata's Helm",
		body="Sakpata's Plate",
		hands="Sakpata's Gauntlets",
		legs="Sakpata's Cuisses",
		feet="Sakpata's Leggings",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Moonshade Earring",
		right_ear={ name="Boii Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+7','Mag. Acc.+7',}},
		left_ring="Flamma Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}

	sets.precast.WS["Shockwave"] = {
		ammo="Knobkierrie",
		head="Agoge Mask +3",
		body="Pumm. Lorica +3",
		hands="Boii Mufflers +2",
		legs="Sakpata's Cuisses",
		feet="Sulev. Leggings +2",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Thrud Earring",
		right_ear="Moonshade Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}

	sets.precast.WS["Red Lotus Blade"] = {
		ammo="Pemphredo Tathlum",
		head="Agoge Mask +3",
		body="Pumm. Lorica +3",
		hands={ name="Valorous Mitts", augments={'"Mag.Atk.Bns."+20','Sklchn.dmg.+3%','INT+1',}},
		legs={ name="Valorous Hose", augments={'"Mag.Atk.Bns."+24','Pet: "Dbl.Atk."+2 Pet: Crit.hit rate +2','Phalanx +2','Mag. Acc.+13 "Mag.Atk.Bns."+13',}},
		feet={ name="Valorous Greaves", augments={'"Mag.Atk.Bns."+25','Crit.hit rate+4','Attack+10',}},
		neck="Sanctity Necklace",
		waist="Orpheus's Sash",
		left_ear="Friomisi Earring",
		right_ear="Moonshade Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Metamor. Ring +1",
		back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}

	sets.precast.WS["Seraph Blade"] = sets.precast.WS["Red Lotus Blade"]

	sets.idle = {
		ammo="Coiste Bodhar",
		head="Sakpata's Helm",
		body="Sakpata's Plate",
		hands="Sakpata's Gauntlets",
		legs="Sakpata's Cuisses",
		feet="Sakpata's Leggings",
		neck="Warder's Charm +1",
		waist="Carrier's Sash",
		left_ear="Brutal Earring",
		right_ear="Boii Earring",
		left_ring="Defending Ring",
		right_ring="Shneddick Ring",
		back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}

	sets.buff.Doom = set_combine(sets.buff.Doom, {
		neck="Nicander's Necklace",
		waist="Gishdubar Sash",
		left_ring="Blenmot's Ring +1",
		right_ring="Blenmot's Ring +1",
	})

	sets.buff.Sleep = {neck="Berserker's Torque"}

	sets.buff.Retaliation = {}
	sets.buff.Restraint = {}

	sets.TreasureHunter = {
			ammo="Perfect Lucky Egg",
			waist="Chaac Belt",
		}

     sets.engaged = {
		 ammo="Coiste Bodhar",
		 head="Sakpata's Helm",
		 body="Sakpata's Plate",
		 hands="Sakpata's Gauntlets",
		 legs="Sakpata's Cuisses",
		 feet="Sakpata's Leggings",
		 neck={ name="War. Beads +2", augments={'Path: A',}},
		 waist="Sailfi Belt +1",
		 left_ear="Brutal Earring",
		 right_ear="Boii Earring",
		 left_ring="Chirich Ring +1",
		 right_ring="Niqmaddu Ring",
		 back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	 }

	 sets.engaged.Acc = {
		 ammo="Coiste Bodhar",
		 head="Sakpata's Helm",
		 body="Boii Lorica +2",
		 hands="Sakpata's Gauntlets",
		 legs="Pumm. Cuisses +2",
		 feet="Pumm. Calligae +3",
		 neck={ name="War. Beads +2", augments={'Path: A',}},
		 waist="Sailfi Belt +1",
		 left_ear="Telos Earring",
		 right_ear={ name="Boii Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+7','Mag. Acc.+7',}},
		 left_ring="Chirich Ring +1",
		 right_ring="Chirich Ring +1",
		 back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	 }

end
	

function select_default_macro_book()
        set_macro_page(1, 4)
end


function job_check_buff()
if state.AutoBuffMode.value ~= 'Off' and in_combat then

	local abil_recasts = windower.ffxi.get_ability_recasts()

	if not state.Buff.Retaliation and abil_recasts[8] < latency then
		windower.chat.input('/ja "Retaliation" <me>')
		add_tick_delay()
		return true
		elseif not state.Buff.Restraint and abil_recasts[9] < latency then
			windower.chat.input('/ja "Restraint" <me>')
			add_tick_delay()
			return true
			elseif not buffactive['Blood Rage'] and not buffactive['Warcry'] and abil_recasts[2] > latency and abil_recasts[11] < latency
				then windower.chat.input('/ja "Blood Rage" <me>')
				tickdelay = os.clock() + 1.1
				return true
				elseif not state.Buff.Berserk and abil_recasts[1] < latency then
					windower.chat.input('/ja "Berserk" <me>')
					add_tick_delay()
					return true
					elseif not state.Buff.Aggressor and abil_recasts[4] < latency then
						windower.chat.input('/ja "Aggressor" <me>')
						add_tick_delay()
						return true
						else
							return false
							end
							end
							end




