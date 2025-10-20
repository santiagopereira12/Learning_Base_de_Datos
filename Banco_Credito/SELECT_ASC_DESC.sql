-- Consulta de mayor saldo a menor.
SELECT 
u.nombre,
u.apellido,
c.tipo_cuenta,
c.saldo_actual
FROM usuarios u
INNER JOIN cuentas c ON u.id_usuario = c.id_usuario
WHERE c.tipo_cuenta = "ahorros"
ORDER BY c.saldo_actual DESC;

-- Consulta de menor saldo al mayor.
SELECT 
u.nombre,
u.apellido,
c.tipo_cuenta,
c.saldo_actual
FROM usuarios u 
INNER JOIN cuentas c ON u.id_usuario = c.id_usuario
WHERE c.tipo_cuenta = "ahorros"
ORDER BY c.saldo_actual ASC;