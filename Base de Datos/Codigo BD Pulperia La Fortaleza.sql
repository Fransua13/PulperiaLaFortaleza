CREATE TABLE Persona (
	dni CHAR(15) PRIMARY KEY,
	nombre_pers VARCHAR(25) NOT NULL,
	fecha_nacimiento DATE NOT NULL,
	edad_pers CHAR(3) NOT NULL,
	sexo_pers BOOLEAN NOT NULL,
	telefono_pers CHAR(9) NOT NULL
);

CREATE TABLE Horario (
    idHorario SMALLINT PRIMARY KEY,
    nombre_Horario VARCHAR(10) NOT NULL
);

CREATE TABLE Cargo (
    idCargo SMALLINT PRIMARY KEY,
    nombre_Cargo VARCHAR(25) NOT NULL
);

CREATE TABLE Empleado (	
	dni_empleado CHAR(15) PRIMARY KEY,
	estado BOOLEAN NOT NULL,
	salario FLOAT NOT NULL,
	direccion_emple VARCHAR(50) NOT NULL,
	idCargo SMALLINT,
	idHorario SMALLINT,
	FOREIGN KEY (idCargo) REFERENCES Cargo (idCargo),
	FOREIGN KEY (dni_empleado) REFERENCES Persona(dni),
	FOREIGN KEY (idHorario) REFERENCES Horario(idHorario)
);

CREATE TABLE Cliente (	
	dni_cliente CHAR(15) PRIMARY KEY,
	RTN CHAR(16) NOT NULL,
	FOREIGN KEY (dni_cliente) REFERENCES Persona(dni)	
);

CREATE TABLE Producto (
	idproductos SERIAL PRIMARY KEY, 
	nom_prod VARCHAR(25) NOT NULL,
	descripcion_prod VARCHAR(50) NOT NULL,
	precio_prod FLOAT,
	fecha_venc DATE NOT NULL,
	categoria VARCHAR(25) NOT NULL,
	subcategoria VARCHAR(25) NOT NULL
);

CREATE TABLE Proveedor (
	rtn CHAR(14) PRIMARY KEY,
	nomb_prove VARCHAR(30) NOT NULL,
	direccion_prove VARCHAR(50) NOT NULL,
	telefono_prove CHAR(9) NOT NULL
);

CREATE TABLE Pedido (
	idpedido SERIAL PRIMARY KEY,
	rtn CHAR(14) NOT NULL,
	dni_empleado CHAR(15) NOT NULL,
	fecha_entrega TIMESTAMP NOT NULL,
	fecha_solicitud TIMESTAMP NOT NULL,
	total_pedido FLOAT NOT NULL,
	FOREIGN KEY (dni_empleado) REFERENCES Empleado(dni_empleado),
	FOREIGN KEY (rtn) REFERENCES Proveedor(rtn)
);

CREATE TABLE producto_pedido (
	cantida_pedido SMALLINT DEFAULT 0,
	precio_pedido FLOAT NOT NULL,
	subtotal_pedido FLOAT NOT NULL,
	isv FLOAT NOT NULL,
	idproductos INT,
	idpedido INT,
	PRIMARY KEY (idproductos, idpedido),
	FOREIGN KEY (idproductos) REFERENCES Producto(idproductos),
	FOREIGN KEY (idpedido) REFERENCES Pedido(idpedido)
);

CREATE TABLE Ventas (
	idventas SERIAL PRIMARY KEY,
	fecha_venta DATE,
	total_venta FLOAT,
	dni_cliente CHAR(15),
	dni_empleado CHAR(15),
	FOREIGN KEY (dni_cliente) REFERENCES Cliente(dni_cliente),
	FOREIGN KEY (dni_empleado) REFERENCES Empleado(dni_empleado)
);

CREATE TABLE Pago (
	idpago SERIAL PRIMARY KEY,
	fecha_pago DATE,
	cantidad_pago FLOAT
);

CREATE TABLE Credito (
	ncuotas SMALLINT,
	pendiente FLOAT,
	pagado FLOAT,
	idpago INT,
	idventas INT PRIMARY KEY,
	FOREIGN KEY (idventas) REFERENCES Ventas(idventas),
	FOREIGN KEY (idpago) REFERENCES Pago(idpago)
);

CREATE TABLE ventas_producto (
	cantidad_vent SMALLINT DEFAULT 0,
	precio_vent FLOAT,
	subtotal_vent FLOAT,
	idventas INT,
	idproductos INT,
	PRIMARY KEY (idventas, idproductos),
	FOREIGN KEY (idventas) REFERENCES Ventas(idventas),
	FOREIGN KEY (idproductos) REFERENCES Producto(idproductos)
);

CREATE TABLE Devolucion (
	iddevolucion SERIAL PRIMARY KEY,
	cantidad_prod SMALLINT DEFAULT 0,
	fecha_devol DATE NOT NULL,
	motivo VARCHAR(50),
	idproductos INT,
	idventas INT,
	FOREIGN KEY (idproductos) REFERENCES Producto(idproductos),
	FOREIGN KEY (idventas) REFERENCES Ventas(idventas)
);

CREATE TABLE Envios (
	idenvios SERIAL PRIMARY KEY,
	pago_envio FLOAT,
	dni_cliente CHAR(15),
	idventas INT,
	FOREIGN KEY (dni_cliente) REFERENCES Cliente(dni_cliente),
	FOREIGN KEY (idventas) REFERENCES Ventas(idventas)
);

