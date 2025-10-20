-- Validar tipo de cuenta (AHORROS).
SELECT 
u.nombre,
u.apellido,
c.tipo_cuenta
FROM usuarios u
INNER JOIN cuentas c ON u.id_usuario = c.id_usuario
WHERE c.tipo_cuenta = "ahorros";

-- Validar tipo de cuenta (CORRIENTE).
SELECT 
u.nombre,
u.apellido,
c.tipo_cuenta
FROM usuarios u 
INNER JOIN cuentas c ON u.id_usuario = c.id_usuario
WHERE c.tipo_cuenta = "corriente";