-- 1. Insertar Catálogos: Productos de Crédito y Beneficios
-- Primero, definimos los productos financieros que el banco ofrece.
INSERT INTO ProductosCredito (id_producto, nombre_producto, tipo_producto, tasa_interes_anual) VALUES
(1, 'Tarjeta de Crédito Clásica', 'tarjeta_credito', 28.50),
(2, 'Tarjeta de Crédito Oro', 'tarjeta_credito', 24.00),
(3, 'Crédito de Libre Inversión', 'credito_consumo', 18.75),
(4, 'Crédito Vehicular', 'credito_consumo', 15.50),
(5, 'Crédito Hipotecario', 'hipotecario', 12.00);

-- Definimos los beneficios que se pueden asociar a los productos o usuarios.
INSERT INTO Beneficios (id_beneficio, id_producto, nombre_beneficio, descripcion) VALUES
(101, 2, 'Acumulación de Millas Aéreas', 'Acumula 1.5 millas por cada dólar gastado en compras internacionales.'),
(102, 1, 'Cashback 1% en Supermercados', 'Recibe el 1% de tus compras en supermercados aliados.'),
(103, NULL, 'Reducción de Tasa de Interés', 'Beneficio por buen comportamiento de pago que reduce la tasa en 2 puntos porcentuales.'),
(104, 2, 'Acceso a Salas VIP en Aeropuertos', 'Disfruta de salas VIP con tu Tarjeta Oro.');

-- 2. Insertar Usuarios
-- Creamos 30 usuarios con nombres mixtos.
INSERT INTO Usuarios (id_usuario, nombre, apellido, email, estado) VALUES
(1, 'Ana', 'García', 'ana.garcia@email.com', 'activo'),
(2, 'Luis', 'Martinez', 'luis.martinez@email.com', 'activo'),
(3, 'Sofía', 'Rodriguez', 'sofia.rodriguez@email.com', 'activo'),
(4, 'Carlos', 'Hernandez', 'carlos.hernandez@email.com', 'bloqueado'),
(5, 'Elena', 'Lopez', 'elena.lopez@email.com', 'activo'),
(6, 'Javier', 'Perez', 'javier.perez@email.com', 'activo'),
(7, 'Laura', 'Gomez', 'laura.gomez@email.com', 'activo'),
(8, 'David', 'Sanchez', 'david.sanchez@email.com', 'activo'),
(9, 'Isabel', 'Romero', 'isabel.romero@email.com', 'activo'),
(10, 'Miguel', 'Suarez', 'miguel.suarez@email.com', 'activo'),
(11, 'Carmen', 'Torres', 'carmen.torres@email.com', 'activo'),
(12, 'Alejandro', 'Diaz', 'alejandro.diaz@email.com', 'activo'),
(13, 'Patricia', 'Ruiz', 'patricia.ruiz@email.com', 'activo'),
(14, 'Fernando', 'Alvarez', 'fernando.alvarez@email.com', 'activo'),
(15, 'Raquel', 'Moreno', 'raquel.moreno@email.com', 'activo'),
(16, 'Daniel', 'Jimenez', 'daniel.jimenez@email.com', 'activo'),
(17, 'Marta', 'Vazquez', 'marta.vazquez@email.com', 'activo'),
(18, 'Sergio', 'Castro', 'sergio.castro@email.com', 'activo'),
(19, 'Lucía', 'Ortega', 'lucia.ortega@email.com', 'activo'),
(20, 'Adrián', 'Gutierrez', 'adrian.gutierrez@email.com', 'activo'),
(21, 'Cristina', 'Ramos', 'cristina.ramos@email.com', 'activo'),
(22, 'Pablo', 'Serrano', 'pablo.serrano@email.com', 'activo'),
(23, 'Beatriz', 'Santos', 'beatriz.santos@email.com', 'activo'),
(24, 'Jorge', 'Cabrera', 'jorge.cabrera@email.com', 'activo'),
(25, 'Silvia', 'Molina', 'silvia.molina@email.com', 'activo'),
(26, 'Ricardo', 'Nieto', 'ricardo.nieto@email.com', 'activo'),
(27, 'Nuria', 'Pascual', 'nuria.pascual@email.com', 'activo'),
(28, 'Iván', 'Gallego', 'ivan.gallego@email.com', 'activo'),
(29, 'Lorena', 'Sanz', 'lorena.sanz@email.com', 'activo'),
(30, 'Óscar', 'Iglesias', 'oscar.iglesias@email.com', 'activo');

