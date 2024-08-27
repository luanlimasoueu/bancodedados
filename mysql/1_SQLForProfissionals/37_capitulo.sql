CREATE TABLE account (acct_num INT, amount DECIMAL(10,2));

select * from account;

CREATE TRIGGER ins_sum BEFORE INSERT ON account
FOR EACH ROW SET @sum = @sum + NEW.amount;

SET @sum = 0;
INSERT INTO account VALUES(137,14.98),(141,1937.50),(97,-100.00);
SELECT @sum AS 'Total amount inserted';
