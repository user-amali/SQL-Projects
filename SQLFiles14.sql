DELIMITER $$;
CREATE PROCEDURE `Split`
(
DECLARE foundPos tinyint unsigned;
declare tmpTxt text;
declare delimLen tinyint unsigned;
declare element text;

drop temporary table if exists tmpValues;
create temporary table tmpValues
(
`values` text not null default ''
) engine = memory;

set delimLen = length(delim);
set tmpTxt = input;

set foundPos = instr(tmpTxt,delim);
while foundPos <> 0 do
set element = substring(tmpTxt, 1, foundPos-1);
set tmpTxt = replace(tmpTxt, concat(ele
ment,delim), '');


insert into tmpValues (`values`) values ( element);

set foundPos = instr(tmpTxt,delim);
end while;

if tmpTxt <> '' then
insert into tmpValues (`values`) values (tmpTxt);
end if;

select * from tmpValues;
}
