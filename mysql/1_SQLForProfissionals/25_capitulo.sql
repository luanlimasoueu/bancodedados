CREATE TABLE Person (
`PersonID` INTEGER NOT NULL PRIMARY KEY,
`LastName` VARCHAR(80),
`FirstName` VARCHAR(80),
`Address` TEXT,
`City` VARCHAR(100)
) Engine=InnoDB;

CREATE TABLE Address (
`AddressID` INTEGER NOT NULL PRIMARY KEY,
`Street` VARCHAR(80),
`City` VARCHAR(80),
`Country` VARCHAR(80) DEFAULT "United States",
`Active` BOOLEAN DEFAULT 1
) Engine=InnoDB;

CREATE TABLE MyAccount (
AccountID INT UNSIGNED NOT NULL,
AccountNo INT UNSIGNED NOT NULL,
PersonID INT UNSIGNED,
PRIMARY KEY (AccountID),
FOREIGN KEY (PersonID) REFERENCES Person (PersonID)
) ENGINE=InnoDB;

