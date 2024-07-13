
/*

[Productos] <------ [Ventas_Detalle] ------> [Ventas] <------ [Clientes]
  ID                     ID                     ID                ID
  Nombre                 VentaID                ClienteID         Nombre
  Descripción            ProductoID             Fecha             Apellidos
  Precio                 Cantidad                                 Email
  SKU                                                          Teléfono
                                                                 Calle
                                                                 Código Postal
                                                                 Barrio/Colonia
                                                                 Ciudad

*/


/* Creación de las Tablas en PostgreSQL */


CREATE TABLE Productos (
    ID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Descripción TEXT,
    Precio DECIMAL(10, 2) NOT NULL,
    SKU VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE Clientes (
    ID SERIAL PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Apellidos VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Teléfono VARCHAR(50),
    Calle VARCHAR(255),
    Código_Postal VARCHAR(20),
    Barrio_Colonia VARCHAR(255),
    Ciudad VARCHAR(255)
);

CREATE TABLE Ventas (
    ID SERIAL PRIMARY KEY,
    ClienteID INT REFERENCES Clientes(ID),
    Fecha DATE NOT NULL
);

CREATE TABLE Ventas_Detalle (
    ID SERIAL PRIMARY KEY,
    VentaID INT REFERENCES Ventas(ID),
    ProductoID INT REFERENCES Productos(ID),
    Cantidad INT NOT NULL
);


/*  Población de la Base de Datos */

-- Insertar productos
INSERT INTO Productos (Nombre, Descripción, Precio, SKU) VALUES
('Producto1', 'Descripción del producto 1', 10.50, 'SKU001'),
('Producto2', 'Descripción del producto 2', 20.00, 'SKU002'),
('Producto3', 'Descripción del producto 3', 15.00, 'SKU003');

-- Insertar clientes
INSERT INTO Clientes (Nombre, Apellidos, Email, Teléfono, Calle, Código_Postal, Barrio_Colonia, Ciudad) VALUES
('Juan', 'Pérez', 'juan.perez@example.com', '1234567890', 'Calle 1', '12345', 'Barrio 1', 'Monterrey'),
('María', 'López', 'maria.lopez@example.com', '0987654321', 'Calle 2', '67890', 'Colonia 2', 'Cancún'),
('Carlos', 'Gómez', 'carlos.gomez@example.com', '1122334455', 'Calle 3', '54321', 'Barrio 3', 'Guadalajara');

-- Insertar ventas y detalles de ventas
INSERT INTO Ventas (ClienteID, Fecha) VALUES
(1, '2024-07-13'),
(2, '2024-07-14');

INSERT INTO Ventas_Detalle (VentaID, ProductoID, Cantidad) VALUES
(1, 1, 5),
(1, 2, 10),
(2, 1, 15),
(2, 3, 20);

/* Insertando nuevas ventas */
INSERT INTO Ventas (ClienteID, Fecha) VALUES
(1, '2024-07-15'),
(2, '2024-07-16'),
(6, '2024-07-17'),
(5, '2024-07-18'),
(4, '2024-07-19');