-- 3. Insertar Cuentas
-- Asignamos una cuenta de ahorros a cada uno de los 30 usuarios.
INSERT INTO Cuentas (id_usuario, tipo_cuenta, saldo_actual) VALUES
(1, 'ahorros', 5200.00), (2, 'ahorros', 8300.50), (3, 'ahorros', 12500.00),
(4, 'ahorros', 150.75), (5, 'ahorros', 25000.00), (6, 'ahorros', 6800.20),
(7, 'ahorros', 9100.00), (8, 'ahorros', 3200.00), (9, 'ahorros', 18000.00),
(10, 'ahorros', 4500.00), (11, 'ahorros', 7600.80), (12, 'ahorros', 11000.00),
(13, 'ahorros', 5400.00), (14, 'ahorros', 300.00), (15, 'ahorros', 19500.00),
(16, 'ahorros', 8800.00), (17, 'ahorros', 4100.50), (18, 'ahorros', 6200.00),
(19, 'ahorros', 13000.00), (20, 'ahorros', 2200.00), (21, 'ahorros', 9500.00),
(22, 'ahorros', 14000.00), (23, 'ahorros', 4800.30), (24, 'ahorros', 7100.00),
(25, 'ahorros', 16000.00), (26, 'ahorros', 3900.00), (27, 'ahorros', 10500.00),
(28, 'ahorros', 1700.00), (29, 'ahorros', 11500.00), (30, 'ahorros', 8200.00);

-- 4. Insertar Créditos Otorgados y Cuotas
-- Simulamos diferentes escenarios para un grupo de usuarios.

-- **Escenario 1: Usuario EN MORA (Carlos Hernandez, ID 4)**
-- Tiene un crédito de libre inversión y no ha pagado las últimas 3 cuotas.
INSERT INTO CreditosOtorgados (id_credito, id_usuario, id_producto, cupo_total, saldo_pendiente, fecha_otorgamiento, estado) VALUES
(401, 4, 3, 5000.00, 2500.00, '2025-01-15', 'en_mora');
INSERT INTO Cuotas (id_credito, numero_cuota, monto_cuota, fecha_vencimiento, fecha_pago, estado_cuota) VALUES
(401, 1, 250.00, '2025-02-15', '2025-02-14', 'pagada'),
(401, 2, 250.00, '2025-03-15', '2025-03-15', 'pagada'),
(401, 3, 250.00, '2025-04-15', '2025-04-13', 'pagada'),
-- A partir de aquí no pagó más
(401, 7, 250.00, '2025-08-15', NULL, 'atrasada'),
(401, 8, 250.00, '2025-09-15', NULL, 'atrasada'),
(401, 9, 250.00, '2025-10-15', NULL, 'atrasada'); -- El sistema lo marcaría en mora

-- **Escenario 2: Usuario AL DÍA (Sofía Rodriguez, ID 3)**
-- Tiene una Tarjeta de Crédito Oro y un crédito vehicular, ambos al día.
INSERT INTO CreditosOtorgados (id_credito, id_usuario, id_producto, cupo_total, saldo_pendiente, fecha_otorgamiento, estado) VALUES
(402, 3, 2, 10000.00, 3500.00, '2024-11-20', 'activo'), -- Tarjeta Oro
(403, 3, 4, 15000.00, 8000.00, '2025-05-10', 'activo'); -- Crédito Vehicular
INSERT INTO Cuotas (id_credito, numero_cuota, monto_cuota, fecha_vencimiento, fecha_pago, estado_cuota) VALUES
(402, 11, 400.00, '2025-09-25', '2025-09-22', 'pagada'),
(402, 12, 400.00, '2025-10-25', NULL, 'pendiente'), -- Cuota actual, no vencida
(403, 4, 650.00, '2025-09-10', '2025-09-08', 'pagada'),
(403, 5, 650.00, '2025-10-10', '2025-10-09', 'pagada'); -- Recién pagada

