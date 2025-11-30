# Práctica de laboratorio - Exploración del kit de herramientas del ingeniero social (SET)

## Objetivos
Muchas explotaciones comienzan con un ataque de ingeniería social diseñado para obtener credenciales o plantar malware para crear puntos de entrada a la red objetivo. Una de las herramientas utilizadas para realizar estos ataques de ingeniería social es el kit de herramientas de ingeniería social (SET), desarrollado por David Kennedy.

- Inicio de SET y exploración del kit de herramientas
- Clonación de un sitio web para obtener credenciales de usuario
- Captura y visualización de credenciales de usuario

## Trasfondo / Escenario
En esta actividad, clonará un sitio web y obtendrá credenciales de usuario. Esta actividad se realiza en condiciones cuidadosamente controladas dentro de un entorno virtual. Las herramientas SET solo deben usarse para pruebas de penetración en situaciones en las que tiene permiso por escrito para realizar explotaciones de ingeniería social.

En una prueba de penetración real, este procedimiento podría usarse para revelar problemas con la capacitación en seguridad del usuario y la necesidad de tomar medidas para educar a los usuarios sobre los diversos tipos de ataques de suplantación de identidad (phishing).

## Recursos necesarios
- Kali VM personalizada para el curso de Ethical Hacker
- Acceso a Internet

## Parte 1: Iniciar SET y explorar el kit de herramientas
__Paso 1: Cargar la aplicación SET__<br>
Inicie Kali Linux con el nombre de usuario kali y la contraseña kali. Abra una sesión de terminal desde la barra de menús en la parte superior de la pantalla.
SET debe ejecutarse como root. Utilice el comando sudo -i para obtener acceso root persistente. En el indicador, introduzca el comando setoolkit para cargar el sistema de menús. El kit de herramientas de ingeniería social también se puede ejecutar desde la opción Applications > Social Engineering Tools > social engineering toolkit (root) en el menú de Kali.
```bash

```
Si es la primera vez que se ejecuta SET, se muestran los términos y condiciones de la licencia y se requiere un acuerdo. Lea los términos con atención.
Después de leer la exención de responsabilidad, ingrese _y_ para aceptar los términos de servicio.<br>
Aparece el menú SET inicial, como se muestra a continuación:
```bash
```
__Paso 2: Examinar los ataques de ingeniería social disponibles__<br>
En el indicador SET, ingrese __1__ y presione __Enter__ para acceder al submenú de Ataques de Ingeniería Social.
```bash
```
Seleccione cada opción para ver una breve descripción de cada exploit y lo que hace cada herramienta para cada uno.

## Parte 2: Clonación de un sitio web para obtener las credenciales de usuario
En esta parte, creará una copia perfecta de la página de inicio de sesión para un sitio web. La página de inicio de sesión falsa recopilará todas las credenciales que se le envíen y redirigirá al usuario al sitio web real.<br>

__Paso 1: Investigue los vectores de ataque web en SET__<br>
- En el submenú de Social-Engineering Attacks, elija __2) Website Attack Vectors__ para comenzar la explotación de clonación del sitio web.
- Seleccione __3) Credential Harvester Attack Method__ en el menú. Se muestra una descripción de las formas de configurar esta explotación.

__Paso 2: Clone la pantalla de inicio de sesión de DVWA.vm__<br>
La aplicación SET crea un sitio web alojado en su computadora Kali Linux. Cuando los usuarios objetivo ingresan sus credenciales en el sitio web clonado, las credenciales y los usuarios serán redirigidos al sitio web real sin ser conscientes de la explotación. Esto es similar a un ataque en ruta.
- Abre el navegador Kali Firefox e ingrese la URL _http://DVWA.vm/_.
- Aparece la pantalla para iniciar sesión. Si no se encuentra la URL, ingrese _http://10.6.6.13/_ para acceder al servidor web mediante su dirección IP.
- Regrese a la sesión de terminal. Seleccione __2) Site Cloner__ en el menú __Credential Harvester Attack Method__. Se muestra información que describe que dirección IP se necesita para alojar el sitio web  falso y recibir los datos de POST. Introduzca la IP del atacante web en el mensaje que se le solicita. Esta es la dirección IP de la interfaz virtual de Kali en la red 10.6.6.0/24. En una explotación real, esta sería la dirección externa (orientada a internet) de la computadora atacante.
- Cuando se le solicite, ingrese la dirección IP __10.6.6.1__.
```bash

```
- Cuando se clona el sitio web, aparece el siguiente mensaje en el terminal.
```bash
```

## Parte 3: Captura y visualización de credenciales de usuario
__Paso 1: Crear la explotación de Ingeniería Social__<br>
En una explotación de la vida real, en este punto, se crea y envía una explotación de suplantación de identidad (phishing) que contiene un enlace o código QR que envía al usuario al sitio web falso. En esta práctica, se crea un documento HTML para dirigir al usuario a la página web falsa. Este documento simula una URL de suplantación de identidad distribuida. Podría distribuirse como archivo adjunto en correos de suplantación de identidad.
- Abra el editor de texto Mousepad de Kali para Linux con la opción _Applications > Favorites > Text Editor_ del menú. Ingrese el siguiente código HTML.

```HTML
<html>
    <head>
        <meta http-equiv="refresh" content="0; url=http://10.6.6.1/" />
    </head>
</html>
```
- Seleccione _File > Save_ en el menú. Nombre el documento como *Great_link.html* y guárdelo en la carpeta _/home/kali/Desktop_. El ícono aparece en el escritorio de Kali.
- Cierre la aplicación Mousepad.

__Paso 2: Capture las credenciales del usuario__<br>
El propósito del sitio web clonado es presentar una página web idéntica a la que espera el usuario. Un buen hacker crearía una URL falsa que sería muy similar a la URL real, de modo que, a menos que el usuario inspeccione la URL muy de cerca, pase desapercibida.
- Haga doble clie en el ícono del escritorio de la página *Great_link.html*. La página de inicio de sesión de DVWA debe aparecer en una ventana del navegador.
- Introduzca información en los campos __Nombre de usuario__ y __Contraseña__ y haga clic en __Login__ para enviar el formulario.
```
Username: some.user@gmail.com
Password: Pa55w0rdd!
```
__Paso 3: Vea la información capturada__
Regrese a la sesión de terminal que ejecuta la aplicación SET. Debe aparecer el resultado del intento de inicio de sesión.
```bash
```
Para guardar el informe en formato XML y usarlo en otras aplicaciones de pruebas de penetración, ingrese __CTRL + C__. Se devuelven el nombre del archivo del informe y la ruta. Seleccione la ruta y el nombre del archivo y haga clic con el botón derecho para copiar la selección. Los nombres de archivo que se crean contienen la fecha y la hora en que se creó el archivo en este formato:
```
2025-11-29 18:45:52.967169.xml
```
Continúe ingresando 99 y presione enter hasta salir de setoolkit. Para ver el contenido del archivo XML, debe colocar el archivo entre comillas dobles porque contiene espacios y caracteres especiales. Utilice el comando _cat_ para ver la información que se guarda.
```bash
```
