CREATE TABLE `car`
( `car_id` INT UNSIGNED NOT NULL PRIMARY KEY,
`name` VARCHAR(20),
`price` DECIMAL(8,2)
);

INSERT INTO CAR (`car_id`, `name`, `price`) VALUES (1, 'Audi A1', '20000');
INSERT INTO CAR (`car_id`, `name`, `price`) VALUES (2, 'Audi A1', '15000');
INSERT INTO CAR (`car_id`, `name`, `price`) VALUES (3, 'Audi A2', '40000');
INSERT INTO CAR (`car_id`, `name`, `price`) VALUES (4, 'Audi A2', '40000');


SELECT DISTINCT `name`, `price` FROM CAR;


CREATE TABLE stack(
id INT,
username VARCHAR(30) NOT NULL,
password VARCHAR(30) NOT NULL
);

INSERT INTO stack (`id`, `username`, `password`) VALUES (1, 'Foo', 'hiddenGem');
INSERT INTO stack (`id`, `username`, `password`) VALUES (2, 'Baa', 'verySecret');

SELECT id FROM stack;

drop  table stack;

CREATE TABLE stack
( id int AUTO_INCREMENT PRIMARY KEY,
username VARCHAR(100) NOT NULL
);

INSERT stack(username) VALUES
('admin'),('k admin'),('adm'),('a adm b'),('b XadmY c'), ('adm now'), ('not here');


SELECT * FROM stack WHERE username LIKE "%adm%";


CREATE TABLE `student`
( 
`name` VARCHAR(20),
`percentage` DECIMAL(8,2),
`Remark` VARCHAR(20)
);

INSERT into `student` (`name` , `percentage`) 
VALUES ("iSHA", 67), ("Rucha", 67), ("Het", 67), ("Ansh", 67);


SELECT st.name,
	st.percentage,
    case when st.percentage >= 35 then 'Pass' else 'Fail' end as "Remark"
from student as st;

SELECT st.name,
st.percentage,
IF(st.percentage >= 35, 'Pass', 'Fail') AS `Remark`
FROM student AS st ;
