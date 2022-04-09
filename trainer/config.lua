config = {};
config.enableControl = true; --> Can control gameplay while the menu is open.

config.localPlayer = 0

config.player = {
    isGodMode = false,
    getActualCar = nil,
    isNeverWantedOn = false,
    isNoClipOn = false,
    noClipSpeed = 1.0
}

config.vehicle = {
    isBoostOn = false,
    isGodMode = false,
}

config.playersList = {} --> This will contain the online users.
config.serverID = -1
config.userName = ""
config.targetIndex = nil


config.menu = { 
    mainSub = { --> main menu :
        {label = "Playerlist",        id = "playerlist"},
        {label = "Self options",      id = "self"},
        {label = "Spawn vehicle",     id = "spawn_cars"},
        {label = "Vehicle options",   id = "option_cars"},
        {label = "Weapons",           id = "weapons"},
        {label = "Weathers",          id = "weathers"},
        --{label = "Time",            id = "time"},
        {label = "Credits",           id = "credits"},
    },

    playerListOptions = { --> online player list options :
        {label = "TP to player"},
    },  

    selfSub = { --> self submenu :
        {label = "Change character",  id = "change_character"}
    },

    selfOptions = { --> self options :
        {label = "Tp to marker"},
    },

    characterListOptions = { --> self change character options :
        {label = "Niko Bellic",   id = 0x6F0783F5},

        {label = "Anna Faustin",   id = 0x6E7BF45F},
        {label = "Anthony Corrado",   id = 0x9DD666EE},
        {label = "Badman",   id = 0x5927A320},
        {label = "Bernie Crane",   id = 0x596FB508},
        {label = "Blendar Morina",   id = 0x6734C2C8},
        {label = "Brian Meech",   id = 0x192BDD4A},
        {label = "Brucie Kibbutz",   id = 0x98E29920},

        {label = "Ray Bulgarin",   id = 0x0E28247F},
        {label = "Charise Glover",   id = 0x0548F609},
        {label = "Charlie",   id = 0xB0D18783},
        {label = "Clarence Little",   id = 0x500EC110},
        {label = "Dardan Petrela",   id = 0x5786C78F},
        {label = "Darko Brevic",   id = 0x1709B920},
        {label = "Derick McReary",   id = 0x45B445F9},
        {label = "Dimitri Rascalov",   id = 0x0E27ECC1},


        {label = "Dwayne Forge",   id = 0xDB354C19},
        {label = "Eddie Low",   id = 0xA09901F1},
        {label = "Mikhail Faustin",   id = 0x03691799},
        {label = "Francis McReary",   id = 0x65F4D88D},
        {label = "French Tom",   id = 0x54EABEE4},
        {label = "Gordon Sargent",   id = 0x7EED7363},
        {label = "Gracie Ancelotti",   id = 0xEAAEA78E},
        {label = "Hossan Ramzy",   id = 0x3A7556B2},
        {label = "Ilyena Faustin",   id = 0xCE3779DA},
        {label = "Isaac Roth",   id = 0xE369F2A6},


        {label = "Ivan Bytchkov",   id = 0x458B61F3},
        {label = "Jay Hamilton",   id = 0x15BCAD23},
        {label = "Jason",   id = 0x0A2D8896},
        {label = "Jeff Harlingford",   id = 0x17446345},
        {label = "Jimmy Pegorino",   id = 0xEA28DB14},
        {label = "Johnny Klebitz",   id = 0xC9AB7F1C},
        {label = "Kate McReary",   id = 0xD1E17FCA},
        {label = "Lenny Petrovic",   id = 0x3B574ABA},
        {label = "Little Jacob",   id = 0x58A1E271},
        {label = "Little Jacob",   id = 0xB4008E4D},
        {label = "Luca",   id = 0xD75A60C8},
        {label = "Luis Fernando Lopez",   id = 0xE2A57E5E},
        {label = "Mallorie Bardas",   id = 0xC1FE7952},


        {label = "Manny Escuela",   id = 0x5629F011},
        {label = "Marnie Allen",   id = 0x188232D0},
        {label = "Mel",   id = 0xCFE0FB92},
        {label = "Michael Keane",   id = 0x2BD27039},
        {label = "Michelle",   id = 0xBF9672F4},
        {label = "Mickey",   id = 0xDA0D3182},
        {label = "Packie McReary",   id = 0x64C74D3B},
        {label = "Pathos",   id = 0xF6237664},
        {label = "Kenny Petrovic",   id = 0x8BE8B7F2},
        {label = "Phil Bell",   id = 0x932272CA},
        {label = "Playboy X",   id = 0x6AF081E8},
        {label = "Ray Boccino",   id = 0x38E02AB6},
        {label = "Ricky Gervais",   id = 0xDCFE251C},
        {label = "Roman Bellic",   id = 0x89395FC9},
        {label = "Roman Bellic",   id = 0x2145C7A5},
        {label = "Sara",   id = 0xFEF00775},


        {label = "Tuna",   id = 0x528AE104},
        {label = "Vinny Spaz",   id = 0xC380AE97},
        {label = "Vlad",   id = 0x356E1C42},
        {label = "Andrei Utraniyev",   id = 0x3977107D},
        {label = "Angie Pegorino",   id = 0xF866DC66},
        {label = "Badman",   id = 0xFC012F67},
        {label = "Blendar Morina",   id = 0xA2DDDBA7},
        {label = "Ray Bulgarin",   id = 0x009E4F3E},
        {label = "Dardan Petrela",   id = 0xF4386436},
        {label = "Dave Bosoy",   id = 0x1A5B22F0},
        {label = "Dimitri Rascalov",   id = 0x030B4624},


        {label = "Mikhail Faustin",   id = 0xA776BDC7},
        {label = "Francis McReary",   id = 0x4AA2E9EA},
        {label = "Hossan Ramzy",   id = 0x2B578C90},
        {label = "Ilyena Faustin",   id = 0x2EB3F295},
        {label = "Ivan Bytchkov",   id = 0x4A85C1C4},
        {label = "Jay Hamilton",   id = 0x96E9F99A},
        {label = "Jimmy Pegorino",   id = 0x7055C230},
        {label = "Mel",   id = 0x298ACEC3},
        {label = "Michelle",   id = 0x70AEB9C8},
        {label = "Mickey",   id = 0xA1DFB431},
        {label = "Ray Boccino",   id = 0xD09ECB11},
        {label = "Sergei",   id = 0xDBAC6805},


        {label = "Vlad",   id = 0x7F5B9540},
        {label = "Manny Escuela",   id = 0xD0F8F893},
        {label = "Anthony Corrado",   id = 0x6B941ABA},
        {label = "Ashley Butler",   id = 0x26C3D079},
        {label = "Charlie",   id = 0xEC96EE3A},
        {label = "Darko Brevic",   id = 0xC4B4204C},
        {label = "Dwayne Forge",   id = 0xFB9190AC},
        {label = "Elizabeta Torres",   id = 0xAED416AF},
        {label = "Anthony Prince",   id = 0x04F78844},
        {label = "Gerald McReary",   id = 0x26DE3A8A},


        {label = "Gordon Sargent",   id = 0x49D3EAD3},
        {label = "Isaac Roth",   id = 0xB93A5686},
        {label = "Johnny Klebitz",   id = 0x2E009A8D},
        {label = "Jon Gravelli",   id = 0xD7D47612},
        {label = "Jorge",   id = 0x5906B7A5},
        {label = "Katt Williams",   id = 0x71A11E4C},
        {label = "Luis Fernando Lopez",   id = 0x5E730218},
        {label = "The Incredible Kleinman",   id = 0x1B508682},
        {label = "Mitch",   id = 0xD8BA6C47},
        {label = "Mori Green",   id = 0x9B333E73},


        {label = "Phil Bell",   id = 0x5BEB1A2D},
        {label = "Playboy X",   id = 0xE9F368C6},
        {label = "Priest",   id = 0x4D6DE57E},
        {label = "Ricky Gervais",   id = 0x88F35A20},
        {label = "Tommy",   id = 0x626C3F77},
        {label = "Brian Meech",   id = 0x2AF6831D},
        {label = "Charise Glover",   id = 0x7AE0A064},
        {label = "Clarence Little",   id = 0xE7AC8418},
        {label = "Eddie Low",   id = 0x6463855D},
        {label = "Gracie Ancelotti",   id = 0x999B9B33},
        {label = "Jeff Harlingford",   id = 0x17C32FB4},
        {label = "Marnie Allen",   id = 0x574DE134},
        {label = "Pathos",   id = 0xD77D71DF},
        {label = "Sara",   id = 0xEFF3F84D},

        {label = "Roman Bellic",   id = 0x42F6375E},
        {label = "Roman Bellic",   id = 0x6368F847},
        {label = "Roman Bellic",   id = 0xE37B786A},
        
        {label = "Brucie Kibbutz",   id = 0x0E37C613},
        {label = "Brucie Kibbutz",   id = 0x0E1B45E6},
        {label = "Brucie Kibbutz",   id = 0x765C9667},
        
        {label = "Bernie Crane",   id = 0x7183C75F},
        {label = "Bernie Crane",   id = 0x4231E7AC},
        {label = "Bernie Crane",   id = 0x1B4899DE},
        
        {label = "Little Jacob",   id = 0xB0B4BC37},
        {label = "Little Jacob",   id = 0x7EF858B3},
        
        {label = "Mallorie Bardas",   id = 0x5DF63F45},
        {label = "Mallorie Bardas",   id = 0xCC381BCB},
        {label = "Mallorie Bardas",   id = 0x45768E2E},
        
        {label = "Derick McReary",   id = 0x8469C377},
        {label = "Derick McReary",   id = 0x2FBC9A1E},

        {label = "Michael Keane",   id = 0x7D0BADD3},
        {label = "Packie McReary",   id = 0x4DFB1B0C},
        {label = "Kate McReary",   id = 0xAF3F2AC0},
        

        {label = "Female Doctor",   id = 0x14A4B50F},
        {label = "Fat Hooker",   id = 0x20EF1FEB},
        {label = "Hooker",   id = 0x3B61D4D0},
        {label = "Nurse",   id = 0xB8D8632B},
        {label = "Stripper",   id = 0x42615D12},
        {label = "Stripper",   id = 0x50AFF9AF},
        {label = "Alcoholic",   id = 0x97093869},
        {label = "Armoured Security",   id = 0x401C1901},

        {label = "Fat Policeman",   id = 0xE9EC3678},
        {label = "FBI Agent",   id = 0xC46CBC16},
        {label = "Tom Goldberg",   id = 0xBC5DA76E},
        {label = "Security",   id = 0x907AF88D},
        {label = "Policeman",   id = 0xF5148AB2},
        {label = "Traffic Policeman",   id = 0xA576D885},
        {label = "Cowboy",   id = 0xDDCCAF85},
        {label = "SWAT",   id = 0xC41C88BE},
        {label = "Valet",   id = 0x102B77F0},

        {label = "Vendor",   id = 0xF4E8205B},
        {label = "French Tom",   id = 0x87DB1287},
    },

    spawnCarsSub = { --> cars submenu :
        {label = "Cars",              id = "cars"},
        {label = "Bikes",             id = "bikes"},
        {label = "Boats",             id = "boats"},
        {label = "Aircraft",          id = "aircraft"},
    },

    carsOptions = {  --> cars options :
        {label = "Repair"},
        {label = "Flip"},
        {label = "Random Color"},
    },

    carsOptionsSub = { --> cars options submenu :
        {label = "Neons", id = "neons"},
    },

    neonsOptions = { --> neons options :
        {label = "Red",    color   = 0xCB26803D},
        {label = "Blue",   color   = 0xD20167BE},
        {label = "White",  color   = 0xFCB32869},
        {label = "Orange", color   = 0x2F8AEA79},
    },

    weaponsOptions = { --> weapons options :
        {label = "Fist",              id = 0},
        {label = "Bat",               id = 1},
        {label = "Pool Cue",          id = 2},
        {label = "Knife",             id = 3},
        {label = "Grenade",           id = 4},
        {label = "Molotov",           id = 5},
        {label = "Pistol",            id = 7},
        {label = "Combat Pistol",     id = 9},
        {label = "Pump Shotgun",      id = 10},
        {label = "Combat Shotgun",    id = 11},
        {label = "Micro-SMG",         id = 12},
        {label = "SMG",               id = 13},
        {label = "Assault Rifle",     id = 14},
        {label = "Carbine Rifle",     id = 15},
        {label = "Combat Sniper",     id = 16},
        {label = "Sniper Rifle",      id = 17},
        {label = "RPG",               id = 18},
    },


    weathersOptions = {  --> weathers options :
        {label = "Extra Sunny",        id = 0},
        {label = "Sunny",              id = 1},
        {label = "Sunny and Windy",    id = 2},
        {label = "Cloudy",             id = 3},
        {label = "Raining",            id = 4},
        {label = "Drizzle",            id = 5},
        {label = "Foggy",              id = 6},
        {label = "Thunderstorm",       id = 7},
        {label = "Extra Sunny 2",      id = 8},
        {label = "Sunny and Windy 2",  id = 9},
    },


    creditsOptions = { --> credits options :
        {label = "K3rhos Base menu"},
        {label = "SuperCoolNinja Features"},
        {label = "CitizenIV Docs"},
        {label = "GTAMods Wiki"},
    },
}


