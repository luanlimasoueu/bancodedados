use cookbook;

#https://www.geeksforgeeks.org/sql-string-functions/

#1. CONCAT()

SELECT CONCAT('John', ' ', 'Doe') AS FullName;

#2. CHAR_LENGTH() / CHARACTER_LENGTH(): Find String Length

SELECT CHAR_LENGTH('Hello') AS StringLength;

#3. UPPER() and LOWER(): Convert Text Case

SELECT UPPER('hello') AS UpperCase;
SELECT LOWER('HELLO') AS LowerCase;

#4. LENGTH(): Length of String in Bytes

SELECT LENGTH('Hello') AS LengthInBytes;

#5. REPLACE(): Replace Substring in String

SELECT REPLACE('Hello World', 'World', 'SQL') AS UpdatedString;

#6. SUBSTRING() / SUBSTR(): Extract Part of a String

SELECT SUBSTRING('Hello World', 1, 7) AS SubStringExample;

#7. LEFT() and RIGHT(): Extract Substring from Left or Right

SELECT LEFT('Hello World', 5) AS LeftString;
SELECT RIGHT('Hello World', 5) AS RightString;

#8. INSTR(): Find Position of Substring

SELECT INSTR('Hello World', 'World') AS SubstringPosition;

#9. TRIM(): Remove Leading and Trailing Spaces

SELECT TRIM(' ' FROM '  Hello World  ') AS TrimmedString;

#10. REVERSE(): Reverse the String

SELECT REVERSE('Hello') AS ReversedString;

#12. CONCAT_WS(): Concatenate Strings with a Separator

SELECT CONCAT_WS('_', 'geeks', 'for', 'geeks');

#14. FORMAT(): Format Numbers for Readable Output

SELECT FORMAT(0.981 * 100, 'N2') + '%' AS PercentageOutput;

#18. LPAD(): Pad the Left Side of a String

SELECT LPAD('geeks', 8, '0');

#19. MID(): Extract a Substring from the Middle

SELECT MID("geeksforgeeks", 6, 2);

#26. STRCMP(): Compare Two Strings

SELECT STRCMP('geeksforgeeks.com', 'geeksforgeeks.com');

SELECT STRCMP('geeksforgeeks.com', 'geeks.com');







