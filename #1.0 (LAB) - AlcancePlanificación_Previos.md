# Alcance y planificación previos al compromiso

## Topología
<img src="Imagenes/Topologia.jpeg" width="450" height="300">

## Tabla de direccionamiento: Centro de datos
| Servidores        | VLAN          | Dirección IP          | 172.16.33.0/30                |
|-------------------|---------------|-----------------------|-------------------------------|
| Administración    | 2 - 5         | 172.24.1.0/24         | (4) 255.255.255.192           |
| Soporte de Amazon | 10 - 25       | 172.25.0.0/16         | (11) 255.255.252.0            |
| Operaciones       | 50 - 55       | 172.26.0.0/21         | (5) 255.255.255.0             |
| Logística         | 80 - 85       | 172.27.0.0/21         | (5) 255.255.255.0             |
| Administración    | 100 - 110     | 172.30.0.0/16         | Varios según sea necesario    |

## Tabla de direccionamiento: LAN
| Departamento              | VLAN          | Dirección IP          | Máscara de subred             |
|---------------------------|---------------|-----------------------|-------------------------------|
| Administración            | 120           | 172.16.1.0            | 255.255.255.0                 |
| Subred                    | 130           | 172.16.4.0            | 255.255.255.0                 |
| TI                        | 140           | 172.16.8.0            | 255.255.255.0                 |
| Depósito                  | 150           | 172.16.12.0           | 255.255.255.0                 |
| Atención al Cliente       | 160           | 172.16.16.0           | 255.255.255.0                 |
| Envío                     | 170           | 172.16.20.0           | 255.255.255.0                 |

## Objetivos
Obtener un acuerdo sobre las reglas de enfrentamiento que se aplican a una prueba de penetración o auditoría de seguridad es el primer paso en cualquier compromiso con un cliente. Es importante dedicar tiempo a garantizar que tanto su empresa como el cliente tengan una comprensión clara de los términos y el alcance del trabajo de prueba.

- Crea un alcance de la prueba de penetración y planifica un documento que aborde los requisitos para los serviios de pruebas de penetración que se recopilaron del cliente.
- Determinar las reglas de los elementos del compromiso.

## Trasfondo / Escenario
Se estableció contacto con su empresa para realizar una auditoría de seguridad para Nexus Plaza, una empresa minorista en línea. Se le ha asignado para ayudar al auditor líder a desarrollar el alcance del trabajo de prueba. Utilice el diagrama de red y la transcripción de la entrevista con el CEO de la empresa y el director de TI para completar la Hoja de trabajo del alcance.

__Entrevista con CEO y director de TI__

__CEO__: Bienvenido a Nexus Plaza. Lo invitamos a iniciar nuestro compromiso y analizar lo que esperamos de esta auditoría de seguridad. Estamos ansiosos por garantizar que nuestra infraestructura de seguridad cumpla o supere las salvaguardas necesarias. Le pasaré esto a nuestro director de TI para que describa nuestro entorno de red.

__Director de TI__: Como sabe, somos principalmente una empresa minorista en línea. Nuestros sitios de comercio electrónico orientados al cliente se alojan en Amazon, pero todas nuestras comunicaciones, almacenamiento y servicios de TI de envío se manejan internamente. Operamos un centro de datos local en Houston que respalda nuestras instalaciones de fabricación y almacenamiento. Actualmente hay 25 servidores separados en tres clústeres: administración, operaciones y logística. Además, operamos un clúster que brinda soporte para nuestra tienda de Amazon. El acceso remoto a estos sistemas se realiza a través de SSL o IPsec VPN. Usamos dos ISP para conectarnos a Internet, pero uno se usa principalmente para las comunicaciones con Amazon para admitir pedidos en tiempo real, inventario y contacto con clientes.

__CEO__: Recientemente, uno de nuestros competidores sufrió un ataque de ransomware dirigido a su sistema de inventario de producción. Perdieron una cantidad significativa de pedidos de clientes debido a que no podían recoger y enviar el inventario a tiempo. Nos preocupa que nuestros sistemas de depósito y envío puedan tener vulnerabilidades que podrían cerrarnos de manera similar si se produce una infracción. Cuando depende de una entrega rápida a los clientes, cualquier demora es un desastre.

