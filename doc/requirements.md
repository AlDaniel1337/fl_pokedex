# Funcionalidades implementadas y pendientes

## Requisitos Funcionales (Core)
Estado | Tarea                            | Notas
-------|----------------------------------|-------------------------------
Ok     | Listado Principal con Paginación | Usar limit y offset de la API.
Ok     | Búsqueda (Nombre/ID)             | Implementar el endpoint `/pokemon/{id}`
Ok     | Debounce en Búsqueda             | Asegurar que la búsqueda no se ejecute en cada pulsación.
x      | Filtro por Tipo                  | Implementar el endpoint `/type/{id}`
Ok     | Vista de Detalle                 | Debe mostrar: Sprites, Stats, Abilities y Types.
x      | Datos de Species                 | Mostrar el Flavor Text (descripción) del Pokémon.
x      | Cadena de Evolución              | Mostrar la cadena de evolución (visual lineal mínima).
Ok     | Mecanismo de Favoritos           | Implementar la funcionalidad para marcar/desmarcar favoritos.
Ok     | Persistencia de Favoritos        | Usar almacenamiento local (SharedPreferences/Hive/sqlite).
Ok     | Manejo de Temas                  | Implementar soporte para tema Claro y tema Oscuro.
Ok     | Placeholders Visuales            | Mostrar elementos de carga/esqueletos mientras se obtienen los datos.
Ok     | Manejo de Errores                | Mostrar mensajes claros en caso de errores de red o API.

## Requisitos No Funcionales y Arquitectura
Estado | Tarea                            | Notas
-------|----------------------------------|-------------------------------
Ok     | Arquitectura Definida            | Usar una arquitectura simple y modular (MVVM/Clean light).
Ok     | Elección del Gestor de Estado    | Seleccionar y usar un gestor (Provider/Riverpod/BLoC/GetX).
Ok     | Justificación en **README**      | Incluir una breve justificación de la elección del gestor de estado en el README.
Ok     | Null-Safety                      | Asegurar que todo el código cumple con las normas de Null-Safety.
Ok     | Análisis de Código (Lint)        | Corregir todos los warnings de lint.
x      | Pruebas Unitarias                | Incluir mínimo 2 pruebas unitarias.
x      | Pruebas de Widgets               | Incluir mínimo 1 prueba de widget.

## Extras Opcionales (Recomendados)
Estado | Tarea                            | Notas
-------|----------------------------------|-------------------------------
x      | Animaciones Básicas              | Añadir animaciones simples para mejorar la experiencia de usuario.
Ok     | Caché de Respuestas              | Implementar un caché básico para la lista y el detalle para mejorar la fluidez.
x      | Soporte Offline Simple           | Mostrar el último listado visto sin conexión (además de favoritos).
x      | Tabla de Efectividades           | Mostrar la tabla de debilidades/resistencias por tipo en la vista de detalle.
Ok     | Movimientos Principales          | Listar los movimientos principales del Pokémon en la vista de detalle.
x      | Accesibilidad                    | Mejorar con Semantics, tamaños adecuados y navegación por teclado (desktop).

## Entregables y Verificación
Estado | Tarea                            | Notas
-------|----------------------------------|-------------------------------
Ok     | Repositorio de Código            | Repositorio git con el código fuente completo.
Ok     | README.md                        | Incluir instrucciones para correr, decisiones técnicas, limitaciones y planes a futuro (+48h).
Ok     | Evidencia de Uso                 | Adjuntar capturas de pantalla o un GIF de la aplicación en funcionamiento.

## Casos de Verificación Sugeridos
Estado | Tarea                            | Notas
-------|----------------------------------|-------------------------------
Ok     | Buscar y Detalle                 | Buscar 'pikachu' y navegar a su vista de detalle.
x      | Filtrar por Tipo                 | Filtrar la lista por el tipo 'electric' y validar los resultados.
x      | Evolución y Texto                | Verificar el flavor text y la cadena de evolución renderizada en la vista de species.
Ok     | Persistencia                     | Marcar un Pokémon como favorito, cerrar la app (o simular un reinicio) y reabrir: el favorito debe persistir.
Ok     | Caché (Subjetivo)                | Navegar a un detalle ya visitado: debe cargarse rápidamente.