function user_job_setup()
    state.OffenseMode:options('SubtleBlow','TP','Squish')
    state.WeaponskillMode:options('Normal', 'PDL')
	state.IdleMode:options('Normal')
	state.Weapons:options('Verethragna','Godhands','Xoanon')

	autows_list = {['Verethragna']="Victory Smite", ['Godhands']="Dragon Kick",['Xoanon']="Shell Crusher"}

	autowstp = 1000

    update_melee_groups()
	
	send_command('bind !f gs c cycle weapons')
	send_command('bind ^` gs c cycle OffenseMode')
	send_command('bind !^f gs c cycle WeaponskillMode')

	send_command('bind ^f gs c toggle AutoWSMode')
	send_command('bind %~f gs c toggle autobuffmode')
	send_command('bind numpad7 gs c toggle autoremovedoommode')

	send_command('bind numpad1 mount "Noble Chocobo"')

	
	select_default_macro_book()
end

function init_gear_sets()

	sets.weapons.Verethragna = {main="Verethragna"}
	sets.weapons.Godhands = {main="Godhands"}
	sets.weapons.Xoanon = {main="Xoanon",sub="Elder's Grip +1"}

	sets.precast.JA['Hundred Fists'] = {legs="Hesychast's Hose +3"}
	sets.precast.JA['Dodge'] = {feet="Anchorite's Gaiters +4"}
	sets.precast.JA['Focus'] = {head="Anchorite's Crown +2"}
	sets.precast.JA['Counterstance'] = {feet="Hesychast's Gaiters +3"}
	sets.precast.JA['Footwork'] = {feet="Shukuyu Sune-Ate"}
	sets.precast.JA['Formless Strikes'] = {body="Hesychast's Cyclas +3"}
	sets.precast.JA['Mantra'] = {feet="Hesychast's Gaiters +3"}
	sets.precast.JA['Boost'] = {}

	sets.precast.JA['Chi Blast'] = {head="Hesychast's Crown +3"}
	
	sets.precast.JA['Chakra'] = {
		body="Anchorite's Cyclas +2",
		hands="Hesychast's Gloves +3"
		}


	sets.precast.JA['Provoke'] = {
		ammo="Hoxne Ampulla",
		head="Halitus Helm",
		body="Emet Harness +1",
		hands="Kurys Gloves",
		legs="Bhikku Hose +3",
		feet="Ahosi Leggings",
		neck="Warder's Charm +1",
		waist="Moonbow Belt +1",
		left_ear="Etiolation Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Murky Ring",
		right_ring="Gelatinous Ring +1",
		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}

	
	sets.precast.FC = {
		ammo="Hoxne Ampulla",
		head={ name="Herculean Helm", augments={'"Fast Cast"+5','Mag. Acc.+7','"Mag.Atk.Bns."+6',}},
		body={ name="Taeon Tabard", augments={'"Fast Cast"+5','Phalanx +3',}},
		hands={ name="Leyline Gloves", augments={'Accuracy+14','Mag. Acc.+13','"Mag.Atk.Bns."+13','"Fast Cast"+2',}},
		legs={ name="Herculean Trousers", augments={'Mag. Acc.+24','"Fast Cast"+5',}},
		feet={ name="Herculean Boots", augments={'Mag. Acc.+2 "Mag.Atk.Bns."+2','"Fast Cast"+6','Mag. Acc.+13',}},
		neck="Warder's Charm +1",
		left_ear="Etiolation Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Prolix Ring",
		right_ring="Naji's Loop",
	}

	sets.precast.WS = {
		ammo="Hoxne Ampulla",
		head="Mpaca's Cap",
		body="Bhikku Cyclas +2",
		hands="Hes. Gloves +3",
		legs="Bhikku Hose +3",
		feet="Mpaca's Boots",
		neck="Fotia Gorget",
		waist="Moonbow Belt +1",
		left_ear="Moonshade Earring",
		right_ear="Sherida Earring",
		left_ring="Gere Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
	}

	sets.precast.WS.PDL = set_combine(sets.precast.WS, {
		body="Malignance Tabard",
		legs="Malignance Tights",
		hands="Malignance Gloves",
		feet="Malignance Boots",
		neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
		left_ring="Sroda Ring",
	})


	sets.precast.WS['Asuran Fists']    = {
		ammo="Hoxne Ampulla",
		head="Hes. Crown +3",
		body="Bhikku Cyclas +2",
		hands="Hes. Gloves +3",
		legs="Bhikku Hose +3",
		feet="Hes. Gaiters +3",
		neck="Fotia Gorget",
		waist="Moonbow Belt +1",
		left_ear="Ishvara Earring",
		right_ear="Sherida Earring",
		left_ring="Gere Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
	}

	sets.precast.WS['Asuran Fists'].PDL = set_combine(sets.precast.WS['Asuran Fists'], {
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
		left_ring="Sroda Ring",
	})

	sets.precast.WS["Victory Smite"]  = {
		ammo="Hoxne Ampulla",
		head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
		body="Mpaca's Doublet",
		hands="Ryuo Tekko +1",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots",
		neck="Fotia Gorget",
		waist="Moonbow Belt +1",
		left_ear="Moonshade Earring",
		right_ear="Sherida Earring",
		left_ring="Murky Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Crit.hit rate+10','Phys. dmg. taken-10%',}},
	}

	sets.precast.WS["Victory Smite"].PDL  = set_combine(sets.precast.WS['Victory Smite'], {
		neck="Mnk. Nodowa +2",
	})

	sets.precast.WS['Shijin Spiral']   = {
		ammo="Hoxne Ampulla",
		head="Mpaca's Cap",
		body="Bhikku Cyclas +2",
		hands="Hes. Gloves +3",
		legs="Bhikku Hose +3",
		feet="Hes. Gaiters +3",
		neck="Fotia Gorget",
		waist="Moonbow Belt +1",
		left_ear="Moonshade Earring",
		right_ear="Sherida Earring",
		left_ring="Gere Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
	}

	sets.precast.WS['Shijin Spiral'].PDL = set_combine(sets.precast.WS['Shijin Spiral'], {
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
		left_ring="Sroda Ring",
		back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
	})

	sets.precast.WS['Cataclysm'] = {
		ammo="Hoxne Ampulla",
		head="Pixie Hairpin +1",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Sanctity Necklace",
		waist="Orpheus's Sash",
		left_ear="Friomisi Earring",
		right_ear="Moonshade Earring",
		left_ring="Archon Ring",
		right_ring="Metamor. Ring +1",
		back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
	}
	
	sets.precast.WS['Spinning Attack'] = {
		ammo="Hoxne Ampulla",
		head="Hes. Crown +3",
		body="Bhikku Cyclas +2",
		hands="Anchor. Gloves +2",
		legs={ name="Herculean Trousers", augments={'Attack+21','Weapon skill damage +5%','STR+10','Accuracy+6',}},
		feet={ name="Herculean Boots", augments={'Attack+9','Weapon skill damage +4%','STR+10','Accuracy+15',}},
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Ishvara Earring",
		right_ear="Sherida Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Sroda Ring",
		back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
	}

	sets.midcast.FastRecast = sets.precast.FC
		
	sets.idle = {
		ammo="Hoxne Ampulla",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Warder's Charm +1",
		waist="Carrier's Sash",
		left_ear="Etiolation Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Murky Ring",
		right_ring="Shneddick Ring",
		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}

	sets.engaged.SubtleBlow = {
		ammo="Hoxne Ampulla",
		head="Bhikku Crown +2",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Bhikku Hose +3",
		feet="Anchorite's Gaiters +4",
		neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
		waist="Moonbow Belt +1",
		left_ear="Dedition Earring",
		right_ear="Sherida Earring",
		left_ring="Chirich Ring +1",
		right_ring="Niqmaddu Ring",
		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}

	sets.engaged.SubtleBlow.Godhands = set_combine(sets.engaged.SubtleBlow, {
		left_ear="Mache Earring +1",
	})

	sets.engaged.TP = {
		ammo="Hoxne Ampulla",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Bhikku Hose +3",
		feet="Anch. Gaiters +4",
		neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
		waist="Moonbow Belt +1",
		left_ear="Dedition Earring",
		right_ear="Telos Earring",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}

	sets.engaged.TP.Godhands = set_combine(sets.engaged.TP, {
		left_ear="Mache Earring +1",
	})

	sets.engaged.Squish = {
			ammo="Hoxne Ampulla",
			head={ name="Ryuo Somen +1", augments={'HP+65','"Store TP"+5','"Subtle Blow"+8',}},
			body="Malignance Tabard",
			hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
			legs="Bhikku Hose +3",
			feet="Malignance Boots",
			neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
			waist="Moonbow Belt +1",
			left_ear="Dedition Earring",
			right_ear="Telos Earring",
			left_ring="Chirich Ring +1",
			right_ring="Chirich Ring +1",
			back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
		}

	sets.engaged.Squish.Godhands = set_combine(sets.engaged.Squish, {
		left_ear="Mache Earring +1",
	})


	sets.FootworkWS = {feet="Anchorite's Gaiters +4"}
	sets.PDLWS = set_combine({neck="Mnk. Nodowa +2"})

	sets.buff.Impetus = {body="Bhikku Cyclas +2", left_ear="Dedition Earring"}
	sets.buff.ImpetusWS = set_combine({body="Bhikku Cyclas +2"})
	sets.engaged.HF = set_combine(sets.engaged, {})




	sets.buff.Doom = set_combine(sets.buff.Doom, {
		neck="Nicander's Necklace",
		waist="Gishdubar Sash",
		left_ring="Blenmot's Ring +1",
		right_ring="Blenmot's Ring +1",
	})

	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.buff.Boost = {waist="Ask Sash"}
	

	sets.TreasureHunter = set_combine(sets.TreasureHunter, {
		hands={ name="Herculean Gloves", augments={'"Mag.Atk.Bns."+22','INT+1','"Treasure Hunter"+1',}},
		feet={ name="Herculean Boots", augments={'"Avatar perpetuation cost" -1','Mag. Acc.+14','"Treasure Hunter"+2','Accuracy+7 Attack+7',}},
		waist="Chaac Belt",
	})



