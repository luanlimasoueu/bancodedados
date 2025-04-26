use cookbook;

#1. CONCAT_WS()

SELECT CONCAT_WS(', ', 'apple', 'banana', 'orange') AS Concatenated_String;


#2. CONCAT()

SELECT CONCAT('Hello', ' ', 'World') AS Concatenated_String;

#3. CHARACTER_LENGTH()

SELECT CHARACTER_LENGTH('Hello World') AS String_Length;

#4. ELT()

SELECT ELT(3, 'apple', 'banana', 'orange', 'grape') AS Selected_String;

#5. EXPORT_SET()

SELECT EXPORT_SET(5, 2, '0', ',', '1') AS Binary_Set;


#6. FIELD()

SELECT FIELD('banana', 'apple', 'banana', 'orange') AS Position;

#7. FIND_IN_SET()

SELECT FIND_IN_SET('banana', 'apple,banana,orange') AS Position;

#8. FORMAT()

SELECT FORMAT(1234567.89, 2) AS Formatted_Number;

#9. FROM_BASE64()

SELECT FROM_BASE64('SGVsbG8gV29ybGQ=') AS Decoded_String;





