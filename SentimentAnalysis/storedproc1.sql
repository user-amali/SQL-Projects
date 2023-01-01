CREATE DEFINER=`root`@`localhost` PROCEDURE `Split`(areview text, delim char)
BEGIN
DECLARE foundPos tinyint unsigned;
declare tmpTxt text;
declare delimLen tinyint unsigned;
declare element text;

set delimLen = length(delim);
set tmpTxt = areview;

set foundPos = instr(tmpTxt,delim);
while foundPos <> 0 do
set element = substring(tmpTxt, 1, foundPos-1);
set tmpTxt = replace(tmpTxt, concat(element,delim), '');

insert into words (`values`) values ( element);

set foundPos = instr(tmpTxt,delim);
end while;

if tmpTxt <> '' then
insert into words (`values`) values (tmpTxt);
end if;

select * from tmpValues;
END