--Vehicle list : 
config.vehicleModel = {
    cars = {
        {model = 0x45D56ADA, name = "Ambulance"},
        {model = 0x71EF6313, name = "Enforcer"},
        {model = 0x73920F8E, name = "Firetruck"},
        {model = 0x08DE2A8B, name = "NOOSE Cruiser"},
        {model = 0xEB221FC2, name = "NOOSE Patriot"},
        {model = 0x79FBB0C5, name = "Police Cruiser"},
        {model = 0x9F05F101, name = "Police Patrol"},
        {model = 0x8EB78F5A, name = "Police Stockade"},

        {model = 0x4B5C5320, name = "Admiral"},
        {model = 0x5D0AAC8F, name = "AirTug"},
        {model = 0xC1E908D2, name = "Banshee"},
        {model = 0x7A61B330, name = "Benson"},
        {model = 0x32B91AE8, name = "Biff"},
        {model = 0xEB70965F, name = "Blista Compact"},
        {model = 0x4020325C, name = "Bobcat"},

        {model = 0x898ECCEA, name = "Boxville"},
        {model = 0xD756460C, name = "Buccaneer"},
        {model = 0xAFBB2CA4, name = "Burrito"},
        {model = 0xD577C962, name = "Bus"},
        {model = 0x705A3E41, name = "Cabby"},
        {model = 0x779F23AA, name = "Cavalcade"},
        {model = 0x28420460, name = "Cavalcade FXT"},
        {model = 0xFBFD5B62, name = "Chavos"},
        {model = 0x86FE0B60, name = "Cognoscenti"},
        {model = 0x3F637729, name = "Comet"},


        {model = 0x8A765902, name = "Contender"},
        {model = 0x067BC037, name = "Coquette"},
        {model = 0x09B56631, name = "DF8-90"},
        {model = 0xBC993509, name = "Dilettante"},
        {model = 0x2B26F456, name = "Dukes"},
        {model = 0xD7278283, name = "Emperor"},
        {model = 0x8FC3AADC, name = "Emperor (Rusty)"},
        {model = 0xEF7ED55D, name = "Esperanto"},

        {model = 0x81A9CDDF, name = "Faction"},
        {model = 0xBE9075F1, name = "Feltzer"},
        {model = 0x3A196CEA, name = "Feroci"},
        {model = 0x432EA949, name = "FIB Buffalo"},
        {model = 0x50B0215A, name = "Flatbed"},
        {model = 0x3D285C4A, name = "FlyUS Feroci"},
        {model = 0xA1363020, name = "FlyUS Perennial"},
        {model = 0x58E49664, name = "Forklift"},
        {model = 0x255FC509, name = "Fortune"},
        {model = 0x7836CE2F, name = "Futo"},
        {model = 0x34B7390F, name = "Habanero"},
        {model = 0xEB9F21D3, name = "Hakumai"},

        {model = 0x1D06D681, name = "Huntley Sport"},
        {model = 0x18F25AC7, name = "Infernus"},
        {model = 0xB3206692, name = "Ingot"},
        {model = 0x34DD8AA1, name = "Intruder"},
        {model = 0x4BA4E8DC, name = "Landstalker"},
        {model = 0xC9E8FF76, name = "Laundromat"},
        {model = 0xFDCAF758, name = "Lokus"},
        {model = 0x81634188, name = "Manana"},
        {model = 0x4DC293EA, name = "Marbelle"},
        {model = 0xB4D8797E, name = "Merit"},
        {model = 0xED7EADA4, name = "Minivan"},
        {model = 0x1F52A43F, name = "Moonbeam"},
        {model = 0x22C16A2F, name = "Mr.Tasty"},
        {model = 0x35ED670B, name = "Mule"},

        {model = 0x506434F6, name = "Oracle"},
        {model = 0x21EEE87D, name = "Packer"},
        {model = 0xCFCFEB3B, name = "Patriot"},
        {model = 0x84282613, name = "Perennial"},
        {model = 0x6D19CCBC, name = "Peyote"},
        {model = 0x809AA4CB, name = "Phantom"},
        {model = 0x07D10BDC, name = "Pinnacle"},
        {model = 0x5208A519, name = "PMP 600"},
        {model = 0xF8DE29A8, name = "Pony"},

        {model = 0x8FB66F9B, name = "Premier"},
        {model = 0x8B0D2BA6, name = "Presidente"},
        {model = 0xBB6B404F, name = "Primo"},
        {model = 0x52DB01E0, name = "Rancher"},
        {model = 0x04F48FC4, name = "Rebla"},
        {model = 0xCD935EF9, name = "Ripley"},
        {model = 0x8CD0264C, name = "Roman's Taxi"},
        {model = 0x2560B2FC, name = "Romero"},
        {model = 0xF26CEFF9, name = "Ruiner"},
        {model = 0xE53C7459, name = "Sabre"},
        {model = 0x4B5D021E, name = "Sabre (Rusty)"},
        {model = 0x9B909C94, name = "Sabre GT"},
        {model = 0xECC96C3F, name = "Schafter"},
        {model = 0x6827CF72, name = "Securicar"},


        {model = 0x50732C82, name = "Sentinel"},
        {model = 0x50249008, name = "Solair"},
        {model = 0xCFB3870C, name = "Speedo"},
        {model = 0x72A4C31E, name = "Stallion"},
        {model = 0x63FFE6EC, name = "Steed"},
        {model = 0x66B4FC45, name = "Stratum"},
        {model = 0x8B13F083, name = "Stretch"},
        {model = 0x39DA2754, name = "Sultan"},
        {model = 0xEE6024BC, name = "Sultan RS"},
        {model = 0x6C9962A9, name = "Super GT"},
        {model = 0xC703DB5F, name = "Taxi"},
        {model = 0x480DAF95, name = "Taxi (Merit)"},
        {model = 0x72435A19, name = "Trashmaster"},
        {model = 0x8EF34547, name = "Turismo"},
        {model = 0x5B73F5B7, name = "Uranus"},
        {model = 0xCEC6B9B7, name = "Vigero"},
        {model = 0x973141FC, name = "Vigero (Rusty)"},
        {model = 0xDD3BD501, name = "Vincent"},
        {model = 0xE2504942, name = "Virgo"},
        {model = 0x779B4F2D, name = "Voodoo"},
        {model = 0x69F06B57, name = "Washington"},
        

        {model = 0x737DAEC2, name = "Willard"},
        {model = 0xBE6FF06A, name = "Yankee"},
    },

    bikes = {
        {model = 0x9229E4EB, name = "Faggio"},
        {model = 0x92E56A2C, name = "Freeway"},
        {model = 0x22DC8E7F, name = "Hellfury"},
        {model = 0x47B9138A, name = "NRG 900"},
        {model = 0xC9CEAF06, name = "PCJ 600"},
        {model = 0x2EF89E46, name = "Sanchez"},
        {model = 0xDE05FB87, name = "Zombie"},
    },

    boats = {
        {model = 0x3D961290, name = "Dinghy"},
        {model = 0x33581161, name = "Jetmax"},
        {model = 0xC1CE1183, name = "Marquis"},
        {model = 0xE2E7D4AB, name = "Police Predator"},
        {model = 0x68E27CB6, name = "Reefer"},
        {model = 0x17DF5EC2, name = "Squalo"},
        {model = 0x1149422F, name = "Tropic"},
        {model = 0x3F724E66, name = "Tug"},
    },

    aircraft = {
        {model = 0x31F0B376, name = "Annihilator"},
        {model = 0x9D0450CA, name = "Maverick"},
        {model = 0x1517D4D9, name = "Police Maverick"},
        {model = 0x78D70477, name = "Helitours Maverick"},
    }
}