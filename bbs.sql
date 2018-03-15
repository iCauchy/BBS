create table article
(
	id int primary key auto_increment,
	pid int,
	rootid int,
	title varchar(255),
	cont text,
	pdate datetime,
	isleaf int
);

insert into article values(null,0,1,'hello','hello',now(),1);
