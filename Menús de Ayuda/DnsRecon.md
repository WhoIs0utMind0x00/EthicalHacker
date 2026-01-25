<h1 style="text-align:center;">Menú de ayuda DNSrecon</h1>

uso: dnsrecon [`-h`] [`-d DOMINIO`] [`-iL LISTA_ENTRADAS`] [`-n NS_SERVIDOR`] [`-r RANGO`] [`-D DICCIONARIO`] [`-f`] [`-a`] [`-s`] [`-b`] [`-y`] [`-k`] [`-w`] [`-z`] [`--threads HILOS`] [`--lifetime TIEMPO_DE_VIDA`] [`--loglevel {DEBUG,INFO,WARNING,ERROR,CRITICAL}`] [`--tcp`]
                [`--db DB`] [`-x XML`] [`-c CSV`] [`-j JSON`] [`--iw`] [`--disable_check_nxdomain`] [`--disable_check_recursion`] [`--disable_check_bindversion`] [`-V`] [`-v`] [`-t TIPO`]

| <h3 style="text-align:center;">Comando</h3> | <h3 style="text-align:center;">Descripción</h3>|
|---------|-------------|
|  `-h`, `--help`            | Muestra este mensaje de ayuda y sale. |
|  `-d`, `--domain DOMINIO`  | Dominio objetivo. |
|  `-iL`, `--input-list LISTA_ENTRADAS` | Archivo que contiene una lista de dominios para ejecutar la enumeración de DNS, uno por línea. |
|  `-n`, `--name_server NS_SERVIDOR` | Dominio del servidor a usar. Si no se proporciona ninguno, se usará el SOA del objetivo. Se pueden especificar múltiples servidores en una lista separados por comas. |
|  `-r`, `--range RANGE` | Rango de IP para búsqueda inversa de fuerza bruta en formatos (primero-último) o en (rango/máscara de bits). |
|  `-D`, `--dictionary DICTIONARY` | Archivo de diccionario de subdominios y nombres de host para usar en ataques de fuerza bruta. |
|  `-f`                   | Filtra las búsquedas de dominio por fuerza bruta, los registros se resuelven a la dirección IP comodín cuando se guardan los registros. |
|  `-a`                  | Ejecuta AXFR con enumeración estándar. |
|  `-s`                   | Ejecuta una búsqueda inversa de rangos IPv4 en el registro SPF con enumeración estándar. |
|  `-b`                  |  Ejecuta enumeración Bing enumeración con enumeración estándar.
|  `-y`                  |  Ejecuta enumeración Yandex con enumeración estándar.
|  `-k`                  |  Ejecuta enumeración crt.sh con enumeración estándar.
|  `-w`                  |  Ejecuta análisis profundo de registros whois y búsqueda inversa de rangos IP encontrados a través de Whois cuando inicia una enumeración estándar.
|  `-z`                  |  Ejecuta un recorrido por la zona de DNSSEC con enumeración estándar.
|  `--threads THREADS`   |  Número de hilos para usar en búsquedas inversas, búsquedas directas, fuerza bruta y enumeración de registros SRV.
|  `--lifetime TIEMPO_DE_VIDA` | Tiempo que espera al servidor para que responda una solicitud. El valor por defecto es 3.0 |
|  `--loglevel {DEBUG,INFO,WARNING,ERROR,CRITICAL}` | Nivel de registro a usar. INFO por defecto
|  `--tcp`               |  Usar protocolo TCP para realizar solicitudes.
|  `--db DB`             |  Guardar registros encontrados en un archivo SQLite 3.
|  `-x`, `--xml XML`       |  Guardar registros encontrados en un archivo XML.
|  `-c`, `--csv CSV`       |  Guardar registros encontrados en un archivo CSV.
|  `-j`, `--json JSON`     |  Guardar registros encontrados en un archivo JSON.
|  `--iw`                |  Continuar ejecutando fuerza bruta incluso si se descubrió un registro comodín.
|  `--disable_check_nxdomain` | Deshabilita la comprobación de secuestro NXDOMAIN en nombres de servidores. |
|  `--disable_check_recursion` | Deshabilita la comprobación de recursión en nombres de servidores. |
|  `--disable_check_bindversion` | Deshabilita la comprobación de versión de BIND en nombres de servidores. |
|  `-V`, `--version` |       Versión de DNSrecon. |
|  `-v`, `--verbose` |       Habilitar verbosidad. |
|  `-t`, `--type TYPE` |     Tipo de enumeración a ejecutar.<br>Posibles tipos:<ul style="list-style:none;"><li>__std__:      SOA, NS, A, AAAA, MX y SRV.</li><li>__rvl__:      Búsqueda inversa de CIDR o rango IP proporcionados.</li><li>__brt__:      Fuerza bruta a dominios y hosts usando un diccionario proporcionado.</li><li>__srv__:      Registros SRV.</li><li>__axfr__:     Prueba todos los servidores NS por zona de transferencia.</li><li>__bing__:     Realiza búsquedas de Bing para subdominios y hosts.</li><li>__yand__:     Realiza búsquedas de Yandex para subdominios y hosts.</li><li>__crt__:      Realiza búsquedas de crt.sh para subdominios y hosts.</li><li>__snoop__:    Utiliza la caché de snooping contra todos los servidores NS del dominio proporcionado, probando todos con un archivo que contiene los dominios, archivo proporcionado con opción -D.</li><li>__tld__:      Elimina el TLD del dominio proporcionado y prueba contra todos los TLDs registrados en IANA.</li><li>__zonewalk__: Ejecuta un recorrido por la zona de DNSSEC usando registros NSEC.</li></ul> |