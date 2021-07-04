create database test_DB_md4;
use test_DB_md4;

create table role(
    id int not null auto_increment primary key,
    name nvarchar(100)
);

create table user(
    id int not null auto_increment primary key ,
    name nvarchar(100) not null ,
    username nvarchar(100) unique not null ,
    password nvarchar(100) not null ,
    email nvarchar(100) unique ,
    address nvarchar(255),
    role_id int not null ,
    foreign key (role_id) references role(id)
);

create table category(
    id int not null auto_increment primary key ,
    name nvarchar(100) not null unique
);

create table product(
    id int not null auto_increment primary key ,
    name nvarchar(255) not null unique ,
    quantity int not null ,
    price double not null ,
    description nvarchar(255) ,
    image nvarchar(255),
    category_id int not null ,
    foreign key (category_id) references category(id)
);


create table transaction(
    id int not null auto_increment primary key ,
    status tinyint(1) not null default 0,
    user_id int not null ,
    amount double not null default 0.0,
    message nvarchar(255),
    security varchar(16) not null ,
    created  datetime not null
);

create  table `order`(
    id int not null primary key auto_increment,
    transaction_id int not null ,
    product_id int not null ,
    qty int not null ,
    amount double not null ,
    data text,
    status tinyint not null ,
    foreign key (transaction_id) references transaction(id),
    foreign key (product_id) references product(id)

)
