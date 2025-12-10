# Práctica de laboratorio - Elaboración de paquetes con Scapy

## Objetivos
En esta práctica de laboratorio, usará Scapy, una herramienta de manipulación de paquetes basada en Python, para crear paquetes personalizados. Estos paquetes personalizados se utilizarán para realizar el reconocimiento en un sistema de destino.

- Parte 1: Investigar la herramienta Scapy.
- Parte 2: Usar Scapy para rastrear el tráfico de red.
- Parte 3: Crear y enviar un paquete ICMP.
- Parte 4: Crear y enviar paquetes TCP SYN.
## Trasfondo / Escenario
Los evaluadores de penetración y los hackers éticos a menudo usan paquetes especialmente diseñados para descubrir o aprovechar las vulnerabilidades en la infraestructura y los sistemas de los clientes. Ha utilizado Nmap para escanear y analizar vulnerabilidades en una computadora conectada a la red local.

En esta práctica de laboratorio, realizará más reconocimientos en la misma computadora mediante paquetes ICMP y TCP personalizados.

## Recursos necesarios

- Kali VM personalizada para el curso de Ethical Hacker
- Acceso a Internet

## Parte 1: Investigar la herramienta Scapy
Scapy es una herramienta multiusos escrita originalmente por Philippe Biondi. En esta parte, cargará la herramienta Scapy y explorará algunas de sus capacidades. Herramientas como Scapy solo deben usarse para escanear o comunicarse con máquinas que posee o tiene permiso por escrito para acceder.

__Paso 1: Investigue la documentación y los recursos de Scapy__ <br>
Scapy se puede ejecutar de forma interactiva desde el shell de Python o se puede incorporar a los programas de Python mediante la importación del módulo python-scapy. La herramienta Scapy tiene una extensa documentación en línea en https://scapy.readthedocs.io/en/latest/introduction.html. Este Kali Linux personalizado se distribuye con Python y Scapy preinstalados.

- Inicie la VM de Kali e inicie sesión.
- Abra el navegador Firefox y vaya a https://scapy.readthedocs.io/en/latest/introduction.html. Lea la página de introducción escrita por el creador de Scapy, Philippe Biondi.

__Paso 2: Use el modo de comando interactivo de Scapy__ <br>
Ingrese el comando scapy en una ventana de terminal para cargar el intérprete de Python. Al usar este comando, el intérprete se ejecuta con las clases y los objetos de Scapy pre-cargados. Ingresará los comandos de Scapy de forma interactiva y recibirá el resultado. Los comandos de Scapy también se pueden incrustar en un guion de Python.

Los comandos para crear y enviar paquetes requieren privilegios de root para ejecutarse. Utilice el comando sudo su para obtener privilegios de root antes de iniciar Scapy. Si se le solicita una contraseña, ingrese kali.
```bash
┌──(kali㉿Kali)-[~]
└─$ sudo su
┌──(root㉿Kali)-[/home/kali]
└─# scapy
INFO: Can't import PyX. Won't be able to use psdump() or pdfdump().
                                      
                     aSPY//YASa       
             apyyyyCY//////////YCa       |
            sY//////YSpcs  scpCY//Pp     | Welcome to Scapy
 ayp ayyyyyyySCP//Pp           syY//C    | Version 2.5.0
 AYAsAYYYYYYYY///Ps              cY//S   |
         pCCCCY//p          cSSps y//Y   | https://github.com/secdev/scapy
         SPPPP///a          pP///AC//Y   |
              A//A            cyP////C   | Have fun!
              p///Ac            sC///a   |
              P////YCpc           A//A   | Craft packets like I craft my beer.
       scccccp///pSP///p          p//Y   |               -- Jean De Clerck
      sY/////////y  caa           S//P   |
       cayCyayP//Ya              pY/Ya
        sY/PsY////YCc          aC//Yp 
         sc  sccaCY//PCypaapyCP//YSs  
                  spCPY//////YPSps    
                       ccaacs         
                                       using IPython 8.14.0
>>>
```
En el indicador >>> dentro del shell Scapy, ingrese la función ls() para enumerar todos los formatos y protocolos predeterminados disponibles incluidos con la herramienta. La lista es bastante extensa y ocupará varias pantallas.
```Python
>>> ls()
```
TFTP es un protocolo utilizado para enviar y recibir archivos en un segmento de LAN. Se usa comúnmente para realizar copias de respaldo de archivos de configuración en dispositivos de red. Desplácese hacia arriba para ver los formatos de paquetes TFTP disponibles.

