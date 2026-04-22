return {
    -- Police Lockers Start --

    {
        target = {
            loc = vec3(461.59, -1000.0, 30.69),
            length = 1.0,
            width = 3.8,
            heading = 0,
            minZ = 29.69,
            maxZ = 32.69,
            label = 'Open Personal Locker'
        },
        name = 'police-locker',
        label = 'Personal Locker',
        owner = true,
        slots = 70,
        weight = 70000,
        groups = shared.police,
        loc = vec3(461.59, -1000.0, 30.69),
    },

    {
        target = {
            loc = vec3(1841.51, 3682.08, 34.19),
            length = 2.0,
            width = 1.0,
            heading = 30,
            minZ = 33.19,
            maxZ = 35.59,
            label = 'Open Personal Locker'
        },
        name = 'police-locker-2',
        label = 'Personal Locker',
        owner = true,
        slots = 70,
        weight = 70000,
        groups = shared.police,
        loc = vec3(1841.51, 3682.08, 34.19),
    },

    {
        target = {
            loc = vec3(-436.32, 6009.79, 37.0),
            length = 0.2,
            width = 2.2,
            heading = 45,
            minZ = 36.3,
            maxZ = 38.1,
            label = 'Open Personal Locker'
        },
        name = 'police-locker-3',
        label = 'Personal Locker',
        owner = true,
        slots = 70,
        weight = 70000,
        groups = shared.police,
        loc = vec3(-436.32, 6009.79, 37.0),
    },

    {
        target = {
            loc = vec3(360.08, -1592.9, 25.45),
            length = 0.5,
            width = 2.8,
            heading = 50,
            minZ = 24.45,
            maxZ = 27.45,
            label = 'Open Personal Locker'
        },
        name = 'police-locker-4',
        label = 'Personal Locker',
        owner = true,
        slots = 70,
        weight = 70000,
        groups = shared.police,
        loc = vec3(360.08, -1592.9, 25.45),
    },

    {
        target = {
            loc = vec3(844.8, -1286.55, 28.24),
            length = 2.0,
            width = 1.2,
            heading = 0,
            minZ = 27.24,
            maxZ = 29.84,
            label = 'Open Personal Locker'
        },
        name = 'police-locker-5',
        label = 'Personal Locker',
        owner = true,
        slots = 70,
        weight = 70000,
        groups = shared.police,
        loc = vec3(844.8, -1286.55, 28.24),
    },

    {
        target = {
            loc = vec3(-1061.09, -247.43, 39.74),
            length = 3.6,
            width = 1.0,
            heading = 27,
            minZ = 38.74,
            maxZ = 41.34,
            label = 'Open Personal Locker'
        },
        name = 'police-locker-6',
        label = 'Personal Locker',
        owner = true,
        slots = 70,
        weight = 70000,
        groups = shared.police,
        loc = vec3(-1061.09, -247.43, 39.74),
    },

    -- Police Lockers End --

    -- EMS Lockers Start --

    {
        target = {
            loc = vec3(1142.12, -1539.54, 35.03),
            length = 4.2,
            width = 0.6,
            heading = 0,
            minZ = 32.23,
            maxZ = 36.23,
            label = 'Open Personal Locker'
        },
        name = 'ems-locker',
        label = 'Personal Locker',
        owner = true,
        slots = 70,
        weight = 70000,
        groups = "ems",
        workplace = "safd",
        loc = vec3(1142.12, -1539.54, 35.03),
    },

    -- EMS Lockers End --

    -- Government Storage Start --

    -- {
    --     target = {
    --         loc = vec3(-586.32, -213.18, 42.84),
    --         length = 0.8,
    --         width = 1.0,
    --         heading = 30,
    --         minZ = 41.84,
    --         maxZ = 44.24,
    --         label = 'Open Safe'
    --     },
    --     name = 'doj-chief-justice-storage',
    --     label = 'Chief Justice Storage',
    --     owner = false,
    --     slots = 70,
    --     weight = 70000,
    --     groups = "government",
    --     workplace = "doj"
    -- },

    {
        target = {
            loc = vec3(-586.64, -203.5, 38.23),
            length = 0.8,
            width = 1.4,
            heading = 30,
            minZ = 37.23,
            maxZ = 39.43,
            label = 'Open Storage'
        },
        name = 'doj-storage',
        label = 'DOJ Storage',
        owner = false,
        slots = 70,
        weight = 70000,
        groups = "government",
        workplace = "doj",
        loc = vec3(-586.64, -203.5, 38.23),
    },

    -- Government Storage End --

    -- Business Safes / Storages Start --
    {
        target = {
            loc = vec3(-1648.3, -1072.7, 13.76),
            length = 0.6,
            width = 1.0,
            heading = 320,
            minZ = 11.96,
            maxZ = 14.56,
            label = 'Open Safe'
        },
        name = 'avast-arcade-safe',
        label = 'Avast Arcade Safe',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "avast_arcade",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(-1648.3, -1072.7, 13.76),
    },

    {
        target = {
            loc = vec3(796.54, -749.24, 31.27),
            length = 0.6,
            width = 1.0,
            heading = 0,
            minZ = 29.47,
            maxZ = 32.07,
            label = 'Open Safe'
        },
        name = 'pizza-this-safe',
        label = 'Pizza This Safe',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "pizza_this",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(796.54, -749.24, 31.27),
    },

    {
        target = {
            loc = vec3(2474.25, 4111.19, 41.24),
            length = 0.6,
            width = 1.0,
            heading = 355,
            minZ = 39.44,
            maxZ = 42.04,
            label = 'Open Safe'
        },
        name = 'greycat-shipping-safe',
        label = 'Greycat Shipping Safe',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "greycat_shipping",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(2474.25, 4111.19, 41.24),
    },

    {
        target = {
            loc = vec3(2467.2, 4090.4, 34.83),
            length = 2.0,
            width = 2.0,
            heading = 0,
            minZ = 33.83,
            maxZ = 36.83,
            label = 'Open Storage'
        },
        name = 'greycat-shipping-storage',
        label = 'Greycat Shipping Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "greycat_shipping",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(2467.2, 4090.4, 34.83),
    },

    {
        target = {
            loc = vec3(-595.65, -914.12, 28.14),
            length = 0.6,
            width = 1.0,
            heading = 1,
            minZ = 26.34,
            maxZ = 28.94,
            label = 'Open Safe'
        },
        name = 'redline-safe',
        label = 'Redline Safe',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "redline",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(-595.65, -914.12, 28.14),
    },

    {
        target = {
            loc = vec3(-580.84, -928.21, 23.89),
            length = 2.2,
            width = 2.2,
            heading = 0,
            minZ = 22.89,
            maxZ = 25.09,
            label = 'Open Safe'
        },
        name = 'redline-safe2',
        label = 'Redline Safe 2',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "redline",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(-580.84, -928.21, 23.89),
    },

    {
        target = {
            loc = vec3(994.78, -1489.84, 31.5),
            length = 3.2,
            width = 3.2,
            heading = 270,
            minZ = 30.5,
            maxZ = 33.1,
            label = 'Open Storage'
        },
        name = 'blackline-storage',
        label = 'Blackline Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "blackline",
        loc = vec3(994.78, -1489.84, 31.5),
    },

    {
        target = {
            loc = vec3(-597.39, -1049.57, 22.34),
            length = 1.0,
            width = 1.0,
            heading = 0,
            minZ = 21.34,
            maxZ = 23.94,
            label = 'Open Safe'
        },
        name = 'uwu-safe',
        label = 'UwU Safe',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "uwu",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(-597.39, -1049.57, 22.34),
    },

    {
        target = {
            loc = vec3(-598.09, -1065.24, 22.34),
            length = 5.2,
            width = 7.6,
            heading = 0,
            minZ = 21.34,
            maxZ = 24.74,
            label = 'Open Storage'
        },
        name = 'uwu_warehouse_storage',
        label = 'UwU Warehouse Storage',
        owner = false,
        slots = 150,
        weight = 150000,
        groups = "uwu",
        loc = vec3(-598.09, -1065.24, 22.34),
    },

    {
        target = {
            loc = vec3(-23.87, -1102.85, 27.27),
            length = 1.0,
            width = 2.2,
            heading = 340,
            minZ = 26.27,
            maxZ = 28.27,
            label = 'Open Safe'
        },
        name = 'pdm-safe',
        label = 'PDM Safe',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "pdm",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(-23.87, -1102.85, 27.27),
    },

    {
        target = {
            loc = vec3(-27.056, -1097.984, 27.274),
            length = 1.0,
            width = 2.2,
            heading = 160,
            minZ = 26.27,
            maxZ = 28.27,
            label = 'Open Storage'
        },
        name = 'pdm-storage',
        label = 'PDM Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "pdm",
        loc = vec3(-27.056, -1097.984, 27.274),
    },

    {
        target = {
            loc = vec3(146.27, -3007.82, 6.04),
            length = 2.0,
            width = 2.0,
            heading = 0,
            minZ = 6.04,
            maxZ = 8.04,
            label = 'Open Safe'
        },
        name = 'tuna-safe',
        label = 'Tuna Safe',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "tuna",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(146.27, -3007.82, 6.04),
    },

    {
        target = {
            loc = vec3(145.68, -3011.15, 6.04),
            length = 1.0,
            width = 1.0,
            heading = 0,
            minZ = 6.04,
            maxZ = 8.24,
            label = 'Open Safe'
        },
        name = 'tuna-safe_2',
        label = 'Tuna Safe 2',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "tuna",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(145.68, -3011.15, 6.04),
    },

    {
        target = {
            loc = vec3(-816.53, -696.26, 32.14),
            length = 1.0,
            width = 1.0,
            heading = 0,
            minZ = 30.94,
            maxZ = 33.34,
            label = 'Open Safe'
        },
        name = 'triad-safe',
        label = 'Triad Safe',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "triad",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(-816.53, -696.26, 32.14),
    },

    {
        target = {
            loc = vec3(757.46, -775.95, 26.34),
            length = 0.8,
            width = 0.8,
            heading = 0,
            minZ = 25.34,
            maxZ = 27.14,
            label = 'Open Safe'
        },
        name = 'bobs-safe',
        label = 'Bobs Safe',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "bobs",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(757.46, -775.95, 26.34),
    },

    {
        target = {
            loc = vec3(-2579.55, 1884.19, 163.79),
            length = 3.6,
            width = 1.4,
            heading = 310,
            minZ = 162.79,
            maxZ = 165.39,
            label = 'Open Safe'
        },
        name = 'dmansion_safe_1',
        label = 'D Mansion Safe 1',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "dgang",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(-2579.55, 1884.19, 163.79),
    },

    {
        target = {
            loc = vec3(-2598.18, 1888.33, 163.75),
            length = 2.4,
            width = 1.6,
            heading = 220,
            minZ = 162.75,
            maxZ = 165.35,
            label = 'Open Safe'
        },
        name = 'dmansion_safe_2',
        label = 'D Mansion Safe 2',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "dgang",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(-2598.18, 1888.33, 163.75),
    },

    {
        target = {
            loc = vec3(-2604.13, 1923.33, 167.3),
            length = 2.4,
            width = 1.6,
            heading = 95,
            minZ = 166.3,
            maxZ = 168.9,
            label = 'Open Safe'
        },
        name = 'dmansion_safe_3',
        label = 'D Mansion Safe 3',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "dgang",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(-2604.13, 1923.33, 167.3),
    },

    {
        target = {
            loc = vec3(-2601.2, 1875.18, 163.79),
            length = 1.2,
            width = 5.0,
            heading = 40,
            minZ = 162.79,
            maxZ = 165.19,
            label = 'Open Safe'
        },
        name = 'dmansion_safe_4',
        label = 'D Mansion Safe 4',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "dgang",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(-2601.2, 1875.18, 163.79),
    },

    {
        target = {
            loc = vec3(-2588.94, 1893.82, 163.72),
            length = 2.0,
            width = 3.0,
            heading = 310,
            minZ = 162.72,
            maxZ = 165.32,
            label = 'Open Safe'
        },
        name = 'dmansion_safe_5',
        label = 'D Mansion Safe 5',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "dgang",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(-2588.94, 1893.82, 163.72),
    },

    {
        target = {
            loc = vec3(-2590.74, 1911.72, 167.3),
            length = 1.8,
            width = 2.0,
            heading = 7,
            minZ = 166.3,
            maxZ = 168.9,
            label = 'Open Safe'
        },
        name = 'dmansion_safe_6',
        label = 'D Mansion Safe 6',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "dgang",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(-2590.74, 1911.72, 167.3),
    },

    {
        target = {
            loc = vec3(-1428.22, -459.8, 35.91),
            length = 1.6,
            width = 1.2,
            heading = 300,
            minZ = 34.91,
            maxZ = 37.11,
            label = 'Open Safe'
        },
        name = 'hayes_safe',
        label = 'Hayes Safe',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "hayes",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(-1428.22, -459.8, 35.91),
    },

    {
        target = {
            loc = vec3(1187.2834, 2635.8643, 38.4020),
            length = 1.6,
            width = 1.2,
            heading = 186.5794,
            minZ = 36.940201,
            maxZ = 40.4020,
            label = 'Open Safe'
        },
        name = 'harmony_safe',
        label = 'Harmony Safe',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "harmony",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(1187.2834, 2635.8643, 38.4020),
    },

    {
        target = {
            loc = vec3(-1372.069, -629.168, 29.320),
            length = 1.25,
            width = 1.0,
            heading = 123,
            minZ = 28.26,
            maxZ = 31.320,
            label = 'Open Safe'
        },
        name = 'bahama_safe',
        label = 'Bahama Safe',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "bahama",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(-1372.069, -629.168, 29.320),
    },

    {
        target = {
            loc = vec3(-296.13, 6268.23, 31.53),
            length = 1.6,
            width = 1.6,
            heading = 43,
            minZ = 30.28,
            maxZ = 32.48,
            label = 'Open Safe'
        },
        name = 'woods_saloon_safe',
        label = 'Woods Saloon Safe',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "woods_saloon",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(-296.13, 6268.23, 31.53),
    },

    {
        target = {
            loc = vec3(93.78, -1290.6, 29.26),
            length = 1.0,
            width = 1.4,
            heading = 30,
            minZ = 28.26,
            maxZ = 29.86,
            label = 'Open Safe'
        },
        name = 'unicorn_safe',
        label = 'Unicorn Safe',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "unicorn",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(93.78, -1290.6, 29.26),
    },

    {
        target = {
            loc = vec3(-725.948, 261.153, 84.101),
            length = 1.0,
            width = 1.0,
            heading = 120,
            minZ = 83.14,
            maxZ = 85.54,
            label = 'Open Safe'
        },
        name = 'dynasty8_safe',
        label = 'Dynasty8 Safe',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "dynasty8",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(-725.948, 261.153, 84.101),
    },

    {
        target = {
            loc = vec3(-716.067, 266.820, 84.101),
            length = 2.0,
            width = 1.0,
            heading = 290,
            minZ = 83.14,
            maxZ = 85.54,
            label = 'Open Storage'
        },
        name = 'dynasty8_storage',
        label = 'Dynasty8 Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "dynasty8",
        loc = vec3(-716.067, 266.820, 84.101),
    },

    {
        target = {
            loc = vec3(-69.95, -1327.76, 29.27),
            length = 1.0,
            width = 1.0,
            heading = 0,
            minZ = 28.27,
            maxZ = 30.27,
            label = 'Open Safe'
        },
        name = 'nutz_safe',
        label = 'Tire Nutz Safe',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "tirenutz",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(-69.95, -1327.76, 29.27),
    },

    {
        target = {
            loc = vec3(-1162.64, -1572.16, 4.66),
            length = 3.2,
            width = 3.2,
            heading = 305,
            minZ = 3.66,
            maxZ = 6.06,
            label = 'Open Storage'
        },
        name = 'weed_storage',
        label = 'Weed Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "weed",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(-1162.64, -1572.16, 4.66),
    },

    {
        target = {
            loc = vec3(-1166.66, -1567.7, 4.66),
            length = 1.0,
            width = 1.0,
            heading = 310,
            minZ = 3.66,
            maxZ = 5.86,
            label = 'Open Safe'
        },
        name = 'weed_safe',
        label = 'Weed Safe',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "weed",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(-1166.66, -1567.7, 4.66),
    },

    {
        target = {
            loc = vec3(-571.53, 289.01, 79.18),
            length = 1.0,
            width = 1.0,
            heading = 355,
            minZ = 78.18,
            maxZ = 80.38,
            label = 'Open Safe'
        },
        name = 'tequila_safe',
        label = 'Tequila Safe',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "tequila",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(-571.53, 289.01, 79.18),
    },

    {
        target = {
            loc = vec3(380.74, -824.81, 29.3),
            length = 1.0,
            width = 1.0,
            heading = 0,
            minZ = 28.3,
            maxZ = 30.9,
            label = 'Open Safe'
        },
        name = 'digitalden_safe',
        label = 'Digital Den Safe',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "digitalden",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(380.74, -824.81, 29.3),
    },

    {
        target = {
            loc = vec3(268.22, -1786.8, 31.27),
            length = 1.0,
            width = 1.0,
            heading = 50,
            minZ = 30.27,
            maxZ = 33.07,
            label = 'Open Safe'
        },
        name = 'superperformance_safe',
        label = 'Super Performance Safe',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "superperformance",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(268.22, -1786.8, 31.27),
    },

    {
        target = {
            loc = vec3(-1184.16, -1149.45, 7.67),
            length = 1.0,
            width = 1.0,
            heading = 15,
            minZ = 6.67,
            maxZ = 9.07,
            label = 'Open Safe'
        },
        name = 'noodle_safe',
        label = 'Noodle Safe',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "noodle",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(-1184.16, -1149.45, 7.67),
    },

    {
        target = {
            loc = vec3(560.4, -198.45, 58.15),
            length = 1.0,
            width = 6.0,
            heading = 0,
            minZ = 57.15,
            maxZ = 59.95,
            label = 'Open Safe'
        },
        name = 'ae_safe',
        label = 'Auto Exotics Safe',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "autoexotics",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(560.4, -198.45, 58.15),
    },

    {
        target = {
            loc = vec3(540.52, -170.44, 57.68),
            length = 1.0,
            width = 1.0,
            heading = 0,
            minZ = 56.68,
            maxZ = 58.88,
            label = 'Open Safe'
        },
        name = 'ae_safe2',
        label = 'Auto Exotics Safe 2',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "autoexotics",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(540.52, -170.44, 57.68),
    },

    {
        target = {
            loc = vec3(543.46, -184.23, 54.51),
            length = 4.6,
            width = 3.8,
            heading = 0,
            minZ = 53.51,
            maxZ = 56.31,
            label = 'Open Safe'
        },
        name = 'ae_safe3',
        label = 'Auto Exotics Safe 3',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "autoexotics",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(543.46, -184.23, 54.51),
    },

    {
        target = {
            loc = vec3(-1007.72, -262.54, 44.8),
            length = 1.0,
            width = 1.0,
            heading = 325,
            minZ = 43.8,
            maxZ = 47.8,
            label = 'Open Safe'
        },
        name = 'rockford_records_safe',
        label = 'Rockford Records Safe',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "rockford_records",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(-1007.72, -262.54, 44.8),
    },

    {
        target = {
            loc = vec3(31.14, -119.98, 56.22),
            length = 1.0,
            width = 0.8,
            heading = 340,
            minZ = 55.22,
            maxZ = 57.22,
            label = 'Open Safe'
        },
        name = 'securoserv_safe',
        label = 'SecuroServ Safe',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "securoserv",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(31.14, -119.98, 56.22),
    },

    {
        target = {
            loc = vec3(-330.72, -96.75, 47.05),
            length = 1.6,
            width = 2.0,
            heading = 340,
            minZ = 44.65,
            maxZ = 48.65,
            label = 'Open Safe'
        },
        name = 'pepega_pawn_safe',
        label = 'Pepega Pawn Safe',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "pepega_pawn",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(-330.72, -96.75, 47.05),
    },

    {
        target = {
            loc = vec3(-214.22, 6230.05, 31.79),
            length = 2.0,
            width = 1.6,
            heading = 0,
            minZ = 29.39,
            maxZ = 33.39,
            label = 'Open Safe'
        },
        name = 'garcon_pawn_safe',
        label = 'Garcon Pawn Safe',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "garcon_pawn",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(-214.22, 6230.05, 31.79),
    },

    {
        target = {
            loc = vec3(950.44, -969.84, 39.51),
            length = 2.6,
            width = 1.2,
            heading = 4,
            minZ = 38.3,
            maxZ = 40.7,
            label = 'Open Safe'
        },
        name = 'ottos_autos_safe',
        label = 'Ottos Autos Safe',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "ottos",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(950.44, -969.84, 39.51),
    },

    {
        target = {
            loc = vec3(952.56, -974.43, 39.5),
            length = 2.6,
            width = 1.2,
            heading = 275,
            minZ = 38.3,
            maxZ = 40.7,
            label = 'Open Safe'
        },
        name = 'ottos_autos_safe2',
        label = 'Ottos Autos Safe 2',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "ottos",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(952.56, -974.43, 39.5),
    },

    {
        target = {
            loc = vec3(-192.8473, -1314.6613, 31.3005),
            length = 1.0,
            width = 1.4,
            heading = 280,
            minZ = 29.4571,
            maxZ = 33.4571,
            label = 'Open Safe'
        },
        name = 'bennys_safe',
        label = 'Bennys Safe',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "bennys",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(-192.8473, -1314.6613, 31.3005),
    },

    {
        target = {
            loc = vec3(-192.4591, -1337.8313, 31.3005),
            length = 1.5,
            width = 0.75,
            heading = 280,
            minZ = 29.4571,
            maxZ = 33.4571,
            label = 'Open Safe'
        },
        name = 'bennys_safe2',
        label = 'Bennys Safe 2',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "bennys",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(-192.4591, -1337.8313, 31.3005),
    },

    {
        target = {
            loc = vec3(978.63, 50.69, 116.17),
            length = 2.6,
            width = 1.0,
            heading = 328,
            minZ = 115.17,
            maxZ = 118.17,
            label = 'Open Safe'
        },
        name = 'casino_safe',
        label = 'Casino Safe',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "casino",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(978.63, 50.69, 116.17),
    },

    {
        target = {
            loc = vec3(1000.85, 52.78, 75.06),
            length = 2.0,
            width = 2.0,
            heading = 330,
            minZ = 74.06,
            maxZ = 76.46,
            label = 'Open Safe'
        },
        name = 'casino_safe2',
        label = 'Casino Safe 2',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "casino",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(1000.85, 52.78, 75.06),
    },

    {
        target = {
            loc = vec3(-1123.2, -1460.47, 5.11),
            length = 2.0,
            width = 2.2,
            heading = 35,
            minZ = 4.11,
            maxZ = 5.91,
            label = 'Open Safe'
        },
        name = 'prego_safe',
        label = 'Prego Safe',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "prego",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(-1123.2, -1460.47, 5.11),
    },

    {
        target = {
            loc = vec3(-381.858, 268.998, 86.459),
            length = 1.0,
            width = 1.2,
            heading = 303.559,
            minZ = 85.459,
            maxZ = 87.459,
            label = 'Open Safe'
        },
        name = 'lasttrain_safe',
        label = 'Last Train Safe',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "lasttrain",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(-381.858, 268.998, 86.459),
    },

    {
        target = {
            loc = vec3(122.380, -1045.557, 29.278),
            length = 1.0,
            width = 1.0,
            heading = 250,
            minZ = 27.9742,
            maxZ = 30.9742,
            label = 'Open Safe'
        },
        name = 'beanmachine_safe',
        label = 'Bean Machine Safe',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "beanmachine",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(122.380, -1045.557, 29.278),
    },

    {
        target = {
            loc = vec3(-1200.774, -896.674, 13.798),
            length = 1.5,
            width = 1.5,
            heading = 35,
            minZ = 11.9742,
            maxZ = 15.9742,
            label = 'Open Safe'
        },
        name = 'burgershot_safe',
        label = 'Burger Shot Safe',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "burgershot",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(-1200.774, -896.674, 13.798),
    },

    {
        target = {
            loc = vec3(164.93, 248.94, 107.05),
            length = 1.4,
            width = 0.9,
            heading = 340,
            minZ = 104.65,
            maxZ = 108.65,
            label = 'Open Safe'
        },
        name = 'rustybrowns_safe',
        label = 'Rusty Browns Safe',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "rustybrowns",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(164.93, 248.94, 107.05),
    },

    {
        target = {
            loc = vec3(1073.0, -2399.06, 25.9),
            length = 1.2,
            width = 1.4,
            heading = 0,
            minZ = 24.9,
            maxZ = 26.9,
            label = 'Open Storage'
        },
        name = 'triad_boxing_storage',
        label = 'Triad Boxing Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "triad_boxing",
        loc = vec3(1073.0, -2399.06, 25.9),
    },

    {
        target = {
            loc = vec3(1002.536, -128.212, 74.063),
            length = 3.0,
            width = 1.4,
            heading = 239,
            minZ = 70.0,
            maxZ = 76.0,
            label = 'Open Safe'
        },
        name = 'odmc_storage_safe',
        label = 'ODMC Storage Safe',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "odmc",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(1002.536, -128.212, 74.063),
    },

    {
        target = {
            loc = vec3(958.58, -108.79, 74.37),
            length = 1.4,
            width = 3.6,
            heading = 315,
            minZ = 72.37,
            maxZ = 76.37,
            label = 'Open Storage'
        },
        name = 'odmc_storage',
        label = 'ODMC Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "odmc",
        loc = vec3(958.58, -108.79, 74.37),
    },

    {
        target = {
            loc = vec3(-18.51, -1438.82, 31.1),
            length = 1.8,
            width = 1.6,
            heading = 0,
            minZ = 28.5,
            maxZ = 32.5,
            label = 'Open Safe'
        },
        name = 'saints_storage_safe',
        label = 'Saints Storage Safe',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "saints",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(-18.51, -1438.82, 31.1),
    },

    {
        target = {
            loc = vec3(-16.51, -1430.47, 31.1),
            length = 2.2,
            width = 1.6,
            heading = 0,
            minZ = 28.9,
            maxZ = 32.9,
            label = 'Open Storage'
        },
        name = 'saints_storage',
        label = 'Saints Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "saints",
        loc = vec3(-16.51, -1430.47, 31.1),
    },

    {
        target = {
            loc = vec3(1616.17, 4830.96, 33.14),
            length = 1.4,
            width = 1.0,
            heading = 10,
            minZ = 31.69,
            maxZ = 33.89,
            label = 'Open Safe'
        },
        name = 'lsfc_storage_safe',
        label = 'LSFC Storage Safe',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "lsfc",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(1616.17, 4830.96, 33.14),
    },

    {
        target = {
            loc = vec3(173.31, 6391.96, 31.27),
            length = 1.0,
            width = 1.0,
            heading = 30,
            minZ = 30.27,
            maxZ = 32.27,
            label = 'Open Safe'
        },
        name = 'paleto_tuners_storage_safe',
        label = 'Paleto Tuners Safe',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "paleto_tuners",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(173.31, 6391.96, 31.27),
    },

    {
        target = {
            loc = vec3(176.64, 6385.5, 31.27),
            length = 1.0,
            width = 1.0,
            heading = 30,
            minZ = 30.27,
            maxZ = 32.47,
            label = 'Open Safe'
        },
        name = 'paleto_tuners_storage_safe2',
        label = 'Paleto Tuners Safe',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "paleto_tuners",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(176.64, 6385.5, 31.27),
    },

    {
        target = {
            loc = vec3(143.54, 6376.71, 31.27),
            length = 1.0,
            width = 1.0,
            heading = 25,
            minZ = 30.27,
            maxZ = 33.07,
            label = 'Open Safe'
        },
        name = 'paleto_tuners_storage_safe3',
        label = 'Paleto Tuners Safe',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "paleto_tuners",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(143.54, 6376.71, 31.27),
    },

    {
        target = {
            loc = vec3(-700.44, -1399.22, 8.55),
            length = 1.0,
            width = 1.4,
            heading = 50,
            minZ = 7.55,
            maxZ = 9.95,
            label = 'Open Safe'
        },
        name = 'dreamworks_safe',
        label = 'Dreamworks Safe',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "dreamworks",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(-700.44, -1399.22, 8.55),
    },

    {
        target = {
            loc = vec3(-742.05, -1526.34, 5.06),
            length = 1.5,
            width = 1.5,
            heading = 24,
            minZ = 4.06,
            maxZ = 6.06,
            label = 'Open Safe'
        },
        name = 'dreamworks_safe2',
        label = 'Dreamworks Safe 2',
        owner = false,
        slots = 50,
        weight = 50000,
        groups = "dreamworks",
        permissionKey = "JOB_ACCESS_SAFE",
        loc = vec3(-742.05, -1526.34, 5.06),
    },

    -- Business Safes / Storages End --

    -- Restaurants / Cafes / Bars / Clubs Safes / Storages Start --
    {
        target = {
            loc = vec3(-1656.03, -1058.7, 12.16),
            length = 1.0,
            width = 2.2,
            heading = 320.0,
            minZ = 11.16,
            maxZ = 13.56,
            label = 'Open Storage'
        },
        name = 'avast_fridge',
        label = 'Avast Arcade',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "avast_arcade",
        permissionKey = "JOB_STORAGE",
        loc = vec3(-1656.03, -1058.7, 12.16),
    },

    {
        target = {
            loc = vec3(494.29, -1530.54, 29.29),
            length = 1.0,
            width = 1.2,
            heading = 319.0,
            minZ = 26.69,
            maxZ = 30.69,
            label = 'Open Storage'
        },
        name = 'aztecas_storage',
        label = 'Aztecas Clubhouse Bar',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "aztecas",
        permissionKey = "JOB_STORAGE",
        loc = vec3(494.29, -1530.54, 29.29),
    },

    {
        target = {
            loc = vec3(-1377.012, -634.215, 30.320),
            length = 1.0,
            width = 2.0,
            heading = 215.0,
            minZ = 29.32,
            maxZ = 31.32,
            label = 'Open Storage'
        },
        name = 'bahama-storage',
        label = 'Bahama Mamas',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "bahama",
        permissionKey = "JOB_STORAGE",
        loc = vec3(-1377.012, -634.215, 30.320),
    },

    {
        target = {
            loc = vec3(-1259.49, -281.17, 37.38),
            length = 3.4,
            width = 2.0,
            heading = 21.0,
            minZ = 36.38,
            maxZ = 38.58,
            label = 'Open Storage'
        },
        name = 'bakery-storage',
        label = 'Bakery',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "bakery",
        permissionKey = "JOB_STORAGE",
        loc = vec3(-1259.49, -281.17, 37.38),
    },

    {
        target = {
            loc = vec3(-1.96, -1827.12, 29.15),
            length = 1.0,
            width = 1.2,
            heading = 320.0,
            minZ = 26.35,
            maxZ = 30.35,
            label = 'Open Storage'
        },
        name = 'ballers_storage',
        label = 'Ballers Clubhouse Bar',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "ballers",
        permissionKey = "JOB_STORAGE",
        loc = vec3(-1.96, -1827.12, 29.15),
    },

    {
        target = {
            loc = vec3(123.59, -1039.2, 29.28),
            length = 2.0,
            width = 2.0,
            heading = 340.0,
            minZ = 28.08,
            maxZ = 30.28,
            label = 'Open Storage'
        },
        name = 'beanmachine-fridge',
        label = 'Bean Machine',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "beanmachine",
        permissionKey = "JOB_STORAGE",
        loc = vec3(123.59, -1039.2, 29.28),
    },

    {
        target = {
            loc = vec3(757.43, -766.4, 26.34),
            length = 0.8,
            width = 1.0,
            heading = 0.0,
            minZ = 25.34,
            maxZ = 27.54,
            label = 'Open Storage'
        },
        name = 'bobs_balls_fridge',
        label = 'Bobs Balls',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "bowling",
        permissionKey = "JOB_STORAGE",
        loc = vec3(757.43, -766.4, 26.34),
    },

    {
        target = {
            loc = vec3(-1192.9, -898.69, 13.8),
            length = 2.2,
            width = 2.4,
            heading = 35.0,
            minZ = 12.6,
            maxZ = 15.2,
            label = 'Open Storage'
        },
        name = 'burgershot-freezer',
        label = 'Burger Shot',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "burgershot",
        permissionKey = "JOB_STORAGE",
        loc = vec3(-1192.9, -898.69, 13.8),
    },

    {
        target = {
            loc = vec3(1008.64, 72.07, 75.06),
            length = 1.8,
            width = 1.8,
            heading = 328.0,
            minZ = 74.06,
            maxZ = 76.66,
            label = 'Open Storage'
        },
        name = 'casino-storage',
        label = 'Casino',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "casino",
        permissionKey = "JOB_STORAGE",
        loc = vec3(1008.64, 72.07, 75.06),
    },

    {
        target = {
            loc = vec3(991.05, 24.74, 71.46),
            length = 1.8,
            width = 1.8,
            heading = 328.0,
            minZ = 70.46,
            maxZ = 73.06,
            label = 'Open Storage'
        },
        name = 'casino-storage2',
        label = 'Casino',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "casino",
        permissionKey = "JOB_STORAGE",
        loc = vec3(991.05, 24.74, 71.46),
    },

    {
        target = {
            loc = vec3(971.52, 68.73, 116.16),
            length = 2.2,
            width = 1.4,
            heading = 238.0,
            minZ = 115.16,
            maxZ = 117.36,
            label = 'Open Storage'
        },
        name = 'casino-storage3',
        label = 'Casino',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "casino",
        permissionKey = "JOB_STORAGE",
        loc = vec3(971.52, 68.73, 116.16),
    },

    {
        target = {
            loc = vec3(984.24, 74.78, -76.01),
            length = 1.0,
            width = 1.4,
            heading = 235.0,
            minZ = -77.01,
            maxZ = -74.81,
            label = 'Open Storage'
        },
        name = 'casino-storage4',
        label = 'Casino',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "casino",
        permissionKey = "JOB_STORAGE",
        loc = vec3(984.24, 74.78, -76.01),
    },

    {
        target = {
            loc = vec3(-383.95, 265.61, 86.46),
            length = 0.8,
            width = 1.4,
            heading = 305.0,
            minZ = 85.0,
            maxZ = 87.66,
            label = 'Open Storage'
        },
        name = 'lasttrain-freezer',
        label = 'The Last Train',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "lasttrain",
        permissionKey = "JOB_STORAGE",
        loc = vec3(-383.95, 265.61, 86.46),
    },

    {
        target = {
            loc = vec3(-289.955, -1936.476, 41.045),
            length = 1.0,
            width = 1.6,
            heading = 322.915,
            minZ = 39.18,
            maxZ = 43.58,
            label = 'Open Storage'
        },
        name = 'mba-storage-1',
        label = 'Maze Bank Arena',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "mba",
        permissionKey = "JOB_STORAGE",
        loc = vec3(-289.955, -1936.476, 41.045),
    },

    {
        target = {
            loc = vec3(-289.337, -1935.401, 30.146),
            length = 1.0,
            width = 1.2,
            heading = 291.033,
            minZ = 28.18,
            maxZ = 32.58,
            label = 'Open Storage'
        },
        name = 'mba-storage-2',
        label = 'Maze Bank Arena',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "mba",
        permissionKey = "JOB_STORAGE",
        loc = vec3(-289.337, -1935.401, 30.146),
    },

    {
        target = {
            loc = vec3(-1183.76, -1155.12, 7.67),
            length = 1.4,
            width = 1.0,
            heading = 15.0,
            minZ = 6.67,
            maxZ = 9.07,
            label = 'Open Storage'
        },
        name = 'noodle-freezer',
        label = 'Noodle Exchange',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "noodle",
        permissionKey = "JOB_STORAGE",
        loc = vec3(-1183.76, -1155.12, 7.67),
    },

    {
        target = {
            loc = vec3(802.49, -758.53, 26.78),
            length = 3.6,
            width = 3.0,
            heading = 1.0,
            minZ = 25.78,
            maxZ = 29.58,
            label = 'Open Storage'
        },
        name = 'pizza_this-freezer',
        label = 'Pizza This',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "pizza_this",
        permissionKey = "JOB_STORAGE",
        loc = vec3(802.49, -758.53, 26.78),
    },

    {
        target = {
            loc = vec3(813.35, -749.39, 26.78),
            length = 2.4,
            width = 1.0,
            heading = 0.0,
            minZ = 25.78,
            maxZ = 27.38,
            label = 'Open Storage'
        },
        name = 'pizza_this-fridge-1',
        label = 'Pizza This',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "pizza_this",
        permissionKey = "JOB_STORAGE",
        loc = vec3(813.35, -749.39, 26.78),
    },

    {
        target = {
            loc = vec3(809.33, -761.47, 22.3),
            length = 2.2,
            width = 1.2,
            heading = 0.0,
            minZ = 21.3,
            maxZ = 23.3,
            label = 'Open Storage'
        },
        name = 'pizza_this-wine',
        label = 'Pizza This',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "pizza_this",
        permissionKey = "JOB_STORAGE",
        loc = vec3(809.33, -761.47, 22.3),
    },

    {
        target = {
            loc = vec3(-1124.56, -1458.42, 5.11),
            length = 1.4,
            width = 2.4,
            heading = 35.0,
            minZ = 4.11,
            maxZ = 6.51,
            label = 'Open Storage'
        },
        name = 'prego-freezer',
        label = 'Cafe Prego',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "prego",
        permissionKey = "JOB_STORAGE",
        loc = vec3(-1124.56, -1458.42, 5.11),
    },

    {
        target = {
            loc = vec3(-1119.02, -1452.57, 5.11),
            length = 1.0,
            width = 1.0,
            heading = 30.0,
            minZ = 4.11,
            maxZ = 6.31,
            label = 'Open Storage'
        },
        name = 'prego-fridge-1',
        label = 'Cafe Prego',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "prego",
        permissionKey = "JOB_STORAGE",
        loc = vec3(-1119.02, -1452.57, 5.11),
    },

    {
        target = {
            loc = vec3(-1120.07, -1456.97, 2.03),
            length = 1.2,
            width = 1.2,
            heading = 35.0,
            minZ = 1.03,
            maxZ = 3.43,
            label = 'Open Storage'
        },
        name = 'prego-wine',
        label = 'Cafe Prego',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "prego",
        permissionKey = "JOB_STORAGE",
        loc = vec3(-1120.07, -1456.97, 2.03),
    },

    {
        target = {
            loc = vec3(-984.61, -263.24, 38.47),
            length = 1.8,
            width = 6.0,
            heading = 297.0,
            minZ = 37.47,
            maxZ = 40.87,
            label = 'Open Storage'
        },
        name = 'rockford_records-storage',
        label = 'Rockford Records Bar',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "rockford_records",
        permissionKey = "JOB_STORAGE",
        loc = vec3(-984.61, -263.24, 38.47),
    },

    {
        target = {
            loc = vec3(158.21, 247.93, 107.05),
            length = 1.4,
            width = 2.0,
            heading = 340.0,
            minZ = 104.65,
            maxZ = 108.65,
            label = 'Open Storage'
        },
        name = 'rustybrowns-storage',
        label = 'Rusty Browns',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "rustybrowns",
        permissionKey = "JOB_STORAGE",
        loc = vec3(158.21, 247.93, 107.05),
    },

    {
        target = {
            loc = vec3(-568.57, 291.2, 79.18),
            length = 1.0,
            width = 1.6,
            heading = 355.0,
            minZ = 78.18,
            maxZ = 80.58,
            label = 'Open Storage'
        },
        name = 'tequila-storage',
        label = 'Tequi-La-La',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "tequila",
        permissionKey = "JOB_STORAGE",
        loc = vec3(-568.57, 291.2, 79.18),
    },

    {
        target = {
            loc = vec3(-810.51, -733.09, 23.78),
            length = 5.0,
            width = 5.0,
            heading = 0.0,
            minZ = 22.78,
            maxZ = 25.98,
            label = 'Open Storage'
        },
        name = 'triad-storage',
        label = 'Triad Records Bar',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "triad",
        permissionKey = "JOB_STORAGE",
        loc = vec3(-810.51, -733.09, 23.78),
    },

    {
        target = {
            loc = vec3(132.78, -1287.97, 29.27),
            length = 1.0,
            width = 2.0,
            heading = 300.0,
            minZ = 28.27,
            maxZ = 30.67,
            label = 'Open Storage'
        },
        name = 'unicorn-storage',
        label = 'Vanilla Unicorn',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "unicorn",
        permissionKey = "JOB_STORAGE",
        loc = vec3(132.78, -1287.97, 29.27),
    },

    {
        target = {
            loc = vec3(-589.43, -1066.88, 22.34),
            length = 3.8,
            width = 3.8,
            heading = 0.0,
            minZ = 21.34,
            maxZ = 23.94,
            label = 'Open Storage'
        },
        name = 'uwu-freezer',
        label = 'UwU Cafe',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "uwu",
        permissionKey = "JOB_STORAGE",
        loc = vec3(-589.43, -1066.88, 22.34),
    },

    {
        target = {
            loc = vec3(337.75, -1988.88, 24.21),
            length = 1.6,
            width = 1.0,
            heading = 320.0,
            minZ = 21.41,
            maxZ = 25.41,
            label = 'Open Storage'
        },
        name = 'vagos_storage',
        label = 'Vagos Clubhouse Bar',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "vagos",
        permissionKey = "JOB_STORAGE",
        loc = vec3(337.75, -1988.88, 24.21),
    },

    {
        target = {
            loc = vec3(-305.63, 6271.79, 31.53),
            length = 1.4,
            width = 5.6,
            heading = 225.0,
            minZ = 30.28,
            maxZ = 32.48,
            label = 'Open Storage'
        },
        name = 'woods-saloon-storage',
        label = 'Black Woods Saloon',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "woods_saloon",
        permissionKey = "JOB_STORAGE",
        loc = vec3(-305.63, 6271.79, 31.53),
    },
    -- Restaurants / Cafes / Bars / Clubs Safes / Storages End --
    -- Taco Shop Storage Start --
    {
        target = {
            loc = vec3(8.0, -1603.23, 29.38),
            length = 1.8,
            width = 1.6,
            heading = 320.0,
            minZ = 26.58,
            maxZ = 30.58,
            label = 'Open Storage'
        },
        name = 'taco_shop-storage-1',
        label = 'taco_shop',
        owner = false,
        slots = 100,
        weight = 100000,
        loc = vec3(8.0, -1603.23, 29.38),
    },
    -- Taco Shop Storage End --
    -- Other Business Storages Start --
    {
        target = {
            loc = vec3(-61.9327, -2516.3125, 7.4032),
            length = 1.0,
            width = 1.4,
            heading = 325.0,
            minZ = 5.4,
            maxZ = 9.4,
            label = 'Open Storage'
        },
        name = 'cloud9-storage',
        label = 'Cloud9 Drift',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "cloud9",
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-61.9327, -2516.3125, 7.4032),
    },

    {
        target = {
            loc = vec3(382.66, -830.16, 29.3),
            length = 1.0,
            width = 1.4,
            heading = 0.0,
            minZ = 28.3,
            maxZ = 30.9,
            label = 'Open Storage'
        },
        name = 'digitalden-storage',
        label = 'Digital Den',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "digitalden",
        permissionKey = 'JOB_STORAGE',
        loc = vec3(382.66, -830.16, 29.3),
    },

    {
        target = {
            loc = vec3(382.15, -818.72, 29.3),
            length = 3.6,
            width = 3.6,
            heading = 0.0,
            minZ = 28.3,
            maxZ = 30.7,
            label = 'Open Storage'
        },
        name = 'digitalden-storage-2',
        label = 'Digital Den',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "digitalden",
        permissionKey = 'JOB_STORAGE',
        loc = vec3(382.15, -818.72, 29.3),
    },

    {
        target = {
            loc = vec3(374.35, -818.37, 29.3),
            length = 2.0,
            width = 2.0,
            heading = 0.0,
            minZ = 28.3,
            maxZ = 30.7,
            label = 'Open Storage'
        },
        name = 'digitalden-storage-3',
        label = 'Digital Den',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "digitalden",
        permissionKey = 'JOB_STORAGE',
        loc = vec3(374.35, -818.37, 29.3),
    },

    {
        target = {
            loc = vec3(-217.28, 6230.52, 31.79),
            length = 1.4,
            width = 1.8,
            heading = 315.0,
            minZ = 29.59,
            maxZ = 33.59,
            label = 'Open Storage'
        },
        name = 'garcon_pawn-storage',
        label = 'Garcon Pawn',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "garcon_pawn",
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-217.28, 6230.52, 31.79),
    },

    {
        target = {
            loc = vec3(-698.615, -902.925, 19.525),
            length = 1.0,
            width = 1.0,
            heading = 270.623,
            minZ = 18.525,
            maxZ = 20.525,
            label = 'Open Storage'
        },
        name = 'jewel-office-storage-1',
        label = 'The Jeweled Dragon',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "jewel",
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-698.615, -902.925, 19.525),
    },

    {
        target = {
            loc = vec3(-707.823, -892.020, 19.525),
            length = 0.5,
            width = 3.0,
            heading = 0.0,
            minZ = 18.525,
            maxZ = 20.525,
            label = 'Open Storage'
        },
        name = 'jewel-office-storage-2',
        label = 'The Jeweled Dragon',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "jewel",
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-707.823, -892.020, 19.525),
    },

    {
        target = {
            loc = vec3(-710.585, -898.925, 19.525),
            length = 4.0,
            width = 3.4,
            heading = 180.876,
            minZ = 18.525,
            maxZ = 20.525,
            label = 'Open Storage'
        },
        name = 'jewel-safe-1',
        label = 'The Jeweled Dragon',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "jewel",
        permissionKey = 'JOB_ACCESS_SAFE',
        loc = vec3(-710.585, -898.925, 19.525),
    },

    {
        target = {
            loc = vec3(-698.491, -899.153, 23.806),
            length = 1.0,
            width = 1.0,
            heading = 275.623,
            minZ = 22.806,
            maxZ = 24.806,
            label = 'Open Storage'
        },
        name = 'jewel-storage-1',
        label = 'The Jeweled Dragon',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "jewel",
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-698.491, -899.153, 23.806),
    },

    {
        target = {
            loc = vec3(-703.913, -893.902, 19.525),
            length = 5.0,
            width = 4.0,
            heading = 0.0,
            minZ = 18.525,
            maxZ = 20.525,
            label = 'Open Storage'
        },
        name = 'jewel-storage-1',
        label = 'The Jeweled Dragon',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "jewel",
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-703.913, -893.902, 19.525),
    },

    {
        target = {
            loc = vec3(1616.95, 4829.26, 33.14),
            length = 2.2,
            width = 1.4,
            heading = 10.0,
            minZ = 32.09,
            maxZ = 34.29,
            label = 'Open Storage'
        },
        name = 'lsfc-storage',
        label = 'Los Santos Fight Club',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "lsfc",
        permissionKey = 'JOB_STORAGE',
        loc = vec3(1616.95, 4829.26, 33.14),
    },

    {
        target = {
            loc = vec3(-330.93, -89.35, 47.05),
            length = 1.4,
            width = 2.6,
            heading = 340.0,
            minZ = 45.05,
            maxZ = 49.05,
            label = 'Open Storage'
        },
        name = 'pepega_pawn-storage',
        label = 'Pepega Pawn',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "pepega_pawn",
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-330.93, -89.35, 47.05),
    },

    {
        target = {
            loc = vec3(-469.44, 35.69, 46.23),
            length = 1.4,
            width = 1.4,
            heading = 355.0,
            minZ = 45.23,
            maxZ = 47.63,
            label = 'Open Storage'
        },
        name = 'sagma-office-storage-1',
        label = 'San Andreas Gallery of Modern Art',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "sagma",
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-469.44, 35.69, 46.23),
    },

    {
        target = {
            loc = vec3(-469.33, 38.29, 46.23),
            length = 1.8,
            width = 1.2,
            heading = 355.0,
            minZ = 45.23,
            maxZ = 47.83,
            label = 'Open Storage'
        },
        name = 'sagma-office-storage-2',
        label = 'San Andreas Gallery of Modern Art',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "sagma",
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-469.33, 38.29, 46.23),
    },

    {
        target = {
            loc = vec3(-467.83, 47.58, 46.23),
            length = 1.8,
            width = 2.4,
            heading = 354.0,
            minZ = 45.23,
            maxZ = 48.03,
            label = 'Open Storage'
        },
        name = 'sagma-safe-1',
        label = 'San Andreas Gallery of Modern Art',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "sagma",
        permissionKey = 'JOB_ACCESS_SAFE',
        loc = vec3(-467.83, 47.58, 46.23),
    },

    {
        target = {
            loc = vec3(-483.25, 63.12, 52.41),
            length = 1.6,
            width = 1.8,
            heading = 355.0,
            minZ = 51.41,
            maxZ = 53.81,
            label = 'Open Storage'
        },
        name = 'sagma-safe-2',
        label = 'San Andreas Gallery of Modern Art',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "sagma",
        permissionKey = 'JOB_ACCESS_SAFE',
        loc = vec3(-483.25, 63.12, 52.41),
    },

    {
        target = {
            loc = vec3(-467.29, 49.55, 52.41),
            length = 2.2,
            width = 1.6,
            heading = 355.0,
            minZ = 51.41,
            maxZ = 53.81,
            label = 'Open Storage'
        },
        name = 'sagma-storage-1',
        label = 'San Andreas Gallery of Modern Art',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "sagma",
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-467.29, 49.55, 52.41),
    },

    {
        target = {
            loc = vec3(20.04, -100.54, 56.18),
            length = 1.0,
            width = 3.2,
            heading = 70.0,
            minZ = 55.18,
            maxZ = 57.98,
            label = 'Open Storage'
        },
        name = 'securoserv-storage',
        label = 'SecuroServ',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "securoserv",
        permissionKey = 'JOB_STORAGE',
        loc = vec3(20.04, -100.54, 56.18),
    },

    {
        target = {
            loc = vec3(-383.68, 6052.27, 31.51),
            length = 1.0,
            width = 1.4,
            heading = 315.0,
            minZ = 30.11,
            maxZ = 32.71,
            label = 'Open Storage'
        },
        name = 'vangelico-safe-1',
        label = 'Vangelico Jewelry',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "vangelico",
        permissionKey = 'JOB_ACCESS_SAFE',
        loc = vec3(-383.68, 6052.27, 31.51),
    },

    {
        target = {
            loc = vec3(-384.58, 6050.94, 31.51),
            length = 2.2,
            width = 2.0,
            heading = 315.0,
            minZ = 29.11,
            maxZ = 33.11,
            label = 'Open Storage'
        },
        name = 'vangelico-storage-1',
        label = 'Vangelico Jewelry',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "vangelico",
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-384.58, 6050.94, 31.51),
    },

    {
        target = {
            loc = vec3(-379.68, 6049.42, 31.51),
            length = 1.4,
            width = 1.0,
            heading = 45.0,
            minZ = 28.71,
            maxZ = 32.71,
            label = 'Open Storage'
        },
        name = 'vangelico-storage-2',
        label = 'Vangelico Jewelry',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "vangelico",
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-379.68, 6049.42, 31.51),
    },

    {
        target = {
            loc = vec3(1648.58, 4875.25, 42.16),
            length = 1.6,
            width = 1.0,
            heading = 8.0,
            minZ = 38.56,
            maxZ = 44.56,
            label = 'Open Storage'
        },
        name = 'vangelico-grapeseed-safe-1',
        label = 'Vangelico Grapeseed Jewelry',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "vangelico_grapeseed",
        permissionKey = 'JOB_ACCESS_SAFE',
        loc = vec3(1648.58, 4875.25, 42.16),
    },

    {
        target = {
            loc = vec3(1650.22, 4875.44, 42.16),
            length = 1.6,
            width = 2.4,
            heading = 8.0,
            minZ = 38.56,
            maxZ = 44.56,
            label = 'Open Storage'
        },
        name = 'vangelico-grapeseed-storage-1',
        label = 'Vangelico Grapeseed Jewelry',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "vangelico_grapeseed",
        permissionKey = 'JOB_STORAGE',
        loc = vec3(1650.22, 4875.44, 42.16),
    },

    {
        target = {
            loc = vec3(1647.05, 4879.75, 42.16),
            length = 1.4,
            width = 2.0,
            heading = 8.0,
            minZ = 38.76,
            maxZ = 44.56,
            label = 'Open Storage'
        },
        name = 'vangelico-grapeseed-storage-2',
        label = 'Vangelico Grapeseed Jewelry',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "vangelico_grapeseed",
        permissionKey = 'JOB_STORAGE',
        loc = vec3(1647.05, 4879.75, 42.16),
    },
    -- Other Business Storages End --
    -- Mechanic Storage Start --
    {
        target = {
            loc = vec3(-584.07, -939.57, 23.89),
            length = 5.0,
            width = 3.8,
            heading = 270.0,
            minZ = 23.29,
            maxZ = 24.89,
            label = 'Open Storage'
        },
        name = 'redline-parts-storage-1',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        groups = "redline",
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-584.07, -939.57, 23.89),
    },

    {
        target = {
            loc = vec3(-57.5, -1325.07, 29.27),
            length = 2.0,
            width = 2.0,
            heading = 0.0,
            minZ = 28.27,
            maxZ = 31.07,
            label = 'Open Storage'
        },
        name = 'nutz-parts-storage-1',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-57.5, -1325.07, 29.27),
    },

    {
        target = {
            loc = vec3(-1421.67, -456.38, 35.91),
            length = 4.4,
            width = 2.0,
            heading = 302.0,
            minZ = 34.91,
            maxZ = 37.31,
            label = 'Open Storage'
        },
        name = 'hayes-parts-storage-1',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-1421.67, -456.38, 35.91),
    },

    {
        target = {
            loc = vec3(476.67, -1876.93, 26.09),
            length = 5.4,
            width = 2.0,
            heading = 25.0,
            minZ = 25.09,
            maxZ = 28.09,
            label = 'Open Storage'
        },
        name = 'atomic-parts-storage-1',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(476.67, -1876.93, 26.09),
    },

    {
        target = {
            loc = vec3(1176.15, 2635.21, 37.75),
            length = 1.4,
            width = 5.0,
            heading = 0.0,
            minZ = 36.75,
            maxZ = 39.55,
            label = 'Open Storage'
        },
        name = 'harmony-parts-storage-1',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(1176.15, 2635.21, 37.75),
    },

    {
        target = {
            loc = vec3(558.99, -171.67, 54.51),
            length = 4.6,
            width = 1.6,
            heading = 0.0,
            minZ = 53.51,
            maxZ = 56.11,
            label = 'Open Storage'
        },
        name = 'ae-storage-1',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(558.99, -171.67, 54.51),
    },

    {
        target = {
            loc = vec3(950.91, -979.09, 39.5),
            length = 3.2,
            width = 2.0,
            heading = 4.0,
            minZ = 38.55,
            maxZ = 40.75,
            label = 'Open Storage'
        },
        name = 'ottos-parts-storage-1',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(950.91, -979.09, 39.5),
    },

    {
        target = {
            loc = vec3(-205.3346, -1335.6605, 31.300),
            length = 1.6,
            width = 1.2,
            heading = 270.0,
            minZ = 29.3,
            maxZ = 32.3,
            label = 'Open Storage'
        },
        name = 'bennys-parts-storage-1',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-205.3346, -1335.6605, 31.300),
    },

    {
        target = {
            loc = vec3(163.12, 6364.78, 31.27),
            length = 2.4,
            width = 7.2,
            heading = 30.0,
            minZ = 30.27,
            maxZ = 32.67,
            label = 'Open Storage'
        },
        name = 'paleto_tuners-parts-storage-1',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(163.12, 6364.78, 31.27),
    },

    {
        target = {
            loc = vec3(-726.39, -1505.64, 5.06),
            length = 1.6,
            width = 1.2,
            heading = 293.0,
            minZ = 4.06,
            maxZ = 6.66,
            label = 'Open Storage'
        },
        name = 'dreamworks-parts-storage-1',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-726.39, -1505.64, 5.06),
    },

    {
        target = {
            loc = vec3(-593.45, -933.6, 28.14),
            length = 6.6,
            width = 12.6,
            heading = 270.0,
            minZ = 27.14,
            maxZ = 31.14,
            label = 'Open Storage'
        },
        name = 'redline-parts-storage-1',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-593.45, -933.6, 28.14),
    },

    {
        target = {
            loc = vec3(-586.19, -931.62, 23.96),
            length = 3.0,
            width = 5.6,
            heading = 0.0,
            minZ = 22.96,
            maxZ = 25.76,
            label = 'Open Storage'
        },
        name = 'redline-parts-storage-2',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-586.19, -931.62, 23.96),
    },

    {
        target = {
            loc = vec3(-585.15, -917.51, 23.96),
            length = 3.0,
            width = 5.0,
            heading = 0.0,
            minZ = 22.96,
            maxZ = 25.76,
            label = 'Open Storage'
        },
        name = 'redline-parts-storage-3',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-585.15, -917.51, 23.96),
    },

    {
        target = {
            loc = vec3(-578.07, -911.8, 23.89),
            length = 1.8,
            width = 1.8,
            heading = 0.0,
            minZ = 22.89,
            maxZ = 25.29,
            label = 'Open Storage'
        },
        name = 'redline-parts-storage-4',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-578.07, -911.8, 23.89),
    },

    {
        target = {
            loc = vec3(-585.85, -924.58, 23.89),
            length = 5.0,
            width = 3.8,
            heading = 0.0,
            minZ = 22.89,
            maxZ = 25.49,
            label = 'Open Storage'
        },
        name = 'redline-parts-storage-5',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-585.85, -924.58, 23.89),
    },

    {
        target = {
            loc = vec3(-57.5, -1325.07, 29.27),
            length = 1.0,
            width = 1.0,
            heading = 0.0,
            minZ = 28.27,
            maxZ = 31.07,
            label = 'Open Storage'
        },
        name = 'Open Storage-storage',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-57.5, -1325.07, 29.27),
    },

    {
        target = {
            loc = vec3(-58.01, -1328.92, 29.27),
            length = 2.0,
            width = 2.0,
            heading = 0.0,
            minZ = 28.27,
            maxZ = 31.07,
            label = 'Open Storage'
        },
        name = 'nutz-parts-storage-1',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-58.01, -1328.92, 29.27),
    },

    {
        target = {
            loc = vec3(-58.01, -1328.92, 29.27),
            length = 2.8,
            width = 2.0,
            heading = 0.0,
            minZ = 28.27,
            maxZ = 31.07,
            label = 'Open Storage'
        },
        name = 'nutz-parts-storage-1',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-58.01, -1328.92, 29.27),
    },

    {
        target = {
            loc = vec3(-59.78, -1336.95, 26.85),
            length = 2.0,
            width = 2.0,
            heading = 0.0,
            minZ = 25.85,
            maxZ = 27.65,
            label = 'Open Storage'
        },
        name = 'nutz-parts-storage-2',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-59.78, -1336.95, 26.85),
    },

    {
        target = {
            loc = vec3(-1421.67, -456.38, 35.91),
            length = 1.0,
            width = 1.0,
            heading = 302.0,
            minZ = 34.91,
            maxZ = 37.31,
            label = 'Open Storage'
        },
        name = 'Open Storage-storage',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-1421.67, -456.38, 35.91),
    },

    {
        target = {
            loc = vec3(-1418.77, -454.4, 35.91),
            length = 4.4,
            width = 2.0,
            heading = 32.0,
            minZ = 34.91,
            maxZ = 38.51,
            label = 'Open Storage'
        },
        name = 'hayes-parts-storage-1',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-1418.77, -454.4, 35.91),
    },

    {
        target = {
            loc = vec3(-1418.77, -454.4, 35.91),
            length = 1.2,
            width = 3.0,
            heading = 32.0,
            minZ = 34.91,
            maxZ = 38.51,
            label = 'Open Storage'
        },
        name = 'hayes-parts-storage-1',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-1418.77, -454.4, 35.91),
    },

    {
        target = {
            loc = vec3(-1407.85, -447.14, 35.91),
            length = 4.4,
            width = 2.0,
            heading = 300.0,
            minZ = 34.91,
            maxZ = 38.51,
            label = 'Open Storage'
        },
        name = 'hayes-parts-storage-2',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-1407.85, -447.14, 35.91),
    },

    {
        target = {
            loc = vec3(476.67, -1876.93, 26.09),
            length = 1.0,
            width = 1.0,
            heading = 25.0,
            minZ = 25.09,
            maxZ = 28.09,
            label = 'Open Storage'
        },
        name = 'Open Storage-storage',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(476.67, -1876.93, 26.09),
    },

    {
        target = {
            loc = vec3(470.12, -1887.23, 26.09),
            length = 5.4,
            width = 2.0,
            heading = 25.0,
            minZ = 25.09,
            maxZ = 28.29,
            label = 'Open Storage'
        },
        name = 'atomic-parts-storage-1',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(470.12, -1887.23, 26.09),
    },

    {
        target = {
            loc = vec3(470.12, -1887.23, 26.09),
            length = 1.2,
            width = 3.8,
            heading = 25.0,
            minZ = 25.09,
            maxZ = 28.29,
            label = 'Open Storage'
        },
        name = 'atomic-parts-storage-1',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(470.12, -1887.23, 26.09),
    },

    {
        target = {
            loc = vec3(471.88, -1879.14, 26.25),
            length = 5.4,
            width = 2.0,
            heading = 295.0,
            minZ = 25.25,
            maxZ = 28.25,
            label = 'Open Storage'
        },
        name = 'atomic-parts-storage-2',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(471.88, -1879.14, 26.25),
    },

    {
        target = {
            loc = vec3(1176.15, 2635.21, 37.75),
            length = 1.0,
            width = 1.0,
            heading = 0.0,
            minZ = 36.75,
            maxZ = 39.55,
            label = 'Open Storage'
        },
        name = 'Open Storage-storage',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(1176.15, 2635.21, 37.75),
    },

    {
        target = {
            loc = vec3(1172.47, 2635.59, 37.8),
            length = 1.4,
            width = 5.0,
            heading = 0.0,
            minZ = 36.8,
            maxZ = 40.8,
            label = 'Open Storage'
        },
        name = 'harmony-parts-storage-1',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(1172.47, 2635.59, 37.8),
    },

    {
        target = {
            loc = vec3(1172.47, 2635.59, 37.8),
            length = 2.0,
            width = 2.0,
            heading = 0.0,
            minZ = 36.8,
            maxZ = 40.8,
            label = 'Open Storage'
        },
        name = 'harmony-parts-storage-1',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(1172.47, 2635.59, 37.8),
    },

    {
        target = {
            loc = vec3(1184.63, 2639.38, 37.75),
            length = 1.4,
            width = 5.0,
            heading = 270.0,
            minZ = 36.75,
            maxZ = 40.15,
            label = 'Open Storage'
        },
        name = 'harmony-parts-storage-2',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(1184.63, 2639.38, 37.75),
    },

    {
        target = {
            loc = vec3(1176.15, 2635.21, 37.75),
            length = 1.0,
            width = 1.0,
            heading = 0.0,
            minZ = 36.75,
            maxZ = 39.55,
            label = 'Open Storage'
        },
        name = 'Open Storage-storage',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(1176.15, 2635.21, 37.75),
    },

    {
        target = {
            loc = vec3(543.13, -166.62, 57.68),
            length = 3.4,
            width = 1.2,
            heading = 0.0,
            minZ = 56.68,
            maxZ = 59.68,
            label = 'Open Storage'
        },
        name = 'ae-storage-1',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(543.13, -166.62, 57.68),
    },

    {
        target = {
            loc = vec3(542.45, -173.23, 54.51),
            length = 3.2,
            width = 2.0,
            heading = 0.0,
            minZ = 53.51,
            maxZ = 54.91,
            label = 'Open Storage'
        },
        name = 'ae-storage-2',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(542.45, -173.23, 54.51),
    },

    {
        target = {
            loc = vec3(555.79, -179.43, 54.51),
            length = 3.2,
            width = 5.6,
            heading = 0.0,
            minZ = 53.51,
            maxZ = 56.31,
            label = 'Open Storage'
        },
        name = 'ae-storage-3',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(555.79, -179.43, 54.51),
    },

    {
        target = {
            loc = vec3(555.81, -187.15, 54.51),
            length = 3.6,
            width = 6.4,
            heading = 0.0,
            minZ = 53.51,
            maxZ = 56.11,
            label = 'Open Storage'
        },
        name = 'ae-storage-4',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(555.81, -187.15, 54.51),
    },

    {
        target = {
            loc = vec3(560.35, -183.3, 54.51),
            length = 5.2,
            width = 1.8,
            heading = 0.0,
            minZ = 53.51,
            maxZ = 55.91,
            label = 'Open Storage'
        },
        name = 'ae-mini-1',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(560.35, -183.3, 54.51),
    },

    {
        target = {
            loc = vec3(560.11, -190.7, 54.51),
            length = 4.4,
            width = 2.0,
            heading = 0.0,
            minZ = 53.51,
            maxZ = 56.31,
            label = 'Open Storage'
        },
        name = 'ae-mini-2',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(560.11, -190.7, 54.51),
    },

    {
        target = {
            loc = vec3(560.02, -198.82, 54.51),
            length = 4.0,
            width = 1.2,
            heading = 0.0,
            minZ = 53.51,
            maxZ = 55.91,
            label = 'Open Storage'
        },
        name = 'ae-mini-3',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(560.02, -198.82, 54.51),
    },

    {
        target = {
            loc = vec3(555.38, -172.12, 54.51),
            length = 2.0,
            width = 3.4,
            heading = 0.0,
            minZ = 53.51,
            maxZ = 56.31,
            label = 'Open Storage'
        },
        name = 'ae-mini-4',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(555.38, -172.12, 54.51),
    },

    {
        target = {
            loc = vec3(564.81, -200.39, 50.31),
            length = 4.6,
            width = 1.6,
            heading = 0.0,
            minZ = 49.31,
            maxZ = 52.11,
            label = 'Open Storage'
        },
        name = 'ae-mini-5',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(564.81, -200.39, 50.31),
    },

    {
        target = {
            loc = vec3(906.83, -968.17, 39.5),
            length = 8.0,
            width = 2.0,
            heading = 5.0,
            minZ = 38.55,
            maxZ = 40.75,
            label = 'Open Storage'
        },
        name = 'ottos-parts-storage-1',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(906.83, -968.17, 39.5),
    },

    {
        target = {
            loc = vec3(936.28, -984.94, 39.5),
            length = 1.6,
            width = 2.8,
            heading = 3.0,
            minZ = 38.55,
            maxZ = 40.75,
            label = 'Open Storage'
        },
        name = 'ottos-parts-storage-2',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(936.28, -984.94, 39.5),
    },

    {
        target = {
            loc = vec3(922.84, -985.68, 39.5),
            length = 1.8,
            width = 7.8,
            heading = 3.0,
            minZ = 38.55,
            maxZ = 40.75,
            label = 'Open Storage'
        },
        name = 'ottos-parts-storage-3',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(922.84, -985.68, 39.5),
    },

    {
        target = {
            loc = vec3(955.57, -955.3, 39.5),
            length = 1.6,
            width = 2.0,
            heading = 4.0,
            minZ = 38.55,
            maxZ = 40.75,
            label = 'Open Storage'
        },
        name = 'ottos-parts-storage-4',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(955.57, -955.3, 39.5),
    },

    {
        target = {
            loc = vec3(947.77, -972.41, 39.5),
            length = 1.6,
            width = 1.2,
            heading = 3.0,
            minZ = 38.55,
            maxZ = 40.75,
            label = 'Open Storage'
        },
        name = 'ottos-parts-storage-5',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(947.77, -972.41, 39.5),
    },

    {
        target = {
            loc = vec3(962.9, -975.17, 39.5),
            length = 3.2,
            width = 2.0,
            heading = 4.0,
            minZ = 38.55,
            maxZ = 40.75,
            label = 'Open Storage'
        },
        name = 'ottos-parts-storage-6',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(962.9, -975.17, 39.5),
    },

    {
        target = {
            loc = vec3(-205.3346, -1335.6605, 31.300),
            length = 1.0,
            width = 1.0,
            heading = 270.0,
            minZ = 29.3,
            maxZ = 32.3,
            label = 'Open Storage'
        },
        name = 'Open Storage-storage',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-205.3346, -1335.6605, 31.300),
    },

    {
        target = {
            loc = vec3(-206.7109, -1339.2489, 31.3015),
            length = 1.6,
            width = 1.2,
            heading = 182.1076,
            minZ = 29.3,
            maxZ = 32.3,
            label = 'Open Storage'
        },
        name = 'bennys-parts-storage-1',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-206.7109, -1339.2489, 31.3015),
    },

    {
        target = {
            loc = vec3(-206.7109, -1339.2489, 31.3015),
            length = 1.0,
            width = 2.0,
            heading = 182.1076,
            minZ = 29.3,
            maxZ = 32.3,
            label = 'Open Storage'
        },
        name = 'bennys-parts-storage-1',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-206.7109, -1339.2489, 31.3015),
    },

    {
        target = {
            loc = vec3(-216.9994, -1337.8951, 31.3005),
            length = 1.0,
            width = 2.0,
            heading = 95.0,
            minZ = 29.3,
            maxZ = 32.3,
            label = 'Open Storage'
        },
        name = 'bennys-parts-storage-2',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-216.9994, -1337.8951, 31.3005),
    },

    {
        target = {
            loc = vec3(-223.6948, -1339.1002, 31.3013),
            length = 1.0,
            width = 2.0,
            heading = 180.6994,
            minZ = 29.3,
            maxZ = 32.3,
            label = 'Open Storage'
        },
        name = 'bennys-parts-storage-3',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-223.6948, -1339.1002, 31.3013),
    },

    {
        target = {
            loc = vec3(-229.7649, -1320.1306, 31.3005),
            length = 1.0,
            width = 1.0,
            heading = 90.0,
            minZ = 29.3,
            maxZ = 32.3,
            label = 'Open Storage'
        },
        name = 'bennys-parts-storage-4',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-229.7649, -1320.1306, 31.3005),
    },

    {
        target = {
            loc = vec3(-724.27, -1511.46, 5.06),
            length = 1.6,
            width = 3.2,
            heading = 293.0,
            minZ = 4.06,
            maxZ = 6.26,
            label = 'Open Storage'
        },
        name = 'bennys-parts-storage-5',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-724.27, -1511.46, 5.06),
    },

    {
        target = {
            loc = vec3(-728.77, -1504.35, 5.08),
            length = 1.6,
            width = 1.2,
            heading = 153.0,
            minZ = 4.08,
            maxZ = 6.28,
            label = 'Open Storage'
        },
        name = 'bennys-parts-storage-6',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-728.77, -1504.35, 5.08),
    },

    {
        target = {
            loc = vec3(163.12, 6364.78, 31.27),
            length = 1.0,
            width = 1.0,
            heading = 30.0,
            minZ = 30.27,
            maxZ = 32.67,
            label = 'Open Storage'
        },
        name = 'Open Storage-storage',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(163.12, 6364.78, 31.27),
    },

    {
        target = {
            loc = vec3(156.24, 6361.33, 31.27),
            length = 2.4,
            width = 7.2,
            heading = 27.0,
            minZ = 30.27,
            maxZ = 32.67,
            label = 'Open Storage'
        },
        name = 'paleto_tuners-parts-storage-1',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(156.24, 6361.33, 31.27),
    },

    {
        target = {
            loc = vec3(156.24, 6361.33, 31.27),
            length = 1.8,
            width = 9.0,
            heading = 27.0,
            minZ = 30.27,
            maxZ = 32.67,
            label = 'Open Storage'
        },
        name = 'paleto_tuners-parts-storage-1',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(156.24, 6361.33, 31.27),
    },

    {
        target = {
            loc = vec3(166.89, 6381.57, 31.27),
            length = 4.0,
            width = 2.0,
            heading = 28.0,
            minZ = 30.27,
            maxZ = 32.47,
            label = 'Open Storage'
        },
        name = 'paleto_tuners-parts-storage-2',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(166.89, 6381.57, 31.27),
    },

    {
        target = {
            loc = vec3(151.7, 6361.63, 31.27),
            length = 2.0,
            width = 2.0,
            heading = 30.0,
            minZ = 30.27,
            maxZ = 32.87,
            label = 'Open Storage'
        },
        name = 'paleto_tuners-parts-storage-3',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(151.7, 6361.63, 31.27),
    },

    {
        target = {
            loc = vec3(156.74, 6370.57, 31.27),
            length = 2.0,
            width = 2.0,
            heading = 30.0,
            minZ = 30.27,
            maxZ = 32.87,
            label = 'Open Storage'
        },
        name = 'paleto_tuners-parts-storage-4',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(156.74, 6370.57, 31.27),
    },

    {
        target = {
            loc = vec3(167.2, 6366.75, 31.27),
            length = 2.0,
            width = 2.0,
            heading = 30.0,
            minZ = 30.27,
            maxZ = 32.87,
            label = 'Open Storage'
        },
        name = 'paleto_tuners-parts-storage-5',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(167.2, 6366.75, 31.27),
    },

    {
        target = {
            loc = vec3(144.49, 6384.49, 31.27),
            length = 2.4,
            width = 7.2,
            heading = 30.0,
            minZ = 30.27,
            maxZ = 32.87,
            label = 'Open Storage'
        },
        name = 'paleto_tuners-parts-storage-6',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(144.49, 6384.49, 31.27),
    },

    {
        target = {
            loc = vec3(-726.39, -1505.64, 5.06),
            length = 1.0,
            width = 1.0,
            heading = 293.0,
            minZ = 4.06,
            maxZ = 6.66,
            label = 'Open Storage'
        },
        name = 'Open Storage-storage',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-726.39, -1505.64, 5.06),
    },

    {
        target = {
            loc = vec3(-755.39, -1516.27, 5.06),
            length = 1.6,
            width = 1.2,
            heading = 23.0,
            minZ = 4.06,
            maxZ = 6.86,
            label = 'Open Storage'
        },
        name = 'dreamworks-parts-storage-1',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-755.39, -1516.27, 5.06),
    },

    {
        target = {
            loc = vec3(-755.39, -1516.27, 5.06),
            length = 2.0,
            width = 2.6,
            heading = 23.0,
            minZ = 4.06,
            maxZ = 6.86,
            label = 'Open Storage'
        },
        name = 'dreamworks-parts-storage-1',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-755.39, -1516.27, 5.06),
    },

    {
        target = {
            loc = vec3(-764.27, -1522.74, 5.06),
            length = 1.6,
            width = 2.4,
            heading = 293.0,
            minZ = 4.06,
            maxZ = 6.26,
            label = 'Open Storage'
        },
        name = 'dreamworks-parts-storage-2',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-764.27, -1522.74, 5.06),
    },

    {
        target = {
            loc = vec3(-751.32, -1530.63, 5.06),
            length = 1.6,
            width = 3.2,
            heading = 203.0,
            minZ = 4.06,
            maxZ = 6.26,
            label = 'Open Storage'
        },
        name = 'dreamworks-parts-storage-3',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-751.32, -1530.63, 5.06),
    },

    {
        target = {
            loc = vec3(-722.64, -1518.13, 5.06),
            length = 1.6,
            width = 3.2,
            heading = 288.0,
            minZ = 4.06,
            maxZ = 6.26,
            label = 'Open Storage'
        },
        name = 'dreamworks-parts-storage-4',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-722.64, -1518.13, 5.06),
    },

    {
        target = {
            loc = vec3(-724.27, -1511.46, 5.06),
            length = 1.6,
            width = 3.2,
            heading = 293.0,
            minZ = 4.06,
            maxZ = 6.26,
            label = 'Open Storage'
        },
        name = 'dreamworks-parts-storage-5',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-724.27, -1511.46, 5.06),
    },

    {
        target = {
            loc = vec3(-728.77, -1504.35, 5.08),
            length = 1.6,
            width = 1.2,
            heading = 153.0,
            minZ = 4.08,
            maxZ = 6.28,
            label = 'Open Storage'
        },
        name = 'dreamworks-parts-storage-6',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-728.77, -1504.35, 5.08),
    },

    {
        target = {
            loc = vec3(-593.45, -933.6, 28.14),
            length = 6.6,
            width = 12.6,
            heading = 270.0,
            minZ = 27.14,
            maxZ = 31.14,
            label = 'Open Storage'
        },
        name = 'redline-parts-storage-1',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-593.45, -933.6, 28.14),
    },

    {
        target = {
            loc = vec3(-586.19, -931.62, 23.96),
            length = 3.0,
            width = 5.6,
            heading = 0.0,
            minZ = 22.96,
            maxZ = 25.76,
            label = 'Open Storage'
        },
        name = 'redline-parts-storage-2',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-586.19, -931.62, 23.96),
    },

    {
        target = {
            loc = vec3(-585.15, -917.51, 23.96),
            length = 3.0,
            width = 5.0,
            heading = 0.0,
            minZ = 22.96,
            maxZ = 25.76,
            label = 'Open Storage'
        },
        name = 'redline-parts-storage-3',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-585.15, -917.51, 23.96),
    },

    {
        target = {
            loc = vec3(-578.07, -911.8, 23.89),
            length = 1.8,
            width = 1.8,
            heading = 0.0,
            minZ = 22.89,
            maxZ = 25.29,
            label = 'Open Storage'
        },
        name = 'redline-parts-storage-4',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-578.07, -911.8, 23.89),
    },

    {
        target = {
            loc = vec3(-585.85, -924.58, 23.89),
            length = 5.0,
            width = 3.8,
            heading = 0.0,
            minZ = 22.89,
            maxZ = 25.49,
            label = 'Open Storage'
        },
        name = 'redline-parts-storage-5',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-585.85, -924.58, 23.89),
    },

    {
        target = {
            loc = vec3(128.58, -3011.16, 7.04),
            length = 6.8,
            width = 8.2,
            heading = 0.0,
            minZ = 6.04,
            maxZ = 9.04,
            label = 'Open Storage'
        },
        name = 'tuner-parts-storage-1',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(128.58, -3011.16, 7.04),
    },

    {
        target = {
            loc = vec3(121.19, -3028.03, 7.04),
            length = 4.0,
            width = 3.0,
            heading = 270.0,
            minZ = 6.04,
            maxZ = 10.84,
            label = 'Open Storage'
        },
        name = 'tuner-parts-storage-2',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(121.19, -3028.03, 7.04),
    },

    {
        target = {
            loc = vec3(129.55, -3031.51, 7.04),
            length = 2.0,
            width = 2.0,
            heading = 345.0,
            minZ = 6.04,
            maxZ = 8.24,
            label = 'Open Storage'
        },
        name = 'tuner-parts-storage-3',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(129.55, -3031.51, 7.04),
    },

    {
        target = {
            loc = vec3(133.37, -3051.24, 7.04),
            length = 2.0,
            width = 2.0,
            heading = 0.0,
            minZ = 6.04,
            maxZ = 8.24,
            label = 'Open Storage'
        },
        name = 'tuner-parts-storage-4',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(133.37, -3051.24, 7.04),
    },

    {
        target = {
            loc = vec3(-58.01, -1328.92, 29.27),
            length = 2.8,
            width = 2.0,
            heading = 0.0,
            minZ = 28.27,
            maxZ = 31.07,
            label = 'Open Storage'
        },
        name = 'nutz-parts-storage-1',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-58.01, -1328.92, 29.27),
    },

    {
        target = {
            loc = vec3(-59.78, -1336.95, 26.85),
            length = 2.0,
            width = 2.0,
            heading = 0.0,
            minZ = 25.85,
            maxZ = 27.65,
            label = 'Open Storage'
        },
        name = 'nutz-parts-storage-2',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-59.78, -1336.95, 26.85),
    },

    {
        target = {
            loc = vec3(-1418.77, -454.4, 35.91),
            length = 1.2,
            width = 3.0,
            heading = 32.0,
            minZ = 34.91,
            maxZ = 38.51,
            label = 'Open Storage'
        },
        name = 'hayes-parts-storage-1',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-1418.77, -454.4, 35.91),
    },

    {
        target = {
            loc = vec3(-1407.85, -447.14, 35.91),
            length = 4.4,
            width = 2.0,
            heading = 300.0,
            minZ = 34.91,
            maxZ = 38.51,
            label = 'Open Storage'
        },
        name = 'hayes-parts-storage-2',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-1407.85, -447.14, 35.91),
    },

    {
        target = {
            loc = vec3(470.12, -1887.23, 26.09),
            length = 1.2,
            width = 3.8,
            heading = 25.0,
            minZ = 25.09,
            maxZ = 28.29,
            label = 'Open Storage'
        },
        name = 'atomic-parts-storage-1',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(470.12, -1887.23, 26.09),
    },

    {
        target = {
            loc = vec3(471.88, -1879.14, 26.25),
            length = 5.4,
            width = 2.0,
            heading = 295.0,
            minZ = 25.25,
            maxZ = 28.25,
            label = 'Open Storage'
        },
        name = 'atomic-parts-storage-2',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(471.88, -1879.14, 26.25),
    },

    {
        target = {
            loc = vec3(1172.47, 2635.59, 37.8),
            length = 2.0,
            width = 2.0,
            heading = 0.0,
            minZ = 36.8,
            maxZ = 40.8,
            label = 'Open Storage'
        },
        name = 'harmony-parts-storage-1',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(1172.47, 2635.59, 37.8),
    },

    {
        target = {
            loc = vec3(1184.63, 2639.38, 37.75),
            length = 1.4,
            width = 5.0,
            heading = 270.0,
            minZ = 36.75,
            maxZ = 40.15,
            label = 'Open Storage'
        },
        name = 'harmony-parts-storage-2',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(1184.63, 2639.38, 37.75),
    },

    {
        target = {
            loc = vec3(543.13, -166.62, 57.68),
            length = 3.4,
            width = 1.2,
            heading = 0.0,
            minZ = 56.68,
            maxZ = 59.68,
            label = 'Open Storage'
        },
        name = 'ae-storage-1',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(543.13, -166.62, 57.68),
    },

    {
        target = {
            loc = vec3(542.45, -173.23, 54.51),
            length = 3.2,
            width = 2.0,
            heading = 0.0,
            minZ = 53.51,
            maxZ = 54.91,
            label = 'Open Storage'
        },
        name = 'ae-storage-2',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(542.45, -173.23, 54.51),
    },

    {
        target = {
            loc = vec3(555.79, -179.43, 54.51),
            length = 3.2,
            width = 5.6,
            heading = 0.0,
            minZ = 53.51,
            maxZ = 56.31,
            label = 'Open Storage'
        },
        name = 'ae-storage-3',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(555.79, -179.43, 54.51),
    },

    {
        target = {
            loc = vec3(555.81, -187.15, 54.51),
            length = 3.6,
            width = 6.4,
            heading = 0.0,
            minZ = 53.51,
            maxZ = 56.11,
            label = 'Open Storage'
        },
        name = 'ae-storage-4',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(555.81, -187.15, 54.51),
    },

    {
        target = {
            loc = vec3(560.35, -183.3, 54.51),
            length = 5.2,
            width = 1.8,
            heading = 0.0,
            minZ = 53.51,
            maxZ = 55.91,
            label = 'Open Storage'
        },
        name = 'ae-mini-1',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(560.35, -183.3, 54.51),
    },

    {
        target = {
            loc = vec3(560.11, -190.7, 54.51),
            length = 4.4,
            width = 2.0,
            heading = 0.0,
            minZ = 53.51,
            maxZ = 56.31,
            label = 'Open Storage'
        },
        name = 'ae-mini-2',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(560.11, -190.7, 54.51),
    },

    {
        target = {
            loc = vec3(560.02, -198.82, 54.51),
            length = 4.0,
            width = 1.2,
            heading = 0.0,
            minZ = 53.51,
            maxZ = 55.91,
            label = 'Open Storage'
        },
        name = 'ae-mini-3',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(560.02, -198.82, 54.51),
    },

    {
        target = {
            loc = vec3(555.38, -172.12, 54.51),
            length = 2.0,
            width = 3.4,
            heading = 0.0,
            minZ = 53.51,
            maxZ = 56.31,
            label = 'Open Storage'
        },
        name = 'ae-mini-4',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(555.38, -172.12, 54.51),
    },

    {
        target = {
            loc = vec3(564.81, -200.39, 50.31),
            length = 4.6,
            width = 1.6,
            heading = 0.0,
            minZ = 49.31,
            maxZ = 52.11,
            label = 'Open Storage'
        },
        name = 'ae-mini-5',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(564.81, -200.39, 50.31),
    },

    {
        target = {
            loc = vec3(906.83, -968.17, 39.5),
            length = 8.0,
            width = 2.0,
            heading = 5.0,
            minZ = 38.55,
            maxZ = 40.75,
            label = 'Open Storage'
        },
        name = 'ottos-parts-storage-1',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(906.83, -968.17, 39.5),
    },

    {
        target = {
            loc = vec3(936.28, -984.94, 39.5),
            length = 1.6,
            width = 2.8,
            heading = 3.0,
            minZ = 38.55,
            maxZ = 40.75,
            label = 'Open Storage'
        },
        name = 'ottos-parts-storage-2',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(936.28, -984.94, 39.5),
    },

    {
        target = {
            loc = vec3(922.84, -985.68, 39.5),
            length = 1.8,
            width = 7.8,
            heading = 3.0,
            minZ = 38.55,
            maxZ = 40.75,
            label = 'Open Storage'
        },
        name = 'ottos-parts-storage-3',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(922.84, -985.68, 39.5),
    },

    {
        target = {
            loc = vec3(955.57, -955.3, 39.5),
            length = 1.6,
            width = 2.0,
            heading = 4.0,
            minZ = 38.55,
            maxZ = 40.75,
            label = 'Open Storage'
        },
        name = 'ottos-parts-storage-4',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(955.57, -955.3, 39.5),
    },

    {
        target = {
            loc = vec3(947.77, -972.41, 39.5),
            length = 1.6,
            width = 1.2,
            heading = 3.0,
            minZ = 38.55,
            maxZ = 40.75,
            label = 'Open Storage'
        },
        name = 'ottos-parts-storage-5',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(947.77, -972.41, 39.5),
    },

    {
        target = {
            loc = vec3(962.9, -975.17, 39.5),
            length = 3.2,
            width = 2.0,
            heading = 4.0,
            minZ = 38.55,
            maxZ = 40.75,
            label = 'Open Storage'
        },
        name = 'ottos-parts-storage-6',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(962.9, -975.17, 39.5),
    },

    {
        target = {
            loc = vec3(-206.7109, -1339.2489, 31.3015),
            length = 1.0,
            width = 2.0,
            heading = 182.1076,
            minZ = 29.3,
            maxZ = 32.3,
            label = 'Open Storage'
        },
        name = 'bennys-parts-storage-1',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-206.7109, -1339.2489, 31.3015),
    },

    {
        target = {
            loc = vec3(-216.9994, -1337.8951, 31.3005),
            length = 1.0,
            width = 2.0,
            heading = 95.0,
            minZ = 29.3,
            maxZ = 32.3,
            label = 'Open Storage'
        },
        name = 'bennys-parts-storage-2',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-216.9994, -1337.8951, 31.3005),
    },

    {
        target = {
            loc = vec3(-223.6948, -1339.1002, 31.3013),
            length = 1.0,
            width = 2.0,
            heading = 180.6994,
            minZ = 29.3,
            maxZ = 32.3,
            label = 'Open Storage'
        },
        name = 'bennys-parts-storage-3',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-223.6948, -1339.1002, 31.3013),
    },

    {
        target = {
            loc = vec3(-229.7649, -1320.1306, 31.3005),
            length = 1.0,
            width = 1.0,
            heading = 90.0,
            minZ = 29.3,
            maxZ = 32.3,
            label = 'Open Storage'
        },
        name = 'bennys-parts-storage-4',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-229.7649, -1320.1306, 31.3005),
    },

    {
        target = {
            loc = vec3(-724.27, -1511.46, 5.06),
            length = 1.6,
            width = 3.2,
            heading = 293.0,
            minZ = 4.06,
            maxZ = 6.26,
            label = 'Open Storage'
        },
        name = 'bennys-parts-storage-5',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-724.27, -1511.46, 5.06),
    },

    {
        target = {
            loc = vec3(-728.77, -1504.35, 5.08),
            length = 1.6,
            width = 1.2,
            heading = 153.0,
            minZ = 4.08,
            maxZ = 6.28,
            label = 'Open Storage'
        },
        name = 'bennys-parts-storage-6',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-728.77, -1504.35, 5.08),
    },

    {
        target = {
            loc = vec3(156.24, 6361.33, 31.27),
            length = 1.8,
            width = 9.0,
            heading = 27.0,
            minZ = 30.27,
            maxZ = 32.67,
            label = 'Open Storage'
        },
        name = 'paleto_tuners-parts-storage-1',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(156.24, 6361.33, 31.27),
    },

    {
        target = {
            loc = vec3(166.89, 6381.57, 31.27),
            length = 4.0,
            width = 2.0,
            heading = 28.0,
            minZ = 30.27,
            maxZ = 32.47,
            label = 'Open Storage'
        },
        name = 'paleto_tuners-parts-storage-2',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(166.89, 6381.57, 31.27),
    },

    {
        target = {
            loc = vec3(151.7, 6361.63, 31.27),
            length = 2.0,
            width = 2.0,
            heading = 30.0,
            minZ = 30.27,
            maxZ = 32.87,
            label = 'Open Storage'
        },
        name = 'paleto_tuners-parts-storage-3',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(151.7, 6361.63, 31.27),
    },

    {
        target = {
            loc = vec3(156.74, 6370.57, 31.27),
            length = 2.0,
            width = 2.0,
            heading = 30.0,
            minZ = 30.27,
            maxZ = 32.87,
            label = 'Open Storage'
        },
        name = 'paleto_tuners-parts-storage-4',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(156.74, 6370.57, 31.27),
    },

    {
        target = {
            loc = vec3(167.2, 6366.75, 31.27),
            length = 2.0,
            width = 2.0,
            heading = 30.0,
            minZ = 30.27,
            maxZ = 32.87,
            label = 'Open Storage'
        },
        name = 'paleto_tuners-parts-storage-5',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(167.2, 6366.75, 31.27),
    },

    {
        target = {
            loc = vec3(144.49, 6384.49, 31.27),
            length = 2.4,
            width = 7.2,
            heading = 30.0,
            minZ = 30.27,
            maxZ = 32.87,
            label = 'Open Storage'
        },
        name = 'paleto_tuners-parts-storage-6',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(144.49, 6384.49, 31.27),
    },

    {
        target = {
            loc = vec3(-755.39, -1516.27, 5.06),
            length = 2.0,
            width = 2.6,
            heading = 23.0,
            minZ = 4.06,
            maxZ = 6.86,
            label = 'Open Storage'
        },
        name = 'dreamworks-parts-storage-1',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-755.39, -1516.27, 5.06),
    },

    {
        target = {
            loc = vec3(-764.27, -1522.74, 5.06),
            length = 1.6,
            width = 2.4,
            heading = 293.0,
            minZ = 4.06,
            maxZ = 6.26,
            label = 'Open Storage'
        },
        name = 'dreamworks-parts-storage-2',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-764.27, -1522.74, 5.06),
    },

    {
        target = {
            loc = vec3(-751.32, -1530.63, 5.06),
            length = 1.6,
            width = 3.2,
            heading = 203.0,
            minZ = 4.06,
            maxZ = 6.26,
            label = 'Open Storage'
        },
        name = 'dreamworks-parts-storage-3',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-751.32, -1530.63, 5.06),
    },

    {
        target = {
            loc = vec3(-722.64, -1518.13, 5.06),
            length = 1.6,
            width = 3.2,
            heading = 288.0,
            minZ = 4.06,
            maxZ = 6.26,
            label = 'Open Storage'
        },
        name = 'dreamworks-parts-storage-4',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-722.64, -1518.13, 5.06),
    },

    {
        target = {
            loc = vec3(-724.27, -1511.46, 5.06),
            length = 1.6,
            width = 3.2,
            heading = 293.0,
            minZ = 4.06,
            maxZ = 6.26,
            label = 'Open Storage'
        },
        name = 'dreamworks-parts-storage-5',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-724.27, -1511.46, 5.06),
    },

    {
        target = {
            loc = vec3(-728.77, -1504.35, 5.08),
            length = 1.6,
            width = 1.2,
            heading = 153.0,
            minZ = 4.08,
            maxZ = 6.28,
            label = 'Open Storage'
        },
        name = 'dreamworks-parts-storage-6',
        label = 'Open Storage',
        owner = false,
        slots = 100,
        weight = 100000,
        permissionKey = 'JOB_STORAGE',
        loc = vec3(-728.77, -1504.35, 5.08),
    },
    -- Mechanic Storage End --
}
