CREATE TABLE iodku (
id INT AUTO_INCREMENT NOT NULL,
name VARCHAR(99) NOT NULL,
misc INT NOT NULL,
PRIMARY KEY(id),
UNIQUE(name)
) ENGINE=InnoDB;

select * from  iodku;

INSERT INTO iodku (name, misc)
VALUES
('Leslie', 123),
('Sally', 456);

select * from  iodku;

INSERT INTO iodku (name, misc)
VALUES
('Sally', 3333) -- should update
ON DUPLICATE KEY UPDATE 
id = LAST_INSERT_ID(id),
misc = VALUES(misc);
SELECT LAST_INSERT_ID();


INSERT INTO iodku (name, misc)
VALUES
('Dana', 789)
ON DUPLICATE KEY UPDATE
id = LAST_INSERT_ID(id),
misc = VALUES(misc);
SELECT LAST_INSERT_ID();

select * from iodku;

CREATE TABLE Burn (
id SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL,
name VARCHAR(99) NOT NULL,
PRIMARY KEY(id),
UNIQUE(name)
) ENGINE=InnoDB;

INSERT IGNORE INTO Burn (name) VALUES ('first'), ('second');

SELECT LAST_INSERT_ID(); -- 1
SELECT * FROM Burn ORDER BY id;

INSERT IGNORE INTO Burn (name) VALUES ('second'); -- dup 'IGNOREd', but id=3 is burned
SELECT LAST_INSERT_ID(); -- Still "1" -- can't trust in this situation
SELECT * FROM Burn ORDER BY id;


INSERT IGNORE INTO Burn (name) VALUES ('third');
SELECT LAST_INSERT_ID(); -- now "4"
SELECT * FROM Burn ORDER BY id; -- note that id=3 was skipped over




