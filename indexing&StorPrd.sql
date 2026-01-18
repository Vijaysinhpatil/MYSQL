use store;

CREATE TABLE accounts (
   acc_id INT PRIMARY KEY , 
   name VARCHAR(30),
   balance DECIMAL(10 , 2),
   branch VARCHAR(50)
);

INSERT INTO accounts VALUES 
(1 , "Adam" , 500.00 , "Mumbai"),
(2 , "Bob" , 300.00 , "Delhi"),
(3 , "Charlie" , 700.00 , "Bangalore"),
(4 , "David" , 1000.00 , "Noida");

SELECT * FROM accounts;

-- single index creation
CREATE INDEX idx_branch ON accounts(branch);
SHOW INDEX FROM accounts;

-- multiple or composite index creation

CREATE INDEX idx2 ON accounts(branch , balance);
SHOW INDEX FROM accounts;

-- drop an index
DROP INDEX idx2 ON accounts;

-- stored Procedures (functions)

DELIMITER $$

CREATE PROCEDURE check_balance(IN p_acc_id INT)
BEGIN 
      SELECT balance
      FROM accounts
      WHERE acc_id = p_acc_id;
END $$

DELIMITER ;

-- CALLing stored procedure
CALL check_balance(2);

-- procedure using input and returning output

DELIMITER $$

CREATE PROCEDURE check_bal(IN p_account_id INT , OUT bal DECIMAL(10 , 2))
BEGIN 
      SELECT balance INTO bal
      FROM accounts
      WHERE acc_id = p_account_id;
END $$

DELIMITER ;

CALL check_bal(1 , @balance);
SELECT @balance;


-- dropping the procedured after its updated because db shows an error that this procedure is already exist that why
DROP PROCEDURE IF EXISTS check_balance;



