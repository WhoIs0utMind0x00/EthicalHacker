# Práctica de laboratorio - Enumeración con Nmap

## Topología
<img src="Imagenes/Topologia_nmap.jpeg" width="50%" height="50%" style="border-radius:10px;">

## Objetivos
Nmap es una potente herramienta de código abierto para la asignación y el descubrimiento de redes. En esta práctica de laboratorio, utilizará Nmap como parte de su estrategia de reconocimiento activa.

- Investigar Nmap
- Realizar escaneos básicos de Nmap
## Trasfondo / Escenario
Una captura de Wireshark muestra una actividad inusual en una máquina en la red DMZ 10.6.6.0. Se le ha pedido que realice un reconocimiento activo en la máquina para determinar qué servicios puede ofrecer y si hay aplicaciones vulnerables que podrían presentar problemas de seguridad. La dirección IP de la computadora sospechosa es 10.6.6.23. Tiene acceso a un sistema Kali Linux en la red 10.6.6.0.

## Recursos necesarios
- Kali VM personalizada para el curso de Ethical Hacker

## Parte 1: Investigue Nmap
__Paso 1: Inicie sesión en Kali Linux y verifique el entorno__
- Inicie sesión en el sistema Kali con el nombre de usuario kali y la contraseña kali. Se le presenta el escritorio Kali.
- Abran una ventana del terminal.
- Verifique que Kali tenga una interfaz en la red 10.6.6.0/24 mediante el comando ifconfig.
- Utilice el comando nmap -V para verificar que Nmap esté instalado y para mostrar la versión de Nmap. Debería obtener una salida similar a la que se muestra a continuación.
```bash
┌──(kali㉿Kali)-[~]
└─$ nmap -V
Nmap version 7.94 ( https://nmap.org )
Platform: x86_64-pc-linux-gnu
Compiled with: liblua-5.4.4 openssl-3.0.9 libssh2-1.10.0 libz-1.2.13 libpcre-8.39 libpcap-1.10.4 nmap-libdnet-1.12 ipv6
Compiled without:
Available nsock engines: epoll poll select
```
__Paso 2: Investigue las opciones y funciones de Nmap__ <br>
El uso del comando nmap sin especificar ninguna opción ni destino devuelve una lista de las opciones de Nmap más utilizadas. Para acceder al sistema de ayuda de Nmap, utilice el comando nmap -h. La salida de ayuda se divide en secciones según el tipo de detección que admite la opción.
La página del manual de Nmap proporciona información adicional. Para acceder a la página del manual, introduzca el comando man nmap. Para salir de las páginas del manual, presione q para salir y volver al indicador del terminal.

## Opciones comunes de Nmap

| Opción            | Descripción                                                                                                       |
|-------------------|-------------------------------------------------------------------------------------------------------------------|
| -A                | Escaneo agresivo que permite la detección del SO, detección de versiones, escaneo de scripts y *traceroute*       |
| -O                | Permite la detección del sistema operativo                                                                        |      
| -p                | Permite escanear puertos o rangos de puertos específicos                                                          |
| -sF               | Realiza un escaneo TCP FIN                                                                                        |
| -sn               | Realiza un escaneo de detección de host                                                                           | 
| -sS               | Realiza un escaneo TCP SYN                                                                                        |
| -c                | Realiza un escaneo de TCP Connect                                                                                 |
| -sV               | Sondeos de puertos abiertos para determinar información de servicio / versión                                     |
| -T <0-5>          | Establece la duración del escaneo, números altos producen resultados rápidos, los bajos eluden mejor la detección |
| -v                | Aumenta el nivel de detalle de la salida                                                                          |
| --open            | Solo reporta puertos abiertos (o posiblemente abiertos)                                                           |

