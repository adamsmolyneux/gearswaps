function user_job_setup()
	-- Options: Override default values
	state.CastingMode:options('Normal')
	state.OffenseMode:options('Normal')
	state.IdleMode:options('Normal','PDT')
	state.Weapons:options('Club','Staff')


    gear.obi_low_nuke_waist = "Refoccilation Stone"
    gear.obi_high_nuke_waist = "Refoccilation Stone"
	
		-- Additional local binds

	send_command('bind ^f gs c cycle MagicBurstMode')

    
	select_default_macro_book()
end

function init_gear_sets()

    --------------------------------------
    -- Start defining the sets
    --------------------------------------
	
	-- Weapons sets
	sets.weapons.Club = {main="Wizard's Rod",sub="Ammurapi Shield"}
	sets.weapons.Staff = {main="Marin Staff +1",sub="Khonsu"}

	
    sets.buff.Sublimation = {}
    sets.buff.DTSublimation = {}
	
	-- Treasure Hunter
	
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.merlinic_treasure_feet})
    
    ---- Precast Sets ----
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Mana Wall'] = {}

    sets.precast.JA.Manafont = {body="Archmage's Coat +3"} --body="Sorcerer's Coat +2"
    
    -- equip to maximize HP (for Tarus) and minimize MP loss before using convert
    sets.precast.JA.Convert = {}


    -- Fast cast sets for spells

    sets.precast.FC = {
        ammo="Sapience Orb",
        head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
        body={ name="Merlinic Jubbah", augments={'"Fast Cast"+7','INT+2','"Mag.Atk.Bns."+5',}},
        hands="Volte Gloves",
        legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
        feet={ name="Merlinic Crackows", augments={'"Fast Cast"+4','"Mag.Atk.Bns."+14',}},
        neck="Orunmila's Torque",
        left_ear="Etiolation Earring",
        right_gear="Malignance Earring",
        left_ring="Kishar Ring",
        right_ring="Prolix Ring",
        back={ name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','MP+20','"Fast Cast"+10','Phys. dmg. taken-10%',}},
    }
		
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {})

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

    sets.precast.FC.Curaga = sets.precast.FC.Cure
	
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Ammurapi Shield"})

	sets.precast.FC.Death = {}

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Vidohunir'] = {}

    sets.precast.WS['Myrkr'] = {
        ammo="Staunch Tathlum +1",
        head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
        body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
        hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
        legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
        feet={ name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
        neck="Orunmila's Torque",
        waist="Fucho-no-Obi",
        left_ear="Etiolation Earring",
        right_ear="Andoaa Earring",
        left_ring="Mephitas's Ring +1",
        right_ring="Lebeche Ring",
        back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
    }

	sets.precast.WS['Starlight'] = sets.precast.WS['Myrkr']

	sets.MaxTPMyrkr = {ear1="Evans Earring",ear2="Etiolation Earring"}
    
    
    ---- Midcast Sets ----

    sets.midcast.FastRecast = {}

    sets.midcast.Cure = {
        ammo="Pemphredo Tathlum",
        head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        hands={ name="Vanya Cuffs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        neck="Incanter's Torque",
        waist="Luminary Sash",
        left_ear="Mendi. Earring",
        right_ear="Malignance Earring",
        left_ring="Stikini Ring +1",
        right_ring="Naji's Loop",
        back="Tempered Cape +1",
    }
		
    sets.midcast.LightWeatherCure = {
        ammo="Pemphredo Tathlum",
        head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        hands={ name="Vanya Cuffs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        neck="Incanter's Torque",
        waist="Luminary Sash",
        left_ear="Mendi. Earring",
        right_ear="Malignance Earring",
        left_ring="Stikini Ring +1",
        right_ring="Naji's Loop",
        back="Tempered Cape +1",
    }
		
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {
        ammo="Pemphredo Tathlum",
        head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        hands={ name="Vanya Cuffs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        neck="Incanter's Torque",
        waist="Luminary Sash",
        left_ear="Mendi. Earring",
        right_ear="Malignance Earring",
        left_ring="Stikini Ring +1",
        right_ring="Naji's Loop",
        back="Tempered Cape +1",
    }

    sets.midcast.Curaga = sets.midcast.Cure
	
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {})
	
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})

	sets.midcast['Enhancing Magic'] = {
        head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +8',}},
        body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +8',}},
        hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +9',}},
        legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +9',}},
        feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +8',}},
        neck="Incanter's Torque",
        waist="Olympus Sash",
        right_ear="Andoaa Earring",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back="Merciful Cape",
    }
    
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1",waist="Emphatikos Rope",legs="Shedir Seraweels"})
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})

    sets.midcast['Enfeebling Magic'] = {
        ammo="Pemphredo Tathlum",
        body="Cohort Cloak +1",
        hands="Spae. Gloves +2",
        legs="Ea Slops +1",
        feet="Spae. Sabots +2",
        neck="Erra Pendant",
        waist="Luminary Sash",
        left_ear="Barkaro. Earring",
        right_ear="Malignance Earring",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
    }

		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {
        legs="Arch. Tonban +3",
        feet="Arch. Sabots +3"
    })

	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})


	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {})

    sets.midcast['Dark Magic'] = {}

    sets.midcast.Drain = {
        ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",
        body="Arch. Coat +3",
        hands={ name="Merlinic Dastanas", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','"Drain" and "Aspir" potency +10','CHR+1','Mag. Acc.+14','"Mag.Atk.Bns."+9',}},
        legs="Arch. Tonban +3",
        feet="Arch. Sabots +3",
        neck="Erra Pendant",
        waist="Luminary Sash",
        left_ear="Regal Earring",
        right_ear="Malignance Earring",
        left_ring="Stikini Ring +1",
        right_ring="Archon Ring",
        back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
    }
    
    sets.midcast.Aspir = sets.midcast.Drain
	
	sets.midcast.Aspir.Death = {}
	
	sets.midcast.Death = {}

    sets.midcast.Stun = {}
		


    sets.midcast.BardSong = {}
		
	sets.midcast.Impact = {}
		
    -- Elemental Magic sets
    
    sets.midcast['Elemental Magic'] = {
        ammo="Pemphredo Tathlum",
        head="Arch. Petasos +3",
        body="Arch. Coat +3",
        hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
        legs="Arch. Tonban +3",
        feet="Arch. Sabots +3",
        neck={ name="Src. Stole +2", augments={'Path: A',}},
        waist="Refoccilation Stone",
        left_ear="Regal Earring",
        right_ear="Malignance Earring",
        left_ring="Freke Ring",
        right_ring="Metamor. Ring +1",
        back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
    }
		


	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {})

	
	sets.midcast.Helix = sets.midcast['Elemental Magic']

		
		-- Minimal damage gear, maximum recast gear for procs.

		
    sets.midcast['Elemental Magic'].OccultAcumen = {}
		
    sets.midcast.Impact.OccultAcumen = set_combine(sets.midcast['Elemental Magic'].OccultAcumen, {head=empty,body="Twilight Cloak"})
	
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {}
    

    -- Idle sets
    
    -- Normal refresh idle set
    sets.idle = {
        ammo="Staunch Tathlum +1",
        head="Befouled Crown",
        body="Jhakri Robe +2",
        hands="Volte Gloves",
        legs="Assid. Pants +1",
        feet={ name="Merlinic Crackows", augments={'AGI+2','"Fast Cast"+2','Damage taken-5%','Mag. Acc.+7 "Mag.Atk.Bns."+7',}},
        neck="Loricate Torque +1",
        waist="Carrier's Sash",
        left_ear="Genmei Earring",
        right_ear="Odnowa Earring +1",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
    }

    -- Idle mode that keeps PDT gear on, but doesn't prevent normal gear swaps for precast/etc.
    sets.idle.PDT = {
        ammo="Staunch Tathlum +1",
        head="Ea Hat +1",
        body="Mallquis Saio +2",
        hands="Volte Gloves",
        legs="Ea Slops +1",
        feet="Ea Pigaches +1",
        neck="Loricate Torque +1",
        waist="Carrier's Sash",
        left_ear="Genmei Earring",
        right_ear="Odnowa Earring +1",
        left_ring="Defending Ring",
        right_ring="Gelatinous Ring +1",
        back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
    }
		

	sets.idle.Death = {}



    -- Defense sets



	sets.Kiting = {ring2="Shneddick Ring"}
    sets.latent_refresh = {waist="Fucho-no-obi"}

	sets.TPEat = {neck="Chrys. Torque"}

	
    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
	
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
    sets.buff['Mana Wall'] = {
        back={ name="Taranus's Cape", augments={'MP+60','Mag. Acc+20 /Mag. Dmg.+20','MP+20','"Fast Cast"+10','Phys. dmg. taken-10%',}},
        feet="Wicce Sabots +1",
    }
	
	-- Gear that converts elemental damage done to recover MP.	

	sets.RecoverMP = {body="Spaekona's Coat +2"}

	-- Gear for Magic Burst mode.
	sets.MagicBurst = {
        ammo="Pemphredo Tathlum",
        head="Ea Hat +1",
        body="Ea Houppe. +1",
        hands="Spae. Gloves +2",
        legs="Ea Slops +1",
        feet="Ea Pigaches +1",
        neck={ name="Src. Stole +2", augments={'Path: A',}},
       waist="Refoccilation Stone",
        left_ear="Regal Earring",
        right_ear="Malignance Earring",
        left_ring="Metamorph Ring +1",
        right_ring="Mujin Band",
        back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}},
    }

	
	-- Gear for specific elemental nukes.
	sets.element.Dark = {head="Pixie Hairpin +1",ring2="Archon Ring"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {}

	--Situational sets: Gear that is equipped on certain targets
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"}
		
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 3)
end

