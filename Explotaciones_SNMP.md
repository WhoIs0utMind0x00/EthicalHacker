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
La mayoría de los servidores de correo electrónico modernos deshabilitan 
