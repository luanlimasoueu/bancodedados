SET @myjson = CAST('["A","B",{"id":1,"label":"C"}]' as JSON);
SELECT
JSON_EXTRACT( @myjson , '$[1]' ) ,
JSON_EXTRACT( @myjson , '$[*].label') ,
JSON_EXTRACT( @myjson , '$[1].*' ) ,
JSON_EXTRACT( @myjson , '$[2].*')
;
