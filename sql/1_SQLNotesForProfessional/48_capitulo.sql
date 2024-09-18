CREATE TABLE mytable (number INT);
INSERT INTO mytable VALUES (1);

CREATE VIEW myview AS SELECT * FROM mytable;

SELECT * FROM myview;