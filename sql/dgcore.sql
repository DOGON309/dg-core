USE dgcore;

CREATE TABLE player (
    id VARCHAR(36) PRIMARY KEY,
    firstname VARCHAR(255),
    lastname VARCHAR(255),
    birthday VARCHAR(255),
    gender VARCHAR(255),
    nationality VARCHAR(255)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE job (
    id VARCHAR(36) PRIMARY KEY,
    event VARCHAR(255),
    label VARCHAR(255),
    defaultDuty BOOLEAN,
    offDuty BOOLEAN
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE job_grade (
    id VARCHAR(36) PRIMARY KEY,
    job_id VARCHAR(36) REFERENCES job(id),
    level INT,
    label VARCHAR(255),
    payment INT,
    isboss BOOLEAN
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE gang (
    id VARCHAR(36) PRIMARY KEY,
    label VARCHAR(255)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE gang_grade (
    id VARCHAR(36) PRIMARY KEY,
    gang_id VARCHAR(36) REFERENCES gang(id),
    level INT,
    label VARCHAR(255)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE item (
    id VARCHAR(36) PRIMARY KEY,
    name VARCHAR(36),
    label VARCHAR(255),
    weight INT,
    category VARCHAR(255),
    ammotype VARCHAR(255),
    image VARCHAR(255),
    isstack BOOLEAN,
    stacksize INT,
    isrightclick BOOLEAN,
    isshouldclose BOOLEAN,
    description VARCHAR(255)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE weapon (
    id VARCHAR(36) PRIMARY KEY,
    item_id VARCHAR(36) UNIQUE REFERENCES item(id),
    damage INT,
    recoil FLOAT,
    firerate FLOAT,
    magazine_size INT,
    weapon_category VARCHAR(255)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE player_status (
    id VARCHAR(36) PRIMARY KEY,
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

CREATE TABLE player_item (
    id VARCHAR(36) PRIMARY KEY,
    player_id VARCHAR(36) REFERENCES player(id),
    item_id VARCHAR(36) REFERENCES item(id),
    quantity INT,
    isjail BOOLEAN
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE player_item_status (
    id VARCHAR(36) PRIMARY KEY,
    player_item_id VARCHAR(36) REFERENCES player_item(id),
    durability INT,
    is_equipped BOOLEAN,
    use_count INT
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE player_wallet (
    id VARCHAR(36) PRIMARY KEY,
    player_id VARCHAR(36) REFERENCES player(id),
    cash INT,
    crypto INT
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE player_bank (
    id VARCHAR(36) PRIMARY KEY,
    player_id VARCHAR(36) REFERENCES player(id),
    name VARCHAR(255),
    account_number VARCHAR(255),
    balance INT
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE player_phone (
    id VARCHAR(36) PRIMARY KEY,
    player_id VARCHAR(36) REFERENCES player(id),
    number VARCHAR(255)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE player_job (
    id VARCHAR(36) PRIMARY KEY,
    player_id VARCHAR(36) REFERENCES player(id),
    job_id VARCHAR(36) REFERENCES job(id),
    job_grade_id VARCHAR(36) REFERENCES job_grade(id)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE player_gang (
    id VARCHAR(36) PRIMARY KEY,
    player_id VARCHAR(36) REFERENCES player(id),
    gang_id VARCHAR(36) REFERENCES gang(id),
    gang_grade_id VARCHAR(36) REFERENCES gang_grade(id)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;