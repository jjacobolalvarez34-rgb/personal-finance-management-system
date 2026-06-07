import streamlit as st
import pymysql
import pandas as pd

# Configuración de la ventana web
st.set_page_config(page_title="Gestor de Gastos", layout="wide")
st.title("💰 Mi Aplicación de Gastos Personales (CRUD)")

# Conexión directa a tu base de datos en la nube (Aiven)
def conectar_base_datos():
    return pymysql.connect(
        host="mysql-12d91c58-neutronwar34-47fc.a.aivencloud.com",
        port=23463,
        user="avnadmin",
        password="AVNS_Vny8OnT3dIlMBj9rETO",  # <- Corregido: Una sola 'A' al principio
        database="LP_PROYECTO",                 # <- Corregido: Cambiado a 'defaultdb'
        autocommit=True
    )

# Crear dos pestañas en la página web: una para el CRUD y otra para la Auditoría
tab1, tab2 = st.tabs(["📝 Gestión de Transacciones (CRUD)", "🚨 Reporte de Auditoría"])

with tab1:
    st.header("📋 Historial de Gastos e Ingresos")
    
    try:
        # 1. LEER (Consultar registros)
        conn = conectar_base_datos()
        query = "SELECT id_transaccion, id_cuenta, id_categoria, monto, fecha, descripcion, tipo FROM lp_transaccion"
        df = pd.read_sql(query, conn)
        st.dataframe(df, use_container_width=True)
        
        # 2. INSERTAR (Crear nuevo registro)
        st.subheader("➕ Agregar Nueva Transacción")
        with st.form("nuevo_registro"):
            col1, col2 = st.columns(2)
            with col1:
                id_cuenta = st.number_input("ID Cuenta (Usa 1)", min_value=1, value=1, step=1)
                id_categoria = st.number_input("ID Categoría (1: Alimento, 2: Salario)", min_value=1, value=1, step=1)
                monto = st.number_input("Monto ($)", min_value=0.0, value=1000.0, step=500.0)
            with col2:
                tipo = st.selectbox("Tipo", ["GASTO", "INGRESO"])
                descripcion = st.text_input("Descripción", value="Gasto de prueba")
            
            boton_guardar = st.form_submit_button("💾 Guardar en la Base de Datos")
            
            if boton_guardar:
                with conn.cursor() as cursor:
                    sql = "INSERT INTO lp_transaccion (id_cuenta, id_categoria, monto, descripcion, tipo) VALUES (%s, %s, %s, %s, %s)"
                    cursor.execute(sql, (id_cuenta, id_categoria, monto, descripcion, tipo))
                st.success("¡Transacción guardada exitosamente! Recarga la página para verla.")

        # 3. ELIMINAR (Borrar registro)
        st.subheader("❌ Eliminar Transacción")
        id_eliminar = st.number_input("Escribe el ID de la transacción que deseas borrar", min_value=1, step=1)
        if st.button("Borrar Registro"):
            with conn.cursor() as cursor:
                cursor.execute(f"DELETE FROM lp_transaccion WHERE id_transaccion = {id_eliminar}")
            st.warning(f"Registro con ID {id_eliminar} eliminado.")
            
    except Exception as e:
        st.error(f"Error de conexión: {e}")

with tab2:
    st.header("🚨 Registro del Sistema de Auditoría (Triggers)")
    st.write("Este reporte muestra los movimientos automáticos capturados por los Triggers en MySQL:")
    
    try:
        # CONSULTAR LA TABLA DE AUDITORÍA
        query_audit = "SELECT id_auditoria, fecha, tabla_afectada, operacion, usuario_db, dato_anterior, dato_nuevo FROM lp_auditoria ORDER BY fecha DESC"
        df_audit = pd.read_sql(query_audit, conn)
        st.table(df_audit)
    except Exception as e:
        st.warning("Aún no hay datos en la tabla de auditoría o hubo un problema al cargar.")