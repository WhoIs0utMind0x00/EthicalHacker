# Reputación de la empresa y postura de seguridad
Las violaciones a la seguridad pueden tener un impacto directo en la reputación de una empresa. Los atacantes pueden aprovechar la información de violaciones de seguridad anteriores que una organización pueda haber experimentado. Pueden, por ejemplo, aprovechar los siguientes datos al intentar recopilar información sobre sus víctimas:
- Volcados o descargas de contraseñas
- Metadatos de archivo
- Análisis/enumeración de motores de búsqueda estratégicos
- Archivado/almacenamiento en caché de sitios web
- Repositorios de código fuente público

### Volcados (dumps) de contraseñas

Los atacantes pueden aprovechar los volcados de contraseñas de violaciones anteriores. Hay varias maneras en que un atacante puede obtener acceso a dichos volcados de contraseñas, como mediante el uso de Pastebin, los sitios web de la dark web e incluso GitHub en algunos casos. Varias herramientas y sitios web diferentes facilitan esta tarea. Un ejemplo de una herramienta que le permite encontrar direcciones de correo electrónico y contraseñas expuestas en violaciones anteriores es h8mail. Puede instalar h8mail con el comando pip3 install h8mail, como se muestra en el ejemplo 3-9. El ejemplo 3-9 también muestra el uso de la línea de comandos de h8mail.

__Instalación y uso de h8mail__
```bash
root@websploit# pip3 install h8mail
Collecting h8mail
  Downloading h8mail-2.5.5-py3-none-any.whl (33 kB)
Requirement already satisfied: requests in /usr/lib/python3/
dist-packages (from h8mail) (2.23.0)
Installing collected packages: h8mail
Successfully installed h8mail-2.5.5
root@websploit# h8mail -h
usage: h8mail [-h] [-t USER_TARGETS [USER_TARGETS ...]] [-u USER_URLS [USER_URLS ...]] [-q USER_QUERY] [--loose] [-c CONFIG_FILE [CONFIG_FILE ...]] [-o OUTPUT_FILE] [-j OUTPUT_JSON] [-bc BC_PATH] [-sk] [-k CLI_APIKEYS [CLI_APIKEYS ...]]
              [-lb LOCAL_BREACH_SRC [LOCAL_BREACH_SRC ...]] [-gz LOCAL_GZIP_SRC [LOCAL_GZIP_SRC ...]] [-sf] [-ch [CHASE_LIMIT]] [--power-chase] [--hide] [--debug] [--gen-config]

Email information and password lookup tool

options:
  -h, --help            show this help message and exit
  -t USER_TARGETS [USER_TARGETS...], --targets USER_TARGETS [USER_TARGETS ...]
                        Either string inputs or files. Supports email pattern matching from input or file, filepath globing and multiple arguments
  -u USER_URLS [USER_URLS...], --url USER_URLS [USER_URLS ...]
                        Either string inputs or files. Supports URL pattern matching from input or file, filepath globing and multiple arguments. Parse URLs page for emails. Requires http:// or https:// in URL.
  -q USER_QUERY, --custom-query USER_QUERY
                        Perform a custom query. Supports username, password, ip, hash, domain. Performs an implicit "loose" search when searching locally
  --loose               Allow loose search by disabling email pattern recognition. Use spaces as pattern seperators
  -c CONFIG_FILE [CONFIG_FILE...], --config CONFIG_FILE [CONFIG_FILE ...]
                        Configuration file for API keys. Accepts keys from Snusbase, WeLeakInfo, Leak-Lookup, HaveIBeenPwned, Emailrep, Dehashed and hunterio
  -o OUTPUT_FILE, --output OUTPUT_FILE
                        File to write CSV output
  -j OUTPUT_JSON, --json OUTPUT_JSON
                        File to write JSON output
  -bc BC_PATH, --breachcomp BC_PATH
                        Path to the breachcompilation torrent folder. Uses the query.sh script included in the torrent
  -sk, --skip-defaults  Skips Scylla and HunterIO check. Ideal for local scans
  -k CLI_APIKEYS [CLI_APIKEYS...], --apikey CLI_APIKEYS [CLI_APIKEYS ...]
                        Pass config options. Supported format: "K=V,K=V"
  -lb LOCAL_BREACH_SRC [LOCAL_BREACH_SRC...], --local-breach LOCAL_BREACH_SRC [LOCAL_BREACH_SRC ...]
                        Local cleartext breaches to scan for targets. Uses multiprocesses, one separate process per file, on separate worker pool by arguments. Supports file or folder as input, and filepath globing
  -gz LOCAL_GZIP_SRC [LOCAL_GZIP_SRC...], --gzip LOCAL_GZIP_SRC [LOCAL_GZIP_SRC ...]
                        Local tar.gz (gzip) compressed breaches to scans for targets. Uses multiprocesses, one separate process per file. Supports file or folder as input, and filepath globing. Looks for 'gz' in filename
-sf, --single-file      If breach contains big cleartext or tar.gz files, set this flag to view the progress bar. Disables concurrent file searching for stability
  -ch [CHASE_LIMIT], --chase [CHASE_LIMIT]
                        Add related emails from hunter.io to ongoing target list. Define number of emails per target to chase. Requires hunter.io private API key if used without power-chase
  --power-chase         Add related emails from ALL API services to ongoing target list. Use with --chase
  --hide                Only shows the first 4 characters of found passwords to output. Ideal for demonstrations
  --debug               Print request debug information
--gen-config, -g        Generates a configuration file template in the current working directory & exits. Will overwrite existing h8mail_config.ini file
```
Las siguientes son herramientas adicionales que le permiten buscar volcados o descargas de datos vulnerados:

