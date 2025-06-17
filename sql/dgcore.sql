USE dgcore;

CREATE TABLE IF NOT EXISTS user (
    id VARCHAR(36) PRIMARY KEY,
    rockstart_id VARCHAR(255) NOT NULL,
    is_admin BOOLEAN DEFAULT 0,
    is_ban BOOLEAN DEFAULT 0,
    ban_reason VARCHAR(255) DEFAULT NULL,
    is_whitelist BOOLEAN DEFAULT 0
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS  player (
    id VARCHAR(36) PRIMARY KEY,
    user_id VARCHAR(36) REFERENCES user(id),
    firstname VARCHAR(255),
    lastname VARCHAR(255),
    birthday VARCHAR(255),
    gender VARCHAR(255),
    cash INT DEFAULT 0,
    nationality VARCHAR(255),
    slot INT DEFAULT 1,
    is_deleted BOOLEAN DEFAULT FALSE
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS  job (
    id VARCHAR(36) PRIMARY KEY,
    event VARCHAR(255),
    label VARCHAR(255),
    defaultDuty BOOLEAN,
    offDuty BOOLEAN
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS  job_grade (
    id VARCHAR(36) PRIMARY KEY,
    job_id VARCHAR(36) REFERENCES job(id),
    level INT,
    label VARCHAR(255),
    payment INT,
    isboss BOOLEAN
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS  gang (
    id VARCHAR(36) PRIMARY KEY,
    label VARCHAR(255)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS  gang_grade (
    id VARCHAR(36) PRIMARY KEY,
    gang_id VARCHAR(36) REFERENCES gang(id),
    level INT,
    label VARCHAR(255)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS  item (
    id VARCHAR(36) PRIMARY KEY,
    name VARCHAR(36),
    label VARCHAR(255),
    weight INT,
    category VARCHAR(255),
    ammotype VARCHAR(255),
    image VARCHAR(255),
    isstack BOOLEAN,
    stacksize INT,
    isrightclickuse BOOLEAN,
    isshouldclose BOOLEAN,
    description VARCHAR(255)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS  weapon (
    id VARCHAR(36) PRIMARY KEY,
    item_id VARCHAR(36) REFERENCES item(id) ON UPDATE CASCADE ON DELETE CASCADE,
    damage INT,
    recoil FLOAT,
    firerate FLOAT,
    magazine_size INT,
    weapon_category VARCHAR(255)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS  player_status (
    id VARCHAR(36) PRIMARY KEY,
    player_id VARCHAR(36) REFERENCES player(id),
    hunger INT,
    thirst INT,
    stress INT,
    isdead BOOLEAN,
    iscrippling BOOLEAN,
    armor INT,
    ishandcuff BOOLEAN,
    istracker BOOLEAN,
    isinjail BOOLEAN
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS  player_item (
    id VARCHAR(36) PRIMARY KEY,
    player_id VARCHAR(36) REFERENCES player(id),
    item_id VARCHAR(36) REFERENCES item(id),
    slot INT,
    quantity INT,
    isjail BOOLEAN
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS  player_item_status (
    id VARCHAR(36) PRIMARY KEY,
    player_item_id VARCHAR(36) REFERENCES player_item(id),
    durability INT,
    is_equipped BOOLEAN,
    use_count INT
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS  player_wallet (
    id VARCHAR(36) PRIMARY KEY,
    player_id VARCHAR(36) REFERENCES player(id),
    cash INT,
    crypto INT
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS  player_bank (
    id VARCHAR(36) PRIMARY KEY,
    player_id VARCHAR(36) REFERENCES player(id),
    name VARCHAR(255),
    account_number VARCHAR(255),
    balance INT
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS  player_phone (
    id VARCHAR(36) PRIMARY KEY,
    player_id VARCHAR(36) REFERENCES player(id),
    number VARCHAR(255)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS  player_job (
    id VARCHAR(36) PRIMARY KEY,
    player_id VARCHAR(36) REFERENCES player(id),
    job_id VARCHAR(36) REFERENCES job(id),
    job_grade_id VARCHAR(36) REFERENCES job_grade(id)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS  player_gang (
    id VARCHAR(36) PRIMARY KEY,
    player_id VARCHAR(36) REFERENCES player(id),
    gang_id VARCHAR(36) REFERENCES gang(id),
    gang_grade_id VARCHAR(36) REFERENCES gang_grade(id)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;