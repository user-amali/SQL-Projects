CREATE PROCEDURE `new_procedure` ()
BEGIN
DECLARE areview text;
DECLARE varinc int;
DECLARE cur1 CURSOR FOR SELECT review FROM sqltextmining.reviews;
#DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

SET varinc = 1;

OPEN cur1;

label1: LOOP 
   FETCH cur1 INTO areview;
   #IF done THEN
    #  LEAVE label1;
   #END IF;
   CALL `Split1`(areview);

   DROP TEMPORARY TABLE IF EXISTS tmpValues1; 
   CREATE TEMPORARY TABLE tmpValues1
   (
      `values` VARCHAR(100) NOT NULL
   ) ENGINE = MEMORY;

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

   UPDATE sqltextmining.reviews
   SET neg_words = -( SELECT count(*) 
                     FROM tmpValues1 AS t1
					 JOIN negative_words AS t2 
                     ON 
						t1.values=t2.wordslist ),
	   pos_words = ( SELECT count(*) 
                     FROM tmpValues1 AS t1
					 JOIN positive_words AS t2 
                     ON 
						t1.values=t2.wordslist )
   WHERE UserId=varinc; 
   SET varinc = varinc + 1;
END LOOP label1;
CLOSE cur1;
END