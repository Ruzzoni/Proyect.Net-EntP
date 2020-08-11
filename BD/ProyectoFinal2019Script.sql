
USE Master
go

if exists(Select * FROM SysDataBases WHERE name='ProyectoFinal2019Script')
BEGIN
	DROP DATABASE ProyectoFinal2019Script
END
Go

CREATE DATABASE ProyectoFinal2019Script --(C:\ProyectoFinal2019Script)
Go

USE ProyectoFinal2019Script
Go

CREATE TABLE EntidadPublica
(
	NombreEnt VARCHAR(50) NOT NULL PRIMARY KEY,
	Direccion VARCHAR(50) NOT NULL
)
Go

CREATE TABLE Telefono
(
	Nombre VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES EntidadPublica(NombreEnt),
	Numero INT NOT NULL,
	PRIMARY KEY (Nombre, Numero)
)
Go

CREATE TABLE Empleado
(
	CI INT NOT NULL PRIMARY KEY,
	Contraseña VARCHAR(30) NOT NULL UNIQUE,
	NombreEmp VARCHAR(20) NOT NULL
)
Go

CREATE TABLE TipoTramite
(
	CodigoT VARCHAR(6) not null,
	EntidadPublicaT VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES EntidadPublica(NombreEnt),
	NombreT VARCHAR(20) NOT NULL,
	Descripcion VARCHAR(50),
	PRIMARY KEY (CodigoT, EntidadPublicaT)
)
Go

CREATE TABLE Solicitud
(
	NumeroSoli INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	CodigoDeT VARCHAR(6) NOT NULL ,
	NombreEntP VARCHAR(50) NOT NULL,
	CiEmp INT NOT NULL FOREIGN KEY REFERENCES Empleado(CI),
	NombreDelSolicitante Varchar(30) NOT NULL,
	Fecha DATE NOT NULL,
	Hora TIME NOT NULL,
	Estado VARCHAR(20) not null,
	FOREIGN KEY (CodigoDeT, NombreEntP) REFERENCES TipoTramite(CodigoT, EntidadPublicaT)
)
Go

INSERT INTO EntidadPublica (NombreEnt, Direccion) VALUES('BancoURU', '18 de julio 6581')
INSERT INTO EntidadPublica (NombreEnt, Direccion) VALUES('CorreoURU', 'Av.Magallanes 2548')
INSERT INTO EntidadPublica (NombreEnt, Direccion) VALUES('FerroViaURU', 'Av.Garzon 8481')
INSERT INTO EntidadPublica (NombreEnt, Direccion) VALUES('PuertoURU', 'Quijote 6582')
INSERT INTO EntidadPublica (NombreEnt, Direccion) VALUES('TeleURU', 'Av.Agraciada 5648')
INSERT INTO EntidadPublica (NombreEnt, Direccion) VALUES('GasURU', '8 de Octubre 6616')
INSERT INTO EntidadPublica (NombreEnt, Direccion) VALUES('ViviendaURU', 'Av.Ialia 9512')
Go

INSERT INTO Telefono (Nombre, Numero) VALUES('BancoURU', 08005562)
INSERT INTO Telefono (Nombre, Numero) VALUES('BancoURU', 08005682)
INSERT INTO Telefono (Nombre, Numero) VALUES('CorreoURU', 08005555)
INSERT INTO Telefono (Nombre, Numero) VALUES('CorreoURU', 08001111)
INSERT INTO Telefono (Nombre, Numero) VALUES('PuertoURU', 08003333)
INSERT INTO Telefono (Nombre, Numero) VALUES('TeleURU', 08001414)
INSERT INTO Telefono (Nombre, Numero) VALUES('PuertoURU', 08001515)
INSERT INTO Telefono (Nombre, Numero) VALUES('TeleURU', 08009988)
INSERT INTO Telefono (Nombre, Numero) VALUES('GasURU', 08007878)
INSERT INTO Telefono (Nombre, Numero) VALUES('ViviendaURU', 08005566)
INSERT INTO Telefono (Nombre, Numero) VALUES('ViviendaURU', 08005665)
Go

