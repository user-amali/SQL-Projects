CREATE DATABASE SqlTextMining;

USE SqlTextMining;

-- (1) Create a table to store movie comments
CREATE TABLE Reviews (
UserId INT NOT NULL,
review VARCHAR (255) NULL,
CONSTRAINT PK_Reviews PRIMARY KEY (UserId)
)

