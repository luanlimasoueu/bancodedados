SELECT @@time_zone

CREATE TABLE times (dt DATETIME, ts TIMESTAMP);
INSERT INTO times VALUES(NOW(), NOW());
SELECT dt, ts, TIMESTAMPDIFF(MINUTE, dt, ts)offset FROM times;


DROP TABLE times;