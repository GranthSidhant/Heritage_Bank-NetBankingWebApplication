-- Create the database
CREATE DATABASE bankdb;
USE bankdb;

-- Users table
CREATE TABLE IF NOT EXISTS users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) NOT NULL,
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Accounts table
CREATE TABLE IF NOT EXISTS accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    account_number VARCHAR(20) UNIQUE NOT NULL,
    account_type ENUM('SAVINGS', 'CURRENT') DEFAULT 'SAVINGS',
    balance DECIMAL(15,2) DEFAULT 0.00,
    status ENUM('ACTIVE', 'INACTIVE', 'BLOCKED') DEFAULT 'ACTIVE',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Transactions table
CREATE TABLE IF NOT EXISTS transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    account_id INT NOT NULL,
    transaction_type ENUM('DEPOSIT', 'WITHDRAWAL', 'TRANSFER') NOT NULL,
    amount DECIMAL(15,2) NOT NULL,
    description TEXT,
    balance_after_transaction DECIMAL(15,2) NOT NULL,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

-- Fixed Deposits table
CREATE TABLE IF NOT EXISTS fixed_deposits (
    fd_id INT PRIMARY KEY AUTO_INCREMENT,
    account_id INT NOT NULL,
    principal_amount DECIMAL(15,2) NOT NULL,
    interest_rate DECIMAL(5,2) NOT NULL,
    term_months INT NOT NULL,
    maturity_amount DECIMAL(15,2) NOT NULL,
    start_date DATE NOT NULL,
    maturity_date DATE NOT NULL,
    status ENUM('ACTIVE', 'MATURED', 'BROKEN') DEFAULT 'ACTIVE',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

-- Insert sample data for testing
INSERT INTO users (username, password, first_name, last_name, email, phone, address) 
VALUES ('jimmy.raja', 'hashed_password_here', 'Jimmy', 'Raja', 'jimmy.raja@email.com', '1234567890', '123 Bank Street');

INSERT INTO accounts (user_id, account_number, account_type, balance) 
VALUES (1, '1000000001', 'SAVINGS', 47187.00);

-- Sample transactions
INSERT INTO transactions (account_id, transaction_type, amount, description, balance_after_transaction) 
VALUES 
(1, 'DEPOSIT', 52421.00, 'Money Deposited', 52421.00),
(1, 'WITHDRAWAL', 15234.00, 'Money Withdrawn', 37187.00),
(1, 'DEPOSIT', 10000.00, 'Money Deposited', 47187.00);

-- Add indexes for better performance
CREATE INDEX idx_user_username ON users(username);
CREATE INDEX idx_account_number ON accounts(account_number);
CREATE INDEX idx_transaction_date ON transactions(transaction_date);
CREATE INDEX idx_fd_maturity ON fixed_deposits(maturity_date);

-- Add triggers for transaction validation
DELIMITER //
CREATE TRIGGER before_transaction_insert 
BEFORE INSERT ON transactions
FOR EACH ROW
BEGIN
    DECLARE current_balance DECIMAL(15,2);
    
    -- Get current balance
    SELECT balance INTO current_balance
    FROM accounts WHERE account_id = NEW.account_id;
    
    -- Validate withdrawal
    IF NEW.transaction_type = 'WITHDRAWAL' AND current_balance < NEW.amount THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insufficient balance for withdrawal';
    END IF;
    
    -- Update account balance
    IF NEW.transaction_type = 'DEPOSIT' THEN
        UPDATE accounts SET balance = balance + NEW.amount 
        WHERE account_id = NEW.account_id;
    ELSEIF NEW.transaction_type = 'WITHDRAWAL' THEN
        UPDATE accounts SET balance = balance - NEW.amount 
        WHERE account_id = NEW.account_id;
    END IF;
END //
DELIMITER ; 