# Ataques de Ingeniería Social
Un ataque de ingeniería social aprovecha el eslabón más débil de una organización, que es el usuario humano. Si un atacante puede lograr que un usuario revele información, es mucho más fácil para el atacante causar daño que utilizando algún otro método de reconocimiento. La ingeniería social se puede lograr a través del correo electrónico o la dirección incorrecta de páginas web y se puede solicitar al usuario que haga clic en algo para que el atacante obtenga información. La ingeniería social también puede realizarse en persona por un interno o una entidad externa o por teléfono.

Un ejemplo principal son los atacantes que aprovechan el comportamiento normal de los usuarios. Supongamos que es un profesional de seguridad a cargo de los cortafuegos de red y otros equipos de infraestructura de seguridad de su empresa. Un atacante podría publicar una oferta de trabajo para un puesto muy lucrativo y hacerlo muy atractivo para usted, la víctima. Supongamos que la descripción del trabajo enumera beneficios y compensaciones mucho más allá de lo que gana en su empresa. Decide postularse para el puesto. El delincuente (atacante) programa una entrevista con usted. Debido a que es probable que “muestre” sus habilidades y trabajo, el atacante puede lograr que le explique cómo ha configurado los cortafuegos y otros dispositivos de infraestructura de red para su empresa. Puede divulgar información sobre los cortafuegos utilizados en su red, cómo los ha configurado, cómo se diseñaron, etc. Esto le daría al atacante mucho conocimiento sobre la organización sin requerir que el atacante realice ningún tipo de escaneo o reconocimiento en la red.

## Suplantación de identidad de correo electrónico (_Phishing_)

Con la *suplantación de identidad (phishing)*, un atacante presenta a un usuario un enlace o un archivo adjunto que parece un recurso válido y confiable. Cuando el usuario hace clic en él, se le solicita que revele información confidencial, como su nombre de usuario y contraseña.
_Ejemplo de **phishing**_
```
Asunto: CONFIRMACIÓN DE PAGO

Mensaje:

Estimado señor,
Hemos descubierto que nuestro departamento de contabilidad se demora ocasionalmente en realizar los pagos completos a nuestros proveedores.
Esto ha provocado una reducción indebida de nuestras existencias y de nuestro departamento de producción, cuyos proveedores no entregan los materiales a tiempo.
El propósito de esta carta es confirmar si se ha realizado o no el pago de los suministros adjuntos recibidos.
Por favor, confirme la recepción y avísenos.

Attachment: SD_085_085_pdf.xz / SD_085_085_pdf.exe
MD5 Checksum of the attachment: 0x8CB6D923E48B51A1CB3B080A0D43589D
```
## Suplantación de identidad focalizada (_Spear phishing_)
*Spear phishing* es un intento de suplantación de identidad dirigido, construido de una manera muy específica y dirigido directamente a grupos específicos de personas o empresas. El atacante estudia a la víctima y la organización de la víctima para poder hacer que los correos electrónicos parezcan legítimos y tal vez hacer que parezcan provenir de usuarios confiables dentro de la empresa.

_Ejemplo de correo electrónico de **Spear phishing**_
```
De: Chris Cleveland
Para: Omar Santos
Asunto: Por favor revise el capítulo 3 para mí y envíeme sus comentarios antes de las 2:00 p. m.

Mensaje:
Estimado Omar,

Lea atentamente el documento adjunto.

Saludos,
Chris

Attachment: chapter.zip
MD5 Checksum of the attachment: 0x61D60EA55AC14444291AA1F911F3B1BE
```
## Whaling
_Whaling_ o _caza de ballenas_, que es similar a la suplantación de identidad y la suplantación de identidad dirigida, es un ataque dirigido a ejecutivos de negocios de alto perfil y personas clave en una empresa. Al igual que los agentes de amenazas que realizan ataques de caza de ballenas también crean correos electrónicos y páginas web para enviar malware o recopilar información confidencial; sin embargo, los correos electrónicos y las páginas de los atacantes de la caza de ballenas tienen un aspecto más oficial o serio. Los correos electrónicos sobre la caza de ballenas están diseñados para parecerse a los correos electrónicos comerciales críticos o los correos electrónicos de alguien que tiene autoridad legítima, ya sea dentro o fuera de la empresa. En los ataques de caza de ballenas, las páginas web están diseñadas para abordar específicamente a las víctimas de alto perfil.
En un ataque de suplantación de identidad regular, el correo electrónico puede ser una advertencia falsa de un banco o proveedor de servicios. En un ataque de caza de ballenas, el correo electrónico o la página web se crearían con un formulario de nivel ejecutivo más serio. El contenido se crea para dirigirse a un gerente superior, como el CEO o una persona que pueda tener credenciales para cuentas valiosas dentro de la origanización.
El objetivo principal en los ataques de caza de ballenas es robar información confidencial o comprometer el sistema de la víctima y luego apuntar a otras víctimas clave de alto perfil.