## Parte 2: Realizar escaneo básico de Nmap
__Paso 1: Iniciar un escaneo básico de Nmap de la computadora de destino__ <br>
Para escanear rápidamente la DMZ en busca de hosts activos, puede realizar un escaneo de descubrimiento. En un escaneo de detección, el host de escaneo envía una solicitud de eco (ping) de ICMP, un TCP SYN al puerto 443, un TCP ACK al puerto 80 y una solicitud de marca de tiempo de ICMP. Una respuesta a cualquiera de las solicitudes indica que el host está activo y la pila de protocolos IP en el host. Ingrese el siguiente comando para escanear la red DMZ:
```bash
┌──(kali㉿Kali)-[~]
└─$ nmap -sn 10.6.6.0/24
Starting Nmap 7.94 ( https://nmap.org ) at 2025-11-18 09:21 UTC
Nmap scan report for 10.6.6.1
Host is up (0.0010s latency).
Nmap scan report for webgoat.vm (10.6.6.11)
Host is up (0.00010s latency).
Nmap scan report for juice-shop.vm (10.6.6.12)
Host is up (0.00060s latency).
Nmap scan report for dvwa.vm (10.6.6.13)
Host is up (0.00069s latency).
Nmap scan report for mutillidae.vm (10.6.6.14)
Host is up (0.00053s latency).
Nmap scan report for gravemind.vm (10.6.6.23)
Host is up (0.0039s latency).
Nmap scan report for 10.6.6.100
Host is up (0.00052s latency).
Nmap done: 256 IP addresses (7 hosts up) scanned in 2.39 seconds
```
El host 10.6.6.23 se identificó como sospechoso en una captura de Wireshark y es necesario realizar un reconocimiento adicional para descubrir más sobre la computadora y sus servicios. Utilice el comando nmap para ejecutar un escaneo predeterminado en el host de destino
```bash
┌──(kali㉿Kali)-[~]
└─$ nmap 10.6.6.23
Starting Nmap 7.94 ( https://nmap.org ) at 2025-11-18 09:22 UTC
Nmap scan report for gravemind.vm (10.6.6.23)
Host is up (0.00012s latency).
Not shown: 994 closed tcp ports (conn-refused)
PORT    STATE SERVICE
21/tcp  open  ftp
22/tcp  open  ssh
53/tcp  open  domain
80/tcp  open  http
139/tcp open  netbios-ssn
445/tcp open  microsoft-ds

Nmap done: 1 IP address (1 host up) scanned in 0.15 seconds
```
De manera predeterminada, Nmap realiza un escaneo de conexión de los 1000 puertos TCP más comunes. Esto utiliza el software de red del sistema operativo para establecer una conexión TCP completa. Este tipo de escaneo crea una gran cantidad de tráfico de red y aumenta la probabilidad de detección por parte de los servicios de detección de intrusiones. También puede especificar un escaneo de conexión TCP mediante la opción de comando nmap -sT. <br>
La salida del escaneo de conexión incluye los códigos de estado que se muestran en la tabla: <br>
| Estado        | Respuesta recibida                                    | Interpretación                                                                    |
|---------------|-------------------------------------------------------|-----------------------------------------------------------------------------------|
| Abierta       | SYN/ACK de TCP                                        | Hay un servicio a la escucha en el puerto identificado                            |
| Cerrado       | TCP RST                                               | No hay servicio a la escucha en el puerto identificado                            |
| Filtrado      | Sin respuesta o mensaje de destino ICMP inaccesible   | El puerto está siendo filtrado por un *firewall*                                  |

