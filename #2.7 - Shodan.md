# Shodan

Shodan es una organización que analiza Internet las 24 horas del día, los 365 días del año. Los resultados de esos escaneos se almacenan en una base de datos que se puede consultar en shodan.io o mediante una API. Puede utilizar Shodan para consultar hosts vulnerables, dispositivos de Internet de las cosas (IoT) y muchos otros sistemas que no deben estar expuestos o conectados a la Internet pública. En la figura 3-5, se muestran diferentes categorías de sistemas detectados por los escaneos de Shodan, incluidos los sistemas de control industrial (ICS), las bases de datos, los dispositivos de infraestructura de red y los videojuegos.

### Exploración de la base de datos de Shodan
<img src="Imagenes/shodan.png" style="border-radius:10px;">

### Revelación de sistemas vulnerables con Shodan
Se muestra una consulta realizada para encontrar dispositivos de infraestructura de red que ejecutan un protocolo roto llamado *Cisco Smart Install*. Los atacantes han aprovechado este protocolo durante años para comprometer diferentes infraestructuras. Cisco eliminó este protocolo de sus sistemas hace muchos años. Sin embargo, muchas personas aún lo usan en dispositivos conectados a la Internet pública.
