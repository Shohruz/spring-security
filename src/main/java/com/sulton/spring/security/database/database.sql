create schema spring;

set search_path to spring;

create table users (
    id bigserial,
    username varchar(255) not null,
    password varchar(255),
    email varchar(50) unique,
    primary key(id)
);

create table roles (
    id serial,
    name varchar(255) not null,
    primary key(id)
);

create table users_roles (
    user_id bigint not null,
    role_id int not null,
    primary key(user_id,role_id),
    foreign key (user_id) references users (id),
    foreign key (role_id) references roles (id)
);

insert into users (username,password,email) values ('user','$2a$12$FF3ALdHdrWWYhOLKaBB09eoTwMUatj4bHXhM8azCVHRsVWcvnTXFS','user@gmail.com');

insert into users (username,password,email) values ('admin','$2a$12$2.M6VhGfJwJwxb6xNZ6DBeK5fgNFZOzaOuU4HmO770LpqRBG22dYy','admin@gmail.com');

insert into roles (name) values ('ROLE_USER'),('ROLE_ADMIN');

insert into users_roles (user_id,role_id) values (1,1);