INSERT INTO TipoTramite (CodigoT, EntidadPublicaT, NombreT, Descripcion) VALUES ('codi07', 'BancoURU', 'Deposito', 'Se puede depositar dinero.')
INSERT INTO TipoTramite (CodigoT, EntidadPublicaT, NombreT, Descripcion) VALUES ('codi06', 'CorreoURU', 'Recivir', 'Servicio de Mensajeria.')
INSERT INTO TipoTramite (CodigoT, EntidadPublicaT, NombreT, Descripcion) VALUES ('codi05', 'FerroViaURU', 'Pasaje', 'Pasaje solo de ida.')
INSERT INTO TipoTramite (CodigoT, EntidadPublicaT, NombreT, Descripcion) VALUES ('codi04', 'PuertoURU', 'Encargo', 'Recivimiento de mercaderia.')
INSERT INTO TipoTramite (CodigoT, EntidadPublicaT, NombreT, Descripcion) VALUES ('codi03', 'TeleURU', 'Facturacion', 'Linea de telefono y internet.')
INSERT INTO TipoTramite (CodigoT, EntidadPublicaT, NombreT, Descripcion) VALUES ('codi02', 'GasURU', 'Mensualidad', 'Servicio de Gas por cañeria.')
INSERT INTO TipoTramite (CodigoT, EntidadPublicaT, NombreT, Descripcion) VALUES ('codi01', 'ViviendaURU', 'Impuestos', 'Impuestos generales por persona.')
INSERT INTO TipoTramite (CodigoT, EntidadPublicaT, NombreT, Descripcion) VALUES ('codi08', 'FerroViaURU', 'Pasaje', 'Pasaje ida y vuelta.')
Go

INSERT INTO Empleado (CI, Contraseña, NombreEmp) VALUES (1111111, 'Emp1', 'Marcos')
INSERT INTO Empleado (CI, Contraseña, NombreEmp) VALUES (6546541, 'Emp2', 'Antonio')
INSERT INTO Empleado (CI, Contraseña, NombreEmp) VALUES (3213211, 'Emp3', 'Pelu')
INSERT INTO Empleado (CI, Contraseña, NombreEmp) VALUES (1231231, 'Emp4', 'Juan')
INSERT INTO Empleado (CI, Contraseña, NombreEmp) VALUES (6456544, 'Emp5', 'Shrek')
INSERT INTO Empleado (CI, Contraseña, NombreEmp) VALUES (6565454, 'Emp6', 'Sofia')
INSERT INTO Empleado (CI, Contraseña, NombreEmp) VALUES (7777777, 'Emp7', 'Tatiana')
INSERT INTO Empleado (CI, Contraseña, NombreEmp) VALUES (7897899, 'Emp8', 'Ronald')
INSERT INTO Empleado (CI, Contraseña, NombreEmp) VALUES (7894561, 'Emp9', 'Donlad')
INSERT INTO Empleado (CI, Contraseña, NombreEmp) VALUES (3265981, 'Emp10', 'John')
INSERT INTO Empleado (CI, Contraseña, NombreEmp) VALUES (1245783, 'Emp11', 'Drake')
INSERT INTO Empleado (CI, Contraseña, NombreEmp) VALUES (2581245, 'Emp12', 'Poul')
Go

