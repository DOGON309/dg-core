USE dgcore;

CREATE TABLE IF NOT EXISTS user (
    id VARCHAR(36) PRIMARY KEY,
    license VARCHAR(255) NOT NULL UNIQUE,
    license2 VARCHAR(255) DEFAULT NULL,
    -- 管理関係
    is_admin BOOLEAN DEFAULT FALSE,
    is_ban BOOLEAN DEFAULT FALSE,
    ban_reason VARCHAR(255) DEFAULT NULL,
    is_whitelist BOOLEAN DEFAULT FALSE,
    note VARCHAR(255) DEFAULT NULL
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS permission (
    id VARCHAR(36) PRIMARY KEY,
    name VARCHAR(255) NOT NULL
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS bank (
    id VARCHAR(36) PRIMARY KEY,
    account_number VARCHAR(20) UNIQUE DEFAULT '000000',
    type VARCHAR(50) DEFAULT 'personal',
    balance INT DEFAULT 0,
    is_disable BOOLEAN DEFAULT FALSE,
    is_infinite BOOLEAN DEFAULT FALSE
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS bank_transaction (
    id VARCHAR(36) PRIMARY KEY,
    type VARCHAR(50) NOT NULL,
    from_bank VARCHAR(36) REFERENCES bank(id) ON DELETE CASCADE,
    to_bank VARCHAR(36) REFERENCES bank(id) ON DELETE CASCADE,
    amount INT NOT NULL,
    balance_after INT,
    message VARCHAR(255),
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS phone (
    id VARCHAR(36) PRIMARY KEY,
    phone_number VARCHAR(20) UNIQUE NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    metadata JSON
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS item (
    id VARCHAR(36) PRIMARY KEY,
    label VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    event VARCHAR(255),
    weight INT DEFAULT 0,
    image VARCHAR(255),
    stack INT DEFAULT 1,
    category VARCHAR(50) NOT NULL,
    `unique` BOOLEAN DEFAULT FALSE,
    usable BOOLEAN DEFAULT FALSE,
    price INT DEFAULT 100,
    is_trade BOOLEAN DEFAULT FALSE,
    is_remove BOOLEAN DEFAULT FALSE,
    metadata JSON
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS item_permission (
    item_id VARCHAR(36) REFERENCES item(id) ON DELETE CASCADE,
    permission_id VARCHAR(36) REFERENCES permission(id) ON DELETE CASCADE,
    PRIMARY KEY (item_id, permission_id)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS vehicle (
    id VARCHAR(36) PRIMARY KEY,
    label VARCHAR(50) NOT NULL,
    brand VARCHAR(100) NOT NULL,
    type VARCHAR(50) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price INT NOT NULL,
    trunk_capacity INT NOT NULL,
    fuel_capacity INT NOT NULL,
    seats INT NOT NULL,
    is_rentable BOOLEAN NOT NULL,
    is_sellable BOOLEAN NOT NULL,
    is_disable BOOLEAN NOT NULL,
    image VARCHAR(255) NOT NULL,
    metadata JSON
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS vehicle_permission (
    vehicle_id VARCHAR(36) REFERENCES vehicle(id) ON DELETE CASCADE,
    permission_id VARCHAR(36) REFERENCES permission(id) ON DELETE CASCADE,
    PRIMARY KEY (vehicle_id, permission_id)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS job (
    id VARCHAR(36) PRIMARY KEY,
    label VARCHAR(255) NOT NULL,
    icon VARCHAR(255),
    description VARCHAR(255) NOT NULL,
    bank VARCHAR(36) REFERENCES bank(id) ON DELETE CASCADE,
    is_whitelist BOOLEAN DEFAULT FALSE,
    is_disable BOOLEAN DEFAULT FALSE
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS job_grade (
    id VARCHAR(36) PRIMARY KEY,
    job_id VARCHAR(36) REFERENCES job(id) ON DELETE CASCADE,
    grade INT NOT NULL,
    label VARCHAR(100) NOT NULL,
    salary INT DEFAULT 0,
    is_disable BOOLEAN DEFAULT FALSE
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS job_permission (
    job_grade_id VARCHAR(36) REFERENCES job_grade(id) ON DELETE CASCADE,
    permission_id VARCHAR(36) REFERENCES permission(id) ON DELETE CASCADE,
    PRIMARY KEY (job_grade_id, permission_id)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS gang (
    id VARCHAR(36) PRIMARY KEY,
    label VARCHAR(255) NOT NULL,
    icon VARCHAR(255),
    description VARCHAR(255),
    bank VARCHAR(36) REFERENCES bank(id) ON DELETE CASCADE,
    is_disable BOOLEAN DEFAULT FALSE
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS gang_grade (
    id VARCHAR(36) PRIMARY KEY,
    gang_id VARCHAR(36) REFERENCES gang(id) ON DELETE CASCADE,
    grade INT NOT NULL,
    label VARCHAR(100) NOT NULL,
    salary INT DEFAULT 0,
    is_disable BOOLEAN DEFAULT FALSE
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS gang_permission (
    gang_grade_id VARCHAR(36) REFERENCES gang_grade(id) ON DELETE CASCADE,
    permission_id VARCHAR(36) REFERENCES permission(id) ON DELETE CASCADE,
    PRIMARY KEY (gang_grade_id, permission_id)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `character` (
    id VARCHAR(36) PRIMARY KEY,
    user_id VARCHAR(36) REFERENCES user(id) ON DELETE CASCADE,
    firstName VARCHAR(255) NOT NULL,
    lastName VARCHAR(255) NOT NULL,
    birthday VARCHAR(255) NOT NULL,
    gender VARCHAR(255) NOT NULL,
    cash INT DEFAULT 0,
    nationality VARCHAR(255),
    slot INT NOT NULL,
    -- スキン
    skin JSON,
    -- スポーン
    pos_x FLOAT DEFAULT 0,
    pos_y FLOAT DEFAULT 0,
    pos_z FLOAT DEFAULT 0,
    heading FLOAT DEFAULT 0,
    -- ステータス
    hp INT DEFAULT 100,
    armor INT DEFAULT 0,
    hunger INT DEFAULT 100,
    thirst INT DEFAULT 100,
    stress INT DEFAULT 0,
    weight INT DEFAULT 15000,
    is_dead BOOLEAN DEFAULT FALSE,
    is_crippling BOOLEAN DEFAULT FALSE,
    is_handcuff BOOLEAN DEFAULT FALSE,
    is_tracker BOOLEAN DEFAULT FALSE,
    is_jail BOOLEAN DEFAULT FALSE,
    -- 管理関係
    is_ban BOOLEAN DEFAULT FALSE,
    ban_reason VARCHAR(255) DEFAULT NULL,
    is_deleted BOOLEAN DEFAULT FALSE
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS character_bank (
    bank_id VARCHAR(36) REFERENCES bank(id) ON DELETE CASCADE,
    character_id VARCHAR(36) REFERENCES `character`(id) ON DELETE CASCADE,
    name VARCHAR(100) NOT NULL,
    is_default BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (bank_id, character_id)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS character_phone (
    phone_id VARCHAR(36) REFERENCES phone(id) ON DELETE CASCADE,
    character_id VARCHAR(36) REFERENCES `character`(id) ON DELETE CASCADE,
    PRIMARY KEY (phone_id, character_id)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS character_item (
    item_id VARCHAR(36) REFERENCES item(id) ON DELETE CASCADE,
    character_id VARCHAR(36) REFERENCES `character`(id) ON DELETE CASCADE,
    quantity INT DEFAULT 1,
    durability INT DEFAULT 100,
    slot INT NOT NULL,
    is_jail BOOLEAN DEFAULT FALSE,
    metadata JSON,
    PRIMARY KEY (item_id, character_id, slot)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS character_vehicle (
    vehicle_id VARCHAR(36) REFERENCES vehicle(id) ON DELETE CASCADE,
    character_id VARCHAR(36) REFERENCES `character`(id) ON DELETE CASCADE,
    plate VARCHAR(20) DEFAULT '000000',
    garage VARCHAR(100),
    fuel INT DEFAULT 100,
    engine_health INT DEFAULT 100,
    body_health INT DEFAULT 100,
    is_impounded BOOLEAN DEFAULT FALSE,
    is_insured BOOLEAN DEFAULT FALSE,
    mods JSON,
    PRIMARY KEY (vehicle_id, character_id)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS character_job (
    job_id VARCHAR(36) REFERENCES job(id) ON DELETE CASCADE,
    job_grade_id VARCHAR(36) REFERENCES job_grade(id) ON DELETE CASCADE,
    character_id VARCHAR(36) REFERENCES `character`(id) ON DELETE CASCADE,
    PRIMARY KEY (job_id, job_grade_id, character_id)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS character_gang (
    gang_id VARCHAR(36) REFERENCES gang(id) ON DELETE CASCADE,
    gang_grade_id VARCHAR(36) REFERENCES gang_grade(id) ON DELETE CASCADE,
    character_id VARCHAR(36) REFERENCES `character`(id) ON DELETE CASCADE,
    PRIMARY KEY (gang_id, gang_grade_id, character_id)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
