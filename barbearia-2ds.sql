create database barbearia_db;
use barbearia_db;

create table if not exists clientes (cliente_id int primary key auto_increment,
  nome varchar(100) not null,
  telefone varchar(20),
  email varchar(100) unique,
  data_nascimento date,
  data_cadastro date not null);

create table if not exists barbeiros (barbeiro_id int primary key auto_increment,
  nome varchar(100) not null,
  telefone varchar(20),
  cpf varchar(11) unique,
  data_contratacao date);

create table if not exists servicos (servico_id int primary key auto_increment,
  nome varchar(100) not null,
  descricao text,
  preco float not null,
  duracao_estimada_min int);

create table if not exists agendamentos (agendamento_id int primary key auto_increment,
  cliente_id int not null,
  barbeiro_id int not null,
  servico_id int not null,
  data_hora_agendamento datetime not null,
  status_agendamento enum('Agendado', 'Concluído', 'Cancelado', 'Não Compareceu'),
  observacoes text,
  preco_cobrado float,
  data_criacao date not null,
  foreign key (cliente_id) references clientes(cliente_id),
  foreign key (barbeiro_id) references barbeiros(barbeiro_id),
  foreign key (servico_id) references servicos(servico_id));

insert into clientes (nome, telefone, email, data_nascimento, data_cadastro) values
('Carlos Silva', '45998765432', 'carlos.s@email.com', '1985-03-15', '2024-01-01'),
('Rafael Santos', '45999876123', 'rafael.s@email.com', '1990-01-10', '2024-01-01'),
('Lucas Pereira', '45997777666', 'lucas.p@email.com', '2000-06-30', '2024-01-01'),
('Bruno Rocha', '45995555444', 'bruno.r@email.com', '1982-04-25', '2024-01-01'),
('Gustavo Ferreira', '45993333222', 'gustavo.f@email.com', '1979-12-01', '2024-01-01'),
('André Souza', '45991111000', 'andre.s@email.com', '1993-10-20', '2024-01-01'),
('Thiago Ribeiro', '45999998888', 'thiago.r@email.com', '1991-05-03', '2024-01-01'),
('Rodrigo Alves', '45997777665', 'rodrigo.a@email.com', '1986-09-09', '2024-01-01'),
('Leonardo Barros', '45995554444', 'leonardo.b@email.com', '1983-11-23', '2024-01-01'),
('Daniel Nunes', '45993332222', 'daniel.n@email.com', '1989-02-07', '2024-01-01'),
('Henrique Lima', '45992112233', 'henrique.l@email.com', '1995-04-18', '2024-01-01'),
('Eduardo Costa', '45993445566', 'eduardo.c@email.com', '1987-07-29', '2024-01-01'),
('Marcelo Duarte', '45992345678', 'marcelo.d@email.com', '1992-01-12', '2024-01-01'),
('Paulo Henrique', '45991234567', 'paulo.h@email.com', '1988-08-08', '2024-01-01'),
('Mateus Ramos', '45990908765', 'mateus.r@email.com', '1996-06-06', '2024-01-01'),
('Jorge Almeida', '45993456789', 'jorge.a@email.com', '1981-09-15', '2024-01-01'),
('Vinícius Lopes', '45994561234', 'vinicius.l@email.com', '1997-03-03', '2024-01-01'),
('Fábio Moura', '45997894561', 'fabio.m@email.com', '1984-10-10', '2024-01-01'),
('Igor Teixeira', '45998987654', 'igor.t@email.com', '1990-12-22', '2024-01-01'),
('Pedro Fernandes', '45992349876', 'pedro.f@email.com', '1998-05-17', '2024-01-01');

