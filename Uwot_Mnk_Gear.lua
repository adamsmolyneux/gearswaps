function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Hybrid','Normal')
    state.WeaponskillMode:options('Match')
	state.IdleMode:options('Normal')
	state.Weapons:options('Verethragna')

    state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None'}

    update_melee_groups()
	
	-- Additional local binds
	 send_command('bind ^` gs c cycle OffenseMode')
	 send_command('bind ^f gs c toggle AutoWSMode')

	
	select_default_macro_book()
end

function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets
	
	-- Precast sets to enhance JAs on use
	sets.precast.JA['Hundred Fists'] = {legs="Hesychast's Hose +3"}
	sets.precast.JA['Dodge'] = {feet="Anchorite's Gaiters +3"}
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

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = {}
		
	sets.precast.Flourish1 = {}

	sets.precast.JA['Provoke'] = {
		ammo="Staunch Tathlum +1",
		head="Halitus Helm",
		body="Emet Harness +1",
		hands="Kurys Gloves",
		legs="Bhikku Hose +2",
		feet="Ahosi Leggings",
		neck="Warder's Charm +1",
		waist="Moonbow Belt +1",
		left_ear="Etiolation Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring",
		right_ring="Gelatinous Ring +1",
		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}


	-- Fast cast sets for spells
	
	sets.precast.FC = {
		ammo="Sapience Orb",
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

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
		ammo="Coiste Bodhar",
		head="Mpaca's Cap",
		body="Mpaca's Doublet",
		hands="Mpaca's Gloves",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots",
		neck="Fotia Gorget",
		waist="Moonbow Belt +1",
		left_ear="Cessance Earring",
		right_ear="Sherida Earring",
		left_ring="Gere Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}


	-- Specific weaponskill sets.


	sets.precast.WS['Asuran Fists']    = {
		ammo="Crepuscular Pebble",
		head="Hes. Crown +3",
		body="Bhikku Cyclas +2",
		hands="Mpaca's Gloves",
		legs="Mpaca's Hose",
		feet="Malignance Boots",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Ishvara Earring",
		right_ear="Sherida Earring",
		left_ring="Sroda Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}

	sets.precast.WS["Victory Smite"]  = {
		ammo="Knobkierrie",
		head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
		body="Ken. Samue +1",
		hands={ name="Ryuo Tekko +1", augments={'DEX+12','Accuracy+25','"Dbl.Atk."+4',}},
		legs="Mpaca's Hose",
		feet="Ken. Sune-Ate +1",
		neck="Fotia Gorget",
		waist="Moonbow Belt +1",
		left_ear="Cessance Earring",
		right_ear="Sherida Earring",
		left_ring="Gere Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}

	sets.precast.WS['Shijin Spiral']   = {
		ammo="Coiste Bodhar",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
		waist="Moonbow Belt +1",
		left_ear="Telos Earring",
		right_ear="Sherida Earring",
		left_ring="Sroda Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}



	sets.precast.WS['Cataclysm'] = {}
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Brutal Earring",ear2="Sherida Earring",}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}
	
	-- Midcast Sets
	sets.midcast.FastRecast = {}
		
	-- Specific spells
		
	-- Sets to return to when not performing an action.
	
	-- Resting sets
	

	-- Idle sets
	sets.idle = {
		ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Warder's Charm +1",
		waist="Carrier's Sash",
		left_ear="Etiolation Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring",
		right_ring="Shneddick Ring",
		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee sets
	sets.engaged = {
		ammo="Coiste Bodhar",
		head="Bhikku Crown +2",
		body="Ken. Samue +1",
		hands="Ken. Tekko +1",
		legs="Bhikku Hose +2",
		feet="Anchorite's Gaiters +3",
		neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
		waist="Moonbow Belt +1",
		left_ear="Dedition Earring",
		right_ear="Sherida Earring",
		left_ring="Gere Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}

	sets.engaged.Hybrid = {
		ammo="Staunch Tathlum +1",
		head="Bhikku Crown +2",
		body="Ken. Samue +1",
		hands="Ken. Tekko +1",
		legs="Bhikku Hose +2",
		feet="Anchorite's Gaiters +3",
		neck={ name="Mnk. Nodowa +2", augments={'Path: A',}},
		waist="Moonbow Belt +1",
		left_ear="Cessance Earring",
		right_ear="Sherida Earring",
		left_ring="Defending Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}

	
	sets.engaged.HF = set_combine(sets.engaged, {})




	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.buff.Impetus = {body="Bhikku Cyclas +2"}
	sets.buff.Footwork = {feet="Shukuyu Sune-Ate"}
	sets.buff.Boost = {waist="Ask Sash"}
	
	sets.FootworkWS = {}

	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})

	if buffactive.Impetus and (spell.english == "Ascetic's Fury" or spell.english == "Victory Smite") then
		equip(sets.buff.Impetus)


	-- Weapons sets
	sets.weapons.Verethragna = {main="Verethragna"}

end
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
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
			elseif not (buffactive.Impetus or buffactive.Footwork) and abil_recasts[21] < latency then
				windower.chat.input('/ja "Footwork" <me>')
				tickdelay = os.clock() + 1.1
				return true
				elseif player.sub_job == 'WAR' and not state.Buff['SJ Restriction'] then
					if not buffactive.Berserk and abil_recasts[1] < latency then
						windower.chat.input('/ja "Berserk" <me>')
						tickdelay = os.clock() + 1.1
						return true
						elseif not (buffactive.Aggressor or buffactive.Focus) and abil_recasts[13] < latency then
							windower.chat.input('/ja "Focus" <me>')
							tickdelay = os.clock() + 1.1
							return true
							else
								return false
								end
								end
								end

								return false
								end

