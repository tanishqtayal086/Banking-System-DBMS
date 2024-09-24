CREATE DATABASE BANK_MANAGEMENT;
USE BANK_MANAGEMENT;

-- Customer Table
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address TEXT NOT NULL,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL,
    registration_date DATE NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Account Table
CREATE TABLE Account (
    account_number INT PRIMARY KEY,
    type VARCHAR(255) NOT NULL,
    balance DECIMAL(10, 2) NOT NULL,
    currency VARCHAR(3) NOT NULL,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

-- Transaction Table
CREATE TABLE Transaction1 (
    transaction_id INT PRIMARY KEY,
    amount DECIMAL(10, 2) NOT NULL,
    date DATE NOT NULL,
    account_number INT,
    transaction_type VARCHAR(255) NOT NULL,
    FOREIGN KEY (account_number) REFERENCES Account(account_number)
);

-- Loan Table
CREATE TABLE Loan (
    Loan_ID INT PRIMARY KEY,
    Customer_ID INT,
    Loan_Type VARCHAR(255) NOT NULL,
    Loan_Amount DECIMAL(10, 2) NOT NULL,
    Interest_Rate DECIMAL(5, 2) NOT NULL,
    Time INT NOT NULL,
    Start_Date DATE NOT NULL,
    End_Date DATE NOT NULL,
    Payment_Frequency VARCHAR(255) NOT NULL,
    Current_Balance DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(customer_id)
);

-- Branch Table
CREATE TABLE Branch (
    BranchID INT PRIMARY KEY,
    Password VARCHAR(255) NOT NULL,
    BranchName VARCHAR(255) NOT NULL,
    Address TEXT NOT NULL,
    City VARCHAR(255) NOT NULL,
    State_Province VARCHAR(255) NOT NULL,
    Country VARCHAR(255) NOT NULL,
    PostalCode VARCHAR(10) NOT NULL
);

-- DebitCard Table
CREATE TABLE DebitCard (
    CardID INT PRIMARY KEY,
    AccountNumber INT,
    CardNumber VARCHAR(255) NOT NULL,
    CardType VARCHAR(255) NOT NULL,
    IssueDate DATE NOT NULL,
    ExpiryDate DATE NOT NULL,
    Pin VARCHAR(255) NOT NULL,
    FOREIGN KEY (AccountNumber) REFERENCES Account(account_number)
);

-- CreditCard Table
CREATE TABLE CreditCard (
    CreditCardID INT PRIMARY KEY,
    AccountNumber INT,
    CardNumber VARCHAR(255) NOT NULL,
    CardType VARCHAR(255) NOT NULL,
    IssueDate DATE NOT NULL,
    ExpiryDate DATE NOT NULL,
    Pin VARCHAR(255) NOT NULL,
    CreditLimit DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (AccountNumber) REFERENCES Account(account_number)
);

-- InternetBanking Table
CREATE TABLE InternetBanking (
    UserID INT PRIMARY KEY,
    CustomerID INT,
    Username VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(customer_id)
);

-- Account_Customer Table
CREATE TABLE Account_Customer (
    Account_Number INT,
    Customer_ID INT,
    PRIMARY KEY (Account_Number, Customer_ID),
    FOREIGN KEY (Account_Number) REFERENCES Account(account_number),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(customer_id)
);

-- Loan_Customer Table
CREATE TABLE Loan_Customer (
    Loan_ID INT,
    Customer_ID INT,
    PRIMARY KEY (Loan_ID, Customer_ID),
    FOREIGN KEY (Loan_ID) REFERENCES Loan(Loan_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(customer_id)
);


--Insertionn here

INSERT INTO Customer (customer_id, name, address, phone, email, date_of_birth, registration_date, password)
VALUES
(1, 'Aarav Sharma', '123, Main Street, Bangalore', '9876543210', 'aarav.sharma@example.com', '1990-05-15', '2022-01-01', 'password123'),
(2, 'Ananya Gupta', '456, Park Avenue, Mumbai', '9876543211', 'ananya.gupta@example.com', '1992-08-20', '2022-01-02', 'password456'),
(3, 'Aaradhya Singh', '789, Lake Road, Kolkata', '9876543212', 'aaradhya.singh@example.com', '1995-02-10', '2022-01-03', 'password789'),
(4, 'Vihaan Kumar', '321, Hill View, Delhi', '9876543213', 'vihaan.kumar@example.com', '1993-11-25', '2022-01-04', 'password321'),
(5, 'Saisha Patel', '654, Garden Street, Chennai', '9876543214', 'saisha.patel@example.com', '1994-06-30', '2022-01-05', 'password654'),
(6, 'Advait Desai', '987, River Road, Pune', '9876543215', 'advait.desai@example.com', '1991-09-12', '2022-01-06', 'password987'),
(7, 'Zara Khan', '741, Skyline Apartment, Hyderabad', '9876543216', 'zara.khan@example.com', '1996-04-18', '2022-01-07', 'password741'),
(8, 'Aryan Joshi', '852, Green Valley, Ahmedabad', '9876543217', 'aryan.joshi@example.com', '1997-07-22', '2022-01-08', 'password852'),
(9, 'Anika Reddy', '963, Ocean View, Kochi', '9876543218', 'anika.reddy@example.com', '1998-10-05', '2022-01-09', 'password963'),
(10, 'Kabir Verma', '159, Hillcrest, Jaipur', '9876543219', 'kabir.verma@example.com', '1999-03-28', '2022-01-10', 'password159');

INSERT INTO Account (account_number, type, balance, currency, customer_id)
VALUES
(101, 'Savings', 50000.00, 'INR', 1),
(102, 'Current', 100000.00, 'INR', 2),
(103, 'Savings', 75000.00, 'INR', 3),
(104, 'Current', 60000.00, 'INR', 4),
(105, 'Savings', 90000.00, 'INR', 5),
(106, 'Current', 120000.00, 'INR', 6),
(107, 'Savings', 80000.00, 'INR', 7),
(108, 'Current', 110000.00, 'INR', 8),
(109, 'Savings', 95000.00, 'INR', 9),
(110, 'Current', 130000.00, 'INR', 10);

INSERT INTO Transaction1 (transaction_id, amount, date, account_number, transaction_type)
VALUES
(1, 500.00, '2022-01-01', 101, 'Credit'),
(2, 1000.00, '2022-01-02', 102, 'Credit'),
(3, 200.00, '2022-01-03', 103, 'Debit'),
(4, 1500.00, '2022-01-04', 104, 'Credit'),
(5, 300.00, '2022-01-05', 105, 'Debit'),
(6, 600.00, '2022-01-06', 106, 'Credit'),
(7, 400.00, '2022-01-07', 107, 'Credit'),
(8, 800.00, '2022-01-08', 108, 'Debit'),
(9, 1200.00, '2022-01-09', 109, 'Credit'),
(10, 700.00, '2022-01-10', 110, 'Debit');


INSERT INTO Loan (Loan_ID, Customer_ID, Loan_Type, Loan_Amount, Interest_Rate, Time, Start_Date, End_Date, Payment_Frequency, Current_Balance)
VALUES
(1, 1, 'Home Loan', 5000000.00, 8.5, 20, '2022-01-01', '2042-01-01', 'Monthly', 4500000.00),
(2, 2, 'Personal Loan', 200000.00, 12.0, 5, '2022-01-02', '2027-01-02', 'Quarterly', 150000.00),
(3, 3, 'Car Loan', 800000.00, 9.0, 7, '2022-01-03', '2029-01-03', 'Monthly', 600000.00),
(4, 4, 'Education Loan', 1000000.00, 7.5, 10, '2022-01-04', '2032-01-04', 'Monthly', 800000.00),
(5, 5, 'Home Loan', 6000000.00, 8.75, 15, '2022-01-05', '2037-01-05', 'Monthly', 5000000.00),
(6, 6, 'Personal Loan', 300000.00, 11.0, 3, '2022-01-06', '2025-01-06', 'Quarterly', 250000.00),
(7, 7, 'Car Loan', 900000.00, 9.25, 5, '2022-01-07', '2027-01-07', 'Monthly', 700000.00),
(8, 8, 'Education Loan', 1200000.00, 7.25, 8, '2022-01-08', '2030-01-08', 'Monthly', 1000000.00),
(9, 9, 'Home Loan', 7000000.00, 8.0, 20, '2022-01-09', '2042-01-09', 'Monthly', 6000000.00),
(10, 10, 'Personal Loan', 400000.00, 10.0, 4, '2022-01-10', '2026-01-10', 'Quarterly', 350000.00);

INSERT INTO Branch (BranchID, Password, BranchName, Address, City, State_Province, Country, PostalCode)
VALUES
(1, 'branchpass1', 'Main Branch', '1, Bank Road', 'Bangalore', 'Karnataka', 'India', '560001'),
(2, 'branchpass2', 'Central Branch', '2, Central Street', 'Mumbai', 'Maharashtra', 'India', '400001'),
(3, 'branchpass3', 'Downtown Branch', '3, Downtown Avenue', 'Kolkata', 'West Bengal', 'India', '700001'),
(4, 'branchpass4', 'City Branch', '4, City Center', 'Delhi', 'Delhi', 'India', '110001'),
(5, 'branchpass5', 'Metro Branch', '5, Metro Plaza', 'Chennai', 'Tamil Nadu', 'India', '600001'),
(6, 'branchpass6', 'Urban Branch', '6, Urban Market', 'Pune', 'Maharashtra', 'India', '411001'),
(7, 'branchpass7', 'Cosmopolitan Branch', '7, Cosmo Tower', 'Hyderabad', 'Telangana', 'India', '500001'),
(8, 'branchpass8', 'Green City Branch', '8, Green City Complex', 'Ahmedabad', 'Gujarat', 'India', '380001'),
(9, 'branchpass9', 'Coastal Branch', '9, Coastal View', 'Kochi', 'Kerala', 'India', '682001'),
(10, 'branchpass10', 'Royal Branch', '10, Royal Road', 'Jaipur', 'Rajasthan', 'India', '302001');

INSERT INTO DebitCard (CardID, AccountNumber, CardNumber, CardType, IssueDate, ExpiryDate, Pin)
VALUES
(1, 101, '1234567812345678', 'Visa', '2022-01-01', '2025-12-31', '1234'),
(2, 102, '2345678923456789', 'MasterCard', '2022-01-02', '2026-12-31', '2345'),
(3, 103, '3456789034567890', 'Visa', '2022-01-03', '2027-12-31', '3456'),
(4, 104, '4567890145678901', 'MasterCard', '2022-01-04', '2028-12-31', '4567'),
(5, 105, '5678901256789012', 'Visa', '2022-01-05', '2029-12-31', '5678'),
(6, 106, '6789012367890123', 'MasterCard', '2022-01-06', '2030-12-31', '6789'),
(7, 107, '7890123478901234', 'Visa', '2022-01-07', '2031-12-31', '7890'),
(8, 108, '8901234589012345', 'MasterCard', '2022-01-08', '2032-12-31', '8901'),
(9, 109, '9012345690123456', 'Visa', '2022-01-09', '2033-12-31', '9012'),
(10, 110, '0123456701234567', 'MasterCard', '2022-01-10', '2034-12-31', '0123');


INSERT INTO CreditCard (CreditCardID, AccountNumber, CardNumber, CardType, IssueDate, ExpiryDate, Pin, CreditLimit)
VALUES
(1, 101, '1111222233334444', 'Visa', '2022-01-01', '2025-12-31', '1234', 50000.00),
(2, 102, '2222333344445555', 'MasterCard', '2022-01-02', '2026-12-31', '2345', 100000.00),
(3, 103, '3333444455556666', 'Visa', '2022-01-03', '2027-12-31', '3456', 75000.00),
(4, 104, '4444555566667777', 'MasterCard', '2022-01-04', '2028-12-31', '4567', 60000.00),
(5, 105, '5555666677778888', 'Visa', '2022-01-05', '2029-12-31', '5678', 90000.00),
(6, 106, '6666777788889999', 'MasterCard', '2022-01-06', '2030-12-31', '6789', 120000.00),
(7, 107, '7777888899990000', 'Visa', '2022-01-07', '2031-12-31', '7890', 80000.00),
(8, 108, '8888999900001111', 'MasterCard', '2022-01-08', '2032-12-31', '8901', 110000.00),
(9, 109, '9999000011112222', 'Visa', '2022-01-09', '2033-12-31', '9012', 95000.00),
(10, 110, '0000111122223333', 'MasterCard', '2022-01-10', '2034-12-31', '0123', 130000.00);

INSERT INTO InternetBanking (UserID, CustomerID, Username, Password, Email)
VALUES
(1, 1, 'aaravsharma', 'internetpass1', 'aarav.sharma@example.com'),
(2, 2, 'ananyagupta', 'internetpass2', 'ananya.gupta@example.com'),
(3, 3, 'aaradhyasingh', 'internetpass3', 'aaradhya.singh@example.com'),
(4, 4, 'vihaankumar', 'internetpass4', 'vihaan.kumar@example.com'),
(5, 5, 'saishapatel', 'internetpass5', 'saisha.patel@example.com'),
(6, 6, 'advaitdesai', 'internetpass6', 'advait.desai@example.com'),
(7, 7, 'zarakhan', 'internetpass7', 'zara.khan@example.com'),
(8, 8, 'aryanjoshi', 'internetpass8', 'aryan.joshi@example.com'),
(9, 9, 'anikareddy', 'internetpass9', 'anika.reddy@example.com'),
(10, 10, 'kabirverma', 'internetpass10', 'kabir.verma@example.com');


INSERT INTO Account_Customer (Account_Number, Customer_ID)
VALUES
(101, 1),
(102, 2),
(103, 3),
(104, 4),
(105, 5),
(106, 6),
(107, 7),
(108, 8),
(109, 9),
(110, 10);

INSERT INTO Loan_Customer (Loan_ID, Customer_ID)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);


--Queries

-- 1. Select all customers
SELECT * FROM Customer;

-- 2. Select all accounts
SELECT * FROM Account;

-- 3. Select all transactions
SELECT * FROM Transaction1;

-- 4. Select all loans
SELECT * FROM Loan;

-- 5. Select all branches
SELECT * FROM Branch;

-- 6. Select all debit cards
SELECT * FROM DebitCard;	

-- 7. Select all credit cards
SELECT * FROM CreditCard;

-- 8. Select all internet banking accounts
SELECT * FROM InternetBanking;

-- 9. Select all customers from a specific city (e.g., Bangalore)
SELECT * FROM Customer WHERE address LIKE '%Mumbai%';

-- 10. Select all accounts with a balance greater than 100000
SELECT * FROM Account WHERE balance > 100000;

-- 11. Select all transactions after a certain date (e.g., '2022-01-05')
SELECT * FROM Transaction1 WHERE date > '2022-01-05';

-- 12. Select all loans with an interest rate less than 8.0
SELECT * FROM Loan WHERE Interest_Rate < 8.0;

-- 13. Select all branches in a specific state (e.g., Maharashtra)
SELECT * FROM Branch WHERE State_Province = 'Maharashtra';

-- 14. Select all accounts with a specific currency (e.g., INR)
SELECT * FROM Account WHERE currency = 'INR';

-- 15. Select all debit cards issued after a certain date (e.g., '2022-01-03')
SELECT * FROM DebitCard WHERE IssueDate > '2022-01-03';

-- 16. Select all credit cards with a credit limit greater than 80000
SELECT * FROM CreditCard WHERE CreditLimit > 80000;

-- 17. Select all internet banking accounts with a specific email domain (e.g., 'example.com')
SELECT * FROM InternetBanking WHERE Email LIKE '%example.com';

-- 18. Select the total balance of all accounts
SELECT SUM(balance) AS total_balance FROM Account;

-- 19. Select the average loan amount
SELECT AVG(Loan_Amount) AS avg_loan_amount FROM Loan;

-- 20. Select the customer name and account balance for each account
SELECT c.name AS customer_name, a.balance AS account_balance
FROM Customer c
JOIN Account a ON c.customer_id = a.customer_id;

-- 21. Update the address of a customer (e.g., customer_id = 1)
UPDATE Customer SET address = 'New Address' WHERE customer_id = 1;

-- 22. Update the balance of an account (e.g., account_number = 101)
UPDATE Account SET balance = balance + 1000 WHERE account_number = 101;

-- 23. Delete a transaction (e.g., transaction_id = 1)
DELETE FROM Transaction1 WHERE transaction_id = 1;


-- 24. Select the customer name, account number, and total balance for each customer
SELECT c.name AS customer_name, ac.Account_Number, SUM(a.balance) AS total_balance
FROM Customer c
JOIN Account_Customer ac ON c.customer_id = ac.Customer_ID
JOIN Account a ON ac.Account_Number = a.account_number
GROUP BY c.name, ac.Account_Number;

-- 25. Show the average loan amount for each loan type
SELECT Loan_Type, AVG(Loan_Amount) AS avg_loan_amount
FROM Loan
GROUP BY Loan_Type;

--26 Show the average balance for each type of account
SELECT type, AVG(balance) AS avg_balance
FROM Account
GROUP BY type;

-- 27. Display the customer name, account number, and balance for accounts with a balance greater than the average balance of all accounts
SELECT c.name, a.account_number, a.balance
FROM Account a
JOIN Customer c ON a.customer_id = c.customer_id
WHERE a.balance > (SELECT AVG(balance) FROM Account);

-- 28. Show the total number of transactions for each account
SELECT account_number, COUNT(*) AS total_transactions
FROM Transaction1
GROUP BY account_number;

-- 29. Show the customer names and the total number of transactions they have made
SELECT c.name, COUNT(t.transaction_id) AS total_transactions
FROM Customer c
JOIN Account a ON c.customer_id = a.customer_id
JOIN Transaction1 t ON a.account_number = t.account_number
GROUP BY c.name;


-- 30. Show the customer names and their corresponding branch names
SELECT c.name, b.BranchName
FROM Customer c
JOIN Branch b ON c.customer_id = b.BranchID;
