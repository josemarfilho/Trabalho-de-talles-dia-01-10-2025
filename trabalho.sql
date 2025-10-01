create database rainha;
use rainha;


create table padaria (
idPadaria int primary key,
nome varchar(50),
cnpj varchar(14)
);

create table patrao(
idPatrao int primary key,
nome varchar(50),
idPadaria int UNIQUE,
foreign key(idPadaria) references padaria(idPadaria)
);

create table padeiro(
idPadeiro int primary key,
nome varchar(50),
idPatrao int,
foreign key(idPatrao) references patrao(idPatrao)
);

create table atendente (
idAtendente int primary key,
nome varchar(50)
);

create table cliente(
idCliente int primary key,
nome varchar(50)
);

create table atendenteCliente(
idAtendente int,
idCliente int,
primary key(idAtendente, idCliente),
foreign key(idAtendente) references atendente(idAtendente),
foreign key(idCliente) references cliente(idCliente)
);

create table entregador(
idEntregador int primary key,
nome varchar(100),
cpf varchar(11)
);

create table pedido(
idPedido int primary key,
nomeProduto varchar (100),
valor decimal(10,2),
idCliente int,
foreign key (idCliente) references cliente(idCliente)
);

create table entregadorPedido(
idEntregador int,
idPedido int,
primary key(idEntregador, idPedido),
foreign key(idEntregador) references entregador(idEntregador),
foreign key(idPedido) references pedido(idPedido)
);

create table pagamento (
idPagamento int primary key,
valor decimal(10,2),
idCliente int  ,
foreign key (idCliente) references cliente(idCliente)
);

create table entrega(
idEntrega int primary key,
endereco varchar(100),
valor decimal(10,2),
frete decimal(10,2),
idCliente int,
idPedido int unique,
foreign key (idPedido) references pedido(idPedido),
foreign key(idCliente) references cliente(idCliente)
);
