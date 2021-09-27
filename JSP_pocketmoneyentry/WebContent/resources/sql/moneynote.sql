create table moneynote(
	no INTEGER NOT NULL AUTO_INCREMENT primary key,
	email varchar(30),
	money INTEGER,
	in_out char(3),
	note varchar(20),
	iodate date,
	memo varchar(50),
	confirm char(1)

)
insert into moneynote(email,money,in_out,note,iodate,memo,confirm) values('bob@ab.co',120000,'in','일반급여','2021.04.17','4월 알바 급여 받음','Y')
insert into moneynote(email,money,in_out,note,iodate,memo,confirm) values('ccb@ab.co',18000,'out','친구선물','2021.04.21','친구 생일선물 구입','Y')
insert into moneynote(email,money,in_out,note,iodate,memo,confirm) values('fob@ab.co',50000,'in','용돈','2021.05.01','엄마에게 용돈받음','Y')
insert into moneynote(email,money,in_out,note,iodate,memo,confirm) values('gob@naver.co',12700,'out','책 구입','2021.05.11','JSP 책 구입','Y')

drop table moneynote

select * from moneynote;

desc moneynote

describe moneynote

select * from moneynote where (iodate BETWEEN '2021.04.16' AND '2021.05.01')
				