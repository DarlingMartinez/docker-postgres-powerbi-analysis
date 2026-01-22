<div align="center">
  <h1>📊 Sistema Integral de BI: De Docker a la Toma de Decisiones</h1>
  <p><strong>Ingeniería de Datos | Análisis de Negocio | Infraestructura Containerizada</strong></p>
  
  <img src="https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white" />
  <img src="https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white" />
  <img src="https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black" />
  <img src="https://img.shields.io/badge/Linux_Fedora-E14411?style=for-the-badge&logo=fedora&logoColor=white" />
</div>

<hr />

## 🎯 Objetivo del Proyecto
Este proyecto demuestra una solución **End-to-End** (extremo a extremo). El propósito fue construir una infraestructura sólida usando **contenedores** para alojar una base de datos relacional y transformarla en un activo estratégico mediante visualización avanzada.

---

## 🏗️ Arquitectura Técnica
Para este desarrollo, utilicé un enfoque de **Infraestructura como Código**:

* **Motor de Base de Datos:** PostgreSQL configurado para persistencia de datos masivos.
* **Orquestación:** Despliegue mediante **Docker Compose** en un entorno **Linux (Fedora 41)**, asegurando portabilidad y escalabilidad.
* **Pipeline de Datos:** Conexión híbrida entre el contenedor y Power BI Desktop para la extracción y modelado en esquema de estrella.

---

## 📈 Dashboard y Análisis de Decisiones

### 1️⃣ Página 1: Overview de Ventas (Salud del Negocio)
<div align="center">
<img width="1306" height="729" alt="image" src="https://github.com/user-attachments/assets/148c9bd2-ff54-43d9-9d5a-54f42df541d2" />
</div>
<ul>
  <li><strong>KPIs Críticos:</strong> Monitoreo de Ingresos, Volumen de Operación y Ticket Promedio.</li>
  <li><strong>Geografía:</strong> Identificación de México y Colombia como mercados líderes.</li>
  <li><strong>VIPs:</strong> Ranking de clientes estratégicos para planes de retención.</li>
</ul>

### 2️⃣ Página 2: Desempeño Regional (Análisis Profundo)
<div align="center">
  <img src="img/regional.png" width="800px" alt="Análisis Regional" />
</div>
<ul>
  <li><strong>Matriz de Penetración:</strong> Cruce de datos para entender qué categorías dominan en cada país.</li>
  <li><strong>Filtros Visuales:</strong> Implementación de Treemaps para una navegación intuitiva por el catálogo.</li>
</ul>

### 3️⃣ Página 3: Análisis de Tendencias y Futuro
<div align="center">
  <img src="img/tendencias.png" width="800px" alt="Tendencias" />
</div>
<ul>
  <li><strong>Gráfico de Dispersión:</strong> Clasificación de productos en "Estrellas" y "Premium" para optimizar precios.</li>
  <li><strong>Inteligencia de Tiempo:</strong> Medición del crecimiento mensual (MoM) para detectar alertas de mercado.</li>
</ul>

---

## 🛠️ Cómo Replicar este Entorno

1.  **Clonar el repositorio.**
2.  **Levantar el servicio:**
  ```
    bash docker-compose up -d
  ```
4.  **Cargar Datos:** Ejecutar el script `init.sql` incluido  (incluye la creación de tablas y la generación de 5,000 registros de prueba).
5.  **Power BI:** Abrir el archivo `.pbix` y conectar a `localhost:5432`.

---

<div align="center">
  <p><strong>Desarrollado por Darling Martínez</strong></p>
  <p>¿Conectamos? www.linkedin.com/in/
veronica-yopasa-849682265</p>
</div>
