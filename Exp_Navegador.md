# Marco de explotación del navegador (BeEF)
Las vulnerabilidades de XSS aprovechan las debilidades de validación de entrada en una aplicación web. Estas vulnerabilidades se utilizan a menudo para redirigir a los usuarios a sitios web maliciosos para robar cookies (tokens de sesión) y otra información confidencial. _BeEF_ es una herramienta que puede utilizarse para manipular a los usuarios aprovechando las vulnerabilidades de XSS. Puede descargar BeEF desde [BeEf Project](https://beefproject.com) o desde [BeEf Project en GitHub](https://github.com/beefproject/beef).

## Inicio de BeEF
La herramienta inicia un servicio web en el puerto 3000 de forma predeterminada. Desde allí, el atacante puede iniciar sesión en una consola web y manipular a los usuarios que son víctimas de ataques XSS.<br>

_Inicio de BeEF_<br>
<img src="Imagenes/inicio_beef.jpeg" width="35%" height="35%" style="border-radius:10px;"><br>

## Robar una cookie del navegador
La imagen muestra un compromiso exitoso en el que el atacante ha robado el token de sesión del usuario.<br>
_Robo de una cookie con XSS y BeEF_<br>
<img src="Imagenes/robo_cookie.jpeg" width="35%" height="35%" style="border-radius:10px;"><br>

## Enviar una notificación falsa
Una vez que el sistema está comprometido, el atacante puede utilizar BeEF para realizar numerosos ataques. Por ejemplo, el atacante puede enviar notificaciones falsas al navegador de la víctima.<br>
_Envío de una notificación falsa_<br>
<img src="Imagenes/envio.jpeg" width="35%" height="35%" style="border-radius:10px;"><br>

_Notificación de BeEF falsa en el navegador de la víctima_<br>
<img src="Imagenes/noti_falsa.jpeg" width="35%" height="35%" style="border-radius:10px;"><br>