INSERT INTO Solicitud (CodigoDeT, NombreEntP, CiEmp, NombreDelSolicitante, Fecha, Hora, Estado) VALUES ('codi03', 'TeleURU', 3213211, 'Antonio', '20180315', '18:14', 'Alta')
INSERT INTO Solicitud (CodigoDeT, NombreEntP, CiEmp, NombreDelSolicitante, Fecha, Hora, Estado) VALUES ('codi01', 'ViviendaURU', 1231231, 'Raul', '20191225', '20:30', 'Ejecutada')
INSERT INTO Solicitud (CodigoDeT, NombreEntP, CiEmp, NombreDelSolicitante, Fecha, Hora, Estado) VALUES ('codi05', 'FerroViaURU', 1111111, 'Martin', '20161002', '7:03', 'Alta')
INSERT INTO Solicitud (CodigoDeT, NombreEntP, CiEmp, NombreDelSolicitante, Fecha, Hora, Estado) VALUES ('codi07', 'BancoURU', 6456544, 'Monica', '20190213', '8:54', 'Anulada')
INSERT INTO Solicitud (CodigoDeT, NombreEntP, CiEmp, NombreDelSolicitante, Fecha, Hora, Estado) VALUES ('codi03', 'TeleURU', 1245783, 'Carlos', '20180517', '17:00', 'Alta')
INSERT INTO Solicitud (CodigoDeT, NombreEntP, CiEmp, NombreDelSolicitante, Fecha, Hora, Estado) VALUES ('codi05', 'FerroViaURU', 7777777, 'Yanina', '20200103', '11:30', 'Alta')
INSERT INTO Solicitud (CodigoDeT, NombreEntP, CiEmp, NombreDelSolicitante, Fecha, Hora, Estado) VALUES ('codi05', 'FerroViaURU', 7777777, 'Yanina', '20200103', '15:20', 'Alta')
INSERT INTO Solicitud (CodigoDeT, NombreEntP, CiEmp, NombreDelSolicitante, Fecha, Hora, Estado) VALUES ('codi05', 'FerroViaURU', 7777777, 'Yohn', '20200103', '17:50', 'Alta')
INSERT INTO Solicitud (CodigoDeT, NombreEntP, CiEmp, NombreDelSolicitante, Fecha, Hora, Estado) VALUES ('codi05', 'FerroViaURU', 7777777, 'Carlos', '20200104', '10:10', 'Alta')
INSERT INTO Solicitud (CodigoDeT, NombreEntP, CiEmp, NombreDelSolicitante, Fecha, Hora, Estado) VALUES ('codi02', 'GasURU', 7777777, 'Valentina', '20200103', '18:55', 'Ejecutada')
INSERT INTO Solicitud (CodigoDeT, NombreEntP, CiEmp, NombreDelSolicitante, Fecha, Hora, Estado) VALUES ('codi02', 'GasURU', 7777777, 'Sol', '20200103', '09:15', 'Ejecutada')
INSERT INTO Solicitud (CodigoDeT, NombreEntP, CiEmp, NombreDelSolicitante, Fecha, Hora, Estado) VALUES ('codi02', 'GasURU', 7777777, 'Mauricio', '20200103', '05:35', 'Anulada')
INSERT INTO Solicitud (CodigoDeT, NombreEntP, CiEmp, NombreDelSolicitante, Fecha, Hora, Estado) VALUES ('codi02', 'GasURU', 7777777, 'Marcelo', '20200103', '03:52', 'Anulada')
INSERT INTO Solicitud (CodigoDeT, NombreEntP, CiEmp, NombreDelSolicitante, Fecha, Hora, Estado) VALUES ('codi03', 'TeleURU', 3213211, 'Catalina', '20160116', '8:23', 'Anulada')
INSERT INTO Solicitud (CodigoDeT, NombreEntP, CiEmp, NombreDelSolicitante, Fecha, Hora, Estado) VALUES ('codi07', 'BancoURU', 2581245, 'Roberto', '20190622', '9:34', 'Anulada')
Go
---------------------------------------------------------------------------------------------------------------------
Create Procedure AltaEntidades @NombreEnt VARCHAR(20), @Direccion VARCHAR(50) as
BEGIN
	if (EXISTS (SELECT * FROM EntidadPublica WHERE NombreEnt=@NombreEnt))
		RETURN -1
		
	DECLARE @Error int
	BEGIN TRAN

	INSERT EntidadPublica(NombreEnt, Direccion) VALUES(@NombreEnt, @Direccion) 
	SET @Error=@@ERROR;
	
	IF(@Error=0)
	BEGIN
		COMMIT TRAN
		RETURN 1
	END
	ELSE
	BEGIN
		ROLLBACK TRAN
		RETURN -2
	END	
END
Go

Create Procedure BuscarEntidadPublica @NombreEnt Varchar(20) as
Begin
	Select* From EntidadPublica Where NombreEnt=@NombreEnt
End
Go

Create Procedure AltaTelefonos @Nombre Varchar(30), @Numero INT as
Begin
	if not(exists(Select* From EntidadPublica Where NombreEnt=@Nombre))
		Return -1 --nopuedo dar de alta un tel de una ent inexistente
	if exists(Select* From Telefono Where Nombre=@Nombre and Numero=@Numero)
		Return -2 --No se puede agregar el mismo numero repetido a la misma ent
	Declare @Error int
	
	Begin tran
	Insert Telefono(Nombre, Numero) Values(@Nombre, @Numero)
	Set @error=@@ERROR;
	
	If (@error=0)
	Begin
		Commit tran
		Return 1 --Completed successful
	End
	Else
	Begin
		Rollback Tran
		Return -3 --Error
	End
End
Go

CREATE PROCEDURE ListarTelefono @Nombre Varchar(30) AS
BEGIN
	SELECT Numero FROM Telefono WHERE Nombre = @Nombre
END 
GO