__Paso 3: Examine los campos en un encabezado de paquete IPv4__ <br>
Es importante comprender la estructura de un paquete IP antes de crear y enviar paquetes personalizados a través de la red. Cada paquete IP tiene un encabezado asociado que proporciona información sobre la estructura del paquete. Revise esta información antes de continuar con la práctica de laboratorio.
Campos del Encabezado del Paquete IPv4

Los valores binarios de cada campo identifican diversos parámetros de configuración del paquete IP. Los diagramas de encabezado del protocolo, que se leen de izquierda a derecha y de arriba hacia abajo, proporcionan una representación visual de consulta al analizar los campos de protocolo. El diagrama de encabezado del protocolo IP en la ilustración identifica los campos de un paquete IPv4.
### Campos del encabezado de paquetes IPv4
<img src="Imagenes/encabezado_IPv4.jpeg" width="50%" height="50%" style="border-radius:10px;">

Los campos significativos en el encabezado IPv4 incluyen lo siguiente:

**Versión**: Contiene un valor binario de 4 bits establecido en 0100 que identifica esto como un paquete IPv4. <br>
**Servicios diferenciados o DiffServ (DS)**: Este campo, formalmente conocido como *Tipo de servicio (ToS)*, es un campo de 8 bits que se utiliza para determinar la prioridad de cada paquete. Los seis bits más significativos del campo DiffServ son los *bits de punto de código de servicios diferenciados (DSCP)* y los dos últimos bits son los *bits de notificación de congestión explícita (ECN)*.<br>
**Suma de comprobación de encabezado**: Se utiliza para detectar daños en el encabezado IPv4.<br>
**Tiempo de duración (Time to Live,TTL)**: TTL contiene un valor binario de 8 bits que se utiliza para limitar la vida útil de un paquete. El dispositivo de origen del paquete IPv4 establece el valor TTL inicial. Se reduce en uno cada vez que el paquete es procesado por un router. Si el campo TTL llega a cero, el router descarta el paquete y envía a la dirección IP de origen un mensaje de tiempo superado del *protocolo de mensajes de control de Internet (ICMP)*. Debido a que el router disminuye el TTL de cada paquete, el router también debe volver a calcular la suma de comprobación del encabezado.<br>
**Protocolo**: Este campo se utiliza para identificar el protocolo del siguiente nivel. Este valor binario de 8 bits indica el tipo de carga de datos que lleva el paquete, lo que permite que la capa de red transmita los datos al protocolo de la capa superior apropiado. *ICMP (1)*, *TCP (6)* y *UDP (17)* son algunos valores comunes. <br>
**Suma de comprobación de encabezado**: Se utiliza para detectar daños en el encabezado IPv4. <br>
**Dirección IPv4 de origen**: Contiene un valor binario de 32 bits que representa la dirección IPv4 de origen del paquete. La dirección IPv4 de origen es siempre una dirección unicast. <br>
**Dirección IPv4 de destino**: Contiene un valor binario de 32 bits que representa la dirección IPv4 de destino del paquete. La dirección IPv4 de destino es una dirección unicast, multicast o de difusión. <br>

