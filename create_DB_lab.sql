use master;
go

drop database if exists PRS;
go

create database PRS;
go

use PRS;
go

create table users (
    Id int not null primary key identity(1,1),
    Username varchar(30) not null unique,
    Password varchar(30) not null,
    Firstname varchar(30) not null,
    Lastname varchar(30) not null,
    Phone varchar(12) null,
    Email varchar(255) null,
    IsReviewer bit null,
    IsAdmin bit not null
);
go

create table vendors (
    Id int not null primary key identity(1,1),
    Code varchar(30) not null unique,
    Name varchar(30) not null,
    Address varchar(30) not null,
    City varchar(30) not null,
    State varchar(2) not null,
    Zip varchar(5) not null,
    Phone varchar(12) null,
    Email varchar(255) null
);
go

create table products (
    Id int not null primary key identity(1,1),
    PartNbr varchar(30) not null unique,
    Name varchar(30) not null,
    Price decimal(11,2) not null,
    Unit varchar(30) not null,
    PhotoPath varchar(255) null,
    VendorId int not null references Vendors(Id)
);
go

create table requests (
    Id int not null primary key identity(1,1),
    Description varchar(80) not null,
    Justification varchar(80) not null,
    RejectionReason varchar(80) null,
    DeliveryMode varchar(20) not null default 'Pickup',
    Status varchar(10) null default 'NEW'
        check (Status in ('NEW', 'EDIT', 'REVIEW', 'APPROVED', 'REJECTED')),
    Total decimal(11,2) null default 0,
    UserId int not null references Users(Id)
);
go

create table RequestLines (
    Id int not null primary key identity(1,1),
    RequestId int not null references Requests(Id) on delete cascade,
    ProductId int not null references Products(Id),
    Quantity int null default 0
);
go

insert users (
    username, password, firstname, lastname, phone, email, isreviewer, isadmin
)
values ('jdoe', 'qwerty123', 'John', 'Doe', '111-111-1111', 'jdoe@gmail.com', 1, 1),
    ('jblow', 'qwerty123', 'Joe', 'Blow', '222-222-2222', 'jblow@gmail.com', 1, 0),
    ('npeterson', 'qwerty123', 'Nancy', 'Peterson', '333-333-3333', 'npeterson@gmail.com', 1, 0),
    ('cxaviar', 'qwerty123', 'Charles', 'Xaviar', '444-444-4444', 'jdoe@gmail.com', 1, 0),
    ('clewis', 'qwerty123', 'Crystal', 'Lewis', '555-555-5555', 'clewis@gmail.com', 1, 0),
    ('emusk', 'qwerty123', 'Elon', 'Must', '666-666-6666', 'emusk@starlink.com', 1, 1),
    ('bmarlo', 'qwerty123', 'Brandon', 'Marlo', '777-777-7777', 'bmarlo@gmail.com', 1, 0);
go


insert vendors (
    code, name, address, city, state, zip, phone, email
)
values ('CTL', 'Castle Tech LLC', '1st A St', 'Pheonix', 'AZ', '14789', '111-111-1111', 'sales@castletech.com'),
    ('NSA', 'NASA', '2nd B St', 'Houston', 'TX', '74123', '222-222-2222', 'sales@nasa.com'),
    ('BD', 'Boston Dynamics', '3rd C St', 'Boston', 'MA', '96321', '333-333-3333', 'sales@bostondynamics.com'),
    ('MTA', 'Meta Inc.', '4th D St', 'Los Angeles', 'CA', '90210', '444-444-4444', 'sales@meta.com'),
    ('GGL', 'Google Inc.', '5th E St', 'San Francisco', 'CA', '91354', '555-555-5555', 'sales@google.com'),
    ('MS', 'Microsoft', '6th F St', 'Denver', 'CO', '85214', '666-666-6666', 'sales@microsoft.com'),
    ('APL', 'Apple', '7th G St', 'New York', 'NY', '78945', '777-777-7777', 'sales@apple.com');
go

insert products (
    partnbr, name, price, unit, photopath, vendorid
)
values ('A110', 'Nighthawk Router', 120.00, '1', '/img/nighthawk.png', 1),
    ('A111', 'CAT5 Cable', 25.82, '1', '/img/cat5.png', 2),
    ('A112', '24" Monitor', 183.50,'2', '/img/24monitor.png', 3),
    ('A113', 'Netgear Modem', 60.00, '1', '/img/netgearmodem.png', 4),
    ('A114', 'Keyboard', 42.00, '1', '/img/keyboard.png', 5),
    ('A115', 'Mouse', 120.00, '1', '/img/mouse.png', 6),
    ('A116', 'Laptop', 850.00, '1', '/img/laptop.png', 7);
go

insert requests (
    [Description], Justification, UserId
)
values ('Request 1', 'None', 3),
    ('Request 2', 'None', 3),
    ('Request 3', 'None', 3),
    ('Request 4', 'None', 3),
    ('Request 5', 'None', 3);
go

insert RequestLines (Quantity, RequestId, ProductId)
values (1, 1, 1),
    (1, 2, 2),
    (2, 3, 3),
    (5, 1, 4),
    (3, 4, 5);
go

select * from products