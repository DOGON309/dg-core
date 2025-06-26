DGCore = DGCore or {}
DGCore.Constant = DGCore.Constant or {}

DGCore.Constant.Tables = {
    User = 'user',
    Permission = 'permission',
    Bank = 'bank',
    BankTransaction = 'bank_transaction',
    Phone = 'phone',
    Item = 'item',
    ItemPermission = 'item_permission',
    Vehicle = 'vehicle',
    VehiclePermission = 'vehicle_permission',
    Job = 'job',
    JobGrade = 'job_grade',
    JobPermission = 'job_permission',
    Gang = 'gang',
    GangGrade = 'gang_grade',
    GangPermission = 'gang_permission',
    Character = '`character`',
    CharacterBank = 'character_bank',
    CharacterItem = 'character_item',
    CharacterVehicle = 'character_vehicle',
    CharacterJob = 'character_job',
    CharacterGang = 'character_gang'
}

DGCore.Constant.Queries = {
    User = {
        SelectAll = string.format('SELECT * FROM %s', DGCore.Constant.Tables.User),
        SelectById = string.format('SELECT * FROM %s WHERE id = ?', DGCore.Constant.Tables.User),
        SelectByLicense = string.format('SELECT * FROM %s WHERE license = ?', DGCore.Constant.Tables.User),
        SelectByLicense2 = string.format('SELECT * FROM %s WHERE license2 = ?', DGCore.Constant.Tables.User),
        Insert = string.format('INSERT INTO %s (id, license, license2, is_admin, is_ban, ban_reason, is_whitelist, note) VALUE (?, ?, ?, ?, ?, ?, ?, ?)', DGCore.Constant.Tables.User),
        Update = string.format('UPDATE %s SET license = ?, license2 = ?, is_admin = ?, is_ban = ?, ban_reason = ?, is_whitelist = ?, note = ? WHERE id = ?', DGCore.Constant.Tables.User)
    },
    Permission = {
        SelectAll = string.format('SELECT * FROM %s', DGCore.Constant.Tables.Permission),
        SelectById = string.format('SELECT * FROM %s WHERE id = ?', DGCore.Constant.Tables.Permission),
        SelectByName = string.format('SELECT * FROM %s WHERE name = ?', DGCore.Constant.Tables.Permission),
        Insert = string.format('INSERT INTO %s (id, name) VALUE (?, ?)', DGCore.Constant.Tables.Permission),
        Update = string.format('UPDATE %s SET name = ? WHERE id = ?', DGCore.Constant.Tables.Permission)
    },
    Bank = {
        SelectAll = string.format('SELECT * FROM %s', DGCore.Constant.Tables.Bank),
        SelectById = string.format('SELECT * FROM %s WHERE id = ?', DGCore.Constant.Tables.Bank),
        SelectByAccountNumber = string.format('SELECT * FROM %s WHERE account_number = ?', DGCore.Constant.Tables.Bank),
        Insert = string.format('INSERT INTO %s (id, account_number, type, balance, is_disable, is_infinite) VALUE (?, ?, ?, ?, ?, ?)', DGCore.Constant.Tables.Bank),
        Update = string.format('UPDATE %s SET account_number = ?, type = ?, balance = ?, is_disable = ?, is_infinite = ? WHERE id = ?', DGCore.Constant.Tables.Bank),
        UpdateAccountNumber = string.format('UPDATE %s SET account_number = ? WHERE id = ?', DGCore.Constant.Tables.Bank)
    },
    BankTransaction = {
        SelectAll = string.format('SELECT * FROM %s ORDER BY timestamp DESC', DGCore.Constant.Tables.BankTransaction),
        SelectById = string.format('SELECT * FROM %s WHERE id = ? ORDER BY timestamp DESC', DGCore.Constant.Tables.BankTransaction),
        SelectByFromBank = string.format('SELECT * FROM %s WHERE from_bank = ? ORDER BY timestamp DESC', DGCore.Constant.Tables.BankTransaction),
        Insert = string.format('INSERT INTO %s (id, type, from_bank, to_bank, amount, balance_after, message) VALUE (?, ?, ?, ?, ?, ?, ?)', DGCore.Constant.Tables.BankTransaction),
        Update = string.format('UPDATE %s SET type = ?, from_bank = ?, to_bank = ?, amount = ?, balance_after = ?, message = ? WHERE id = ?', DGCore.Constant.Tables.BankTransaction)
    },
    Phone = {
        SelectAll = string.format('SELECT * FROM %s WHERE is_active = TRUE', DGCore.Constant.Tables.Phone),
        SelectByPhoneNumber = string.format('SELECT * FROM %s WHERE phone_number = ? AND is_active = TRUE', DGCore.Constant.Tables.Phone),
        Insert = string.format('INSERT INTO %s (id, phone_number, is_active, metadata) VALUE (?, ?, ?, ?)', DGCore.Constant.Tables.Phone),
        Update = string.format('UPDATE %s SET phone_number = ?, is_active = ?, metadata = ? WHERE id = ?', DGCore.Constant.Tables.Phone)
    },
    Item = {
        SelectAll = string.format('SELECT * FROM %s', DGCore.Constant.Tables.Item),
        Insert = string.format('INSERT INTO %s (id, label, description, event, weight, image, stack, category, `unique`, usable, price, is_trade, is_remove, metadata) VALUE (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', DGCore.Constant.Tables.Item),
        Update = string.format('UPDATE %s SET label = ?, description = ?, event = ?, weight = ?, image = ?, stack = ?, category = ?, `unique` = ?, usable = ?, price = ?, is_trade = ?, is_remove = ?, metadata = ? WHERE id = ?', DGCore.Constant.Tables.Item)
    },
    ItemPermission = {
        SelectAll = string.format('SELECT * FROM %s', DGCore.Constant.Tables.ItemPermission),
        Insert = string.format('INSERT INTO %s (item_id, permission_id) VALUE (?, ?)', DGCore.Constant.Tables.ItemPermission),
        Update = string.format('UPDATE %s SET permission_id = ? WHERE item_id = ?', DGCore.Constant.Tables.ItemPermission)
    },
    Vehicle = {
        SelectAll = string.format('SELECT * FROM %s WHERE is_disable = FALSE', DGCore.Constant.Tables.Vehicle),
        Insert = string.format('INSERT INTO %s (id, label, brand, type, category, price, trunk_capacity, fuel_capacity, seats, is_rentable, is_sellable, is_disable, image, metadata) VALUE (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', DGCore.Constant.Tables.Vehicle),
        Update = string.format('UPDATE %s SET label = ?, brand = ?, type = ?, category = ?, price = ?, trunk_capacity = ?, fuel_capacity = ?, seats = ?, is_rentable = ?, is_sellable = ?, is_disable = ?, image = ?, metadata = ? WHERE id = ?', DGCore.Constant.Tables.Vehicle)
    },
    VehiclePermission = {
        SelectAll = string.format('SELECT * FROM %s', DGCore.Constant.Tables.VehiclePermission),
        Insert = string.format('INSERT INTO %s (vehicle_id, permission_id) VALUE (?, ?)', DGCore.Constant.Tables.VehiclePermission),
        Update = string.format('UPDATE %s SET permission_id = ? WHERE vehicle_id = ?', DGCore.Constant.Tables.VehiclePermission)
    },
    Job = {
        SelectAll = string.format('SELECT * FROM %s WHERE is_disable = FALSE', DGCore.Constant.Tables.Job),
        Insert = string.format('INSERT INTO %s (id, label, icon, description, bank, is_whitelist, is_disable) VALUE (?, ?, ?, ?, ?, ?, ?)', DGCore.Constant.Tables.Job),
        Update = string.format('UPDATE %s SET label = ?, icon = ?, description = ?, bank = ?, is_whitelist = ?, is_disable = ? WHERE id =?', DGCore.Constant.Tables.Job)
    },
    JobGrade = {
        SelectAll = string.format('SELECT * FROM %s WHERE is_disable = FALSE', DGCore.Constant.Tables.JobGrade),
        SelectByJobId = string.format('SELECT * FROM %s WHERE job_id = ? AND is_disable = FALSE', DGCore.Constant.Tables.JobGrade),
        Insert = string.format('INSERT INTO %s (id, job_id, grade, label, salary, is_disable) VALUE (?, ?, ?, ?, ?, ?)', DGCore.Constant.Tables.JobGrade),
        Update = string.format('UPDATE %s SET job_id = ?, grade = ?, label = ?, salary = ?, is_disable = ? WHERE id = ?', DGCore.Constant.Tables.JobGrade),
    },
    JobPermission = {
        SelectAll = string.format('SELECT * FROM %s', DGCore.Constant.Tables.JobPermission),
        Insert = string.format('INSERT INTO %s (job_grade_id, permission_id) VALUE (?, ?)', DGCore.Constant.Tables.JobPermission),
        Update = string.format('UPDATE %s SET permission_id = ? WHERE job_grade_id = ?', DGCore.Constant.Tables.JobPermission)
    },
    Gang = {
        SelectAll = string.format('SELECT * FROM %s WHERE is_disable = FALSE', DGCore.Constant.Tables.Gang),
        Insert = string.format('INSERT INTO %s (id, label, icon, description, bank, is_disable) VALUE (?, ?, ?, ?, ?, ?)', DGCore.Constant.Tables.Gang),
        Update = string.format('UPDATE %s SET label = ?, icon = ?, description = ?, bank = ?, is_disable = ? WHERE id = ?', DGCore.Constant.Tables.Gang)
    },
    GangGrade = {
        SelectAll = string.format('SELECT * FROM %s WHERE is_disable = FALSE', DGCore.Constant.Tables.GangGrade),
        SelectByGangId = string.format('SELECT * FROM %s WHERE gang_id = ? AND is_disable = FALSE', DGCore.Constant.Tables.GangGrade),
        Insert = string.format('INSERT INTO %s (id, gang_id, grade, label, salary, is_disable) VALUE (?, ?, ?, ?, ?, ?)', DGCore.Constant.Tables.GangGrade),
        Update = string.format('UPDATE %s SET gang_id = ?, grade = ?, label = ?, salary = ?, is_disable = ? WHERE id = ?', DGCore.Constant.Tables.GangGrade)
    },
    GangPermission = {
        SelectAll = string.format('SELECT * FROM %s', DGCore.Constant.Tables.GangPermission),
        Insert = string.format('INSERT INTO %s (gang_grade_id, permission_id) VALUE (?, ?)', DGCore.Constant.Tables.GangPermission),
        Update = string.format('UPDATE %s SET permission_id = ? WHERE gang_grade_id = ?', DGCore.Constant.Tables.GangPermission)
    },
    Character = {
        SelectAll = string.format('SELECT * FROM %s WHERE is_deleted = FALSE', DGCore.Constant.Tables.Character),
        SelectById = string.format('SELECT * FROM %s WHERE id = ? AND is_deleted = FALSE', DGCore.Constant.Tables.Character),
        SelectByUserId = string.format('SELECT * FROM %s WHERE user_id = ? AND is_deleted = FALSE', DGCore.Constant.Tables.Character),
        Insert = string.format('INSERT INTO %s (id, user_id, firstName, lastName, birthday, gender, cash, nationality, slot, skin, pos_x, pos_y, pos_z, heading, hp, armor, hunger, thirst, stress, weight, is_dead, is_crippling, is_handcuff, is_tracker, is_jail, is_ban, ban_reason, is_deleted) VALUE (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', DGCore.Constant.Tables.Character),
        Update = string.format('UPDATE %s SET user_id = ?, firstName = ?, lastName = ?, birthday = ?, gender = ?, cash = ?, nationality = ?, slot = ?, skin = ?, pos_x = ?, pos_y = ?, pos_z = ?, heading = ?, hp = ?, armor = ?, hunger = ?, thirst = ?, stress = ?, weight = ?, is_dead = ?, is_crippling = ?, is_handcuff = ?, is_tracker = ?, is_jail = ?, is_ban = ?, ban_reason = ?, is_deleted = ? WHERE id = ?', DGCore.Constant.Tables.Character),
        UpdateStatus = string.format('UPDATE %s SET hp = ?, armor = ?, hunger = ?, stress = ?, weight = ?, is_dead = ?, is_handcuff = ?, is_tracker = ?, is_jail = ? WHERE id = ?', DGCore.Constant.Tables.Character)
    },
    CharacterBank = {
        SelectAll = string.format('SELECT * FROM %s', DGCore.Constant.Tables.CharacterBank),
        SelectByCharacterId = string.format('SELECT * FROM %s WHERE character_id = ?', DGCore.Constant.Tables.CharacterBank),
        Insert = string.format('INSERT INTO %s (bank_id, character_id, name, is_default) VALUE (?, ?, ?, ?)', DGCore.Constant.Tables.CharacterBank),
        Update = string.format('UPDATE %s SET character_id = ?, name = ?, is_default = ? WHERE bank_id = ?', DGCore.Constant.Tables.CharacterBank)
    },
    CharacterPhone = {
        SelectAll = string.format('SELECT * FROM %s', DGCore.Constant.Tables.CharacterPhone),
        SelectByCharacterId = string.format('SELECT * FROM %s WHERE character_id = ?', DGCore.Constant.Tables.CharacterPhone),
        Insert = string.format('INSERT INTO %s (phone_id, character_id) VALUE (?, ?)', DGCore.Constant.Tables.CharacterPhone),
        Update = string.format('UPDATE %s SET character_id = ? WHERE phone_id = ?', DGCore.Constant.Tables.CharacterPhone)
    },
    CharacterItem = {
        SelectAll = string.format('SELECT * FROM %s', DGCore.Constant.Tables.CharacterItem),
        SelectByCharacterId = string.format('SELECT * FROM %s WHERE character_id = ?', DGCore.Constant.Tables.CharacterItem),
        Insert = string.format('INSERT INTO %s (item_id, character_id, quantity, durability, slot, is_jail, metadata) VALUE (?, ?, ?, ?, ?, ?, ?)', DGCore.Constant.Tables.CharacterItem),
        Update = string.format('UPDATE %s SET quantity = ?, durability = ?, slot = ?, is_jail = ?, metadata = ? WHERE item_id = ? AND character_id = ?', DGCore.Constant.Tables.CharacterItem)
    },
    CharacterVehicle = {
        SelectAll = string.format('SELECT * FROM %s', DGCore.Constant.Tables.CharacterVehicle),
        SelectByCharacterId = string.format('SELECT * FROM %s WHERE character_id = ?', DGCore.Constant.Tables.CharacterVehicle),
        Insert = string.format('INSERT INTO %s (vehicle_id, character_id, plate, garage, fuel, engine_health, body_health, is_impounded, is_insured, mods) VALUE (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', DGCore.Constant.Tables.CharacterVehicle),
        Update = string.format('UPDATE %s SET character_id = ?, plate = ?, garage = ?, fuel = ?, engine_health = ?, body_health = ?, is_impounded = ?, is_insured = ?, mods = ? WHERE vehicle_id = ?', DGCore.Constant.Tables.CharacterVehicle),
    },
    CharacterJob = {
        SelectAll = string.format('SELECT * FROM %s', DGCore.Constant.Tables.CharacterJob),
        SelectByCharacterId = string.format('SELECT * FROM %s WHERE character_id = ?', DGCore.Constant.Tables.CharacterJob),
        Insert = string.format('INSERT INTO %s (job_id, job_grade_id, character_id) VALUE (?, ?, ?)', DGCore.Constant.Tables.CharacterJob),
        Update = string.format('UPDATE %s SET job_grade_id = ?, character_id = ? WHERE job_id = ?', DGCore.Constant.Tables.CharacterJob)
    },
    CharacterGang = {
        SelectAll = string.format('SELECT * FROM %s', DGCore.Constant.Tables.CharacterGang),
        SelectByCharacterId = string.format('SELECT * FROM %s WHERE character_id = ?', DGCore.Constant.Tables.CharacterGang),
        Insert = string.format('INSERT INTO %s (gang_id, gang_grade_id, character_id) VALUE (?, ?, ?)', DGCore.Constant.Tables.CharacterGang),
        Update = string.format('UPDATE %s SET gang_grade_id = ?, character_id = ? WHERE gang_id = ?', DGCore.Constant.Tables.CharacterGang)
    }
}