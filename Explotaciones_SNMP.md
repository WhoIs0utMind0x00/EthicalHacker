# Explotaciones de SNMP
El protocolo simple de administración de redes (SNMP) es un protocolo que muchas personas y organizaciones utilizan para administrar dispositivos de red. SNMP utiliza el puerto UDP 161. En las implementaciones de SNMP, cada dispositivo de red contiene un agente SNMP que se conecta con un servidor SNMP independiente (también conocido como administrador SNMP). Un administrador puede utilizar SNMP para obtener información sobre el estado y la configuración de un dispositivo de red, para cambiar la configuración y realizar otras tareas administrativas. Como puede imaginar, esto es muy atractivo para los atacantes porque pueden aprovechar las vulnerabilidades de SNMP para realizar acciones similares de manera maliciosa.<br>
Hay varias versiones de SNMP: Las dos versiones más populares en la actualidad son SNMPv2c y SNMPv3. SNMPv2c utiliza cadenas de comunidad, que son contraseñas que se aplican a un dispositivo de red para permitir que un administrador restrinja el acceso al dispositivo de dos maneras: proporcionando acceso de solo lectura o de lectura/escritura.<br>
La información administrada del dispositivo se mantiene en una base de datos denominada _Base de información de administración (MIB)_.<br>
Un ataque SNMP común implica que un atacante enumere los servicios SNMP y luego verifique las contraseñas SNMP predeterminadas configuradas. Desafortunadamente, este es uno de los principales defectos de muchas implementaciones porque muchos usuarios dejan credenciales SNMP débiles o predeterminadas en los dispositivos de red. SNMPv3 utiliza nombres de usuario y contraseñas y es más seguro que todas las versiones anteriores de SNMP. Sin embargo, los atacantes aún pueden realizar ataques de diccionario y de fuerza bruta contra las implementaciones de SNMPv3. Una implementación más moderna y de seguridad implica el uso de NETCONF con dispositivos de infraestructura más nuevos (como enrutadores y conmutadores).<br>
Puede aprovechar los scripts del motor de scripts de Nmap (NSE) para recopilar información de dispositivos habilitados para SNMP y forzar credenciales débiles. En Kali Linux, los scripts de NSE se encuentran en _/usr/share/nmap/scripts_ de manera predeterminada.
<!-- cd /usr/share/nmap/scripts -->
<!--  ls -l snmp* -->
```bash
 ```
 Además de los scripts de NSE, puede utilizar la herramienta __snmp-check__ para realizar un _SNMP walk_ a fin de recopilar información sobre los dispositivos configurados para SNMP.

 # Explotaciones de SMTP
 Los atacantes pueden aprovechar servidores SMTP inseguros para enviar correo electrónico no deseado y realizar suplantación de identidad (_phishing_) y otros ataques basados en el correo electrónico. SMTP es un protocolo de servidor a servidor, que es diferente de los protocolos de cliente/servidor, como POP3 o IMAP.<br>
 ## Relés abiertos SMTP
 _SMTP retransmisión abierta_ es el término utilizado para un servidor de correo electrónico que acepta y retransmite correos electrónicos de cualquier usuario. Es posible abusar de estas configuraciones para enviar correos electrónicos falsificados, correo electrónico no deseado, phishing y otras estafas relacionadas con el correo electrónico. Nmap tiene un script NSE para probar las configuraciones de retransmisiones abiertas.<br>
 _Secuencia de comandos de NSE de retransmisión abierta de SMTP_<br>
 <!-- cd /usr/share/nmap/scripts -->
 <!-- nmap --script smtp-open-relay.nse 10.1.2.14 -->
 ## Comandos SMTP útiles
 Varios comandos SMTP pueden ser útiles para realizar una evaluación de seguridad de un servidor de correo electrónico. Los siguientes son algunos ejemplos:
 - __HELO__: Se utiliza para iniciar una conversación SMTP con un servidor de correo electrónico. El comando va seguido de una dirección IP o un nombre de dominio, por ejemplo _HELO 10.1.2.14_.
 - __EHLO__: Se utiliza para iniciar una conversación con un servidor SMTP extendido (ESMTP). Este comando se utiliza de la misma manera que _HELO_.
 - __STARTTLS__: Se utiliza para iniciar una conexión de segurida de la capa de transporte (TLS) a un servidor de correo electrónico.
 - __RCPT__: Se utiliza para indicar la dirección de correo electrónico del destinatario.
 - __DATA__: Se utiliza para iniciar la transferencia del contenido de un mensaje de correo electrónico.
 - __RSET__: Se utiliza para restablecer (cancelar) una transacción de correo electrónico.
 - __MAIL__: Se utiliza para indicar la dirección de correo electrónico del remitente.
 - __QUIT__: Se utiliza para cerrar una conexión.
 - __HELP__: Se utiliza para mostrar un menú de ayuda (si está disponible).
 - __AUTH__: Se utiliza para autenticar un cliente en el servidor.
 - __VRFY__: Se usa para verificar si existe la casilla de correo de un usuario.
 - __EXPN__: Se utiliza para solicitar o expandir una lista de correo en el servidor remoto.