insert into barbeiros (nome, telefone, cpf, data_contratacao) values
('Jonas Mestre', '454799990001', '12345678909', '2020-01-15'),
('Ricardo Alves', '454799990002', '98765432100', '2021-06-01'),
('Fernando Lima', '454799990003', '32165498701', '2019-03-10'),
('Diego Costa', '454799990004', '45612378910', '2022-02-20'),
('Marcos Silva', '454799990005', '74185296302', '2018-11-01'),
('Roberto Oliveira', '454799990006', '25836914703', '2023-01-10'),
('Claudio Pereira', '454799990007', '36925814704', '2020-05-12'),
('Eduardo Santos', '454799990008', '14725836905', '2021-08-19'),
('Sergio Martins', '454799990009', '65432198706', '2022-11-05'),
('Luis Gonzaga', '454799990010', '96385274107', '2019-07-23'),
('Felipe Neto', '454799990011', '85274196308', '2023-03-01'),
('Gabriel Jesus', '454799990012', '74196385209', '2021-02-15'),
('Alexandre Pires', '454799990013', '32198765400', '2020-09-30'),
('Vinicius Moraes', '454799990014', '98712345611', '2022-04-10'),
('Caio Castro', '454799990015', '15975348612', '2018-10-05'),
('Pedro Bial', '454799990016', '75315986413', '2023-05-20'),
('Tiago Leifert', '454799990017', '35795148614', '2019-01-25'),
('Rodrigo Faro', '454799990018', '95135786415', '2021-12-11'),
('Luciano Huck', '454799990019', '65498732116', '2022-07-07'),
('Sergio Silva', '454799990020', '78945612317', '2020-03-18');

insert into servicos (nome, descricao, preco, duracao_estimada_min) values
('Corte de cabelo masculino', 'Corte tradicional ou moderno.', 50.0, 45),
('Barba', 'Aparo da barba.', 30.0, 30);

insert into agendamentos (cliente_id, barbeiro_id, servico_id, data_hora_agendamento, status_agendamento, observacoes, preco_cobrado, data_criacao) values
(1, 1, 1, '2024-06-05 10:00:00', 'agendado', 'Solicitou corte baixo', 50.0, '2024-06-01'),
(2, 2, 2, '2024-06-05 11:00:00', 'agendado', 'Cliente indicou amigo', 30.0, '2024-06-01'),
(3, 3, 1, '2024-06-05 14:00:00', 'concluído', 'Preferiu corte navalhado', 50.0, '2024-06-01'),
(4, 1, 2, '2024-06-06 09:00:00', 'agendado', 'Chegará 10 minutos antes', 30.0, '2024-06-01'),
(5, 4, 1, '2024-06-06 10:30:00', 'cancelado', 'Cancelou no mesmo dia', null, '2024-06-01'),
(6, 5, 1, '2024-06-07 15:00:00', 'agendado', 'Solicitou degradê', 50.0, '2024-06-01'),
(7, 2, 2, '2024-06-07 16:00:00', 'concluído', 'Cliente retornou pela terceira vez', 30.0, '2024-06-01'),
(8, 1, 1, '2024-06-08 11:00:00', 'agendado', 'Corte anterior agradou', 50.0, '2024-06-01'),
(9, 3, 2, '2024-06-08 13:30:00', 'não compareceu', null, null, '2024-06-01'),
(10, 4, 1, '2024-06-09 10:00:00', 'agendado', 'Corte tradicional', 50.0, '2024-06-01'),
(11, 5, 2, '2024-06-10 09:00:00', 'agendado', 'Solicitou barba desenhada', 30.0, '2024-06-01'),
(12, 1, 1, '2024-06-10 10:30:00', 'concluído', null, 50.0, '2024-06-01'),
(13, 2, 1, '2024-06-11 11:00:00', 'agendado', 'Primeiro agendamento', 50.0, '2024-06-01'),
(14, 3, 2, '2024-06-11 12:30:00', 'agendado', null, 30.0, '2024-06-01'),
(15, 4, 1, '2024-06-12 13:00:00', 'agendado', 'Cliente frequente', 50.0, '2024-06-01'),
(16, 5, 1, '2024-06-12 14:30:00', 'agendado', null, 50.0, '2024-06-01'),
(17, 1, 2, '2024-06-13 09:00:00', 'agendado', 'Barba completa', 30.0, '2024-06-01'),
(18, 2, 1, '2024-06-13 10:30:00', 'agendado', 'Quer repetir corte anterior', 50.0, '2024-06-01'),
(19, 3, 2, '2024-06-14 11:00:00', 'concluído', null, 30.0, '2024-06-01'),
(20, 4, 1, '2024-06-14 12:30:00', 'agendado', 'Agendamento feito pela esposa', 50.0, '2024-06-01');
