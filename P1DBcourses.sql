-- DB diagram


table Users {
  id uuid [pk]
  name varchar [not null]
  email varchar [not null, unique]
  password varchar [not null]
  age numeric [not null]
  is_active bool [default:true]
  Rol_id uuid [not null]
}

table Courses {
  id uuid [pk]
  title varchar [not null]
  description varchar [not null]
  Level varchar [not null]
  Teacher name [not null]
  is_active bool [default:true]
}

table courses_users {
    id uuid [pk]
    user_id uuid
    course_id uuid [not null]
}

table Course_Video {
  id uuid [pk]
  title varchar [not null]
  URL URL [not null]
  Video_description varchar [not null, unique]
  courses_id uuid [not null]
  category_id uuid [not null]
  is_completed bool [default: false]
  completed integer

}

table Categories {
  id uuid [pk]
  name varchar [not null]
}

table courses_Categories {
  id uuid [pk]
  course_id uuid
  category_id uuid
}


table Roles {
  id uuid [pk]
  name varchar
}

// 1 : 1
// 1 : Muchos
// Muchos : Muchos


Ref: "Users"."id" < "courses_users"."user_id"

Ref: "Courses"."id" < "courses_users"."course_id"



Ref: "Courses"."id" < "Course_Video"."courses_id"

Ref: "Courses"."id" < "courses_Categories"."course_id"

Ref: "Categories"."id" < "courses_Categories"."category_id"

Ref: "Roles"."id" < "Users"."Rol_id"


-- SQL 

CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar NOT NULL,
  "age" numeric NOT NULL,
  "is_active" bool DEFAULT true,
  "roles_id" uuid NOT NULL
);

CREATE TABLE "courses" (
  "id" uuid PRIMARY KEY,
  "title" varchar NOT NULL,
  "description" varchar NOT NULL,
  "Level" varchar NOT NULL,
  "Teacher" name NOT NULL,
  "is_active" bool DEFAULT true
);

CREATE TABLE "courses_users" (
  "id" uuid PRIMARY KEY,
  "user_id" uuid,
  "courses_id" uuid NOT NULL
);

CREATE TABLE "course_video" (
  "id" uuid PRIMARY KEY,
  "title" varchar NOT NULL,
  "url" varchar NOT NULL,
  "video_description" varchar UNIQUE NOT NULL,
  "courses_id" uuid NOT NULL,
  "category_id" uuid NOT NULL,
  "is_completed" bool DEFAULT false,
  "completed" integer
);

CREATE TABLE "categories" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "courses_categories" (
  "id" uuid PRIMARY KEY,
  "course_id" uuid,
  "categories_id" uuid
);

CREATE TABLE "roles" (
  "id" uuid PRIMARY KEY,
  "name" varchar
);

ALTER TABLE "courses_users" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "courses_users" ADD FOREIGN KEY ("courses_id") REFERENCES "courses" ("id");

ALTER TABLE "course_video" ADD FOREIGN KEY ("courses_id") REFERENCES "courses" ("id");

ALTER TABLE "courses_categories" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "courses_categories" ADD FOREIGN KEY ("categories_id") REFERENCES "categories" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("roles_id") REFERENCES "roles" ("id");

-- building data -- 2 registers by each one

insert into roles (
  id,
  name 
  ) values (
  '7996f025-577d-4306-b324-738155aff98c',
  'Student'
  ),(
'537a02ee-8723-4e6a-bbb8-4dde7656fbdc',
'Teacher'
  )



insert into users (
id,
  name,
  email,
  password,
  age,
  is_active,
  roles_id
) values (
'11044dd9-30e0-4651-82ae-59dd4bc490f6',
'daniel student2', 
'danielstudent2@gmail.com',
'12345D',
24,
true,
'7996f025-577d-4306-b324-738155aff98c'
), (
'd42cc74b-3b92-4298-87e1-e95c04ac03d2',
'danielteacher1@gmail.com', 
'danfdfdielc@ddsdsd',
'123fhD',
48,
true,
'537a02ee-8723-4e6a-bbb8-4dde7656fbdc'
)

insert into courses (
  id,
  title,
  description,
  "Level",
  "Teacher",
  is_active
) values (
'9e527b29-be28-4d9f-bc4f-3437d832cba1',
'backend course',
'a better course for improve your backend skills and get end to your full stack carreer',
'intermediate',
'Carlos Perez',
true
), (
'21580851-ffb2-4d99-ae56-1e2ba7423955',
'front end course',
'start your walk acroos the better front end course using react',
'intermediate',
'Andres Gonzales',
true
)


insert into categories (
  id,
  name
) values (
'5306b289-343f-4d55-a33e-8e1b59a728ef',
'front course'
), (
'73d5159a-aeda-4ccb-93e5-f43649ffda66',
'back course'
);



insert into course_video (
  id,
  title,
  url,
  Video_description,
  courses_id,
  category_id,
  is_completed,
  completed
) values (
'9e527b29-be28-4d9f-bc4f-3437d832cba1',
'introduction to',
'https//www.course/video1',
'introduce to back course we are goin to see the first concepts',
'9e527b29-be28-4d9f-bc4f-3437d832cba1',
'73d5159a-aeda-4ccb-93e5-f43649ffda66',
false,
0
), (
'7c7f93c9-b678-4fbc-91b7-4e7bdf4dd0fe',
'introduction to',
'https//www.course/front/video2',
'introduce front course we are goin to see the first concepts',
'21580851-ffb2-4d99-ae56-1e2ba7423955',
'5306b289-343f-4d55-a33e-8e1b59a728ef',
false,
0
);

insert into courses_categories (
  id,
  course_id,
  categories_id
) values (
'1c1cb191-f6c0-4fbb-9659-145f250b412e',
'21580851-ffb2-4d99-ae56-1e2ba7423955',
'5306b289-343f-4d55-a33e-8e1b59a728ef'
),(
'562b65b7-92c3-4a00-8daf-9f75853ab943',
'9e527b29-be28-4d9f-bc4f-3437d832cba1',
'73d5159a-aeda-4ccb-93e5-f43649ffda66'
);

insert into courses_users (
  id,
  user_id,
  courses_id
) values (
'9a56f6a4-73d5-4105-a70c-4190864c2a84',
'11044dd9-30e0-4651-82ae-59dd4bc490f6',
'9e527b29-be28-4d9f-bc4f-3437d832cba1'
),(
'b000bca9-ee46-4114-8579-26eec3566405',
'd42cc74b-3b92-4298-87e1-e95c04ac03d2',
'21580851-ffb2-4d99-ae56-1e2ba7423955'
);


