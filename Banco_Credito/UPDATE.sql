-- Desactiva el modo seguro para permitir actualizaciones masivas
SET SQL_SAFE_UPDATES = 0;

-- 1. Actualizar saldos en las cuentas de los usuarios
-- Multiplicamos por 2000 para que los saldos queden en un rango realista de COP.
-- Ejemplo: 5,200.00 se convierte en 10,400,000 COP.
UPDATE Cuentas
SET saldo_actual = saldo_actual * 2000;


-- 2. Actualizar los créditos, cupos y saldos pendientes
-- Usamos una lógica condicional (CASE) para tratar el crédito hipotecario de forma diferente.
-- El crédito hipotecario (id_producto = 5) se multiplica por 800 para que quede bajo 100 millones.
-- Los demás créditos y tarjetas se multiplican por 2000.
UPDATE CreditosOtorgados
SET
    cupo_total = CASE
        WHEN id_producto = 5 THEN cupo_total * 800 -- Para la hipoteca
        ELSE cupo_total * 2000                    -- Para los demás
    END,
    saldo_pendiente = CASE
        WHEN id_producto = 5 THEN saldo_pendiente * 800
        ELSE saldo_pendiente * 2000
    END;


-- 3. Actualizar el valor de las cuotas mensuales
-- Se multiplica por el mismo factor general para mantener la coherencia con los saldos de los créditos.
-- Ejemplo: una cuota de 250.00 se convierte en 500,000 COP.
UPDATE Cuotas
SET monto_cuota = monto_cuota * 2000;


-- 4. Actualizar los cupos ofrecidos en las ofertas preaprobadas
-- Ajustamos las ofertas para que reflejen la nueva escala de valores.
-- Se omite cualquier oferta que no tenga un cupo numérico (WHERE... IS NOT NULL).
UPDATE OfertasPreaprobadas
SET cupo_ofrecido = cupo_ofrecido * 2000
WHERE cupo_ofrecido IS NOT NULL;

-- Vuelve a activar el modo seguro por buenas prácticas 🛡️
SET SQL_SAFE_UPDATES = 1;