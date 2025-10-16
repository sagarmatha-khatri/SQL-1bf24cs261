show databases;
create database banking_week3;
create table branch(Branchname varchar(50) primary key, branchcity varchar(50), assests int);
CREATE TABLE bank_account (
    acc_no INT PRIMARY KEY,
    branchname VARCHAR(255),
    balance INT,
    FOREIGN KEY (branchname) REFERENCES branch(branchname)
);
create table bank_customer(customer_name varchar(50) primary key, customer_street varchar(50), customer_city varchar(50));
CREATE TABLE depositor (
    customer_name VARCHAR(50) PRIMARY KEY,
    acc_no INT,
    FOREIGN KEY (acc_no) REFERENCES bank_account(acc_no)
);
CREATE TABLE loan (
    loan_number INT PRIMARY KEY,
    branchname VARCHAR(255),
    balance INT,
    FOREIGN KEY (branchname) REFERENCES branch(branchname)
);

 show tables;
 
 insert into branch values ("SBI_Chamrajpet","Banglore",50000);
 insert into branch values ("SBI_ResidencyRoad","Banglore",10000);
 insert into branch values ("SBI_ShivajiRoad","Bombay",20000);
 insert into branch values ("SBI_ParlimentRoad","Delhi",10000);
 insert into branch values ("SBI_Jantarmantar","Delhi",20000);
 
 insert into bank_account values (1,"SBI_Chamrajpet", 2000);
 insert into bank_account values (2,"SBI_ResidencyRoad", 5000);
 insert into bank_account values (3,"SBI_ShivajiRoad", 6000);
 insert into bank_account values (4,"SBI_ParlimentRoad", 9000);
 insert into bank_account values (5,"SBI_Jantarmantar", 8000);
 insert into bank_account values (6,"SBI_ShivajiRoad", 4000);
 insert into bank_account values (7,"SBI_ResidencyRoad", 4000);
 insert into bank_account values (8,"SBI_ParlimentRoad", 3000);
 insert into bank_account values (9,"SBI_ResidencyRoad", 5000);
 insert into bank_account values (10,"SBI_Jantarmantar", 2000);
 
 select * from branch;
 DELETE FROM branch WHERE branchname=1;

insert into bank_customer values ("Avinash","Bull_Temple_Road","Banglore");
insert into bank_customer values ("Dinesh","Bannergatta_Road","Banglore");
insert into bank_customer values ("Mohan","NationalCollege_Road","Banglore");
insert into bank_customer values ("Nikil","Akbar_Road","Delhi");
insert into bank_customer values ("Ravi","Prithviraj_Road","Delhi");

insert into loan values (1,"SBI_Chamrajpet", 1000);
insert into loan values (2,"SBI_ResidencyRoad", 2000);
insert into loan values (3,"SBI_ShivajiRoad", 3000);
insert into loan values (4,"SBI_ParlimentRoad", 4000);
insert into loan values (5,"SBI_Jantarmantar", 5000);

insert into depositor values ("Avinash", 1);
insert into depositor values ("Dinesh", 2);
insert into depositor values ("Nikhil", 4);
insert into depositor values ("Ravi", 5);
insert into depositor values ("Avinash", 8);
insert into depositor values ("Nikhil", 9);
insert into depositor values ("Dinesh", 10);
insert into depositor values ("Nikhil", 11); 
