CREATE TABLE lessons (
	id SERIAL not null,
	lesson_id varchar(10) primary key not null,
	lesson_title varchar(60) not null,
	area varchar (60) not null,
	thumbnail text
);

COPY lessons (lesson_id, lesson_title, area, thumbnail)
FROM 'D:\ALICIA (D)\ACADEMIC\Web development\Javascript\Nodejs\smartlittlefox-server\csv_files\lessons.csv'
DELIMITER ';'
CSV HEADER;

CREATE TABLE vocabulary (
	id SERIAL PRIMARY KEY NOT NULL,
	word VARCHAR(60) NOT NULL,
	lesson_id VARCHAR(10) NOT NULL,
	CONSTRAINT fk_lesson
	FOREIGN KEY (lesson_id)
	REFERENCES lessons(lesson_id)
);

COPY vocabulary (word, lesson_id)
FROM 'D:\ALICIA (D)\ACADEMIC\Web development\Javascript\Nodejs\smartlittlefox-server\csv_files\vocabulary.csv'
DELIMITER ';'
CSV HEADER;


-- on command prompt:
-- psql -h ec2-3-225-41-234.compute-1.amazonaws.com -U rycbyjhutxvyea dbu31vno4jav2c
-- psw:63518d2b8051cd16c84cc17c0a40015951057626955eae76998c91d9a372feea