[WhatBreach][https://github.com/Ekultek/WhatBreach]
[LeakLooker][https://github.com/woj-ciech/LeakLooker]
[Buster][https://github.com/sham00n/buster]
[Scavenger][https://github.com/rndinfosecguy/Scavenger]
[PwnDB][https://github.com/davidtavarez/pwndb]

Herramientas como h8mail y WhatBreach aprovechan los repositorios de datos vulnerados de sitios web como haveibeenpwned.com y snusbase.com. Históricamente, los delincuentes han utilizado sitios web como weleakinfo.com (incautado por el FBI) para descargar información de violaciones de seguridad anteriores.

__Metadatos de archivo__

Puede obtener mucha información de los metadatos en archivos como imágenes, documentos de Microsoft Word, archivos de Excel, archivos de PowerPoint y más. Por ejemplo, el formato de archivo de imagen intercambiable (Exif) es una especificación que define los formatos de imágenes, sonido y etiquetas complementarias utilizados por cámaras digitales, teléfonos móviles, escáneres y otros sistemas que procesan archivos de imagen y sonido.
<img src="Imagenes/Metadatos.jpeg" width="250" height="300">

__Ejemplo con ExifTool__
```bash
┌──(kali㉿Kali)-[~]
└─$ exiftool IMG_Prueba.png
ExifTool Version Number         : 12.64
File Name                       : IMG_Prueba.png
Directory                       : .
File Size                       : 1647 kB
File Modification Date/Time     : 2025:11:16 00:56:11+00:00
File Access Date/Time           : 2025:11:16 00:56:47+00:00
File Inode Change Date/Time     : 2025:11:16 00:56:47+00:00
File Permissions                : -rw-r--r--
File Type                       : PNG
File Type Extension             : png
MIME Type                       : image/png
Image Width                     : 2000
Image Height                    : 2000
Bit Depth                       : 8
Color Type                      : RGB with Alpha
Compression                     : Deflate/Inflate
Filter                          : Adaptive
Interlace                       : Noninterlaced
SRGB Rendering                  : Perceptual
Significant Bits                : 8 8 8 8
Image Size                      : 2000x2000
Megapixels                      : 4.0
```
__Análisis/enumeración estratégicos del motor de búsqueda__

La mayoría de nosotros usamos motores de búsqueda como DuckDuckGo, Bing y Google para localizar información. Lo que quizás no sepa es que los motores de búsqueda, como Google, pueden realizar búsquedas mucho más potentes de lo que la mayoría de las personas sueña. Google puede traducir documentos, realizar búsquedas de noticias y realizar búsquedas de imágenes. Además, los hackers y atacantes pueden usarlo para hacer algo que se ha denominado Google hacking.

Mediante el uso de técnicas de búsqueda básicas combinadas con operadores avanzados, tanto usted como los atacantes pueden utilizar Google como una potente herramienta de búsqueda de vulnerabilidades. Los siguientes son algunos operadores avanzados:

- **Tipo de archivo**: indica a Google que busque solo en el texto de un tipo de archivo en particular (por ejemplo, tipo de archivo:xls).
- **Inurl**: indica a Google que busque solo en la URL especificada de un documento (por ejemplo, inurl:search-text)
- **Enlace**: dirige a Google a buscar un término específico en los hipervínculos (por ejemplo, enlace:www.domain.com)
- **Intitle**: dirige a Google a buscar un término dentro del título de un documento (por ejemplo, intitle:“Index of/etc”)
- 
Al utilizar estos operadores avanzados en combinación con términos clave, tanto usted como los atacantes pueden lograr que Google descubra mucha información confidencial que no debe revelarse. Estas cadenas de búsqueda a menudo se denominan Dorks de Google.

Para ver cómo funciona Google dorking, ingrese la siguiente frase en Google:

*intext:JSESSIONID OR intext:PHPSESSID inurl:access.log ext:log*

Esta consulta busca en una URL los ID de sesión que podrían usarse para suplantar usuarios. No es inusual que esta búsqueda encuentre más de 100 sitios que almacenan ID de sesión confidenciales en registros que eran de acceso público. Si estos ID no han agotado el tiempo, podrían usarse para obtener acceso a recursos restringidos.

- Puede utilizar operadores avanzados para buscar muchos tipos de datos. El siguiente es otro ejemplo de una cadena de búsqueda de Google (o dork de Google) que puede revelar contraseñas de aplicaciones web:
```
"public $user =" | "public $password = " | "public $secret =" | "public $db =" ext:txt | ext:log -git
```
Ahora que hemos analizado algunas técnicas básicas de búsqueda de Google, veamos la piratería avanzada de Google. Le recomendamos que visite los repositorios de la base de datos de piratería de Google (GHDB) en https://www.exploit-db.com/google-hacking-database/. GHDB tiene las siguientes categorías de búsqueda:

- Puntos de apoyo
- Archivos que contienen nombres de usuario
- Directorios sensibles
- Detección de servidor web
- Archivos vulnerables
- Servidores vulnerables
- Mensajes de error
- Archivos que contienen información interesante
- Archivos que contienen contraseñas
- Información confidencial sobre compras en línea
- Datos de red o vulnerabilidad
- Páginas que contienen portales de inicio de sesión
- Varios dispositivos en línea
- Advertencias y vulnerabilidades

GHDB es un esfuerzo de la comunidad. Cualquiera puede cargar un nuevo dork de Google para realizar este tipo de búsquedas. Una vez que comiences a jugar con los dorks en GHDB, te sorprenderán las cosas increíbles que se encuentran a través de la piratería de Google. GHDB ha hecho que usar Google dorks sea muy fácil, y también hay otras opciones. Más adelante en este módulo, aprenderá sobre herramientas adicionales que se pueden utilizar para realizar búsquedas similares (como Recon-ng).