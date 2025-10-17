# Pokedex

## Dev

**Compilar y ejecutar proyecto**
* Instalaciones previas
  * Tener instalado **Flutter**
  * Tener instalado **Dart**
  * Tener instalado **VSCode**
  * Tener instalado **Android Studio** (opcional, para emulador)
* Tener un emulador o un dispositivo fisico conectado
* Presionar **F5** o correr el comando `flutter run` en la terminal
  * Seleccionar el dispositivo en caso de tener varios
* Esperar a que se compile y se instale la app en el dispositivo

## Paquetes usados
* get: ^4.7.2
  * Manejo de estados y rutas
* dio: ^5.9.0
  * Manejo de peticiones HTTP
* flutter_svg: ^2.2.0 
  * Manejo de imagenes SVG
* get_storage: ^2.1.1
  * Almacenamiento local simple y eficiente 


## Justificación 

**Si tuviera más tiempo**
* Realizaría más pruebas unitarias y de widget
* Mejoraría la arquitectura
  * Implementaría mejor **clean architecture**
  * Crearía más capas (domain, application, etc)
* Me apegaría más a los principios **solid**
  * Separando lógica, clases y/o funcionalidades adecuadamente
  * Crearía más servicios o controladores de ser necesario
  * Separaría mejor las responsabilidades
* Revisaría las secciones donde pueda usar otros **patrones de diseño**
* Mejoraría la UI

**Por qué elecciones de paquetes**
* `get`: 
  * Para el manejo de estados y rutas de manera sencilla y eficiente.
  * Me siento cómodo usándolo y me permite desarrollar más rápido.
  * Cuenta con funcionalidades ya integradas que facilitan el desarrollo.
* `dio`: 
  * Para el manejo de peticiones HTTP, permitiendo un control más fino sobre las mismas.
  * Lo escogi por que lo he usado en otros proyectos recientes por lo que me resulta familiar.
* `flutter_svg`: 
  * Para el manejo de imágenes SVG, facilitando la inclusión de gráficos escalables.
  * Es el unico paquete `svg` que he usado en Flutter y me ha funcionado bien.
* `get_storage`: 
  * Para el almacenamiento local simple y eficiente.
  * Lo escogi por su simplicidad y facilidad de uso para almacenar datos pequeños como favoritos.
