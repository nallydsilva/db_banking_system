CREATE TABLE Branch (
    branch_id int,
    branch_address VARCHAR(225),
    manager_name CHAR(100),
    asset_size INT,
    contact_no INT,
    balance int,
    PRIMARY KEY (branch_id)
);

CREATE TABLE Loan (
    loan_id int,
    loan_type VARCHAR(25),
    date_disb date,
    branch_id int,
    PRIMARY KEY (loan_id)
    );

CREATE TABLE Customer (
    user_id int ,
    user_name CHAR(200),
    user_birthdate date ,
    user_address VARCHAR(25),
    user_contact int,
    user_email VARCHAR(25),
    user_since date,
    user_id_verified CHAR(30), 
    user_occupation CHAR (30),
    user_income INT,
    branch_id INT,
    PRIMARY KEY (user_id),
    FOREIGN KEY (branch_id) REFERENCES branch(branch_id)
);

CREATE TABLE Creditcard (
    card_id int,
    user_id int,
    date_open date,
    card_limit int,
    high_balance int,
    date_high_balance date,
    last_limit_change_date date,
    PRIMARY KEY (Card_id),
    FOREIGN KEY (user_id) REFERENCES Customer(user_id)
);

CREATE TABLE AccountDetails (
    account_id VARCHAR(25),
    acct_type CHAR(25),
    balance int,
    PRIMARY KEY (account_id)
);


CREATE TABLE customer_account (
    user_id int,
    account_id varchar(25),
    PRIMARY KEY (user_id,account_id),
    FOREIGN KEY (user_id) REFERENCES Customer(user_id),
    FOREIGN KEY (account_id) REFERENCES AccountDetails(account_id)
    );
    
   
CREATE TABLE customer_loan (
    user_id int,
    loan_id int,
    PRIMARY KEY (user_id,loan_id),
    FOREIGN KEY (user_id) REFERENCES Customer(user_id),
    FOREIGN KEY (loan_id) REFERENCES Loan( loan_id)
    );
    