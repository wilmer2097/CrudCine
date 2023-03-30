drop database Cine
create database Cine

use Cine

create table Peliculas(
Id_Peli int identity(1,1),
Nombre varchar(15),
Año int,
Duracion int,
Genero varchar(15),
Director varchar(100),
Actores varchar(max)
)

create table Actores(
Id_Actor int identity(1,1),
Nombre varchar(15),
Apellido varchar(15),
Fecha_Nacimiento date,
Nacionalidad varchar(15),
imagen image NOT NULL
)

create table Director(
Id_Dir int identity(1,1),
Nombre varchar(15),
Apellido varchar(15),
Fecha_Nacimiento date,
Nacionalidad varchar(15),
imagen image NOT NULL
)

create procedure sp_VerPelis
as begin
select * from Peliculas
End

create procedure sp_VerActores
as begin
select * from Actores
End

create procedure sp_VerDirector
as begin
select * from Director
End

--CRUD: CREATE, READ, UPDATE, DELETE

create procedure sp_CrearPeli
@Nombre varchar(15),
@Año int,
@Dur int,
@Gen varchar(15),
@Dir varchar(100),
@Act varchar(max)
as begin
insert into Peliculas values(@Nombre, @Año, @Dur, @Gen, @Dir, @Act)
end


create procedure sp_CrearActor
@Nom varchar(15),
@Ape varchar(15),
@Fecha_Nac date,
@Nac varchar(15),
@Foto varchar(15)
as begin
insert into Actores values(@Nom, @Ape, @Fecha_Nac, @Nac, @Foto)
end

create procedure sp_CrearDirector
@Nom varchar(15),
@Ape varchar(15),
@Fecha_Nac date,
@Nac varchar(15),
@Foto varchar(15)
as begin
insert into Director values(@Nom, @Ape, @Fecha_Nac, @Nac, @Foto)
end

create procedure sp_BuscarPeli
@Id_pel int
as begin
select * from Peliculas where Id_Peli=@Id_pel
end

create procedure sp_BuscarActor
@Id_act int
as begin
select * from Actores where Id_Actor=@Id_Act
end

create procedure sp_BuscarDirector
@Id_dir int
as begin
select * from Director where @Id_dir=@Id_dir
end

create procedure sp_actualizarPeli
@Id_pel int,
@Nom varchar(15),
@Año int,
@Dur int,
@Gen varchar(15),
@Dir varchar(100),
@Act varchar(max)
as begin
update Peliculas set Nombre=@Nom, Año=@Año, Duracion=@Dur, Genero=@Gen,Director=@Dir, Actores=@Act
where Id_Peli=@Id_pel
end

create procedure sp_actualizarActor
@Id_act int,
@Nom varchar(15),
@Ape varchar(15),
@Fecha_Nac date,
@Nac varchar(15),
@Foto varchar(15)
as begin
update Actores set Nombre=@Nom, Apellido=@Ape, Fecha_Nacimiento=@Fecha_Nac, Nacionalidad=@Nac,imagen=@Foto
where Id_Actor=@Id_act
end

create procedure sp_actualizarDirector
@Id_Dir int,
@Nom varchar(15),
@Ape varchar(15),
@Fecha_Nac date,
@Nac varchar(15),
@Foto varchar(15)
as begin
update Director set Nombre=@Nom, Apellido=@Ape, Fecha_Nacimiento=@Fecha_Nac, Nacionalidad=@Nac,imagen=@Foto
where Id_Dir=@Id_Dir
end



create procedure sp_deletePeli
@Id_pel int
as begin
delete from Peliculas where Id_Peli=@Id_pel
end




create procedure sp_deleteActor
@Id_act int
as begin
delete from Actores where Id_Actor=@Id_act
end




create procedure sp_deleteDirector
@Id_dir int
as begin
delete from Director where Id_Dir=@Id_dir
end
