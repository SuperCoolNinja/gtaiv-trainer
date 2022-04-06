config = {};
config.enableControl = true; --> Can control gameplay while the menu is open.

config.player = {
    isGodMode = false,
    getActualCar = nil,
}

config.vehicle = {
 
}

config.menu = {
    mainSub = {
        {label = "Self options",      id = "self"},
        {label = "Spawn vehicle",     id = "spawn_cars"},
        {label = "Vehicle options",   id = "option_cars"},
        {label = "Weapons",           id = "weapons"},
        {label = "Weathers",          id = "weathers"},
        --{label = "Time",            id = "time"},
        {label = "Credits",           id = "credits"},
    },

    selfSub = {
        {label = "Tp to marker"},
    },

    spawnCarsSub = {
        {label = "Cars",              id = "cars"},
        {label = "Bikes",             id = "bikes"},
        {label = "Boats",             id = "boats"},
        {label = "Aircraft",          id = "aircraft"},
    },

    carsOptions = {
        {label = "GodMode"},
        {label = "Boost"},
        {label = "Repair"},
        {label = "Flip"},
        {label = "Random Color"},
    },

    carsOptionsSub = {
        {label = "Neons", id = "neons"},
    },

    neonsOptions = {
        {label = "Red",    color   = 0xCB26803D},
        {label = "Blue",   color   = 0xD20167BE},
        {label = "White",  color   = 0xFCB32869},
        {label = "Orange", color   = 0x2F8AEA79},
    },

    weaponsOptions = {
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


    weathersOptions = {
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


    creditsOptions = {
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