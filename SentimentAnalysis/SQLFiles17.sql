call `Split1`("A very interesting scifi movie that perfectly visualises the nature through amazing animation.");

drop temporary table if exists tmpValues1; 
create temporary table tmpValues1
(
`values` varchar(100) not null
) engine = memory;

INSERT INTO tmpValues1
SELECT 
    t1.* 
FROM 
   tmpValues AS t1
LEFT JOIN 
   sqltextmining.my_stopwords AS t2 
ON 
   t1.values=t2.value
WHERE
   t2.value IS NULL;

SELECT count(*) FROM tmpValues1 AS t1
JOIN negative_words AS t2 ON 
    t1.values=t2.wordslist;


