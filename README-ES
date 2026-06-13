# Sistema de Gestión de Finanzas Personales

## Descripción General

Este proyecto consiste en un sistema de gestión de finanzas personales desarrollado utilizando Python, Streamlit y MySQL.

La aplicación permite administrar usuarios, cuentas, categorías, ingresos y gastos mediante una base de datos relacional normalizada, garantizando la integridad de los datos a través de restricciones relacionales y mecanismos automáticos de auditoría implementados mediante triggers.

El proyecto fue desarrollado como parte de un curso universitario de Bases de Datos y se enfoca en modelado relacional, implementación SQL, auditoría de datos y despliegue en la nube.

---

## Funcionalidades

- Gestión de usuarios
- Gestión de cuentas financieras
- Registro de ingresos y gastos
- Diseño relacional en Tercera Forma Normal (3FN)
- Base de datos MySQL desplegada en la nube
- Auditoría automática mediante triggers
- Historial de transacciones
- Operaciones CRUD desde una interfaz desarrollada en Streamlit

---

## Tecnologías Utilizadas

### Backend

- Python
- Streamlit

### Base de Datos

- MySQL
- SQL
- Triggers
- Llaves foráneas
- Integridad referencial

### Infraestructura Cloud

- Aiven for MySQL

---

## Diseño de Base de Datos

El modelo relacional sigue los principios de la Tercera Forma Normal (3FN) con el fin de minimizar redundancias y garantizar consistencia en la información.

### Entidades principales

- Usuario
- Cuenta
- Categoría
- Transacción
- Presupuesto
- Auditoría

### Diagrama Entidad-Relación

![Entity Relationship Diagram](images/entity_relationship_diagram.png)

---

## Sistema de Auditoría

Se implementó un mecanismo de auditoría directamente en la base de datos mediante triggers de MySQL.

El sistema registra automáticamente:

- Inserciones (INSERT)
- Actualizaciones (UPDATE)
- Eliminaciones (DELETE)
- Usuario de base de datos responsable
- Valores anteriores
- Valores nuevos
- Fecha y hora de la operación

Esto permite mantener trazabilidad completa sobre las modificaciones realizadas en la información financiera.

---

## Capturas de la Aplicación

### Interfaz Principal

![Main Interface](images/Principal.png)

### Gestión de Transacciones

![Transaction Interface](images/principal2.png)

### Reporte de Auditoría

![Audit Report](images/audit.png)

---

## Estructura del Proyecto

```text
personal-finance-management-system
│
├── README.md
├── README_ES.md
│
├── app/
│   └── LP_PROYECTO.py
│
├── database/
│   ├── Backup_Total_Proyecto.sql
│   └── Triggers.sql
│
└── images/
    ├── Principal.png
    ├── principal2.png
    ├── audit.png
    └── entity_relationship_diagram.png


```

---
# Aprendizajes Obtenidos

Este proyecto permitió fortalecer conocimientos en:

- Modelado relacional
- Diseño de bases de datos normalizadas
- Desarrollo SQL
- Implementación de triggers
- Auditoría de bases de datos
- Despliegue de bases de datos en la nube
- Desarrollo de aplicaciones con Python
- Integridad y consistencia de datos
- Posibles Mejoras Futuras
- Sistema de autenticación y autorización
- Planeación presupuestal avanzada
- Dashboards interactivos
- Analítica financiera
- Visualización avanzada de datos
- Exportación de reportes
- Despliegue de la Base de Datos

El proyecto fue desplegado originalmente utilizando una instancia MySQL alojada en Aiven.

Debido a que la instancia gratuita ya no se encuentra activa, el repositorio incluye:

- Esquema completo de la base de datos
- Scripts de creación
- Definiciones de triggers
- Datos de ejemplo

permitiendo reconstruir el entorno localmente en cualquier instalación de MySQL.

Autor

**Jacobo López**

Estudiante de Matemáticas

Fundación Universitaria Konrad Lorenz

Bogotá, Colombia
