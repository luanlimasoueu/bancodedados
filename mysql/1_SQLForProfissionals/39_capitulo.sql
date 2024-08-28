SHOW VARIABLES WHERE variable_name='event_scheduler';

SET GLOBAL event_scheduler = ON;

create table theMessages
( id INT AUTO_INCREMENT PRIMARY KEY,
userId INT NOT NULL,
message VARCHAR(255) NOT NULL,
updateDt DATETIME NOT NULL,
KEY(updateDt)
);

INSERT theMessages(userId,message,updateDt) VALUES (1,'message 123','2015-08-24 11:10:09');
INSERT theMessages(userId,message,updateDt) VALUES (7,'message 124','2015-08-29');
INSERT theMessages(userId,message,updateDt) VALUES (1,'message 125','2015-09-03 12:00:00');
INSERT theMessages(userId,message,updateDt) VALUES (1,'message 126','2015-09-03 14:00:00');


DROP EVENT IF EXISTS `delete7DayOldMessages`;
DELIMITER $$
CREATE EVENT `delete7DayOldMessages`
ON SCHEDULE EVERY 1 DAY STARTS '2024-08-25 00:00:00'
ON COMPLETION PRESERVE
DO BEGIN
DELETE FROM theMessages
WHERE datediff(now(),updateDt)>6; -- not terribly exact, yesterday but <24hrs is still 1 day
-- Other code
END$$
DELIMITER ;


DROP EVENT IF EXISTS `Every_10_Minutes_Cleanup`;
DELIMITER $$
CREATE EVENT `Every_10_Minutes_Cleanup`
ON SCHEDULE EVERY 10 MINUTE STARTS '2015-09-01 00:00:00'
ON COMPLETION PRESERVE
DO BEGIN
DELETE FROM theMessages
WHERE TIMESTAMPDIFF(HOUR, updateDt, now())>168; -- messages over 1 week old (168 hours)
-- Other code here
END$$
DELIMITER ;

SHOW EVENTS FROM my_db_name; -- List all events by schema name (db name)
SHOW EVENTS;





