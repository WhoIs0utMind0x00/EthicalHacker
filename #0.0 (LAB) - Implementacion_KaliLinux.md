# Práctica de laboratorio — Implementación de una máquina virtual (VM) Kali Linux prediseñada

## Objetivos
En esta práctica de laboratorio se cumplirán los siguientes objetivos:
- Parte 1: Implementación de una VM Kali Linux personalizada en una computadora basada en el chip Intel o AMD
- Parte 2: Implementar una VM Kali Linux personalizada en una computadora MacOS basada en ARM M1 / M2
- Parte 3: Exploración de Linux

## Trasfondo / Escenario
La potencia y los recursos informáticos han aumentado enormemente en un corto período de tiempo. Una ventaja de los procesadores multinúcleo y de las grandes cantidades de RAM es la capacidad de ejecutar varios sistemas operativos en una computadora mediante la virtualización.

Con la virtualización, una o más computadoras virtuales pueden funcionar en una sola computadora física. Las computadoras virtuales que se ejecutan en computadoras físicas se denominan máquinas virtuales (VM). Las máquinas virtuales suelen denominarse huéspedes y las computadoras físicas suelen denominarse hosts. Cualquier persona con una computadora y un sistema operativo modernos puede ejecutar máquinas virtuales.

En este laboratorio, primero instalará una aplicación de virtualización de escritorio, como Oracle VirtualBox, e implementará una máquina virtual que ejecute un sistema operativo Kali Linux.

## Recursos Necesarios 
- Computadora con un mínimo de 4 GB de RAM y 50 GB de espacio libre en disco
- Acceso a Internet para descargar software de virtualización, Oracle VirtualBox o UTM e imágenes de VM

## Instrucciones

### Parte 1: Implementación de una VM Kali personalizada prediseñada en una computadora basada en chips Intel o AMD
__Paso 1: Descargar e instalar VirtualBox__

VMware Workstation Player y VirtualBox son dos programas de virtualización que puede descargar e instalar para ejecutar el archivo Kali VM. En esta práctica de laboratorio, usará la aplicación VirtualBox.

- Vaya a https://www.virtualbox.org/. Haga clic en el enlace de descarga en esta página.
- Elija y descargue el archivo de instalación adecuado según su sistema operativo.
- Una vez que se haya descargado el archivo de instalación de VirtualBox, ejecute el instalador y acepte la configuración de instalación predeterminada

__Paso 2: Descargar el Kali personalizado prediseñado__

- Vaya a https://www.netacad.com/resources/lab-downloads?courseLang=es-XL desde netacad.com
- Descargar el archivo OVA para este curso. Anota la ubicación del archivo OVA descargado en la computadora.

__Paso 3: Implementar la VM en VirtualBox__

- Abrir VirtualBox
- Hacer click en **Archivo > Importar dispositivo** para importar el archivo OVA descargado. Haz click en el botón **Next** para continuar.
- Revise la configuración del dispositivo. Aumenta la cantidad de RAM si lo deseas. Haz click en **Finish** para continuar.
- Haz click en **Iniciar** para encender la VM recién creada después de que se haya importado el dispositivo.

### Parte 2: Implementación de una VM Kali personalizada prediseñada en una computadora basada en el chip ARM M1/M2 (Solo para MacOS)

__Paso 1: Descargar e instalar UTM__

- Vaya a https://mac.getutm.app/. Haz clic en Descargar para descargar la versión gratuita.
- Después de descargar el archivo, instale UTM.

__Paso 2: Descargar y cargar el Kali personalizado prediseñado__

- Vaya a https://www.netacad.com/resources/lab-downloads?courseLang=es-XL desde netacad.com
- Descargar el archivo Kali.utm.zip. Anotar la ubicación del archivo Kali.utm.zip descargado.
- Descomprima el archivo zip.
- Haz doble clie en el archivo descomprimido para abrir la VM en UTM.

### Parte 3: Exploración de Linux

__Paso 1: Privilegios root__

El usuario root en Linux es equivalente al usuario administrador en Windows. Los comandos *su* y *sudo* permiten obtener permisos root.

El comando *su* permite convertirse en el usuario raíz después de proporcionar la contraseña del usuario *root*. Cuando haya terminado de ejecutar los comandos, debe escribir el comando *exit* para salir del shell *root* y volver a su propia cuenta.

Con el comando *sudo*, solo se ejecuta un comando con privilegios de raiz con la contrasela del usuario actual de manera predeterminada.

Para el Kali personalizado prediseñado para este curso, el usuario *kali* está configurado para usar el comando *sudo* para acceder a los privilegios *root*