- La opción -O se puede utilizar para determinar más información sobre el sistema operativo que se ejecuta en el host de destino. Algunas opciones de Nmap requieren permisos adicionales y deben ejecutarse como root o con el comando sudo. Para encontrar información del sistema operativo en el host de destino, utilice el comando nmap -O. Introduzca la contraseña kali cuando se le solicite.
```bash
┌──(kali㉿Kali)-[~]
└─$ sudo nmap -O 10.6.6.23
[sudo] password for kali: 
Starting Nmap 7.94 ( https://nmap.org ) at 2025-11-18 09:34 UTC
Nmap scan report for gravemind.vm (10.6.6.23)
Host is up (0.00015s latency).
Not shown: 994 closed tcp ports (reset)
PORT    STATE SERVICE
21/tcp  open  ftp
22/tcp  open  ssh
53/tcp  open  domain
80/tcp  open  http
139/tcp open  netbios-ssn
445/tcp open  microsoft-ds
MAC Address: 02:42:0A:06:06:17 (Unknown)
Device type: general purpose
Running: Linux 4.X|5.X
OS CPE: cpe:/o:linux:linux_kernel:4 cpe:/o:linux:linux_kernel:5
OS details: Linux 4.15 - 5.8
Network Distance: 1 hop

OS detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 1.67 seconds
```
__Paso 2: Obtenga información adicional sobre el host y los servicios__ <br>
Para proporcionar información adicional sobre el equipo de destino, es posible combinar diferentes opciones en una sola línea de comando. El comando anterior identificó varios puertos potencialmente abiertos en el host 10.6.6.23. Puede utilizar -v, -py -sV para encontrar información adicional sobre los servicios que se ejecutan en los puertos abiertos. Este comando proporciona información sobre el servicio FTP que se ejecuta en el puerto 21 del destino en modo detallado, con la sincronización establecida en rápido (-T4):
```bash
┌──(kali㉿Kali)-[~]
└─$ nmap -v -p21 -sV -T4 10.6.6.23
Starting Nmap 7.94 ( https://nmap.org ) at 2025-11-19 04:35 UTC
NSE: Loaded 46 scripts for scanning.
Initiating Ping Scan at 04:35
Scanning 10.6.6.23 [2 ports]
Completed Ping Scan at 04:35, 0.00s elapsed (1 total hosts)
Initiating Connect Scan at 04:35
Scanning gravemind.vm (10.6.6.23) [1 port]
Discovered open port 21/tcp on 10.6.6.23
Completed Connect Scan at 04:35, 0.00s elapsed (1 total ports)
Initiating Service scan at 04:35
Scanning 1 service on gravemind.vm (10.6.6.23)
Completed Service scan at 04:35, 0.01s elapsed (1 service on 1 host)
NSE: Script scanning 10.6.6.23.
Initiating NSE at 04:35
Completed NSE at 04:35, 0.00s elapsed
Initiating NSE at 04:35
Completed NSE at 04:35, 0.00s elapsed
Nmap scan report for gravemind.vm (10.6.6.23)
Host is up (0.0033s latency).

PORT   STATE SERVICE VERSION
21/tcp open  ftp     vsftpd 3.0.3
Service Info: OS: Unix

Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 0.52 seconds
```
La opción -A ejecuta la detección del sistema operativo, la detección de la versión, el escaneo de scripts y el traceroute. El escaneo -A puede ser muy intrusivo y, por lo tanto, será detectado por muchos sistemas IDS, así que asegúrese de tener permiso antes de intentar realizar este escaneo fuera del entorno del laboratorio. Para recopilar más información sobre el servicio FTP, ingrese el comando nmap -p21 -sV -A 10.6.6.23.
```bash
┌──(kali㉿Kali)-[~]
└─$ nmap -p21 -sV -A 10.6.6.23
Starting Nmap 7.94 ( https://nmap.org ) at 2025-11-19 04:36 UTC
Nmap scan report for gravemind.vm (10.6.6.23)
Host is up (0.00098s latency).

PORT   STATE SERVICE VERSION
21/tcp open  ftp     vsftpd 3.0.3
| ftp-syst: 
|   STAT: 
| FTP server status:                                                                                     
|      Connected to 10.6.6.1                                                                             
|      Logged in as ftp                                                                                  
|      TYPE: ASCII                                                                                       
|      No session bandwidth limit                                                                        
|      Session timeout in seconds is 300                                                                 
|      Control connection is plain text                                                                  
|      Data connections will be plain text                                                               
|      At session startup, client count was 3                                                            
|      vsFTPd 3.0.3 - secure, fast, stable                                                               
|_End of status                                                                                          
| ftp-anon: Anonymous FTP login allowed (FTP code 230)                                                   
| -rw-r--r--    1 0        0              16 Aug 13  2021 file1.txt                                      
| -rw-r--r--    1 0        0              16 Aug 13  2021 file2.txt                                      
| -rw-r--r--    1 0        0              29 Aug 13  2021 file3.txt                                      
|_-rw-r--r--    1 0        0              26 Aug 13  2021 supersecretfile.txt                            
Service Info: OS: Unix                                                                                   
                                                                                                         
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .           
Nmap done: 1 IP address (1 host up) scanned in 0.53 seconds
```
Examine el resultado del comando nmap -A. Observe que el resultado indica que se realizó una conexión entre el sistema Kali Linux y el servicio FTP de destino.

__Paso 3: Investigue los servicios para pymes con secuencias de comandos__

