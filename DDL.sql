DROP TABLE IF EXISTS customer;
CREATE TABLE customer (
    id SERIAL PRIMARY KEY,
    citizen_id VARCHAR(20) UNIQUE NOT NULL,
    thai_name VARCHAR(255) UNIQUE NOT NULL,
    en_name VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    pin_hash VARCHAR(255) NOT NULL,
    locked BOOLEAN DEFAULT false NOT NULL,
    failed_attempts INT DEFAULT 0 NOT NULL,
    last_login TIMESTAMP null
);


DROP TABLE IF EXISTS account;
CREATE TABLE account (
    account_number CHAR(7) PRIMARY KEY,
    citizen_id VARCHAR(20) NOT NULL,
    current_balance DECIMAL(15,2) NOT NULL,
    version BIGINT DEFAULT 0 NOT NULL
);
DROP TABLE IF EXISTS transactions;

CREATE TABLE transactions (
    id SERIAL PRIMARY KEY,
    reference_id VARCHAR(36) UNIQUE NOT NULL,
    from_account CHAR(7) NOT NULL,
    to_account CHAR(7) NOT NULL,
    code CHAR(2) NOT NULL,
    channel VARCHAR(255) NOT null,
    transaction_date DATE NOT NULL,
    transaction_time TIME NOT NULL,
    amount DECIMAL(15,2) NOT NULL,
    initiated_by VARCHAR(255) NOT null,
    remark VARCHAR(255)
);

DROP TABLE IF EXISTS teller;
CREATE TABLE IF NOT EXISTS teller (
    employee_id CHAR(9) PRIMARY key,
    display_name VARCHAR(100) NOT NULL
);


CREATE INDEX idx_tx_time ON transactions(transaction_date, transaction_time);
CREATE INDEX idx_user_accounts ON account(account_number);