CREATE PROCEDURE BajaTelefono @Nombre VARCHAR(30), @Numero INT AS
BEGIN
	IF not(EXISTS(SELECT * FROM Telefono WHERE Nombre = @Nombre AND Numero = @Numero))
	RETURN -1

	DECLARE @Error int
	BEGIN TRAN

	DELETE Telefono	WHERE Nombre = @Nombre AND Numero = @Numero
	SET @Error=@@ERROR;

	IF(@Error=0)
	BEGIN
		COMMIT TRAN
		RETURN 1
	END
	ELSE
	BEGIN
		ROLLBACK TRAN
		RETURN -2
	END	
END 
GO

Create Procedure AltaTipoTramite @CodigoT varchar(6), @NombreT Varchar(20), @Descripcion Varchar(50), @NombreEnt Varchar(20) as
Begin
	if NOT(EXISTS (SELECT * FROM EntidadPublica WHERE NombreEnt=@NombreEnt))
		RETURN -1 --Si no existe la entidadpublica no se puede hacer
	if (Exists(SELECT * FROM TipoTramite WHERE CodigoT=@CodigoT))	
		RETURN -2 --Si ya existe este tramite no se puede hacer
		
	DECLARE @Error int;
	BEGIN TRAN

	INSERT TipoTramite (CodigoT, EntidadPublicaT, NombreT, Descripcion) 
	VALUES(@CodigoT, @NombreEnt, @NombreT, @Descripcion) 
	SET @Error=@@ERROR;
	
	IF(@Error=0)
	BEGIN
		COMMIT TRAN
		RETURN 1 --Completed successful
	END
	ELSE
	BEGIN
		ROLLBACK TRAN
		RETURN -3 --Error
	END		
End
Go

Create Procedure AltaEmpleado @CI int, @Contraseña Varchar(20), @NombreEmp Varchar(20) as
Begin
	If (Exists(Select* From Empleado Where CI=@CI))
		Return -1 --No se puede agregar uno existente
		
	Declare @error int;
	Begin Tran
	Insert Empleado (CI, Contraseña, NombreEmp) Values(@CI, @Contraseña, @NombreEmp)
	Set @error=@@ERROR;
	
	If (@error=0)
	Begin
		Commit tran
		Return 1 --Completed successful
	End
	Else
	Begin
		Rollback Tran
		Return -2 --Error
	End
End
Go

Create Procedure RegistroSolicitud @CodigoDeT varchar(6), @CiEmp int, @Fecha Date, @Hora Time,
 @NombreEnt Varchar(50), @NombreSolicitante varchar(50) as
Begin
	If not(exists (select* From EntidadPublica Where NombreEnt=@NombreEnt))
		Return -1
	if Exists(select * from TipoTramite where LEN(@CodigoDeT) >= 7 and CodigoT=@CodigoDeT)
		Return -2 --no puede ser mayor a 6 letras y no repetirse
		
	Declare @Error int
	
	begin tran
	Insert Solicitud (CodigoDeT, NombreEntP, CiEmp, NombreDelSolicitante, Fecha, Hora, Estado)
	Values(@CodigoDeT, @NombreEnt, @CiEmp, @NombreSolicitante, @Fecha, @Hora, 'Alta');
	Set @Error=@@ERROR
	
	If (@error=0)
	Begin
		Commit tran
		Return 1
	End
	Else
	Begin
		Rollback Tran
		Return -3
	End
	
End
Go

Create Procedure CambioEstadoSolicitud @Estado Varchar(20), @CodigoDeT Varchar(6) as
Begin
	if not(exists (select* from TipoTramite t inner join Solicitud s on t.CodigoT=s.CodigoDeT where CodigoDeT=@CodigoDeT))
		return -1 --si no existe la solicitud asosiada no se puede modificar
	Declare @error int
	begin tran	
	UPDATE Solicitud
	SET Estado = @Estado
	WHERE CodigoDeT =@CodigoDeT
	SET @error=@@ERROR;	
	If (@error=0)
	Begin
		Commit tran
		Return 1
	End
	Else
	Begin
		Rollback Tran
		Return -2
	End
End
Go

Create Procedure ModificarEntidad @NombreEnt VARCHAR(20), @Direccion VARCHAR(50) as
BEGIN
	if not(exists(Select* From EntidadPublica Where @NombreEnt=NombreEnt))
		Return -1 --no se puede modificar entpublica inexistente
		
	Declare @Error int 
	BEGIN TRAN

	UPDATE EntidadPublica 
	SET NombreEnt = @NombreEnt, Direccion = @Direccion
	WHERE NombreEnt = @NombreEnt
	SET @Error=@@ERROR;
	
	IF(@Error=0)
	BEGIN
		COMMIT TRAN
		RETURN 1
	END
	ELSE
	BEGIN
		ROLLBACK TRAN
		RETURN -2
	END	
