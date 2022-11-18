CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "first_name" varchar,
  "last_name" varchar,
  "email" varchar,
  "password" varchar,
  "age" int,
  "gender" varchar,
  "country" varchar,
  "role_id" int
);

CREATE TABLE "user_courses" (
  "id" uuid PRIMARY KEY,
  "user_id" uuid,
  "course_id" uuid
);

CREATE TABLE "courses" (
  "id" uuid PRIMARY KEY,
  "title" varchar,
  "description" text,
  "teacher" varchar,
  "score" float,
  "url_cover" varchar,
  "level_id" int
);

CREATE TABLE "course_categories" (
  "id" uuid PRIMARY KEY,
  "course_id" uuid,
  "categorie_id" int
);

CREATE TABLE "course_videos" (
  "id" uuid PRIMARY KEY,
  "title" varchar,
  "description" text,
  "duration" int,
  "url_video" varchar,
  "courses_id" uuid
);

CREATE TABLE "categories" (
  "id" serial PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "roles" (
  "id" serial PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "levels" (
  "id" serial PRIMARY KEY,
  "level" varchar
);

ALTER TABLE "course_videos" ADD FOREIGN KEY ("courses_id") REFERENCES "courses" ("id");

ALTER TABLE "course_categories" ADD FOREIGN KEY ("categorie_id") REFERENCES "categories" ("id");

ALTER TABLE "course_categories" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("id");

ALTER TABLE "user_courses" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "user_courses" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("level_id") REFERENCES "levels" ("id");


insert into roles (
	name  
) values (
	'Admin'
), (
	'Student'
), (
	'Teacher'
);


insert into users (
	id, 
	first_name, 
	last_name, 
	email, 
	"password",
	age, 
	gender,
	country,
	role_id 
)
values (
	'02236b91-ff21-4e13-9b20-84eeeb19000a', 
	'Marcos', 
	'Plata', 
	'mjsilver98@gmail.com', 
	'root',
	24,
	'male',
	'Ecuador',
	2
), (
	'ac155312-892c-4c9d-a498-ec759dbc7e4a',
	'Andrea',
	'Nuñez',
	'andrea@hotmail.com',
	'1234',
	27,
	'female',
	'Ecuador',
	1
), (
	'ba6dce8a-81cb-4cc7-b9ad-b2fa0de627c9',
	'Andres',
	'Barahona',
	'andres200@gmail.com',
	'rootAdmin',
	40,
	'male',
	'Spain',
	3
);

insert into user_courses (
	id, 
	user_id, 
	course_id
) values (
	'eced4220-241e-4bcc-bf3f-4fb9df19743c',
	'02236b91-ff21-4e13-9b20-84eeeb19000a',
	'cc3f6ac6-9e15-4367-a03d-21163aa77cda'
), (
	'2bd8fcb3-7f5a-45ed-b4bc-6f7c0fadac2f',
	'02236b91-ff21-4e13-9b20-84eeeb19000a',
	'ac155312-892c-4c9d-a498-ec759dbc7e4a'
);


insert into categories (
	name  
) values (
	'Web development'
), (
	'Video games development'
), (
	'mobile development'
);

insert into levels (
	level  
) values (
	'Beginner'
), (
	'Mid Level'
), (
	'Advanced'
);

insert into courses (
	id, 
	title, 
	description, 
	teacher, 
	score,
	url_cover,
	level_id
) values (
	'cc3f6ac6-9e15-4367-a03d-21163aa77cda',
	'Modern JavaScript: A Guide to Mastering the Language',
	'Welcome to the Modern JavaScript course. The main objective of the course is to teach you current JavaScript, 
	starting from zero knowledge in JavaScript to taking you to an advanced and competitive level in the current job market.',
	'Fernando Herrera',
	4.8,
	'https://www.udemy.com/course/javascript-fernando-herrera/',
	1
), (
	'ac155312-892c-4c9d-a498-ec759dbc7e4a',
	'Complete Web Development with HTML5, CSS3, JS AJAX PHP and MySQL',
	'Learn Web Development with this 100% practical course, step by step and without prior knowledge. INCLUDES 4 FINAL PROJECTS',
	'Juan Pablo De la Torre',
	4.7,
	'https://www.udemy.com/course/desarrollo-web-completo-con-html5-css3-js-php-y-mysql/',
	2
);

insert into course_categories (
	id, 
	course_id, 
	categorie_id
) values (
	'b821e155-23da-4fd9-9390-a6d9b7cc1431',
	'cc3f6ac6-9e15-4367-a03d-21163aa77cda',
	1
), (
	'9a00fc45-faae-41e2-bec3-26afca9b4235',
	'ac155312-892c-4c9d-a498-ec759dbc7e4a',
	2
), (
	'84a0614c-07f0-4636-b4b4-88f86e6f5f65',
	'ac155312-892c-4c9d-a498-ec759dbc7e4a',
	1
);

insert into course_videos (
	id, 
	title, 
	description, 
	duration, 
	url_video,
	courses_id
) values (
	'81e79ad9-4ae5-45ee-8a02-5e1042169be3',
	'introduction JavaScript',
	'Here our path will begin',
	3,
	'https://www.youtube.com/watch?v=bDOn2lI9KXs&list=PLCKuOXG0bPi0Fbb70mxM0V3P6XHXKiVmq&index=1',
	'cc3f6ac6-9e15-4367-a03d-21163aa77cda'
), (
	'588c5e0d-2879-458c-9906-67f9bf3d4ab6',
	'Introduction Web Development',
	'Introduction to HTML - The Role of HTML (Download Materials here)',
	5,
	'https://www.youtube.com/watch?v=JuhGYoZNQYU&t=2s',
	'ac155312-892c-4c9d-a498-ec759dbc7e4a'
);

select * from users;

select first_name, email from users;

select id, last_name, age, email from users;

-- as nos sirve para modificar el nombre en la respuesta por ejemplo id a user_id
select id as user_id, last_name, age, email from users;

select * from users where email = 'mjsilver98@gmail.com';

select * from users where age = 40 and first_name = 'Andres'


-- join sirve para unir dos tabla mediante la relacion de la primary key y la llave foranea
select * from users inner join roles on users.role_id = roles.id 
-- aqui agregamos alias para sea mas sencialla la lectura 
select * from users as u inner join roles as r on u.role_id  = r.id