## Suplantación de identidad de llamadas telefónicas (_Vishing_)
_Vishing_ es un ataque de ingeniería social que se lleva a cabo en una conversación telefónica. El atacante persuade al usuario para que revele información personal y financiera privada o información sobre otra persona o empresa.
El objetivo del vishing suele ser robar números de tarjetas de crédito, números de seguro social y otra información que pueda utilizarse en planes de robo de identidad. Los atacantes pueden suplantar y falsificar el identificador de llamadas para ocultarse cuando realizan ataques de vishing.

## Suplantación de identidad del servicio de mensajes cortos (_Smishing_)
Dado que la suplantación de identidad ha sido una técnica eficaz para los agentes de amenazas, han encontrado otras formas además del correo electrónico para engañar a sus víctimas para que sigan enlaces maliciosos o activen malware desde correos electrónicos. Las campañas de suplantación de identidad a menudo utilizan mensajes de texto para enviar malware o enlaces maliciosos a dispositivos móviles.

Un ejemplo de suplantación de identidad del servicio de mensajes cortos (SMS) o Smishing como se conoce en Inglés, son las estafas de SMS relacionadas con bitcoins que han surgido en los últimos años. Numerosas víctimas han recibido mensajes que les indican que hagan clic en los enlaces para confirmar sus cuentas y reclamar bitcoins. Cuando un usuario hace clic en dicho enlace, puede ser engañado para que ingrese información confidencial en el sitio del atacante.

Puede ayudar a mitigar los ataques de suplantación de identidad (phishing) por SMS al no hacer clic en enlaces de remitentes de mensajes desconocidos. A veces, los atacantes falsifican la identidad de entidades legítimas (como su banco, su proveedor de Internet, plataformas de medios sociales, Amazon o eBay). No debe hacer clic en ningún enlace enviado por mensajes de texto si no espera que se le envíe dicho mensaje. Por ejemplo, si recibe un mensaje aleatorio sobre un problema con un pedido de Amazon, no haga clic en ese enlace. En cambio, vaya directamente al sitio web de Amazon, inicie sesión y verifique en el sitio web de Amazon si hay un problema. De manera similar, si recibe un mensaje que indica que hay un problema con una transacción de tarjeta de crédito o una factura, llame al banco directamente en lugar de hacer clic en un enlace. Si recibe un mensaje que le indica que ha ganado algo, probablemente sea un intento de suplantación de identidad por SMS y no debe hacer clic en el enlace.

## Abandono de USB
Muchos evaluadores de penetración y atacantes han utilizado ataques de caída de dispositivos USB o también conocido como abandono de USB, para comprometer con éxito los sistemas de las víctimas. Este tipo de ataque implica dejar las memorias USB (a veces denominadas llaves USB o unidades USB) desatendidas o colocarlas en ubicaciones estratégicas. A menudo, los usuarios piensan que los dispositivos se han perdido y los insertan en sus sistemas para averiguar a quién devolverlos; antes de darse cuenta, están descargando e instalando malware. Conectar esa memoria USB que encontró en la calle fuera de su oficina podría provocar una violación de la seguridad.

La investigación de Elie Bursztein, del equipo de investigación contra el abuso de Google, muestra que la mayoría de los usuarios conectarán unidades USB a su sistema sin dudarlo. Como parte de su investigación, colocó cerca de 300 memorias USB en el campus Urbana-Champaign de la Universidad de Illinois y midió quién enchufó las unidades. Los resultados mostraron que se captaron el 98% de las unidades USB y, en el 45% de las unidades, alguien no solo conectó la unidad, sino que hizo clic en los archivos.

Otra técnica de ingeniería social implica dejar caer un llavero que contiene una memoria USB que también puede incluir imágenes de niños o mascotas y una o dos memorias reales. Este tipo de toques personales pueden hacer que la víctima intente identificar al propietario para devolver el llavero. Este tipo de ataque de ingeniería social es muy eficaz y también puede ser catastrófico.