La función *ls()* también se puede utilizar para enumerar los detalles de los campos y las opciones disponibles en cada encabezado de protocolo. La sintaxis para usar una función en Scapy es *nombre_función(argumentos)*. Utilice la función *ls(IP)* para enumerar los campos disponibles en un encabezado de paquete IP.
```Python
>>> ls(IP)
version    : BitField  (4 bits)                  = ('4')
ihl        : BitField  (4 bits)                  = ('None')
tos        : XByteField                          = ('0')
len        : ShortField                          = ('None')
id         : ShortField                          = ('1')
flags      : FlagsField                          = ('<Flag 0 ()>')
frag       : BitField  (13 bits)                 = ('0')
ttl        : ByteField                           = ('64')
proto      : ByteEnumField                       = ('0')
chksum     : XShortField                         = ('None')
src        : SourceIPField                       = ('None')
dst        : DestIPField                         = ('None')
options    : PacketListField                     = ('[]')
>>>
```
## Parte 2: Usar Scapy para rastrear el tráfico de red
Scapy se puede usar para capturar y mostrar el tráfico de red, de manera similar a una recopilación de paquetes tcpdump o tshark.

__Paso 1: Utilice la función sniff()__
Utilice la función ¨*sniff()* para recopilar el tráfico mediante la interfaz eth0 predeterminada de su VM. Inicie la captura con la función *sniff()* sin especificar ningún argumento.
```Python
>>> sniff()
```
Abra una segunda ventana de terminal y haga ping a una dirección de Internet, como www.cisco.com. Recuerde especificar el conteo con el argumento -c
```bash
┌──(kali㉿Kali)-[~]
└─$ ping -c 5 www.cisco.com
PING e2867.dsca.akamaiedge.net (23.60.70.119) 56(84) bytes of data.
64 bytes from a23-60-70-119.deploy.static.akamaitechnologies.com (23.60.70.119): icmp_seq=1 ttl=255 time=35.7 ms
64 bytes from a23-60-70-119.deploy.static.akamaitechnologies.com (23.60.70.119): icmp_seq=2 ttl=255 time=36.6 ms
64 bytes from a23-60-70-119.deploy.static.akamaitechnologies.com (23.60.70.119): icmp_seq=3 ttl=255 time=36.0 ms
64 bytes from a23-60-70-119.deploy.static.akamaitechnologies.com (23.60.70.119): icmp_seq=4 ttl=255 time=36.2 ms
64 bytes from a23-60-70-119.deploy.static.akamaitechnologies.com (23.60.70.119): icmp_seq=5 ttl=255 time=36.1 ms

--- e2867.dsca.akamaiedge.net ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 5028ms
rtt min/avg/max/mdev = 35.690/36.098/36.600/0.296 ms
```
Regrese a la ventana de terminal que ejecuta la herramienta Scapy. Presione CTRL-C para detener la captura. Debe recibir una salida similar a la siguiente:
```Python
^C<Sniffed: TCP:0 UDP:14 ICMP:10 Other:4>
```
Vea el tráfico capturado mediante la función summary(). A = _ asigna la variable a para contener la salida de la función sniff(). El guion bajo (_) en Python se usa para contener temporalmente el resultado de la última función ejecutada.
```Python
>>> a=_
>>> a.summary()
Ether / IP / UDP / DNS Qry "b'www.cisco.com.'" 
Ether / IP / UDP / DNS Qry "b'www.cisco.com.'" 
Ether / IP / UDP / DNS Ans "b'www.cisco.com.akadns.net.'" 
Ether / IP / UDP / DNS Ans "b'www.cisco.com.akadns.net.'" 
Ether / IP / ICMP 10.0.2.15 > 23.60.70.119 echo-request 0 / Raw
Ether / IP / ICMP 23.60.70.119 > 10.0.2.15 echo-reply 0 / Raw
Ether / IP / UDP / DNS Qry "b'119.70.60.23.in-addr.arpa.'" 
Ether / IP / UDP / DNS Ans "b'a23-60-70-119.deploy.static.akamaitechnologies.com.'" 
Ether / IP / ICMP 10.0.2.15 > 23.60.70.119 echo-request 0 / Raw
Ether / IP / ICMP 23.60.70.119 > 10.0.2.15 echo-reply 0 / Raw
Ether / IP / UDP / DNS Qry "b'119.70.60.23.in-addr.arpa.'" 
Ether / IP / UDP / DNS Ans "b'a23-60-70-119.deploy.static.akamaitechnologies.com.'" 
Ether / IP / ICMP 10.0.2.15 > 23.60.70.119 echo-request 0 / Raw
Ether / IP / ICMP 23.60.70.119 > 10.0.2.15 echo-reply 0 / Raw
Ether / IP / UDP / DNS Qry "b'119.70.60.23.in-addr.arpa.'" 
Ether / IP / UDP / DNS Ans "b'a23-60-70-119.deploy.static.akamaitechnologies.com.'" 
Ether / IP / ICMP 10.0.2.15 > 23.60.70.119 echo-request 0 / Raw
Ether / IP / ICMP 23.60.70.119 > 10.0.2.15 echo-reply 0 / Raw
Ether / IP / UDP / DNS Qry "b'119.70.60.23.in-addr.arpa.'" 
Ether / IP / UDP / DNS Ans "b'a23-60-70-119.deploy.static.akamaitechnologies.com.'" 
Ether / IP / ICMP 10.0.2.15 > 23.60.70.119 echo-request 0 / Raw
Ether / ARP who has 10.0.2.2 says 10.0.2.15
Ether / ARP who has 10.0.2.3 says 10.0.2.15
Ether / ARP is at 52:55:0a:00:02:02 says 10.0.2.2 / Padding
Ether / ARP is at 52:55:0a:00:02:03 says 10.0.2.3 / Padding
Ether / IP / ICMP 23.60.70.119 > 10.0.2.15 echo-reply 0 / Raw
Ether / IP / UDP / DNS Qry "b'119.70.60.23.in-addr.arpa.'" 
Ether / IP / UDP / DNS Ans "b'a23-60-70-119.deploy.static.akamaitechnologies.com.'" 
>>>
```
__Paso 2: Capture y guarde el tráfico en una interfaz específica__
En este paso, capturará el tráfico hacia y desde un dispositivo conectado a una red virtual en su VM Kali Linux.