end


function select_default_macro_book()

		set_macro_page(1, 5)

end



function job_check_buff()
if state.AutoBuffMode.value ~= 'Off' and player.in_combat then
	local abil_recasts = windower.ffxi.get_ability_recasts()

	if player.hpp < 51 and abil_recasts[15] < latency then
		windower.chat.input('/ja "Chakra" <me>')
		tickdelay = os.clock() + 1.1
		return true
		elseif not (buffactive.Impetus or buffactive.Footwork) and abil_recasts[31] < latency then
			windower.chat.input('/ja "Impetus" <me>')
			tickdelay = os.clock() + 1.1
			return true
				elseif not buffactive['Focus'] and abil_recasts[13] < latency then
					windower.chat.input('/ja "Focus" <me>')
					tickdelay = os.clock() + 1.1
					return true
					elseif not buffactive['Impetus'] and not buffactive['Footwork'] and abil_recasts[21] < latency then
						windower.chat.input('/ja "Footwork" <me>')
						tickdelay = os.clock() + 1.1
						return true
				elseif player.sub_job == 'WAR' and not state.Buff['SJ Restriction'] then
					if not buffactive.Berserk and abil_recasts[1] < latency then
						windower.chat.input('/ja "Berserk" <me>')
						tickdelay = os.clock() + 1.1
						return true
							else
								return false
								end
								end
								end

								return false
								end



function job_filtered_action(spell, eventArgs)
if spell.type == 'WeaponSkill' then
	local available_ws = S(windower.ffxi.get_abilities().weapon_skills)
	if available_ws:contains(176) then
		if spell.english == "Spinning Attack" then
			windower.chat.input('/ws "Cataclysm" '..spell.target.raw)
			cancel_spell()
			eventArgs.cancel = true
			end
	end
end
end



function job_customize_melee_set(meleeSet)

	if player.equipment.main == "Godhands" and state.OffenseMode.value == 'SubtleBlow' then
		meleeSet = sets.engaged.SubtleBlow.Godhands
	end
	if player.equipment.main == "Godhands" and state.OffenseMode.value == "TP" then
		meleeSet = sets.engaged.TP.Godhands
	end
	if player.equipment.main == "Godhands" and state.OffenseMode.value == "Squish" then
		meleeSet = sets.engaged.Squish.Godhands
	end

	if buffactive.Impetus then
		meleeSet = set_combine(meleeSet, sets.buff.Impetus)
		end

		if buffactive.Footwork then
			meleeSet = set_combine(meleeSet, sets.buff.Footwork)
			end

	    return meleeSet
end