END
Go

Create Procedure MoificarTipoTramite @CodigoT Varchar(6), @EntidadPublicaT Varchar(20), @NombreT Varchar(20), @Descripcion Varchar(50) as
Begin
	if not(exists(Select* From EntidadPublica e inner join TipoTramite t on e.NombreEnt=t.EntidadPublicaT Where NombreEnt=@EntidadPublicaT))
		return -1 --no se modifica un traminte de una entpublica inexistente
	if not(exists(Select* From TipoTramite Where CodigoT=@CodigoT))
		return -2 --no se modifica un tipotramite inexistente
	
	Declare @Error int
	Begin Tran
	Update TipoTramite
	Set CodigoT=@CodigoT, EntidadPublicaT=@EntidadPublicaT, NombreT=@NombreT, Descripcion=@Descripcion
	Where CodigoT=@CodigoT
	Set @Error=@@ERROR;
	
	IF(@Error=0)
	BEGIN
		COMMIT TRAN
		RETURN 1
	END
	ELSE
	BEGIN
		ROLLBACK TRAN
		RETURN -3
	END	
End
Go

Create Procedure ModificoEmpleado @CI int, @Contraseña Varchar(20), @NombreEmp Varchar(20) as
Begin
	if not(Exists(Select* From Empleado Where CI=@CI))
		Return -1 --No se puede modificar un emp inexistente
	
	Declare @error int
	Update Empleado
	Set CI=@CI, Contraseña=@Contraseña, NombreEmp=@NombreEmp
	Where CI=@CI
	Set @error=@@ERROR;
	
	If (@error=0)
	Begin
		Return 1 --Completed successful
	End
	Else
	Begin
		Return -2 --Error
	End	
End
Go

Create Procedure EliminoEntidad @NombreEnt VARCHAR(30) as
Begin
	if not(exists(Select* From EntidadPublica Where NombreEnt=@NombreEnt))
		Return -1 --No se elimina entidadpublica inexistente
	if exists(Select* From EntidadPublica e inner join TipoTramite t on e.NombreEnt = t.EntidadPublicaT 
	inner join Solicitud s on t.CodigoT = s.CodigoDeT Where NombreEnt=@NombreEnt)
		Return -2 --No se puede eliminar la entidad con SOLISITUD ASOSIADA
		
	DECLARE @error int
	BEGIN TRAN	
	
	DELETE TipoTramite
	WHERE  EntidadPublicaT = @NombreEnt
	SET @error=@@ERROR+@error;
	
	DELETE Telefono
	WHERE Nombre = @NombreEnt
	SET @error=@@ERROR;

	DELETE EntidadPublica
	WHERE NombreEnt = @NombreEnt
	SET @error=@@ERROR+@error+@error;

	IF(@error=0)
	BEGIN
		COMMIT TRAN
		RETURN 1
	END
	ELSE
	BEGIN
		ROLLBACK TRAN
		RETURN -3
	END	
End
Go

Create Procedure EliminoTipoTramite @CodigoT Varchar(6) as
Begin
	if not(exists(Select* From TipoTramite Where CodigoT=@CodigoT))
		Return -1 -- No existe el traminte
	if not(exists(Select* From EntidadPublica e inner join TipoTramite t on e.NombreEnt = t.EntidadPublicaT Where CodigoT=@CodigoT))
		Return -2 --si no existe el tipo de tramite asosiado a la entidad no se puede elimiar
	
	
	Declare @error int
	BEGIN TRAN
	
	DELETE Solicitud
	WHERE CodigoDeT = @CodigoT 
	SET @error=@@ERROR;
	
	DELETE TipoTramite
	WHERE CodigoT = @CodigoT
	SET @error=@@ERROR+@error;

	IF(@error=0)
	BEGIN
		COMMIT TRAN
		RETURN 1
	END
	ELSE
	BEGIN
		ROLLBACK TRAN
		RETURN -3
	END	
End
Go

