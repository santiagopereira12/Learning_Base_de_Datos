CREATE TABLE Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    -- Otros datos personales como dirección, teléfono, etc.
    estado ENUM('activo', 'inactivo', 'bloqueado') DEFAULT 'activo'
);

CREATE TABLE Cuentas (
    id_cuenta INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    tipo_cuenta ENUM('ahorros', 'corriente') NOT NULL,
    saldo_actual DECIMAL(15, 2) NOT NULL DEFAULT 0.00,
    fecha_apertura TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

CREATE TABLE Transacciones (
    id_transaccion INT AUTO_INCREMENT PRIMARY KEY,
    id_cuenta INT NOT NULL,
    tipo ENUM('ingreso', 'egreso') NOT NULL,
    monto DECIMAL(15, 2) NOT NULL,
    descripcion VARCHAR(255),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_cuenta) REFERENCES Cuentas(id_cuenta)
);

CREATE TABLE ProductosCredito (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(150) NOT NULL, -- Ej: 'Tarjeta Visa Gold', 'Crédito de Libre Inversión'
    tipo_producto ENUM('tarjeta_credito', 'credito_consumo', 'hipotecario') NOT NULL,
    tasa_interes_anual DECIMAL(5, 2) NOT NULL
);

CREATE TABLE CreditosOtorgados (
    id_credito INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_producto INT NOT NULL,
    cupo_total DECIMAL(15, 2) NOT NULL,
    saldo_pendiente DECIMAL(15, 2) NOT NULL,
    fecha_otorgamiento DATE NOT NULL,
    estado ENUM('activo', 'pagado', 'en_mora', 'cancelado') NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_producto) REFERENCES ProductosCredito(id_producto)
);

CREATE TABLE Cuotas (
    id_cuota INT AUTO_INCREMENT PRIMARY KEY,
    id_credito INT NOT NULL,
    numero_cuota INT NOT NULL,
    monto_cuota DECIMAL(15, 2) NOT NULL,
    fecha_vencimiento DATE NOT NULL,
    fecha_pago DATE, -- NULL si aún no se ha pagado
    estado_cuota ENUM('pendiente', 'pagada', 'atrasada') NOT NULL,
    FOREIGN KEY (id_credito) REFERENCES CreditosOtorgados(id_credito)
);

CREATE TABLE OfertasPreaprobadas (
    id_oferta INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_producto_ofrecido INT NOT NULL,
    tipo_oferta ENUM('nuevo_credito', 'aumento_cupo', 'nueva_tarjeta') NOT NULL,
    cupo_ofrecido DECIMAL(15, 2),
    descripcion VARCHAR(255),
    fecha_expiracion DATE NOT NULL,
    estado_oferta ENUM('disponible', 'aceptada', 'rechazada', 'expirada') NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_producto_ofrecido) REFERENCES ProductosCredito(id_producto)
);

CREATE TABLE Beneficios (
    id_beneficio INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT, -- Puede estar asociado a un producto específico (NULL si es general)
    nombre_beneficio VARCHAR(200) NOT NULL, -- Ej: 'Puntos x2 en viajes', 'Cashback 5% en restaurantes'
    descripcion TEXT,
    FOREIGN KEY (id_producto) REFERENCES ProductosCredito(id_producto)
);