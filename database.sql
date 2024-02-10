CREATE TABLE lessons (
	id SERIAL not null,
	lesson_id varchar(10) primary key not null,
	lesson_title varchar(60) not null,
	area varchar (60) not null,
	thumbnail text
);

COPY lessons (lesson_id, lesson_title, area, thumbnail)
FROM ''
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
FROM ''
DELIMITER ';'
CSV HEADER;


