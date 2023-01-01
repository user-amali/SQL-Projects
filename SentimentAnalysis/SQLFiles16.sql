CREATE PROCEDURE `new_procedure` ()
BEGIN
declare @s1 varchar(3000);
declare @xmlt xml,
        @str varchar(100),@delimiter varchar(10), @out varchar(max);;
select @delimiter =' '
select @s1 =  'This is a string';
select @s1 = 'This    is   a   string ';
select @s1 = 'This  is a          string ';
select @s1 = 'This  is           a string';

select @xml = cast(('<X>'+replace(@s1,@delimiter ,'</X><X>')+'</X>') as xml);
select @out = 
    COALESCE(@out + ' ', '') +  C.value('.', 'varchar(100)') 
from @xml.nodes('X') as X(C)
where LEN(C.value('.', 'varchar(10)')) > 0

select @out
END