Create Procedure EliminoEmpleado @CI int as
Begin
	If not(exists(Select* From Empleado Where CI=@Ci))
		Return -1
	If exists(Select* From Empleado e inner join Solicitud s on e.CI=s.CiEmp Where CI=@CI)
		Return -2 --no se puede eliminar emp con solisitud pendiente
	
	Declare @error int
	Begin Tran
	DELETE Empleado
	WHERE CI = @Ci 
	SET @error=@@ERROR;
	
	IF(@error=0)
	BEGIN
		COMMIT TRAN
		RETURN 1
	END
	ELSE
	BEGIN
		ROLLBACK TRAN
		RETURN -3
	END	
End
Go

Create Procedure BuscoTipoDeTramite @CodigoT varchar (6), @NombreEnt Varchar(20) as
Begin
	Select* From TipoTramite t inner join EntidadPublica e on t.EntidadPublicaT=e.NombreEnt Where CodigoT=@CodigoT and NombreEnt=@NombreEnt
End
Go

Create Procedure BuscarEmpleado @CI int as
Begin
	SELECT * FROM Empleado WHERE CI=@CI
End
Go

Create Procedure BuscoEntidad @NombreEnt Varchar(50) as
Begin
	Select* From EntidadPublica Where NombreEnt=@NombreEnt
End
Go

Create Procedure ListadoSolicitudesTodas as
Begin
	select* from Solicitud order by Fecha, Hora asc
End
Go

Create Procedure ListadoSolicitudesDeXTramiteTodas @codigo varchar(6), @entidadP varchar(20) as
Begin
	Select * From Solicitud Where CodigoDeT=@codigo and NombreEntP=@entidadP
	order by Fecha, Hora asc
End
Go

Create Procedure ListadoSolicitudesEjecutadas @codigo varchar(6), @entidadP varchar(20) as
Begin
	Select * From Solicitud Where Estado = 'Ejecutada' and CodigoDeT=@codigo and NombreEntP=@entidadP
	order by Fecha, Hora asc
End
Go

Create Procedure ListadoSolicitudesAnuladas @codigo varchar(6), @entidadP varchar(20) as
Begin
	Select * From Solicitud Where Estado = 'Anulada' and CodigoDeT=@codigo and NombreEntP=@entidadP
	order by Fecha, Hora asc
End
Go

Create Procedure ListadoSolicitudesAlta as
Begin
	Select * From Solicitud Where Estado = 'Alta'
	order by Fecha, Hora asc
End
Go

Create Procedure ListadoSolicitudesXFecha @fecha date as
Begin
	Select * From Solicitud Where Estado = 'Alta' and Fecha=@fecha
		order by Fecha, Hora asc
End
Go

Create Procedure SolicitudCambioEjec @NumeroSol int as
Begin
	if exists(select* from Solicitud where NumeroSoli=@NumeroSol and Estado = 'Alta')
	begin
		update Solicitud
		set Estado = 'Ejecutada'
		where NumeroSoli=@NumeroSol
	end
	else
	begin
		return -2
	end
End
Go

Create Procedure SolicitudCambioAnu @NumeroSol int as
begin
	if exists(select* from Solicitud where NumeroSoli=@NumeroSol and (Estado = 'Ejecutada' or Estado = 'Alta'))
	begin
		update Solicitud
		set Estado = 'Anulada'
		where NumeroSoli=@NumeroSol
	end
	else
	begin
		return -2
	end
end
go

Create procedure ListarTipoDeTramites @nombreent varchar(50) as
Begin
	Select* from TipoTramite 
	where EntidadPublicaT=@nombreent
	order by NombreT asc 
End
Go

Create procedure ListarElTramite @codigo varchar(6), @nombreEnt varchar(30) as
Begin
	Select* from TipoTramite t inner join EntidadPublica e on t.EntidadPublicaT=e.NombreEnt
	where CodigoT=@codigo and EntidadPublicaT=@nombreEnt
End
Go

Create procedure ListarTodosTipoDeTramites as
begin
	select* from TipoTramite order by NombreT
end
go

Create Procedure ListarTodasEntidades as
begin
	select* from EntidadPublica 
end
Go

Create Procedure BuscarSoli @NumeroSoli int as
begin
		select* from Solicitud where NumeroSoli=@NumeroSoli
end
Go

Create Procedure BuscarSoliXTipoTramite @codigo varchar(6), @entidadP varchar(30) as
begin
		select* from Solicitud where CodigoDeT=@codigo and NombreEntP=@entidadP
end
Go

CREATE PROCEDURE LogueoEmpleado @Ci int, @Password VARCHAR(30) AS
BEGIN
	SELECT * FROM Empleado  WHERE CI = @Ci AND Contraseña = @Password 
END 
GO