__Director de TI__: Los sistemas que soportan nuestro almacenamiento y envío se encuentran en dos clústeres en el centro de datos: operaciones y logística. El acceso interno a estos sistemas está restringido al personal de administración del almacén, el personal de TI y los empleados de control de inventario. Nuestro sistema de control de inventario es compatible con una base de datos Microsoft SQL Server. Como puede ver en el diagrama, la base de datos SQL se aloja en una SAN separada con conexiones tanto al almacén como a los sistemas de producción. Nuestro negocio depende de nuestro acceso a Amazon; por lo tanto, ninguna prueba debe invadir los clústeres de centros de datos que contienen los datos y el inventario de la tienda de Amazon. Estos se identifican en el diagrama.

__CEO__: Queremos que pruebe los controles de seguridad para garantizar que un atacante que obtenga correctamente el acceso a una cuenta de usuario final y una computadora dentro del depósito no pueda obtener acceso de administrador a ninguno de los servidores o tener acceso al inventario de producción base de datos. También queremos asegurarnos de que el software y los sistemas operativos estén actualizados y que no haya vulnerabilidades conocidas en nuestras aplicaciones.

__Director de TI__: le brindaremos acceso interno a través de una VLAN aislada dentro del departamento de TI desde la que podrá realizar las pruebas. Hay un cortafuego con IDS integrado que separa las redes del centro de datos de la LAN corporativa, incluido el departamento de TI. Dentro del centro de datos, cada servidor tiene un cortafuego local habilitado. El DNS interno se proporciona a través de los servicios de Microsoft Active Directory y el DNS externo es un servidor Linux ubicado en una DMZ separada. El acceso externo a los clústeres de operaciones y logística se limita a los empleados que se conectan a través de VPN. No se permite el acceso HTTP a estos clústeres. Los servidores de estos dos clústeres no tienen acceso a Internet, excepto para obtener actualizaciones de software automáticas.

__CEO__: Debido a que los sistemas que queremos que pruebe son sistemas de producción, esperamos limitar al mínimo las interrupciones causadas por las pruebas. Le daremos acceso a un sistema de desarrollo Microsoft SQL Server que está configurado de manera idéntica al sistema de producción con un espejo de la base de datos.

__Director de TI__: Sí, quiero reforzar la necesidad de mantener las interrupciones al mínimo. Le daremos un intervalo de tiempo durante nuestro período de mantenimiento programado normal para realizar pruebas de carga y simulaciones de ataques de denegación de servicio. Nuestro período de mantenimiento programado es entre las 2:00 a. M. Y las 6:00 a. M. Los viernes, sábados y domingos. Se pueden ejecutar otras pruebas no disruptivas durante el horario comercial normal.

__CEO__: Estamos limitando la cantidad de personal de TI que está al tanto de las pruebas. Solo se notificará al personal de TI directamente responsable del monitoreo de las operaciones y los sistemas de logística cuando se realizarán las pruebas. Proporcionaremos una lista de direcciones de correo electrónico del personal de operaciones y depósitos, ya que nos preocupa que la mayoría de los ransomware y las infracciones de datos comiencen con un ataque de ingeniería social exitoso. Los usuarios finales no se darán cuenta de que se están realizando las pruebas. Esperamos que el compromiso comience dos semanas después de la firma del contrato y el acuerdo de confidencialidad. Esperamos el informe final en un plazo de 60 días.

Tus contactos principales para esta interacción son el director de TI, el gerente de depósito y el gerente de operaciones. Programa un informe de actualización semanal y una teleconferencia para informarles sobre el progreso de las pruebas y los resultados intermedios.


### Parte 1: Determina el alcance del compromiso

__Paso 1: Analiza la información obtenida del cliente__
- Revisa la información obtenida en la entrevista con el CEO y el director de TI del cliente.
- Identifica los puntos que influyen en el alcance del proyecto y las reglas para entablar combate.

