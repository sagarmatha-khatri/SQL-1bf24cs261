use supplier_week7;
create table suppliers(sid integer(5) primary key, sname varchar(20), city varchar(20));
desc suppliers;
create table parts(pid integer(5) primary key, pname varchar(20), color varchar(10));
desc parts;
CREATE TABLE catalog (
    sid INT(5),
    pid INT(5),
    cost FLOAT(6),
    PRIMARY KEY (sid, pid),
    FOREIGN KEY (sid) REFERENCES suppliers(sid),
    FOREIGN KEY (pid) REFERENCES parts(pid)
);

insert into suppliers values(10001, "Acme Widget","Bangalore");
insert into suppliers values(10002, "Johns","Kolkata");
insert into suppliers values(10003, "Vimal", "Mumbai");
insert into suppliers values(10004,"Reliance","Delhi");
insert into suppliers values(10005, "Mahindra","Mumbai");

insert into parts values(20001, "Book","Red");
insert into parts values(20002, "Pen","Red");
insert into parts values(20003, "Pencil","Green");
insert into parts values(20004, "Mobile","Green");
insert into parts values(20005, "Charger","Black");


insert into CATALOG values(10001, 20001,10);
insert into CATALOG values(10001, 20002,10);
insert into CATALOG values(10001, 20003,30);
insert into CATALOG values(10001, 20004,10);
insert into CATALOG values(10001, 20005,10);

insert into CATALOG values(10002, 20001,10);
insert into CATALOG values(10002, 20002,20);
insert into CATALOG values(10003, 20003,30);
insert into CATALOG values(10004, 20003,40);

select * from catalog;
select * from parts;
select * from suppliers;


-- 1. Find the pnames of parts for which there is some supplier --
SELECT DISTINCT P.pname
FROM Parts P, Catalog C
WHERE P.pid = C.pid;

-- 2. Find the snames of suppliers who supply every part. --
SELECT S.sname
FROM Suppliers S
WHERE
(( SELECT count(P.pid)
FROM Parts P ) =
( SELECT count(C.pid)
FROM Catalog C
WHERE C.sid = S.sid ));

-- 3. Find the snames of suppliers who supply every red part. --

SELECT S.sname
FROM Suppliers S
WHERE
(( SELECT count(P.pid)
FROM Parts P where color="Red" ) =
( SELECT count(C.pid)
FROM Catalog C, Parts P
WHERE C.sid = S.sid AND
C.pid = P.pid AND P.color = "Red" ));

-- iv) Find the pnames of parts supplied by Acme Widget Suppliers and by no one else.--

SELECT P.pname
FROM Parts P, Catalog C, Suppliers S
WHERE P.pid = C.pid AND C.sid = S.sid
AND S.sname = "Acme Widget"
AND NOT EXISTS ( SELECT * FROM Catalog C1, Suppliers S1
WHERE P.pid = C1.pid AND C1.sid = S1.sid AND
S1.sname <> "Acme Widget");

-- v) Find the sids of suppliers who charge more for some part than the average cost of that part (averaged over all the suppliers who supply that part). --
 SELECT DISTINCT C.sid FROM Catalog C WHERE C.cost> (SELECT AVG (C1.cost)FROM Catalog C1 WHERE C1.pid = C.pid);
 
 -- 6. For each part, find the sname of the supplier who charges the most for that part. --
SELECT P.pid, S.sname
FROM Parts P, Suppliers S, Catalog C
WHERE C.pid = P.pid
AND C.sid = S.sid
AND C.cost = (SELECT MAX (C1.cost)
FROM Catalog C1
WHERE C1.pid = P.pid);

SELECT P.pid, S.sname
FROM Parts P
JOIN Catalog C ON C.pid = P.pid
JOIN Suppliers S ON C.sid = S.sid
WHERE C.cost = (
    SELECT MAX(C1.cost)
    FROM Catalog C1
    WHERE C1.pid = P.pid
);
