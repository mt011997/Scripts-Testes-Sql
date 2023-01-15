create table if not exists carros(
	placa varchar(10) unique primary key,
	model varchar(100),
	marca varchar(100),
	ano int not null,
	check(ano > 0),
	numero_de_donos int not null,
	check(numero_de_donos > 0),
	km decimal(10,2)
);

insert into
	carros(placa, model, marca, ano, numero_de_donos, km)
values 
	('ITH2662', 'Palio', 'Fiat', 1999, 3, 120004.50),
	('JTT0001', 'Uno', 'Fiat', 1998, 5, 200147.50),
	('TJI4875', 'Corsa', 'Chevrolet', 2005, 3, 100111.15),
	('ADS5545', 'Celta', 'Chevrolet', 2001, 2, 80078.50),
	('IJT4A55', 'Fiorino', 'Fiat', 2004, 3, 212000.50),
	('GAE1554', 'Clio', 'Renault', 2007, 2, 112000.50),
	('IIR5552', '206', 'Renault', 2011, 1, 70400.50);

ALTER TABLE carros RENAME model TO modelo;
alter table carros rename km to km_rodado;
alter table carros add column alugado boolean default false;
alter table carros alter column km_rodado set not null;
update carros set numero_de_donos = null where placa = 'JTT0001';
alter table carros alter column numero_de_donos drop not null;
update carros set numero_de_donos = null where placa = 'JTT0001';
update carros set alugado = true where placa = 'IJT4A55';
update carros set marca = 'Peugeot' where placa = 'IIR5552';
select * from carros;
alter table carros drop column km_rodado;
update carros set numero_de_donos = null where modelo like 'C%';



