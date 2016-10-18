select * from USUARIO

insert into USUARIO(Usuario, Nombre, P_Apellido, S_Apellido, Cedula, Contrasena, Codigo, Telefono)
values 
('juanp1995', 'Juan Pablo', 'Brenes', 'Coto', 304900726, 'gremory1995', 'C4532', '71545453'),
('user0', 'General1', 'AP1', 'AP2', 123456789, '1234567', NULL, '34565667'),
('user1', 'Ingeniero1', 'Apellido1', 'Apellido1', 305860923, '123456', 'A3356', '34354532'),
('user2', 'Ingeniero2', 'Apellido2', 'Apellido2', 124466577, '124567', 'B3478', '33775645'),
('user3', 'Admin1', 'Apellido3', 'Apellido3', 1083533263, '123456', NULL, '66585756'),
('user4', 'Admin2', 'Apellido4', 'Apellido4', 4364645653, '123456', NULL, '897864552')



insert into ROL(Tipo)
values ('Usuario General'), ('Ingeniero'), ('Administrador')


insert into ROL(Tipo)
values (1), (2), (3)

select * from ROL_USUARIO
select * from USUARIO
select * from PROYECTO
select * from PROYECTO_USUARIO

delete from PROYECTO_USUARIO
where Id_Proyecto=2

delete from PROYECTO

delete from ROL_USUARIO
where Usuario='test' and Id_Rol=3

delete from USUARIO
where Usuario='test'



alter sequence proyecto_id_seq restart


insert into ROL_USUARIO(Usuario, Id_Rol)
values 
('juanp1995' , 1), ('user0', 1), ('user1', 2),
('user2', 2), ('user3', 3), ('user4', 3), 
('juanp1995',2), ('juanp1995', 3)


alter sequence rol_usuario_id_seq restart

drop table ROL_USUARIO
drop table ROL
