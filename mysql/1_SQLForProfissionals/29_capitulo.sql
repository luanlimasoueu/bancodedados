CREATE TABLE `gtType` (
`type` char(2) NOT NULL,
`description` varchar(1000) NOT NULL,
PRIMARY KEY (`type`)
) ENGINE=InnoDB;

select * from `gtType`;

CREATE TABLE `getTogethers` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`type` char(2) NOT NULL,
`eventDT` datetime NOT NULL,
`location` varchar(1000) NOT NULL,
PRIMARY KEY (`id`),
KEY `fk_gt2type` (`type`), -- see Note1 below
CONSTRAINT `gettogethers_ibfk_1` FOREIGN KEY (`type`) REFERENCES `gtType` (`type`)
) ENGINE=InnoDB;

select * from `getTogethers`;

CREATE TABLE `someOther` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`someDT` datetime NOT NULL,
PRIMARY KEY (`id`),
CONSTRAINT `someOther_dt` FOREIGN KEY (`someDT`) REFERENCES `getTogethers` (`eventDT`)
) ENGINE=InnoDB;