Abran una nueva ventana del terminal. Utilice el comando ifconfig para determinar el nombre de la interfaz a la que se asigna la dirección IP 10.6.6.1. Esta es la dirección de puerta de enlace predeterminada para una de las redes virtuales que se ejecutan dentro de Kali. Tenga en cuenta el nombre de la interfaz.
Regrese a la ventana de terminal que ejecuta la herramienta Scapy. Utilice la sintaxis sniff(iface = "nombre de la interfaz") para comenzar la captura en la interfaz virtual br-internal.
```Python
>>> sniff(iface="br-internal")
```
Abra Firefox y vaya a la URL http://10.6.6.23/. Cuando se abra la página de inicio de Gravemind, regrese a la ventana de terminal que ejecuta la herramienta Scapy. Presione CTRL-C. Debe recibir una salida similar a la siguiente:
```Python
^C<Sniffed: TCP:215 UDP:0 ICMP:0 Other:2>
```
Vea el tráfico capturado
```Python
>>> a=_
>>> a.summary()
```
__Paso 3: Examine los paquetes recopilados__
En este paso, filtrará el tráfico recopilado para incluir solo el tráfico ICMP, limitará la cantidad de paquetes que se recopilarán y verá los detalles de los paquetes individuales.
Use la ID de interfaz asociada con 10.6.6.1 (br-internal) para capturar diez paquetes ICMP enviados y recibidos en la red virtual interna.
```Python
>>> sniff(iface="br-internal", filter="icmp", count=10)
```
Abra una segunda ventana de terminal y haga ping al host en 10.6.6.23.
```bash
┌──(kali㉿Kali)-[~]
└─$ ping -c 10 10.6.6.23
PING 10.6.6.23 (10.6.6.23) 56(84) bytes of data.
64 bytes from 10.6.6.23: icmp_seq=1 ttl=64 time=0.571 ms
64 bytes from 10.6.6.23: icmp_seq=2 ttl=64 time=0.142 ms
64 bytes from 10.6.6.23: icmp_seq=3 ttl=64 time=0.174 ms
64 bytes from 10.6.6.23: icmp_seq=4 ttl=64 time=0.144 ms
64 bytes from 10.6.6.23: icmp_seq=5 ttl=64 time=0.253 ms
64 bytes from 10.6.6.23: icmp_seq=6 ttl=64 time=0.029 ms
64 bytes from 10.6.6.23: icmp_seq=7 ttl=64 time=0.058 ms
64 bytes from 10.6.6.23: icmp_seq=8 ttl=64 time=0.060 ms
64 bytes from 10.6.6.23: icmp_seq=9 ttl=64 time=0.046 ms
64 bytes from 10.6.6.23: icmp_seq=10 ttl=64 time=0.122 ms
```
Regrese a la ventana de terminal que ejecuta la herramienta Scapy. La captura se detuvo automáticamente cuando se enviaron o recibieron 10 paquetes. Vea el tráfico capturado con números de línea mediante la función nsummary().
```Python
>>> a=_
>>> a.nsummary()
0000 Ether / IP / ICMP 10.6.6.1 > 10.6.6.23 echo-request 0 / Raw
0001 Ether / IP / ICMP 10.6.6.23 > 10.6.6.1 echo-reply 0 / Raw
0002 Ether / IP / ICMP 10.6.6.1 > 10.6.6.23 echo-request 0 / Raw
0003 Ether / IP / ICMP 10.6.6.23 > 10.6.6.1 echo-reply 0 / Raw
0004 Ether / IP / ICMP 10.6.6.1 > 10.6.6.23 echo-request 0 / Raw
0005 Ether / IP / ICMP 10.6.6.23 > 10.6.6.1 echo-reply 0 / Raw
0006 Ether / IP / ICMP 10.6.6.1 > 10.6.6.23 echo-request 0 / Raw
0007 Ether / IP / ICMP 10.6.6.23 > 10.6.6.1 echo-reply 0 / Raw
0008 Ether / IP / ICMP 10.6.6.1 > 10.6.6.23 echo-request 0 / Raw
0009 Ether / IP / ICMP 10.6.6.23 > 10.6.6.1 echo-reply 0 / Raw
>>>
```
Para ver los detalles sobre un paquete específico de la serie, consulte el número de línea azul del paquete. No incluya los ceros a la izquierda
```Python
>>> a[2]
<Ether  dst=02:42:0a:06:06:17 src=02:42:2b:2e:4b:4d type=IPv4 |<IP  version=4 ihl=5 tos=0x0 len=84 id=630proto=icmp chksum=0x2453 src=10.6.6.1 dst=10.6.6.23 |<ICMP  type=echo-request code=0 chksum=0xa18b id=0x9w  load='\\x82\\xce\x1ei\x00\x00\x00\x00Ql\x0e\x00\x00\x00\x00\x00\x10\x11\x12\x13\x14\x15\x16\x17\x18\x1!"#$%&\'()*+,-./01234567' |>>>>
```
La salida detallada muestra las capas de información sobre las unidades de datos de protocolo (PDU) que conforman el paquete. Los nombres de las capas de protocolo aparecen en rojo en la salida. Examine las direcciones de origen (src) y de destino (dst), así como la parte de datos sin procesar (load=) del paquete recopilado.a

