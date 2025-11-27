-- Setup vars that are user-dependent.
function user_job_setup()
    state.OffenseMode:options('Hybrid','Normal')
    state.WeaponskillMode:options('Match','Proc')
    state.RangedMode:options('Normal', 'Acc')
    state.PhysicalDefenseMode:options('PDT','PDTReraise')
	state.MagicalDefenseMode:options('MDT','MDTReraise')
	state.ResistDefenseMode:options('MEVA')
    state.IdleMode:options('Normal', 'Reraise')
	state.Weapons:options('GKT','ProcWeapon','Polearm')

    autowstp = 1200


    -- Additional local binds
    send_command('bind ^f gs c toggle AutoWSMode')
    send_command('bind !f gs c cycle weapons')
    send_command('bind numpad1 mount "Noble Chocobo"')
    send_command('bind ^` gs c cycle OffenseMode')

    select_default_macro_book()
end




-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    -- Precast Sets
    -- Precast sets to enhance JAs
    sets.precast.JA.Meditate = {head="Wakido Kabuto +3",hands="Sakonji Kote +3",back="Smertrios's Mantle"}
    sets.precast.JA['Warding Circle'] = {head="Wakido Kabuto +2"}
    sets.precast.JA['Blade Bash'] = {hands="Sakonji Kote +3"}
	sets.precast.JA['Sekkanoki'] = {hands="Kasuga Kote +1"}
	sets.precast.JA['Sengikori'] = {feet="Kas. Sune-Ate +1"}
	
    sets.precast.Step = {}

    sets.precast.JA['Violent Flourish'] = {}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    sets.precast.FC = {
        ammo="Sapience Orb",
        neck="Orunmila's Torque",
        left_ear="Etiolation Earring",
        left_ring="Prolix Ring",
        right_ring="Naji's Loop",
    }
	   
    -- Ranged snapshot gear
    sets.precast.RA = {}
	   
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS= {
        ammo="Knobkierrie",
        head="Mpaca's Cap",
        body="Sakonji Domaru +3",
        hands="Kasuga Kote +2",
        legs="Wakido Haidate +3",
        feet="Flam. Gambieras +2",
        neck="Fotia Gorget",
        waist="Sailfi Belt +1",
        left_ear="Thrud Earring",
        right_ear="Moonshade Earring",
        left_ring="Epaminondas's Ring",
        right_ring="Niqmaddu Ring",
        back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

	
	sets.precast.WS.Proc = {}

    sets.precast.WS['Tachi: Fudo'] = set_combine(sets.precast.WS, {})

    sets.precast.WS['Tachi: Fudo'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
    sets.precast.WS['Tachi: Shoha'] = set_combine(sets.precast.WS, {
        ammo="Knobkierrie",
        head="Mpaca's Cap",
        body="Sakonji Domaru +3",
        hands="Kasuga Kote +2",
        legs="Wakido Haidate +3",
        feet="Flam. Gambieras +2",
        neck="Fotia Gorget",
        waist="Sailfi Belt +1",
        left_ear="Thrud Earring",
        right_ear="Moonshade Earring",
        left_ring="Epaminondas's Ring",
        right_ring="Niqmaddu Ring",
        back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    })

    sets.precast.WS['Stardiver'] = {
        ammo="Coiste Bodhar",
        head="Flam. Zucchetto +2",
        body="Sakonji Domaru +3",
        hands="Kasuga Kote +2",
        legs="Mpaca's Hose",
        feet="Flam. Gambieras +2",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Brutal Earring",
        right_ear="Moonshade Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Petrov Ring",
        back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
    }

    sets.precast.WS['Tachi: Shoha'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Tachi: Rana'] = set_combine(sets.precast.WS, {})

    sets.precast.WS['Tachi: Rana'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Tachi: Kasha'] = set_combine(sets.precast.WS, {})

    sets.precast.WS['Tachi: Kasha'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Tachi: Gekko'] = set_combine(sets.precast.WS, {})

    sets.precast.WS['Tachi: Gekko'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Tachi: Yukikaze'] = set_combine(sets.precast.WS, {})

    sets.precast.WS['Tachi: Yukikaze'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Tachi: Ageha'] = {
        ammo="Knobkierrie",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Gwati Earring",
        right_ear="Moonshade Earring",
        left_ring="Stikini Ring +1",
        right_ring="Metamor. Ring +1",
        back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }
		
    sets.precast.WS['Tachi: Hobaku'] = sets.precast.WS['Tachi: Jinpu']
		
    sets.precast.WS['Tachi: Jinpu'] = {
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
        right_ring="Niqmaddu Ring",
        back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    sets.precast.WS['Apex Arrow'] = {}
		

	-- Swap to these on Moonshade using WS if at 3000 TP

		sets.MaxTP = {ear2="Ishvara Earring"}
	
    -- Midcast Sets
    sets.midcast.FastRecast = {}
		
    -- Ranged gear
    sets.midcast.RA = {}

    sets.midcast.RA.Acc = {}

    

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	
    sets.Kiting = {ring2="Shneddick Ring"}

	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.Skillchain = {}
	
	sets.idle = {
        ammo="Staunch Tathlum +1",
        head="Wakido Kabuto +3",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Warder's Charm +1",
        waist="Carrier's Sash",
        left_ear="Etiolation Earring",
        right_ear="Odnowa Earring +1",
        left_ring="Defending Ring",
        right_ring="Shneddick Ring",
        back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
    }



    sets.engaged.Hybrid = {
        ammo="Coiste Bodhar",
        head="Kasuga Kabuto +2",
        body="Kasuga Domaru +2",
        hands="Nyame Gauntlets",
        legs="Kasuga Haidate +2",
        feet="Nyame Sollerets",
        neck="Warder's Charm +1",
        waist="Sailfi Belt +1",
        left_ear="Dedition Earring",
        right_ear="Kasuga Earring",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
        back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
    }

    sets.engaged.Normal = {
        ammo="Coiste Bodhar",
        head="Kasuga Kabuto +2",
        body="Kasuga Domaru +2",
        hands="Wakido Kote +3",
        legs="Kasuga Haidate +2",
        feet={ name="Ryuo Sune-Ate +1", augments={'HP+65','"Store TP"+5','"Subtle Blow"+8',}},
        neck="Ainia Collar",
        waist="Sailfi Belt +1",
        left_ear="Dedition Earring",
        right_ear="Kasuga Earring",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
        back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
    }


        

	-- Weapons sets
	sets.weapons.GKT = {main="Hachimonji",sub="Utu Grip"}
--	sets.weapons.ProcWeapon = {main="Norifusa +1",sub="Bloodrain Strap"}
    sets.weapons.Polearm = {main="Shining One",sub="Utu Grip"}
	
	-- Buff sets
	sets.Cure_Received = {}
	sets.buff.Doom = set_combine(sets.buff.Doom, {
        neck="Nicander's Necklace",
        waist="Gishdubar Sash",
        left_ring="Blenmot's Ring +1",
        right_ring="Blenmot's Ring +1",
    })
	sets.buff.Sleep = {neck="Berserker's Torque"}
	sets.buff.Hasso = {}
	sets.buff['Third Eye'] = {} --legs="Sakonji Haidate +3"
    sets.buff.Sekkanoki = {hands="Kasuga Kote +2"}
    sets.buff.Sengikori = {}
    sets.buff['Meikyo Shisui'] = {}
end


function select_default_macro_book()

        set_macro_page(1, 2)
    end

function job_precast(spell, spellMap, eventArgs)

    if spell.type == 'WeaponSkill' and state.AutoBuffMode.value ~= 'Off' then
        local abil_recasts = windower.ffxi.get_ability_recasts()
        if player.tp > 1850 and abil_recasts[140] < latency then
            eventArgs.cancel = true
            windower.chat.input('/ja "Sekkanoki" <me>')
            windower.chat.input:schedule(1.1,'/ws "'..spell.english..'" '..spell.target.raw..'')
            add_tick_delay(1.1)
            return
        elseif abil_recasts[134] < latency then
            eventArgs.cancel = true
            windower.chat.input('/ja "Meditate" <me>')
            windower.chat.input:schedule(1.1,'/ws "'..spell.english..'" '..spell.target.raw..'')
            add_tick_delay(1.1)
            return
        elseif player.tp < 2000 and not buffactive['Sekkanoki'] and abil_recasts[54] < latency then
            eventArgs.cancel = true
            windower.chat.input('/ja "Hagakure" <me>')
            windower.chat.input:schedule(1,'/ws "'..spell.english..'" '..spell.target.raw..'')
            add_tick_delay(1.1)
            return
        end
    end

end

function job_filtered_action(spell, eventArgs)
if spell.type == 'WeaponSkill' then
    local available_ws = S(windower.ffxi.get_abilities().weapon_skills)
    -- WS 112 is Double Thrust, meaning a Spear is equipped.
    if available_ws:contains(112) then
        if spell.english == "Tachi: Fudo" then
            windower.chat.input('/ws "Impulse Drive" '..spell.target.raw)
            cancel_spell()
            eventArgs.cancel = true
            elseif spell.english == "Tachi: Shoha" then
                send_command('@input /ws "Sonic Thrust" '..spell.target.raw)
                cancel_spell()
                eventArgs.cancel = true
                elseif spell.english == "Tachi: Kasha" then
                    send_command('@input /ws "Stardiver" '..spell.target.raw)
                    cancel_spell()
                    eventArgs.cancel = true
                        elseif spell.english == "Tachi: Hobaku" then
                            send_command('@input /ws "Leg Sweep" '..spell.target.raw)
                            cancel_spell()
                            eventArgs.cancel = true
                            end
                            end
                            end
                            end

function job_check_buff()
if state.AutoBuffMode.value ~= 'Off' and in_combat and not state.Buff['SJ Restriction'] then

    local abil_recasts = windower.ffxi.get_ability_recasts()

    if player.sub_job == 'DRK' and not buffactive['Last Resort'] and abil_recasts[87] < latency then
        windower.chat.input('/ja "Last Resort" <me>')
        add_tick_delay()
        return true
        elseif player.sub_job == 'WAR' and not buffactive.Berserk and abil_recasts[1] < latency then
            windower.chat.input('/ja "Berserk" <me>')
            add_tick_delay()
            return true
                else
                    return false
                    end
                    end

                    return false
                    end