__Paso 2: Completa la hoja de trabajo del alcance__
Utiliza la información que identificaste en la transcripción de la entrevista par completar la Hoja de trabajo del alcance.

## Hoja de trabajo del alcance
Para determinar el alcance y las reglas de participación del proyecto de pruebas de penetración, responde las preguntas en función de los resultados del análisis de la entrevista.

1. __¿Cuáles son las mayores preocupaciones de seguridad del cliente?__

    Que los sistemas de inventario y envío pueden estar expuestos a ataques de ransomware y entonces la empresa no podrá cumplir con los pedidos de manera oportuna.


2. __¿Qué clústeres de servidores, rangos de direcciones de red o aplicaciones específicos deben probarse?__

    De operaciones y logística. Rangos de direcciones IP 172.26.0.0/21 y 172.27.0.0/21. Las aplicaciones de Microsoft SQL Server.

3. __¿Qué clústeres de servidores, rangos de direcciones de red o aplicaciones específicos NO deben probarse explícitamente?__

    De administración y soporte de Amazon, y los rangos de direcciones IP de la LAN

4. __¿La prueba se realizará en un entorno de producción en vivo o en un entorno de prueba?__

    La mayoría en sistemas de producción. Solo se realizarán pruebas intrusivas de SQL Server en sistemas de desarrollo

5. __¿La prueba de penetración incluirá pruebas de red internas? Si es así, ¿cómo se obtendrá el acceso?__

    Sí, el acceso se proprociona a través de una VLAN en la red interna

6. __¿Los sistemas de cliente / usuario final se incluyen en el alcance? Si es así, ¿cómo se aprovecharán los clientes?__

    No, no están en el alcance

7. __¿Está permitida la ingeniería social? Si es así, ¿es limitado?__

    Sí, pero se limita a una lista específica de correos electrónicos

8. __¿Se permiten la denegación de servicio y otros ataques disruptivos? Si es así, ¿hay límites respecto de cuándo se pueden realizar las pruebas disruptivas?__

    Sí, se pueden intentar durante un periodo de tiempo programado en los periodos de mnantenimiento normales

9.  __¿Existen dispositivos que puedan afectar los resultados de una prueba de penetración? De ser así, ¿Cuáles?__

    Sí, están los cortafuegos y los sistemas IDS

10. __¿Probar el acceso inalámbrico es parte de este compromiso?__

    No, está fuera de alcance

11. __¿Los servicios web están incluidos en el alcance de las pruebas?__

    No, no están incluidos

12. __¿Los empleados conocen las pruebas y el plazo en que se realizarán?__

    No, solo los administradores y el personal de TI seleccionado

13. __¿Dónde se encuentra físicamente el centro de datos del cliente?__

    En Houston

### Parte 2: Determina las reglas del compromiso

__Paso 1: Revisa la información de la hoja de trabajo del alcance__

| Reglas de los elementos del compromiso                                            | Valor                                                         |
|-----------------------------------------------------------------------------------|---------------------------------------------------------------|
| Prueba de línea de tiempo                                                         | Comienza en dos semanas, informe en 60 días                   |                            
| Ubicación de la prueba                                                            | Instalaciones de Houston                                      |
| Ventanas de tiempo para la prueba (horas del día)                                 | Pruebas no invasivas durante el horario comercial <br> Pruebas invasivas durante el horario de 2 a 6 AM de viernes a domingo  |
| Método de comunicación preferido                                                  | Informes o teleconferencias                                   |
| Controles de seguridad que potencialmente podrían detectar o evitar las pruebas   | Cortafuegos e IDS implementados                               |
| Manejo de datos sensibles                                                         | Acuerdo de confidencialidad firmado                           |
| Direcciones IP o redes desde las que se originarán las pruebas                    | VLAN interna del departamento de TI                           |
| Tipos de pruebas permitidas o no permitidas                                       | Pruebas limitadas a servidores de operaciones y logística. Pruebas de SQL limitadas al entorno de desarrollo. Ingeniería social limitada a las direcciones de correo electrónico proporcionadas   |
| Contactos del cliente                                                             | Gerente de almacén, director de TI, gerente de operaciones    |