- Utilice la función wrpcap () para guardar los datos capturados en un archivo pcap que Wireshark y otras aplicaciones pueden abrir. La sintaxis es wrpcap (“nombre de archivo.Pcap", nombre de variable), en este ejemplo, la variable que almacenó la salida es “a”.
```Python
>>> wrpcap("capture1.pcap", a)
```

- El archivo .pcap se escribirá en el directorio de usuarios predeterminado. Utilice una ventana de terminal diferente para verificar la ubicación del archivo capture1.pcap con el comando ls de Linux.
- Abra la captura en Wireshark para ver el contenido del archivo.

## Parte 3: Crear y enviar un paquete ICMP.
ICMP es un protocolo diseñado para enviar mensajes de control entre dispositivos de red para diversos fines. Hay muchos tipos de paquetes ICMP, siendo echo-request y echo-reply los más familiares para los técnicos de TI. Para ver una lista de los tipos de mensajes que se pueden enviar y recibir mediante ICMP, vaya a https://www.iana.org/assignments/icmp-paraámetros/icmp-paraámetros.xhtml.

__Paso 1: use el modo interactivo para crear y enviar un paquete ICMP personalizado__
En una ventana de terminal de Scapy, ingrese el comando para rastrear el tráfico de la interfaz conectada a la red 10.6.6.0/24.
```Python
>>> sniff(iface="br-internal")
```
Abra otra ventana de terminal, introduzca sudo su para realizar la creación de paquetes como raiz. Inicie una segunda instancia de Scapy. Ingrese la función send() para enviar un paquete a 10.6.6.23 con una carga útil de ICMP modificada.
```bash
┌──(kali㉿Kali)-[~]
└─$ sudo su
[sudo] password for kali: 
┌──(root㉿Kali)-[/home/kali]
└─# scapy
```
```Python
>>> send(IP(dst="10.6.6.23")/ICMP()/"This is a test")
.
Sent 1 packets.
```
Regrese a la primera ventana de terminal y presione CTRL-C. Debería recibir una respuesta similar a ésta:
```Python
^C<Sniffed: TCP:0 UDP:0 ICMP:2 Other:0>
``` 
Ingrese el comando de resumen para mostrar el resumen con los números de paquete.
```Python
>>> a=_
>>> a.nsummary()
0000 Ether / IP / ICMP 10.6.6.1 > 10.6.6.23 echo-request 0 / Raw
0001 Ether / IP / ICMP 10.6.6.23 > 10.6.6.1 echo-reply 0 / Raw
```

## Parte 4: Crear y enviar un paquete TCP SYN
En esta parte, utilizará Scapy para determinar si el puerto 445, un puerto compartido de unidad de Microsoft Windows, está abierto en el sistema de destino en 10.6.6.23.

__Paso 1: Inicie la captura de paquetes en la interfaz interna__
En la ventana de terminal Scapy original, comience una captura de paquetes en la interfaz interna conectada a la red 10.6.6.0/24. Utilice el nombre de la interfaz que obtuvo anteriormente.
Navegue hasta la segunda ventana de terminal. Cree y envíe un paquete TCP SYN con el comando que se muestra.
```Python
>>> send(IP(dst="10.6.6.23")/TCP(dport=445, flags="S"))
.
Sent 1 packets.
>>>
```
- Este comando envió un paquete IP al host con la dirección IP 10.6.6.23. El paquete se direcciona al puerto TCP 445 y tiene el indicador S (SYN) activado.
- Cierre la ventana de la terminal.
- 
__Paso 2: Revise los paquetes capturados__
En la ventana de terminal Scapy original, detenga la captura de paquetes presionando CTRL-C. El resultado debe ser similar al que se muestra a continuación.
```Python
^C<Sniffed: TCP:3 UDP:0 ICMP:0 Other:0>
```
Vea los paquetes TCP capturados mediante la función nsummary(). Muestre el detalle del paquete TCP que se devolvió desde el equipo de destino en 10.6.6.23.
```Python
>>> a[número de paquete]
```