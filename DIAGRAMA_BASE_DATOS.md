```mermaid
erDiagram
    %% MÓDULO DE USUARIOS Y ROLES
    roles ||--o{ usuarios : tiene
    roles {
        bigint id PK
        varchar nombre UK
    }
    
    usuarios {
        bigint id PK
        varchar username UK
        varchar password
        varchar nombre_completo
        varchar email UK
        boolean activo
        bigint rol_id FK
        timestamp created_at
        timestamp updated_at
    }

    %% MÓDULO DE PRODUCTOS E INVENTARIO
    categorias ||--o{ productos : contiene
    categorias {
        bigint id PK
        varchar nombre UK
        text descripcion
        boolean activo
        timestamp created_at
        timestamp updated_at
    }
    
    productos ||--o{ movimientos_stock : registra
    productos ||--o{ detalle_ventas : incluye
    productos {
        bigint id PK
        varchar codigo UK
        varchar nombre
        text descripcion
        bigint categoria_id FK
        decimal precio_compra
        decimal precio_venta
        int stock_actual
        int stock_minimo
        varchar unidad_medida
        boolean activo
        timestamp created_at
        timestamp updated_at
    }
    
    movimientos_stock {
        bigint id PK
        bigint producto_id FK
        varchar tipo_movimiento
        int cantidad
        int stock_anterior
        int stock_nuevo
        varchar motivo
        bigint usuario_id FK
        timestamp created_at
    }
    
    usuarios ||--o{ movimientos_stock : realiza

    %% MÓDULO DE VENTAS
    ventas ||--|{ detalle_ventas : contiene
    ventas ||--o{ movimientos_caja : genera
    usuarios ||--o{ ventas : registra
    
    ventas {
        bigint id PK
        varchar numero_venta UK
        timestamp fecha_venta
        decimal subtotal
        decimal descuento
        decimal total
        varchar metodo_pago
        varchar estado
        bigint cajero_id FK
        varchar cliente_nombre
        text observaciones
        timestamp created_at
    }
    
    detalle_ventas {
        bigint id PK
        bigint venta_id FK
        bigint producto_id FK
        int cantidad
        decimal precio_unitario
        decimal subtotal
        timestamp created_at
    }

    %% MÓDULO DE CAJAS
    cajas ||--o{ sesiones_caja : tiene
    cajas {
        bigint id PK
        varchar nombre UK
        text descripcion
        boolean activo
        timestamp created_at
        timestamp updated_at
    }
    
    sesiones_caja ||--o{ movimientos_caja : registra
    usuarios ||--o{ sesiones_caja : opera
    
    sesiones_caja {
        bigint id PK
        bigint caja_id FK
        bigint cajero_id FK
        timestamp fecha_apertura
        timestamp fecha_cierre
        decimal monto_inicial
        decimal monto_final
        varchar estado
        text observaciones_apertura
        text observaciones_cierre
        timestamp created_at
        timestamp updated_at
    }
    
    usuarios ||--o{ movimientos_caja : realiza
    
    movimientos_caja {
        bigint id PK
        bigint sesion_caja_id FK
        varchar tipo_movimiento
        varchar concepto
        decimal monto
        varchar metodo_pago
        bigint venta_id FK
        text descripcion
        bigint usuario_id FK
        timestamp created_at
    }
```

## 📊 Resumen de Entidades

### Módulo Usuarios (V1)
- **roles**: Define los roles del sistema
- **usuarios**: Información de usuarios del sistema

### Módulo Inventario (V2)
- **categorias**: Clasificación de productos
- **productos**: Catálogo de productos
- **movimientos_stock**: Historial de cambios en inventario

### Módulo Ventas (V3)
- **ventas**: Cabecera de cada venta
- **detalle_ventas**: Items vendidos en cada venta

### Módulo Cajas (V4)
- **cajas**: Cajas físicas del negocio
- **sesiones_caja**: Aperturas/cierres de caja
- **movimientos_caja**: Movimientos de dinero

## 🔐 Roles Iniciales
- **ROL_ADMIN**: Acceso total al sistema
- **ROL_ENCARGADO**: Gestión de inventario y reportes
- **ROL_CAJERO**: Ventas y operación de caja

## 📝 Notas Importantes
1. Todos los precios están en formato DECIMAL(10,2)
2. Las fechas usan TIMESTAMP para precisión
3. Se incluyen constraints para validación de datos
4. Índices agregados para optimizar consultas frecuentes
5. Claves foráneas con nombres descriptivos
