use cookbook;

CREATE TABLE emp_bonus (
    EMPNO INT NOT NULL,
    RECEIVED DATE NOT NULL,
    TYPE INT NOT NULL
);

INSERT INTO emp_bonus (EMPNO, RECEIVED, TYPE) VALUES
(7934, STR_TO_DATE('17-MAR-2005', '%d-%b-%Y'), 1),
(7934, STR_TO_DATE('15-FEB-2005', '%d-%b-%Y'), 2),
(7839, STR_TO_DATE('15-FEB-2005', '%d-%b-%Y'), 3),
(7782, STR_TO_DATE('15-FEB-2005', '%d-%b-%Y'), 1);