- Inicia sesión en el sistema Kali con el username *kali* y la contraseña *kali*. Se presenta el escritorio Kali.
- Haz click con el botón derecho en el **Escritorio > Aplicaciones > Emulador de Terminal**.
- Se requieren privilegios root para ver y editar el archivo /etc/sudoers. Para ilustrar el uso de privilegios de raíz, ingrese el comando *visudo* en la línea de comandos de la terminal.

``` bash
┌──(kali㉿Kali)-[~]
└─$ visudo
visudo: /etc/sudoers: Permission denied
```

Ten en cuenta que no tienes permisos para ver y editar el archivo
- Para elevar temporalmente tu permiso de acceso root, ingresa **sudo visudo** en el indicador. Proporciona la contraseña *kali* cuando se solicite.

``` bash
┌──(kali㉿Kali)-[~]
└─$ sudo visudo
[sudo] password for kali: 
```
- Desplázate hasta el final del archivo. Las configuraciones resaltadas permiten que cualquier usuario del grupo sudo ejecute cualquier comando. Presiona Ctrl + X para salir del archivo sin guardar los cambios.
``` bash
# Allow members of group sudo to execute any command
%sudo   ALL=(ALL:ALL) ALL
```
- Verifica que el usuario kali sea parte del grupo sudo. El comando [grep] solo imprime las líneas que coinciden con el patrón proporcionado. En este ejemplo, el comando busca la palabra sudo en el archivo /etc/group e imprime esa línea. El resultado confirma que el usuario kali está en el grupo sudo.
``` bash
┌──(kali㉿Kali)-[~]
└─$ grep sudo /etc/group
sudo:x:27:kali
```

__Paso 2: Atajos de teclado__
A medida que trabajas en la terminal, es posible que debas volver a escribir algunos comandos o intentar recordar un comando, un nombre de archivo o un nombre de carpeta. Algunos métodos abreviados de teclado pueden ayudar a ser más eficiente en la terminal.
- Puedes usar las teclas de flecha hacia arriba o hacia abajo para ubicar y ejecutar comandos ingresados previamente. En la terminal, presiona la flecha hacia arriba hasta encontrar el comando *visudo*.
- ¿Qué sucede si buscas un comando que utilizaste hace tiempo? El historial de comandos permite ver todos los comandos que ha utilizado recientemente en el mismo terminal. En el indicador, elimina el comando que se muestra si es necesario. Ingresa el comando *history* para ver una lista de los comandos utilizados recientemente.
``` bash
┌──(kali㉿Kali)-[~]
└─$ history
    1  visudo
    2  sudo visudo
    3  grep sudo /etc/group
    4  history
```
El resultado muestra la lista de comandos con un número junto a cada comando que acabas de usar en el paso anterior

- Puedes usar una combinación del signo de exclamación (!) y el número de historial o la cadena de comando para repetir los comandos utilizados anteriormente.

Ingreso _**!3**_, ¿Qué resultado muestra?
``` bash
┌──(kali㉿Kali)-[~]
└─$ !3
grep sudo /etc/group
sudo:x:27:kali
```
Ahora, ingreso _**!his**_, ¿Qué comando se muestra?
``` bash
┌──(kali㉿Kali)-[~]                                                                                                                
└─$ !his                                                                                                                           
history                                                                                                                            
    1  visudo                                                                                                                      
    2  sudo visudo                                                                                                                 
    3  grep sudo /etc/group                                                                                                        
    4  history                                                                                                                     
    5  grep sudo /etc/group                                                                                                        
    6  history 
```
- La tecla *Tab* puede ayudarte a completar un comando parcial o un nombre de archivo o carpeta.

Ingreso _**hi**_ y presiona la tecla *Tab*, esta es la salida
``` bash
┌──(kali㉿Kali)-[~]                                                                                                                
└─$ hi                                                                                                                             
hishrink   history    histretch  hitex
```
- Puedes seguir agregando más letras al comando hasta que se muestre *histo*. Ahora, cuando presiones la tecla *Tab*, el comando se completa por que es único para el sistema.
- La finalización de tabulación también se puede utilizar en archivos y carpetas. Ingresa *ls /me* y presiona la tecla *Tab*. Debido a que la cadena *me* es única en la lista de nombres de archivos y carpetas en el directorio raíz, deberías ver comando completado como *ls /media*. Presiona Enter para ver el contenido de la carpeta /media.
``` bash
┌──(kali㉿Kali)-[~]                                                                                                                
└─$ ls /media/
cdrom  cdrom0  
```

