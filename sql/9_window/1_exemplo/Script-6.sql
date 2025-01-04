use sqlnotes;

create table products (
    ID            integer primary key asc,
    name          text not null,
    description   text not null,
    price         number(6, 2) not null
);