-- **Escenario 3: Usuario con Deuda PAGADA (Javier Perez, ID 6)**
-- Tuvo un crédito que ya terminó de pagar exitosamente.
INSERT INTO CreditosOtorgados (id_credito, id_usuario, id_producto, cupo_total, saldo_pendiente, fecha_otorgamiento, estado) VALUES
(404, 6, 3, 3000.00, 0.00, '2024-04-01', 'pagado');
-- No se insertan cuotas pendientes para este crédito.

-- **Escenario 4: Usuario con Tarjeta de Crédito y una cuota ATRASADA (Laura Gomez, ID 7)**
INSERT INTO CreditosOtorgados (id_credito, id_usuario, id_producto, cupo_total, saldo_pendiente, fecha_otorgamiento, estado) VALUES
(405, 7, 1, 4000.00, 1200.00, '2025-02-05', 'activo');
INSERT INTO Cuotas (id_credito, numero_cuota, monto_cuota, fecha_vencimiento, fecha_pago, estado_cuota) VALUES
(405, 7, 150.00, '2025-09-05', NULL, 'atrasada'), -- Una sola cuota atrasada
(405, 8, 150.00, '2025-10-05', '2025-10-04', 'pagada'); -- Pagó la siguiente pero no la anterior

-- **Escenario 5: Usuario con múltiples productos (Isabel Romero, ID 9)**
-- Tiene una hipoteca y una tarjeta de crédito, todo al día.
INSERT INTO CreditosOtorgados (id_credito, id_usuario, id_producto, cupo_total, saldo_pendiente, fecha_otorgamiento, estado) VALUES
(406, 9, 5, 120000.00, 115000.00, '2024-08-30', 'activo'), -- Hipoteca
(407, 9, 1, 6000.00, 500.00, '2025-01-20', 'activo'); -- Tarjeta Clásica
INSERT INTO Cuotas (id_credito, numero_cuota, monto_cuota, fecha_vencimiento, fecha_pago, estado_cuota) VALUES
(406, 13, 1100.00, '2025-09-30', '2025-09-28', 'pagada'),
(407, 9, 200.00, '2025-10-15', '2025-10-14', 'pagada');

-- 5. Insertar Ofertas Preaprobadas y Beneficios
-- Basado en el historial, el sistema genera ofertas.

-- Para **Sofía Rodriguez (ID 3)**: Buen historial con 2 productos.
-- Se le ofrece un aumento de cupo en su tarjeta Oro.
INSERT INTO OfertasPreaprobadas (id_usuario, id_producto_ofrecido, tipo_oferta, cupo_ofrecido, descripcion, fecha_expiracion, estado_oferta) VALUES
(3, 2, 'aumento_cupo', 15000.00, 'Aumento de cupo por excelente manejo de tus productos.', '2025-12-31', 'disponible');

-- Para **Javier Perez (ID 6)**: Pagó un crédito completo.
-- Se le ofrece una nueva Tarjeta de Crédito Oro como premio a su fidelidad.
INSERT INTO OfertasPreaprobadas (id_usuario, id_producto_ofrecido, tipo_oferta, cupo_ofrecido, descripcion, fecha_expiracion, estado_oferta) VALUES
(6, 2, 'nueva_tarjeta', 8000.00, '¡Felicitaciones! Tienes una Tarjeta Oro preaprobada.', '2025-11-30', 'disponible');

-- Para **Isabel Romero (ID 9)**: Maneja productos de alto valor correctamente.
-- Se le concede un beneficio de reducción de tasa en su hipoteca.
INSERT INTO OfertasPreaprobadas (id_usuario, id_producto_ofrecido, tipo_oferta, descripcion, fecha_expiracion, estado_oferta) VALUES
(9, 5, 'nuevo_credito', 'Te otorgamos el beneficio de reducción de tasa en tu crédito hipotecario.', '2026-01-31', 'aceptada'); -- El sistema aplicaría el beneficio

-- Para **Carlos Hernandez (ID 4)**: Usuario en mora.
-- No se le otorgan ofertas. Su cuenta de usuario está 'bloqueada'.