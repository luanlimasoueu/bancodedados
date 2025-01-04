
create table products (
    ID            integer primary key,
    name          text not null,
    description   text not null,
    price        float 
);


select * from products


insert into products (id, name, description, price) values (0, 'Matice M5', 'DIN 934', 0.25);
insert into products (id, name, description, price) values (1, 'Matice M5 nízká', 'DIN 439', 0.15);
insert into products (id, name, description, price) values (2, 'Matice M5 dlouhá', 'DIN 6334', 1.50);
insert into products (id, name, description, price) values (3, 'Soustruh', 'S2-B', 10000.00);
