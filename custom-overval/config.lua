Config = {}
--Config.Locale = 'en' niet nodig

Config.Marker = {
	r = 250, g = 0, b = 0, a = 100,  -- red color/*
	x = 1.0, y = 1.0, z = 1.5,       -- tiny, cylinder formed circle
	DrawDistance = 1.1, Type = 2,    -- default circle type, low draw distance due to indoors area
}

Config.GiveBlackMoney = true -- give black money?w If disabled it will give cash instead

Stores = {
	['Drugs huis'] = {
		PoliceNumberRequired = 8,
		distance = 50,
		start = vector3(2433.7622, 4968.6855, 42.3316),
		nameOfStore = 'Drugs huis',
		lastRobbed = 0,
		type = 4,
		kluisAan = false,
		wordOvervallen = false,
		kassaGeld = math.random(10000, 20000), -- 5 ton gemiddeld
		kassas = {
			['een'] = {
				aan = false,
				locatie = vector3(2433.7622, 4968.6855, 42.3316),
			},
			['twee'] = {
				aan = false,
				locatie = vector3(2437.4355, 4966.6597, 42.3476),
			},
			['drie'] = {
				aan = false,
				locatie = vector3(-9.6489, -1438.6022, 31.1015),
			},
			['vier'] = {
				aan = false,
				locatie = vector3(2434.7124, 4964.2588, 42.3476),
			},
			['fijf'] = {
				aan = false,
				locatie = vector3(2432.1323, 4962.7373, 42.3588),
			},
			['ses'] = {
				aan = false,
				locatie = vector3(2432.9465, 4971.5166, 42.3476),
			},
			['zeven'] = {
				aan = false,
				locatie = vector3(2428.8057, 4969.7603, 42.3476),
			},
			['acht'] = {
				aan = false,
				locatie = vector3(2432.3428, 4959.8354, 46.8181),
			},
			['negen'] = {
				aan = false,
				locatie = vector3(2442.5486, 4968.0508, 46.8105),
			},
			['tien'] = {
				aan = false,
				locatie = vector3(2441.0564, 4970.7524, 46.8116),
			},
			['elf'] = {
				aan = false,
				locatie = vector3(2436.3135, 4965.1685, 46.8106),
			},
			['twaalf'] = {
				aan = false,
				locatie = vector3(2432.3601, 4967.5811, 46.8218),
			},
			['dertien'] = {
				aan = false,
				locatie = vector3(2431.0388, 4964.5659, 46.8106),
			},
			['veertien'] = {
				aan = false,
				locatie = vector3(2444.0945, 4975.5718, 46.8106),
			},
			['fijftien'] = {
				aan = false,
				locatie = vector3(2439.7693, 4977.7598, 46.8106),
			},
			['sestien'] = {
				aan = false,
				locatie = vector3(2447.5764, 4972.2676, 46.8106),
			},
			['zeventien'] = {
				aan = false,
				locatie = vector3(2451.1670, 4977.3726, 46.8099),
			},
		},
		kluis = {
			['een'] = {
				aan = false,
				locatie = vector3(2435.4150, 4972.6704, 46.8256),
			},
		},
		kluisGeld = math.random(100000, 150000),
	},
	['Fantom-huis'] = {
		PoliceNumberRequired = 3,
		distance = 20,
		start = vector3(-11.6500, -1438.2656, 31.1016),
		nameOfStore = 'het huis van Danny Fantom',
		lastRobbed = 0,
		type = 3,
		kluisAan = false,
		wordOvervallen = false,
		kassaGeld = math.random(5500, 6750), --102 + 10k
		kassas = {
			['een'] = {
				aan = false,
				locatie = vector3(-9.3783, -1441.3256, 31.1015),
			},
			['twee'] = {
				aan = false,
				locatie = vector3(-9.0763, -1439.5968, 31.1015),
			},
			['drie'] = {
				aan = false,
				locatie = vector3(-9.6489, -1438.6022, 31.1015),
			},
			['vier'] = {
				aan = false,
				locatie = vector3(-10.9094, -1440.4651, 31.1015),
			},
			['fijf'] = {
				aan = false,
				locatie = vector3(-12.3332, -1436.9484, 31.1015),
			},
			['ses'] = {
				aan = false,
				locatie = vector3(-9.2975, -1435.0284, 31.1015),
			},
			['zeven'] = {
				aan = false,
				locatie = vector3(-9.8533, -1432.5599, 31.1015),
			},
			['acht'] = {
				aan = false,
				locatie = vector3(-10.2751, -1430.3638, 31.1015),
			},
			['negen'] = {
				aan = false,
				locatie = vector3(-9.2975, -1435.0284, 31.1015),
			},
			['tien'] = {
				aan = false,
				locatie = vector3(-10.5865, -1428.1029, 31.1015),
			},
			['elf'] = {
				aan = false,
				locatie = vector3(-12.6212, -1428.0620, 31.1015),
			},
			['twaalf'] = {
				aan = false,
				locatie = vector3(-17.1113, -1430.4185, 31.1016),
			},
			['dertien'] = {
				aan = false,
				locatie = vector3(-17.1113, -1430.4185, 31.1016),
			},
			['veertien'] = {
				aan = false,
				locatie = vector3(-16.7785, -1434.2710, 31.1015),
			},
			['fijftien'] = {
				aan = false,
				locatie = vector3(-17.5303, -1436.8862, 31.1016),
			},
			['sestien'] = {
				aan = false,
				locatie = vector3(-18.0549, -1440.5315, 31.1016),
			},
			['zeventien'] = {
				aan = false,
				locatie = vector3(-13.3321, -1440.1416, 31.1015),
			},
		},
		kluis = {
			['een'] = {
				aan = false,
				locatie = vector3(-12.3158, -1429.4071, 31.1015),
			},
		},
		kluisGeld = math.random(5000, 15000),
	},
	['Paleto'] = {
		PoliceNumberRequired = 4,
		distance = 20,
		start = vector3(1728.2817, 6416.8359, 35.0372),
		nameOfStore = 'Paleto - deze winkel is beetje skeer',
		lastRobbed = 0,
		type = 0,
		kluisAan = false,
		wordOvervallen = false,
		kassaGeld = math.random(5000, 10000), -- 15k + 37.5k = 55k
		kassas = {
			['een'] = {
				aan = false,
				locatie = vector3(1727.8427, 6415.2329, 35.0372),
			},
			['twee'] = {
				aan = false,
				locatie = vector3(1728.8282, 6417.3306, 35.0372),
			},
		},
		kluis = {
			['een'] = {
				aan = false,
				locatie = vector3(1734.8142, 6420.7944, 35.0372),
			},
		},
		kluisGeld = math.random(25000, 50000),
	},
	['mirror_ltd'] = {
		PoliceNumberRequired = 3,
		distance = 20,
		start = vector3(1165.87, -322.73, 68.20),
		nameOfStore = 'LTD Gasoline. (Mirror Park Boulevard) - meest overvallen winkel',
		lastRobbed = 0,
		type = 0,
		kluisAan = false,
		wordOvervallen = false,
		kassaGeld = math.random(10000, 20000), -- 35k +  70k
		kassas = {
			['een'] = {
				aan = false,
				locatie = vector3(1164.87, -324.4, 68.21),
			},
			['twee'] = {
				aan = false,
				locatie = vector3(1164.87, -322.73, 68.20),
			}
		},
		kluis = {
			['een'] = {
				aan = false,
				locatie = vector3(1159.78, -313.95, 68.20),
			},
		},
		kluisGeld = math.random(60000, 80000),
	},
	['Grove'] = {
		PoliceNumberRequired = 3,
		distance = 20,
		start = vector3(-47.2045, -1758.6309, 29.4210),
		nameOfStore = 'Grove streets winkel',
		lastRobbed = 0,
		type = 0,
		kluisAan = false,
		wordOvervallen = false,
		kassaGeld = math.random(10000, 20000), -- 30k + 60k
		kassas = {
			['een'] = {
				aan = false,
				locatie = vector3(-47.8191, -1759.2986, 29.4210),
			},
			['twee'] = {
				aan = false,
				locatie = vector3(-46.7299, -1757.8650, 29.4210),
			},
		},
		kluis = {
			['een'] = {
				aan = false,
				locatie = vector3(-43.3541, -1748.3563, 29.4210),
			},
		},
		kluisGeld = math.random(50000, 70000),
	},
	--[[
	['Little Seoul winkel (LSF)'] = {
		PoliceNumberRequired = 1,
		distance = 20,
		start = vector3(-705.4497, -914.5034, 19.2156),
		nameOfStore = 'LSF block winkel',
		lastRobbed = 0,
		type = 0,
		kluisAan = false,
		wordOvervallen = false,
		kassaGeld = math.random(10000, 20000), -- 30k + 60k
		kassas = {
			['een'] = {
				aan = false,
				locatie = vector3(-706.0664, -915.3289, 19.2156),
			},
			['twee'] = {
				aan = false,
				locatie = vector3(-706.0665, -913.6190, 19.2156),
			},
		},
		kluis = {
			['een'] = {
				aan = false,
				locatie = vector3(-709.4124, -904.4432, 19.2156),
			},
		},
		kluisGeld = math.random(50000, 70000),
	},
	['Yellow Jacket'] = {
		PoliceNumberRequired = 1,
		distance = 20,
		start = vector3(1990.1871, 3048.0630, 47.2151),
		nameOfStore = 'Yekllow Jacket',
		lastRobbed = 0,
		type = 3,
		kluisAan = false,
		wordOvervallen = false,
		kassaGeld = math.random(7500, 10000), -- 80k + 10k
		kassas = {
			['een'] = {
				aan = false,
				locatie = vector3(1991.6605, 3048.0271, 47.2151),
			},
			['twee'] = {
				aan = false,
				locatie = vector3(1994.6727, 3048.1816, 47.2153),
			},
			['drie'] = {
				aan = false,
				locatie = vector3(1992.5717, 3044.5776, 47.2151),
			},
			['vier'] = {
				aan = false,
				locatie = vector3(1989.3584, 3046.0022, 47.2151),
			},
			['ses'] = {
				aan = false,
				locatie = vector3(1987.5558, 3050.9866, 47.2151),
			},
			['zeven'] = {
				aan = false,
				locatie = vector3(1985.2184, 3048.8596, 47.2151),
			},
			['fijn'] = {
				aan = false,
				locatie = vector3(1989.0066, 3049.1794, 47.2151),
			},
			['acht'] = {
				aan = false,
				locatie = vector3(1982.4392, 3053.3723, 47.2151),
			},
			['negen'] = {
				aan = false,
				locatie = vector3(1981.4789, 3051.4629, 47.2173),
			},
		},
		kluis = {
			['een'] = {
				aan = false,
				locatie = vector3(1994.8197, 3046.4199, 47.2152),
			},
		},
		kluisGeld = math.random(10000, 10000),
	},
	--]]
	['BP Wapen Winkel'] = {
		PoliceNumberRequired = 1,
		distance = 20,
		start = vector3(20.8520, -1108.8257, 29.5994),
		nameOfStore = 'Grote gunnoes winkel',
		lastRobbed = 0,
		type = 5,
		kluisAan = false,
		wordOvervallen = false,
		kassaGeld = math.random(60000, 90000), --- 5ton gemiddeld
		kassas = {
			['een'] = {
				aan = false,
				locatie = vector3(17.5744, -1112.1345, 29.7970),
			},
			['twee'] = {
				aan = false,
				locatie = vector3(18.4100, -1110.1807, 29.7970),
			},
			['drie'] = {
				aan = false,
				locatie = vector3(20.2047, -1106.0844, 29.7968),
			},
			['vier'] = {
				aan = false,
				locatie = vector3(21.9696, -1106.7335, 29.7970),
			},
			['fijv'] = {
				aan = false,
				locatie = vector3(22.5109, -1107.6470, 29.7970),
			},
			['ses'] = {
				aan = false,
				locatie = vector3(22.5693, -1109.6799, 29.7970),
			},
		},
		kluis = {
			['een'] = {
				aan = false,
				locatie = vector3(14.1399, -1106.3481, 29.7970),
			},
		},
		kluisGeld = math.random(0, 100000),
	},
	['De haven'] = {
		PoliceNumberRequired = 4,
		distance = 75,
		start = vector3(34.0349, -2692.6802, 6.0047),
		nameOfStore = 'Haven opslag pand',
		lastRobbed = 0,
		type = 3,
		kluisAan = false,
		wordOvervallen = false,
		kassaGeld = math.random(5000, 7500), --121k + 10k
		kassas = {
			['een'] = {
				aan = false,
				locatie = vector3(35.6066, -2708.6975, 1.8717),
			},
			['twee'] = {
				aan = false,
				locatie = vector3(34.3248, -2712.2400, 2.1347),
			},
			['drie'] = {
				aan = false,
				locatie = vector3(35.1911, -2717.0405, 2.1204),
			},
			['vier'] = {
				aan = false,
				locatie = vector3(35.4069, -2722.2039, 2.1373),
			},
			['fijv'] = {
				aan = false,
				locatie = vector3(45.9455, -2721.9583, 6.0024),
			},
			['ses'] = {
				aan = false,
				locatie = vector3(47.6928, -2706.7666, 6.0041),
			},
			['zeven'] = {
				aan = false,
				locatie = vector3(48.3935, -2698.9602, 6.0051),
			},
			['acht'] = {
				aan = false,
				locatie = vector3(21.1554, -2699.8250, 6.0078),
			},
			['negen'] = {
				aan = false,
				locatie = vector3(19.7540, -2709.9419, 6.0076),
			},
			['tien'] = {
				aan = false,
				locatie = vector3(23.9079, -2727.3433, 6.0049),
			},
			['elf'] = {
				aan = false,
				locatie = vector3(20.4867, -2736.9731, 6.0053),
			},
			['twaalf'] = {
				aan = false,
				locatie = vector3(46.7336, -2680.5234, 6.0116),
			},
			['dertien'] = {
				aan = false,
				locatie = vector3(50.4080, -2682.1821, 6.0092),
			},
			['veertien'] = {
				aan = false,
				locatie = vector3(57.6954, -2678.7747, 6.0251),
			},
			['fijftien'] = {
				aan = false,
				locatie = vector3(30.7607, -2666.5012, 12.0451),
			},
			['sestien'] = {
				aan = false,
				locatie = vector3(35.3867, -2679.7258, 12.0354),
			},
			['zeventien'] = {
				aan = false,
				locatie = vector3(28.3761, -2681.2703, 12.0354),
			},
			['zeventien'] = {
				aan = false,
				locatie = vector3(48.2572, -2720.2520, 12.0066),
			},
			['achtien'] = {
				aan = false,
				locatie = vector3(21.7152, -2688.4326, 12.0068),
			},
		},
		kluis = {
			['een'] = {
				aan = false,
				locatie = vector3(39.7854, -2675.9321, 6.0104),
			},
		},
		kluisGeld = math.random(0, 20000),
	},
	--[[ ['StripClub'] = {
		PoliceNumberRequired = 1,
		distance = 40,
		start = vector3(97.1826, -1291.8916, 29.2688),
		nameOfStore = 'Grote ... winkel - de favoriete plek van ...',
		lastRobbed = 0,
		type = 1,
		kluisAan = false,
		wordOvervallen = false,
		kassaGeld = math.random(11000, 22000),
		kassas = {
			['een'] = {
				aan = false,
				locatie = vector3(129.8880, -1292.7292, 29.2695),
			},
			['twee'] = {
				aan = false,
				locatie = vector3(129.6890, -1291.9532, 29.2695),
			},
			['drie'] = {
				aan = false,
				locatie = vector3(129.1882, -1291.0533, 29.2695),
			},
			['vier'] = {
				aan = false,
				locatie = vector3(128.4521, -1285.5317, 29.2797),
			},
			['fijv'] = {
				aan = false,
				locatie = vector3(108.5649, -1305.8750, 28.7688),
			},
			['ses'] = {
				aan = false,
				locatie = vector3(112.3517, -1287.1440, 28.4588),
			},
		},
		kluis = {
			['een'] = {
				aan = false,
				locatie = vector3(93.3674, -1291.4266, 29.2687),
			},
		},
		kluisGeld = math.random(40000, 60000),
	}, ]]--
	--[[
	['Humain'] = {
		PoliceNumberRequired = 1,
		distance = 200,
		start = vector3(3614.9814, 3726.6040, 28.6901),
		nameOfStore = 'Menselijk Lab vol misterien - waar zijn de aliens???',
		lastRobbed = 0,
		type = 2,
		kluisAan = false,
		wordOvervallen = false,
		kassaGeld = math.random(50000, 90000), --1miljoen + 200k
		kassas = {
			['een'] = {
				aan = false,
				locatie = vector3(3537.4592, 3662.4966, 28.3553),
			},
			['twee'] = {
				aan = false,
				locatie = vector3(3553.5830, 3656.2661, 28.1219),
			},
			['drie'] = {
				aan = false,
				locatie = vector3(3549.6489, 3662.0229, 28.1219),
			},
			['vier'] = {
				aan = false,
				locatie = vector3(3553.5811, 3659.6431, 28.1219),
			},
			['fijv'] = {
				aan = false,
				locatie = vector3(3561.6816, 3670.1140, 28.1219),
			},
			['ses'] = {
				aan = false,
				locatie = vector3(3557.8787, 3685.4316, 28.1237),
			},
			['zeven'] = {
				aan = false,
				locatie = vector3(3562.4634, 3684.6816, 28.1219),
			},
			['acht'] = {
				aan = false,
				locatie = vector3(3589.0500, 3709.8176, 29.6894),
			},
			['negen'] = {
				aan = false,
				locatie = vector3(3595.0381, 3711.1323, 29.6894),
			},
			['tien'] = {
				aan = false,
				locatie = vector3(3589.5652, 3714.0918, 29.6894),
			},
			['elf'] = {
				aan = false,
				locatie = vector3(3595.7952, 3716.1829, 29.6894),
			},
			['twaalf'] = {
				aan = false,
				locatie = vector3(3593.0759, 3725.0432, 29.6894),
			},
			['dertien'] = {
				aan = false,
				locatie = vector3(3597.8267, 3721.6604, 29.6894),
			},
			['veertien'] = {
				aan = false,
				locatie = vector3(3602.0847, 3726.7837, 29.6894),
			},
		},
		kluis = {
			['een'] = {
				aan = false,
				locatie = vector3(3562.4744, 3675.6929, 28.1219),
			},
		},
		kluisGeld = math.random(100000, 300000),
	},
	]]--
}