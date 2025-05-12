create table if not exists Plantas(id bigint primary key auto_increment not null,
									nome varchar(45) not null,
                                    especie varchar(45) not null,
                                    nome_cientifico varchar(45) not null,
                                    idade int not null,
                                    quantidade int not null,
                                    tamanho float not null,
                                    observacoes varchar(100) not null);
                                    
create table if not exists Canteiros(id bigint primary key auto_increment not null,
									 locais_disponiveis varchar(45) not null,
                                     metros_quadrados float not null,
                                     uso_de_adubo varchar(45) not null,
                                     tipo_solo varchar(45) not null,
                                     data_plantio datetime not null,
                                     data_irrigacao datetime not null,
                                     data_adubamento datetime not null);
                                     
create table if not exists Colheita(id bigint primary key auto_increment not null,
									data_colheita datetime not null,
                                    qualidade_colheita enum('proprio','improprio') not null,
                                    local_colheita varchar(45) not null,
                                    quantidade_colhida int not null,
                                    quantidade_descartada int not null);