El protocolo Server Message Block (SMB) es un protocolo de uso compartido de archivos de red admitido en computadoras con Windows y por SAMBA en Linux. SMB permite que las aplicaciones lean y escriban archivos o soliciten servicios a través de una red. Se puede acceder a recursos compartidos públicos abiertos o dispositivos compartidos, como servidores de impresión en una red, a través de SMB.

El escaneo anterior de puertos abiertos en el equipo de destino indica que los puertos SMB 139 y 445 están abiertos. Encuentre más información sobre estos puertos mediante las opciones de comando -A y -p. La opción -A ejecuta varias funciones, incluida la ejecución de los guiones predeterminados. Especifique más de un puerto para escanear enumerándolos por separado con una coma entre ellos.
```bash
┌──(kali㉿Kali)-[~]                                                                                      
└─$ nmap -A -p139,445 10.6.6.23
Starting Nmap 7.94 ( https://nmap.org ) at 2025-11-19 04:38 UTC                                          
Nmap scan report for gravemind.vm (10.6.6.23)                                                            
Host is up (0.0011s latency).                                                                            
                                                                                                         
PORT    STATE SERVICE     VERSION                                                                        
139/tcp open  netbios-ssn Samba smbd 3.X - 4.X (workgroup: WORKGROUP)                                    
445/tcp open  netbios-ssn Samba smbd 4.9.5-Debian (workgroup: WORKGROUP)                                 
Service Info: Host: GRAVEMIND                                                                            
                                                                                                         
Host script results:                                                                                     
| smb-security-mode:                                                                                     
|   account_used: guest                                                                                  
|   authentication_level: user                                                                           
|   challenge_response: supported                                                                        
|_  message_signing: disabled (dangerous, but default)                                                   
| smb2-security-mode:                                                                                    
|   3:1:1:                                                                                               
|_    Message signing enabled but not required                                                           
| smb-os-discovery:                                                                                      
|   OS: Windows 6.1 (Samba 4.9.5-Debian)
|   Computer name: gravemind
|   NetBIOS computer name: GRAVEMIND\x00
|   Domain name: \x00
|   FQDN: gravemind
|_  System time: 2025-11-19T04:38:20+00:00
| smb2-time: 
|   date: 2025-11-19T04:38:19
|_  start_date: N/A

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 16.27 seconds
```
Examine la información devuelta por el escaneo de Nmap. A partir de esta información, se puede determinar que el equipo de destino es miembro del grupo de trabajo predeterminado, denominado WORKGROUP, y que SMB es compatible con este host a través de SAMBA en Linux.

Nmap contiene el potente motor de secuencias de comandos de Nmap (NSE), que permite la programación de varias opciones de Nmap y acciones condicionales que se tomarán como resultado de las respuestas. NSE tiene secuencias de comandos integradas que enumeran los usuarios, los grupos y los recursos compartidos de la red. Uno de los guiones más utilizados para la detección de pymes es el guion smb-enum-users.nse. Use el guion de Nmap NSE con el comando:
```bash
┌──(kali㉿Kali)-[~]
└─$ nmap --script smb-enum-users.nse -p139,445 10.6.6.23
Starting Nmap 7.94 ( https://nmap.org ) at 2025-11-19 04:40 UTC
Nmap scan report for gravemind.vm (10.6.6.23)
Host is up (0.0016s latency).

PORT    STATE SERVICE
139/tcp open  netbios-ssn
445/tcp open  microsoft-ds

Host script results:
| smb-enum-users: 
|   GRAVEMIND\arbiter (RID: 1001)
|     Full name:   
|     Description: 
|     Flags:       Account disabled, Normal user account, Password not required
|   GRAVEMIND\masterchief (RID: 1000)
|     Full name:   
|     Description: 
|_    Flags:       Account disabled, Normal user account, Password not required

Nmap done: 1 IP address (1 host up) scanned in 0.22 seconds
```
Examine la salida creada por el guion smb-enum-comparte. En el resultado, los nombres de recursos compartidos que terminan con un carácter “$” representan recursos compartidos ocultos que incluyen recursos compartidos del sistema y administrativos.

Hay guiones preprogramados que pueden proporcionar capacidades adicionales de detección de SMB si hay una cuenta de usuario autorizada disponible. Tómese su tiempo e investigue algunos de los scripts (guiones) de NSE que enumeran los sistemas Windows y SAMBA.