<!-- telnet 192.168.78.8 25 -->
_El comando SMTP **VRFY**_<br>
```bash
```
La herramienta __smtp-user-enum__ le permite automatizar estos pasos de recopilación de información.
_Uso de la herramienta smtp-user-enum_
```bash
```
La mayoría de los servidores de correo electrónico modernos deshabilitan los comandos __VRFY__ y __EXPN__. Se recomienda que desactive estos comandos SMTP. Los cortafuegos modernos también ayudan a proteger y bloquear cualquier intento de conexión SMTP con estos comandos.<br>
_Enumeración de un usuario con la herramienta **smtp-user-enum**_<br>
<!-- smtp-user-enum -M VRFY -u [usuario] -t 192.168.78.8 -->
```bash
```
## Explotaciones conocidas del servidor SMTP
Es posible aprovechar las explotaciones que se han creado para aprovechar las vulnerabilidades conocidas relacionadas con SMTP.<br>
_Uso de **searchsploit** para encontrar explotaciones SMTP conocidas_
<!-- searchsploit smtp -->
```bash
```
# Explotaciones de FTP
Los atacantes suelen abusar de los servidores FTP para robar información. El protocolo FTP heredado no utiliza cifrado ni realiza ningún tipo de validación de integridad. La práctica recomendada dicta que implemente una alternativa más segura, como SFTP o FTPS.<br>
Los protocolos SFTP y FTPS utilizan cifrado para proteger los datos; sin embargo, algunas implementaciones, como _Blowfish_ y _DES_, ofrecen cifrados débiles (algoritmos de cifrado). Debe utilizar algoritmos más sólidos, como _AES_. De manera similar, los servidores SFTP y FTPS utilizan algoritmos de hash para verificar la integridad de la transmisión de archivos. SFTP usa SSH y FTPS sobr TLS. Las mejores prácticas exigen deshabilitar los protocolos de hash débiles, como MD5 o SHA-1, y usar algoritmos más solidos en la familia SHA-2 (como SHA-2 o SHA-512).<br>
Además los servidores FTP a menudo permiten la autenticación de usuarios anónimos, de la que un atacante puede abusar para almacenar archivos no deseados en su servidor, potencialmente para la exfiltración. Por ejemplo, un atacante pone en riesgo un sistema y extrae información confidencial, puede almacenar esa información en cualquier servidor FTP que pueda estar disponible y permitir que cualquier usuario se conecte mediante una cuenta anónima.<br>
_Uso de Nmap para escanear un servidor FTP_<br>
<!-- nmap -sV 172.16.20.136 -->
```bash
```
_Verificación de inicio de sesión anónimo de FTP con Metasploit_<br>
<!-- metasploit > use auxiliary/scanner/ftp/anonymous -->
<!-- set RHOSTS 172.16.20.136 > exploit -->
```bash
```
La mitigación de este ejemplo es editar el archivo de configuración del servidor FTP para deshabilitar el inicio de sesión anónimo. En este ejemplo, el servidor está usando vsFTPd y, por lo tanto, el archivo de configuración se encuentra en _/etc/vsftpd.conf_. Los siguientes son varios procedimientos recomendados adicionales para mitigar el abuso y los ataques al servidor FTP:

