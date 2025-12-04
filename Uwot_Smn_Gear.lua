-- Setup vars that are user-dependent.  Can override this function in a sidecar.
function user_job_setup()
    state.OffenseMode:options('Normal','Acc')
    state.CastingMode:options('Normal')
    state.IdleMode:options('Normal','PDT')


	
    send_command('bind !` input /ja "Release" <me>')
	send_command('bind @` gs c cycle MagicBurst')
	send_command('bind ^` gs c toggle PactSpamMode')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation.
	send_command('bind ^q gs c weapons Khatvanga;gs c set CastingMode OccultAcumen')
	send_command('bind !q gs c weapons default;gs c reset CastingMode')
	
    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Precast Sets
    --------------------------------------
    
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.merlinic_treasure_feet})
	
    -- Precast sets to enhance JAs
    sets.precast.JA['Astral Flow'] = {head="Glyphic Horn"}
    
    sets.precast.JA['Elemental Siphon'] = {}

    sets.precast.JA['Mana Cede'] = {}

    -- Pact delay reduction gear
    sets.precast.BloodPactWard = {
        main={ name="Espiritus", augments={'Summoning magic skill +15','Pet: Mag. Acc.+30','Pet: Damage taken -4%',}},
        ammo="Sancus Sachet +1",
        head="Beckoner's Horn +2",
        body="Con. Doublet +2",
        hands="Glyphic Bracers +1",
        legs="Summoner's Spats",
        feet="Summoner's Pgch.",
        left_ear="Evans Earring",
        }
		
    sets.precast.BloodPactRage = sets.precast.BloodPactWard

    -- Fast cast sets for spells
    
    sets.precast.FC = {
        head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
        body={ name="Merlinic Jubbah", augments={'"Fast Cast"+7','INT+2','"Mag.Atk.Bns."+5',}},
        hands="Volte Gloves",
        legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
        feet={ name="Merlinic Crackows", augments={'"Fast Cast"+4','"Mag.Atk.Bns."+14',}},
        neck="Orunmila's Torque",
        left_ear="Malignance Earring",
        right_ear="Etiolation Earring",
        left_ring="Kishar Ring",
        right_ring="Naji's Loop",
        }

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {})
		
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})
	
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})
	
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})       
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Genmei Shield"})
	
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Ishvara Earring",
        right_ear="Telos Earring",
        left_ring="Epaminondas's Ring",
        right_ring="Chirich Ring +1",
        back="Moonlight Cape",
        }

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Myrkr'] = {}

    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {}
	
    sets.midcast.Cure = {
        head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        hands={ name="Vanya Cuffs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        legs={ name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        neck="Incanter's Torque",
        left_ear="Mendi. Earring",
        left_ring="Lebeche Ring",
        right_ring="Stikini Ring +1",
        back="Tempered Cape +1",
        }
		
	sets.Self_Refresh = {}
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {})
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})

	sets.midcast['Summoning Magic'] = {}
		
	sets.midcast['Elemental Magic'] = {}
		
	sets.midcast.Impact = {}
		

    sets.midcast['Divine Magic'] = {}
		
    sets.midcast['Dark Magic'] = {}
	
	sets.midcast.Drain = {}
    
    sets.midcast.Aspir = sets.midcast.Drain
		
    sets.midcast.Stun = {}
		
    sets.midcast.Stun.Resistant = {}
		
	sets.midcast['Enfeebling Magic'] = {}
		
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
		
	sets.midcast['Enhancing Magic'] = {}
		
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {
        head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
        feet="Inspirited Boots",
        waist="Gishdubar Sash",
        back="Grapevine Cape",
    })
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {
        head={ name="Amalric Coif +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
        legs="Shedir Seraweels",
        waist="Emphatikos Rope",
    })
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
        legs="Shedir Seraweels",
        neck="Nodens Gorget",
        waist="Siegel Sash",
        left_ear="Earthcry Earring",
    })
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {})

    -- Avatar pact sets.  All pacts are Ability type.
    
    sets.midcast.Pet.BloodPactWard = {
        main={ name="Espiritus", augments={'Summoning magic skill +15','Pet: Mag. Acc.+30','Pet: Damage taken -4%',}},
        sub="Elan Strap +1",
        ammo="Sancus Sachet +1",
        head="Beckoner's Horn +1",
        body="Beck. Doublet +1",
        hands={ name="Merlinic Dastanas", augments={'Blood Pact Dmg.+10','Pet: STR+3','Pet: "Mag.Atk.Bns."+15',}},
        legs="Beck. Spats +1",
        neck="Incanter's Torque",
        waist="Incarnation Sash",
        left_ring="Evoker's Ring",
        right_ring="Stikini Ring +1",
        }

    sets.midcast.Pet.DebuffBloodPactWard = {}
        
    sets.midcast.Pet.DebuffBloodPactWard.Acc = sets.midcast.Pet.DebuffBloodPactWard
    
    sets.midcast.Pet.PhysicalBloodPactRage = {
        main={ name="Grioavolr", augments={'Blood Pact Dmg.+7','Pet: "Mag.Atk.Bns."+25',}},
        sub="Elan Strap +1",
        ammo="Sancus Sachet +1",
        head={ name="Helios Band", augments={'Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: "Dbl. Atk."+8','Blood Pact Dmg.+7',}},
        body="Con. Doublet +2",
        hands={ name="Merlinic Dastanas", augments={'Blood Pact Dmg.+10','Pet: STR+3','Pet: "Mag.Atk.Bns."+15',}},
        legs={ name="Apogee Slacks +1", augments={'Pet: STR+20','Blood Pact Dmg.+14','Pet: "Dbl. Atk."+4',}},
        feet="Convoker's Pigaches +2",
        neck="Adad Amulet",
        waist="Incarnation Sash",
        left_ring="Varar Ring +1",
        right_ring="Varar Ring +1",
        left_ear="Kyrene Earring",
        right_ear="Gelos Earring",
        }
		
    sets.midcast.Pet.PhysicalBloodPactRage.Acc = {}

    sets.midcast.Pet.MagicalBloodPactRage = {
        main={ name="Grioavolr", augments={'Blood Pact Dmg.+7','Pet: "Mag.Atk.Bns."+25',}},
        sub="Elan Strap +1",
        ammo="Sancus Sachet +1",
        head={ name="Apogee Crown +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
        body="Apogee doublet +1",
        hands={ name="Merlinic Dastanas", augments={'Blood Pact Dmg.+10','Pet: STR+3','Pet: "Mag.Atk.Bns."+15',}},
        legs={ name="Enticer's Pants", augments={'MP+50','Pet: Accuracy+15 Pet: Rng. Acc.+15','Pet: Mag. Acc.+15','Pet: Damage taken -5%',}},
        feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
        neck="Adad Amulet",
        waist="Incarnation Sash",
        left_ring="Varar Ring +1",
        right_ring="Varar Ring +1",
        left_ear="Kyrene Earring",
        right_ear="Gelos Earring",
        }

    sets.midcast.Pet.MagicalBloodPactRage.Acc = {}

    -- Spirits cast magic spells, which can be identified in standard ways.
    
    sets.midcast.Pet.WhiteMagic = {} --legs="Summoner's Spats"
    
    sets.midcast.Pet['Elemental Magic'] = set_combine(sets.midcast.Pet.MagicalBloodPactRage, {}) --legs="Summoner's Spats"
    
	sets.midcast.Pet['Impact'] = sets.midcast.Pet.DebuffBloodPactWard

	sets.midcast.Pet['Flaming Crush'] = {
        main={ name="Grioavolr", augments={'Blood Pact Dmg.+7','Pet: "Mag.Atk.Bns."+25',}},
        sub="Elan Strap +1",
        ammo="Sancus Sachet +1",
        head={ name="Apogee Crown +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
        body="Apogee doublet +1",
        hands={ name="Merlinic Dastanas", augments={'Blood Pact Dmg.+10','Pet: STR+3','Pet: "Mag.Atk.Bns."+15',}},
        legs={ name="Enticer's Pants", augments={'MP+50','Pet: Accuracy+15 Pet: Rng. Acc.+15','Pet: Mag. Acc.+15','Pet: Damage taken -5%',}},
        feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
        neck="Adad Amulet",
        waist="Incarnation Sash",
        left_ring="Varar Ring +1",
        right_ring="Varar Ring +1",
        left_ear="Kyrene Earring",
        right_ear="Gelos Earring",
    }
		
	sets.midcast.Pet['Flaming Crush'].Acc = {}
	
	sets.midcast.Pet['Mountain Buster'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's Pants"})
	sets.midcast.Pet['Mountain Buster'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's Pants"})
	sets.midcast.Pet['Rock Buster'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's Pants"})
	sets.midcast.Pet['Rock Buster'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's Pants"})
	sets.midcast.Pet['Crescent Fang'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's Pants"})
	sets.midcast.Pet['Crescent Fang'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's Pants"})
	sets.midcast.Pet['Eclipse Bite'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's Pants"})
	sets.midcast.Pet['Eclipse Bite'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's Pants"})
	sets.midcast.Pet['Blindside'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's Pants"})
	sets.midcast.Pet['Blindside'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's Pants"})

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
    
    -- Idle sets
    sets.idle = {
        main="Gridarvor",
        sub="Elan Strap +1",
        ammo="Staunch Tathlum +1",
        head="Beckoner's Horn +2",
        body={ name="Apo. Dalmatica +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
        hands="Nyame Gauntlets",
        legs="Assid. Pants +1",
        feet="Nyame Sollerets",
        neck="Warder's Charm +1",
        waist="Carrier's Sash",
        left_ear="Genmei Earring",
        right_ear="Odnowa Earring +1",
        left_ring="Defending Ring",
        right_ring="Shneddick Ring",
        back="Moonlight Cape",
        }

		
    -- perp costs:
    -- spirits: 7
    -- carby: 11 (5 with mitts)
    -- fenrir: 13
    -- others: 15
    -- avatar's favor: -4/tick
    
    -- Max useful -perp gear is 1 less than the perp cost (can't be reduced below 1)
    -- Aim for -14 perp, and refresh in other slots.
    
    -- Can make due without either the head or the body, and use +refresh items in those slots.
    
    sets.idle.Avatar = {
        main="Gridarvor",
        sub="Elan Strap +1",
        ammo="Sancus Sachet +1",
        head="Beckoner's Horn +2",
        body={ name="Apo. Dalmatica +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
        hands="Nyame Gauntlets",
        legs="Assid. Pants +1",
        feet="Nyame Sollerets",
        neck="Warder's Charm +1",
        waist="Carrier's Sash",
        left_ear="Evans Earring",
        right_ear="Odnowa Earring +1",
        left_ring="Stikini Ring +1",
        right_ring="Evoker's Ring",
        back="Moonlight Cape",
    }

    sets.idle.Spirit = {}
		
		
	--Favor always up and head is best in slot idle so no specific items here at the moment.
    sets.idle.Avatar.Favor = {}
    sets.idle.Avatar.Engaged = {}
	
	sets.idle.Avatar.Engaged.Carbuncle = {}
	sets.idle.Avatar.Engaged['Cait Sith'] = {}
        
    sets.perp = {}
    -- Caller's Bracer's halve the perp cost after other costs are accounted for.
    -- Using -10 (Gridavor, ring, Conv.feet), standard avatars would then cost 5, halved to 2.
    -- We can then use Hagondes Coat and end up with the same net MP cost, but significantly better defense.
    -- Weather is the same, but we can also use the latent on the pendant to negate the last point lost.
    sets.perp.Day = {}
    sets.perp.Weather = {}
	
	sets.perp.Carbuncle = {}
    sets.perp.Diabolos = {}
    sets.perp.Alexander = sets.midcast.Pet.BloodPactWard

	-- Not really used anymore, was for the days of specific staves for specific avatars.
    sets.perp.staff_and_grip = {}
		
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {}

	-- Weapons sets

    sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}
    --------------------------------------
    -- Engaged sets
    --------------------------------------
    
    -- Normal melee group
    sets.engaged = {
        head="Beckoner's Horn +2",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Loricate Torque +1",
        waist="Carrier's Sash",
        left_ear="Telos Earring",
        right_ear="Mache Earring +1",
        left_ring="Chirich Ring +1",
        right_ring="Chirich Ring +1",
        back="Moonlight Cape",
        }

    sets.Kiting = {right_ring="Shneddick Ring"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book(reset)
    if reset == 'reset' then
        -- lost pet, or tried to use pact when pet is gone
    end
    
    -- Default macro set/book
    set_macro_page(1, 7)
end
