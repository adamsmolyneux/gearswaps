function user_job_setup()

    state.OffenseMode:options('Normal','Acc')
    state.WeaponskillMode:options('Match')

	state.Weapons:options('Chango','Sword','Club','Polearm','Greatsword')

	autows_list = {['Chango']="Upheaval", ['Sword']="Savage Blade", ['Club']="Judgment", ['Polearm']="Impulse Drive", ['Greatsword']="Resolution"}

	send_command('bind !f gs c cycle weapons')
	send_command('bind ^` gs c cycle OffenseMode')

	send_command('bind ^f gs c toggle AutoWSMode')
	send_command('bind %~f gs c toggle autobuffmode')

	send_command('bind numpad1 mount "Noble Chocobo"')

	select_default_macro_book()
end

function init_gear_sets()


	sets.weapons.Chango = {main="Chango",sub="Utu Grip"}
	sets.weapons.Sword = {main="Naegling",sub="Blurred Shield +1"}
	sets.weapons.Club = {main="Loxotic Mace +1",sub="Blurred Shield +1"}
	sets.weapons.Polearm = {main="Shining One",sub="Utu Grip"}
	sets.weapons.Greatsword = {main="Montante +1",sub="Utu Grip"}


	sets.precast.JA['Berserk'] = {back="Cichol's Mantle", feet="Agoge Calligae +1"}
	sets.precast.JA['Warcry'] = {head="Agoge Mask +3"}
	sets.precast.JA['Aggressor'] = {head="Pummeler's Mask +1"}
	sets.precast.JA['Mighty Strikes'] = {}
	sets.precast.JA["Warrior's Charge"] = {}
	sets.precast.JA['Tomahawk'] = {ammo="Thr. Tomahawk", feet="Agoge Calligae +1"}
	sets.precast.JA['Blood Rage'] = {body="Boii Lorica +2"}
	sets.precast.JA['Provoke'] = set_combine(sets.Enmity,{})
                   

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
		right_ear="Ishvara Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}

	sets.precast.WS["Red Lotus Blade"] = {
		ammo="Knobkierrie",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Sanctity Necklace",
		waist="Orpheus's Sash",
		left_ear="Friomisi Earring",
		right_ear="Moonshade Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Metamor. Ring +1",
		back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}

	sets.precast.WS["Seraph Blade"] = sets.precast.WS["Red Lotus Blade"]
	sets.precast.WS["Sanguine Blade"] = set_combine(sets.precast.WS["Red Lotus Blade"],{
		head="Pixie Hairpin +1",
		left_ring="Archon Ring"
	})

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
if state.AutoBuffMode.value ~= 'Off' and player.in_combat then

	local abil_recasts = windower.ffxi.get_ability_recasts()

	if not buffactive.Retaliation and abil_recasts[8] < latency then
		windower.chat.input('/ja "Retaliation" <me>')
		tickdelay = os.clock() + 1.1
		return true
		elseif not buffactive.Restraint and abil_recasts[9] < latency then
			windower.chat.input('/ja "Restraint" <me>')
			tickdelay = os.clock() + 1.1
			return true
				elseif not buffactive.Berserk and abil_recasts[1] < latency then
					windower.chat.input('/ja "Berserk" <me>')
					tickdelay = os.clock() + 1.1
					return true
					elseif not buffactive.Aggressor and abil_recasts[4] < latency then
						windower.chat.input('/ja "Aggressor" <me>')
						tickdelay = os.clock() + 1.1
						return true
						else
							return false
							end
							end
							end

function job_precast(spell, spellMap, eventArgs)
if spell.type == 'WeaponSkill' then
	if state.AutoBuffMode.value ~= 'Off' then
		local abil_recasts = windower.ffxi.get_ability_recasts()
		if player.tp < 2250 and not state.Buff['Blood Rage'] and not state.Buff.Warcry and abil_recasts[2] < latency then
			eventArgs.cancel = true
			windower.chat.input('/ja "Warcry" <me>')
			windower.chat.input:schedule(1.1,'/ws "'..spell.english..'" '..spell.target.raw..'')
			add_tick_delay(1.1)
			return
				elseif not buffactive['Blood Rage'] and not buffactive['Warcry'] and abil_recasts[2] > latency and abil_recasts[11] < latency then
					eventArgs.cancel = true
					windower.chat.input('/ja "Blood Rage" <me>')
					windower.chat.input:schedule(1.1,'/ws "'..spell.english..'" '..spell.target.raw..'')
					tickdelay = os.clock() + 1.1
					return true
			elseif state.Buff['SJ Restriction'] then
				return
				elseif player.sub_job == 'SAM' and player.tp > 1850 and abil_recasts[140] < latency then
					eventArgs.cancel = true
					windower.chat.input('/ja "Sekkanoki" <me>')
					windower.chat.input:schedule(1.1,'/ws "'..spell.english..'" '..spell.target.raw..'')
					add_tick_delay(1.1)
					return
					elseif player.sub_job == 'SAM' and abil_recasts[134] < latency then
						eventArgs.cancel = true
						windower.chat.input('/ja "Meditate" <me>')
						windower.chat.input:schedule(1.1,'/ws "'..spell.english..'" '..spell.target.raw..'')
						add_tick_delay(1.1)
						return
						end
						end
						elseif spell.type == "JobAbility" then
							if spell.english == 'Berserk' then
								if state.ConquerorMode.value == 'Always' or (state.ConquerorMode.value ~= 'Never' and tonumber(state.ConquerorMode.value) > player.tp) then
									internal_enable_set("Weapons")
									end
									end
									end
									end


function job_filtered_action(spell, eventArgs)
if spell.type == 'WeaponSkill' then
	local available_ws = S(windower.ffxi.get_abilities().weapon_skills)
	-- WS 112 is Double Thrust, meaning a Spear is equipped.
	if available_ws:contains(48) then
		if spell.english == "Upheaval" then
			windower.chat.input('/ws "Resolution" '..spell.target.raw)
			cancel_spell()
			eventArgs.cancel = true
			elseif spell.english == "Fell Cleave" then
				send_command('@input /ws "Shockwave" '..spell.target.raw)
				cancel_spell()
				eventArgs.cancel = true
				end
				end
				end
				end




