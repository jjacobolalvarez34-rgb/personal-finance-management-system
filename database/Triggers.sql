-- =====================================================
-- AUDIT TRIGGERS
-- Personal Finance Management System
-- =====================================================

DROP TRIGGER IF EXISTS TRG_AUDIT_INSERT_TRANSACCION;
DROP TRIGGER IF EXISTS TRG_AUDIT_UPDATE_TRANSACCION;
DROP TRIGGER IF EXISTS TRG_AUDIT_DELETE_TRANSACCION;

-- INSERT AUDIT

CREATE TRIGGER TRG_AUDIT_INSERT_TRANSACCION
AFTER INSERT ON lp_transaccion
FOR EACH ROW
INSERT INTO lp_auditoria (
    tabla_afectada,
    operacion,
    usuario_db,
    fecha,
    dato_nuevo
)
VALUES (
    'lp_transaccion',
    'INSERT',
    USER(),
    NOW(),
    CONCAT(
        'ID: ', NEW.id_transaccion,
        ' | Monto: ', NEW.monto,
        ' | Tipo: ', NEW.tipo,
        ' | Desc: ', COALESCE(NEW.descripcion,'SIN DESCRIPCION')
    )
);

-- UPDATE AUDIT

CREATE TRIGGER TRG_AUDIT_UPDATE_TRANSACCION
AFTER UPDATE ON lp_transaccion
FOR EACH ROW
INSERT INTO lp_auditoria (
    tabla_afectada,
    operacion,
    usuario_db,
    fecha,
    dato_anterior,
    dato_nuevo
)
VALUES (
    'lp_transaccion',
    'UPDATE',
    USER(),
    NOW(),
    CONCAT(
        'ID: ', OLD.id_transaccion,
        ' | Monto: ', OLD.monto,
        ' | Tipo: ', OLD.tipo,
        ' | Desc: ', COALESCE(OLD.descripcion,'SIN DESCRIPCION')
    ),
    CONCAT(
        'ID: ', NEW.id_transaccion,
        ' | Monto: ', NEW.monto,
        ' | Tipo: ', NEW.tipo,
        ' | Desc: ', COALESCE(NEW.descripcion,'SIN DESCRIPCION')
    )
);

-- DELETE AUDIT

CREATE TRIGGER TRG_AUDIT_DELETE_TRANSACCION
BEFORE DELETE ON lp_transaccion
FOR EACH ROW
INSERT INTO lp_auditoria (
    tabla_afectada,
    operacion,
    usuario_db,
    fecha,
    dato_anterior,
    dato_nuevo
)
VALUES (
    'lp_transaccion',
    'DELETE',
    USER(),
    NOW(),
    CONCAT(
        'ID: ', OLD.id_transaccion,
        ' | Monto: ', OLD.monto,
        ' | Tipo: ', OLD.tipo,
        ' | Desc: ', COALESCE(OLD.descripcion,'SIN DESCRIPCION')
    ),
    NULL
);