- Utilice contraseñas seguras y autenticación multifactor. Una buena práctica es utilizar una buena administración de credenciales y contraseñas seguras. Cuando sea posible, utilice la autenticación de dos factores para cualquier servicio o servidor crítico.
- Implemente la seguridad de archivos y carpetas, asegurándose que los usuarios tengan acceso a solo los archivos a los que tienen derecho.
- Utilizar el cifrado en reposo, es decir, cifrar todos los archivos almacenados en el servidor FTP.
- Bloquear cuentas de administración. Debe restringir los privilegios de administrador a una cantidad limitada de usuarios y exigirles que utilicen la autenticación de varios factores. Además, no utilice nombres de usuario de administrador comunes como _root_ o _admin_.
- Mantenga actualizado el software del servidor FTPS o SFTP.
- Utilice los cifrados validados FIPS 140-2 del gobierno de EE. UU. para obtener orientación general sobre qué algoritmos de cifrado utilizar.
- Mantenga la base de datos back-end en un servidor diferente al servidor FTP.
- Requerir la reautenticación de las sesiones inactivas.

# Ataques de tipo _Pass-the-Hash_
Todas las versiones de Windows almacenan las contraseñas como hashes en un archivo denominado _Administrador de cuentas de seguridad (SAM)_. El sistema operativo no sabe cuál es la contraseña real porque almacena solo un hash de la contraseña. En lugar de utilizar un algoritmo de hash conocido. Microsoft creó su propia implementación que se ha desarrollado a lo largo de los años.<br>
Microsoft también tiene un conjunto de protocolos de seguridad para la autenticación, denominado New Technology LAN Manager (NTLM). NTLM tenía dos versiones: NTLMv1 y NTLMv2. Desde Windows 2000, Microsoft ha utilizado Kerberos en dominios de Windows. Sin embargo, NTLM aún se puede usar cuando el cliente se autentica en un servidor a través de una dirección IP o si un cliente se autentica en un servidor en un bosque de Active Directory (AD) diferente configurado para la confianza  de NTLM en lugar de una confianza transitiva entre bosques. Además, es posible que NTLM se siga usando si el cliente se autentica en un servidor que no pertenece a un dominio o si la comunicación Kerberos está bloqueada por un cortafuego.<br>
Entonces, __¿Qué es un ataque de transferencia de hash?__ Debido a que los hash de contraseña no se pueden revertir, en lugar de intentar averiguar cuál es la contraseña del usuario, un atacante puede usar un hash de contraseña recopilado de un sistema comprometido y luego usar el mismo hash para iniciar sesión en otro sistema cliente o servidor.<br>
_Ataque de transferencia de hash_<br>

<img src="Imagenes/pass_hash.jpeg" width="35%" height="35%" style="border-radius:10px;"><br>

El sistema operativo Windows y las aplicaciones de Windows piden a los usuarios que ingresen sus contraseñas cuando inician sesión. Luego, el sistema convierte las contraseñas en hashes (en la mayoría de los casos, mediante una API llamada LsaLogonUser). Un ataque de transferencia de hash evita este proceso y simplemente envía el hash al sistema para la autenticación.<br>
__CONSEJO__: _Mimikatz_ es una herramienta utilizada por muchos evaluadores de penetración, atacantes e incluso malware que puede ser útil para recuperar hashes de contraseñas de la memoria; es una herramienta posterior a la explotación muy útil. Puede descargar la herramienta desde el [Repositorio Mimikatz](https://github.com/gentilkiwi/mimikatz). Metasploit también incluye Mimikatz como un script de Meterpreter para facilitar la explotación sin la necesidad de cargar ningún archivo al disco del host comprometido. Puede encontrar más información en [Integración de Mimikatz / Metasploit](https://www.offensive-security.com/metasploit-unleashed/mimikatz/).

# Ataques basados en _Kerberos_ y _LDAP_
Kerberos es un protocolo de autenticación definido en RFC 4120 que Windows ha utilizado durante varios años. Kerberos también se utiliza en numerosas aplicaciones y otros sistemas operativos. El sitio web del Consorcio de Kerberos proporciona información detallada en [Kerberos](https://kerberos.org). Una implementación de Kerberos contiene tres elementos básicos:
- Cliente
- Servidor
- Centro de distribución de claves (KDC), que incluye el servidor de autenticación y el servidor de concesión de tiquetes.<br>
_Pasos de la autenticación Kerberos_<br>
<img src="Imagenes/auth_kerb.jpeg" width="35%" height="35%" style="border-radius:10px;">

__Paso 1__. El cliente envía una solicitud al servidor de autenticación dentro del KDC.
__Paso 2__. El servidor de autenticación envía una clave de sesión y un tiquete de concesión de tiquetes (TGT) que se utiliza para verificar la identidad del cliente.
__Paso 3__. El cliente envía el TGT al servidor de concesión de tiquetes.
__Paso 4__. El servidor de concesión de tiquetes genera y envía un tiquete al cliente.
__Paso 5__. El cliente presenta el tiquete al servidor.
__Paso 6__. El servidor concede acceso al cliente.

Active Directory utiliza el Protocolo ligero de acceso a directorios (LDAP) como protocolo de acceso. La implementación de LDAP de Windows admite la autenticación Kerberos. LDAP utiliza una estructura jerárquica de árbol invertido denominada árbol de información de directorio (DIT). En LDAP, cada entrada tiene una posición definida. El nombre distinguido (DN) representa la ruta completa de la entrada.<br>
Uno de los ataques más comunes es el ataque del tiquete de oro de Kerberos. Un atacante puede manipular los tiquetes Kerberos basándose en los hashes disponibles comprometiendo un sistema vulnerable y obteniendo las credenciales de usuario local y los hashes de contraseña. Si el sistema está conectado a un dominio, el atacante puede identificar un hash de contraseña de Kerberos (KRBTGT) para obtener el tiquete dorado.<br>
__CONSEJO__: _Empire_ es una herramienta popular que se puede usar para realizar tiquetes de oro y muchos otros tipos de ataques. Empire es básicamente un marco de trabajo posterior a la explotación que incluye un agente de Windows puro de PowerShell y un agente de Python. Puede descargar Empire y acceder a demostraciones, presentaciones y documentación en [Repositorio Empire](https://github.com/BC-SECURITY/Empire).<br>
_La herramienta Empire_<br>
<!-- Empire -->
<!--(Empire) > use module powershell/credentials/mimikatz/golden_ticket -->
```bash
```
Un ataque similar es el ataque del _tiquete de plata de Kerberos_. Los tiquetes plateados son tiquetes de servicio falsificados para un servicio determinado en un servidor en particular. El sistema de archivos de Internet común (CIFS) de Windows le permite acceder a archivos en un servidor en particular y el servicio HOST le permite ejecutar __schtasks.exe__ o Instrumentación de administración de Windows (WMI) en un servidor determinado. Para crear un tiquete plateado, necesita la cuenta del sistema (que termina en __$__), el identificador de seguridad (SID) para el dominio, el nombre de dominio completo y el servicio proporcionado (por ejemplo, CIFS, HOST). También puede utilizar herramientas como Empire para obtener la información relevante de un volcado de Mimikatz para un sistema comprometido.
Otra debilidad en las implementaciones de Kerberos es el uso de la delegación de Kerberos sin restricciones. La delegación de Kerberos es una función que permite que una aplicación reutilice las credenciales del usuario final para acceder a los recursos alojados en un servidor diferente. Por lo general, debe permitir la delegación de Kerberos solo si el servidor de aplicaciones es de confianza; sin embargo, permitirlo podría tener consecuencias de seguridad negativas si se abusa y, por lo tanto, la delegación de Kerberos no está habilitada de manera predeterminada en Active Directory.

# _Kerberoasting_
Otro ataque contra las implementaciones basadas en Kerberos es Kerberoasting. Es una actividad posterior a la explotación que un atacante utiliza para extraer hashes de credenciales de cuentas de servicio de Active Directory para el descifrado fuera de línea. Es un ataque generalizado que explota una combinación de implementaciones de cifrado débiles y prácticas de uso de contraseñas inadecuadas. El kerberoasting puede ser un ataque eficaz porque el actor de la amenaza puede extraer los hashes de las credenciales de la cuenta de servicio sin enviar ningún paquete IP a la víctima y sin tener credenciales de administrador de dominio.

# Ataques en ruta
En un _ataque en ruta_ (anteriormente conocido como Man-in-the-Middle [MITM]), el atacante se coloca entre la línea entre dos dispositivos o personas que se comunican para escuchar a escondidas (es decir, robar datos confidenciales) o manipular los datos que se transfieren (por ejemplo, mediante la corrupción o la modificación de datos). Los ataques en ruta pueden ocurrir en la capa 2 o en la capa 3.<br>
_Ataque en ruta_<br>

<img src="Imagenes/mitm.jpeg" width="35%" height="35%" style="border-radius:10px;">

## Suplantación de ARP y envenenamiento de caché ARP
Es un ejemplo de ataque que conduce a un escenario de ataque en ruta. Un ataque de suplantación de ARP puede apuntar a hosts, conmutadores y enrutadores conectados a una red de capa 2 enevenenando los cachés ARP de los sistemas conectados a la subred e interceptando el tráfico destinado a otros hosts en la subred. El atacante falsifica las direccipnes MAC de la capa 2 para que la víctima crea que la dirección de la capa 2 del atacante es la dirección de la capa 2 de su puerta de enlace predeterminada (10.2.3.4). Los paquetes que se supone que van a la puerta de enlace predeterminada son reenviados por el conmutador a la dirección de capa 2 del atacante en la misma red. El atacante puede reenviar los paquetes IP al destino correcto para permitir que el cliente acceda al servidor web (10.2.66.77).

## Suplantación de control de acceso a medios (MAC)
Es un ataque en el que un actor de amenazas suplanta la dirección MAC de otro dispositivo (generalmente un dispositivo de infraestructura, como un enrutador). La dirección MAC suele ser una dirección codificada en un controlador de interfaz de red. En entornos virtuales, la dirección MAC podría ser una dirección virtual (es decir, no asignada a un adaptador físico). Un atacante podría falsificar la dirección MAC de los sistemas físicos o virtuales para eludir las medidas de control de acceso o realizar un ataque en la ruta.

__NOTA__: Una mitigación común para los ataques de envenenamiento de caché ARP es utilizar la inspección del protocolo de resolución dinámica de direcciones (DAI) en los conmutadores para evitar la suplantación de las direcciones de la capa 2.<br>
Otro ejemplo de ataque en ruta de capa 2 implica colocar un conmutador en la red y manipular el protocolo de árbol de expansión (STP) para convertirlo en el conmutador raíz. Este tipo de ataque puede permitir que un atacante vea cualquier tráfico que deba enviarse a través del conmutador raíz.<br>
Un atacante puede llevar a cabo un ataque en ruta en la capa 3 colocando un enrutador dudoso en la red y luego engañando a los otros enrutadores para que crean que este nuevo enrutador tiene una mejor ruta que otros enrutadores. También es posible realizar un ataque en ruta comprometiendo el sistema de la víctima e instalando malware que pueda interceptar los paquetes enviados por la víctima. El malware puede capturar paquetes antes de cifrarlos si la víctima utiliza SSL/TLS/HTTPS o cualquier otro mecanismo. Una herramienta de ataque llamada _SSLStrip_ utiliza la funcionalidad en ruta para ver de manera transparente el tráfico HTTPS, secuestrarlo y devolver enlaces HTTP no cifrados al usuario en respuesta. Esta herramienta fue creada por un investigador de seguridad llamado Moxie Marlinspike. Puede descargar la herramienta desde el [Repositorio SSLStrip](https://github.com/moxie0/sslstrip).<br>

Las siguientes son algunas recomendaciones de seguridad adicionales de capa 2 para proteger su infraestructura:

- Seleccione una VLAN no utilizada (que no sea VLAN1) y utilícela como VLAN nativa para todos sus enlaces troncales. No use esta VLAN nativa para ninguno de sus puertos de acceso habilitados. Evite el uso de la VLAN1 en cualquier lugar porque es la predeterminada.
- Configurar administrativamente puertos de conmutador como puertos de acceso para que los usuarios no puedan negociar un enlace troncal; también deshabilita la negociación de enlaces troncales (es decir, no permite el protocolo de enlace troncal dinámico [DTP]).
- Limite la cantidad de direcciones MAC aprendidas en un puerto determinado mediante la función de seguridad de puertos.
- Controle el árbol de expansión para evitar que los usuarios o dispositivos desconocidos lo manipulen. Puede hacerlo mediante las funciones BPDU Guard y Root Guard.
- Desactive el Protocolo de Detección de Cisco (CDP) en los puertos que enfrentan redes desconocidas o no confiables que no requieren CDP para nada positivo. (CDP opera en la capa 2 y puede proporcionar a los atacantes inforamción que preferiría no divulgar).
- En un conmutador nuevo, apaque todos los puertos y asígnelos a una VLAN que no se use para nada más que un punto muerto. Luego, abra los puertos y asigne las VLAN correctas a medida que los puertos se asignan y se necesitan.
- Utilice __Root Guard__ para controlar qué puertos no pueden convertirse en puertos raíz para conmutadores remotos.
- Utilice DAI.
- Utilice IP Source Guard para evitar la suplantación de información de capa 3 por parte de los hosts.
- Implemente 802.1X cuando sea posible para autenticar y autorizar a los usuarios antes de permitirles comunicarse con el resto de la red.
- Utilice la detección del Protocolo de configuración dinámica de host (DHCP Snooping) para evitar que los servidores DHCP dudosos afecten la red.
- Utilice el control de tormentas para limitar la cantidad de tráfico de difusión o multidifusión que fluye a través de un conmutador. Un atacante podría realizar un ataque de _paquete de tormenta_ (o _tormenta de difusión_) para causar una condición DoS. El atacante hace esto enviando transmisiones excesivas de paquetes IP (a menudo tráfico de difusión) en una red.
- Implemente listas de control de acceso (ACL), como las ACL de capa 3 y capa 2, para el control del tráfico y la aplicación de políticas.

## Ataques de degradación
En un ataque de degradación, un atacante obliga al sistema a favorecer un protocolo de cifrado débil o un algoritmo de hash que puede ser susceptible a otras vulnerabilidades. Un ejemplo de vulnerabilidad y ataque de degradación es la vulnerabilidad de relleno de Oracle en cifrado heredado degradado (POODLE) en OpenSSL, que permitió al atacante negociar el uso de una versión inferior de TLS entre el cliente y el servidor. Puede encontrar más información en [Vulnerabilidad POODLE](https://www.cisa.gov/news-events/alerts/2014/10/17/ssl-30-protocol-vulnerability-and-poodle-attack).
POODLE era una vulnerabilidad específica de OpenSSL y ha sido parcheada desde 2014. Sin embargo, en la práctica, la eliminación de la compatibilidad con versiones anteriores suele ser la única forma de evitar otros ataques o fallas de degradación.

