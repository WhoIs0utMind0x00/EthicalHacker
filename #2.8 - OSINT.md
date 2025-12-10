# Recopilación de inteligencia de código abierto (OSINT)

Recopilación de inteligencia de código abierto (OSINT) es un método de recopilación de fuentes de inteligencia disponibles públicamente para recopilar y analizar información sobre un objetivo. OSINT es de “código abierto” porque la recopilación de información no requiere ningún tipo de método encubierto. Normalmente, la información se puede encontrar en Internet. Cuanto mayor sea la presencia en línea del objetivo, más información estará disponible. Este tipo de recopilación a menudo puede comenzar con una simple búsqueda en Google, que puede revelar una cantidad significativa de información sobre un objetivo. Al menos, le dará suficiente información para saber qué dirección tomar con su proceso de recopilación de información. Veamos dos herramientas que se pueden usar para la recopilación de OSINT: Recong-ng y Shodan.

__Recon-ng__

Este módulo cubre una serie de fuentes y herramientas individuales utilizadas para la recopilación de información. Estas herramientas son muy eficaces para sus usos específicos; sin embargo, ¿no sería fantástico si hubiera una herramienta que pudiera reunir todas estas funciones diferentes? Aquí es donde entra en juego Recon-ng. Es un marco desarrollado por Tim Tomes de Black Hills Information Security. Esta herramienta fue desarrollada en Python con Metasploit msfconsole en mente. Si ha usado la consola de Metasploit antes, Recon-ng debe ser familiar y fácil de entender.

Recon-ng es un marco modular que facilita el desarrollo y la integración de nuevas funcionalidades. Es muy eficaz en la enumeración de sitios de redes sociales debido a su uso de interfaces de programación de aplicaciones (API) para recopilar información. También incluye una función de informes que le permite exportar datos en diferentes formatos de informe. Debido a que siempre deberá proporcionar algún tipo de entrega en cualquier prueba que realice, Recon-ng es especialmente valioso.

_Paso 1: Iniciar Recon-ng_

Para comenzar a usar Recon-ng simplemente ejecuta *recon-ng* desde una nueva ventana de terminal.
```bash
┌──(kali㉿Kali)-[~
└─$ recon-ng
[*] Version check disabled.

    _/_/_/    _/_/_/_/    _/_/_/    _/_/_/    _/      _/            _/      _/    _/_/_/
   _/    _/  _/        _/        _/      _/  _/_/    _/            _/_/    _/  _/       
  _/_/_/    _/_/_/    _/        _/      _/  _/  _/  _/  _/_/_/_/  _/  _/  _/  _/  _/_/_/
 _/    _/  _/        _/        _/      _/  _/    _/_/            _/    _/_/  _/      _/ 
_/    _/  _/_/_/_/    _/_/_/    _/_/_/    _/      _/            _/      _/    _/_/_/    


                                          /\
                                         / \\ /\
    Sponsored by...               /\  /\/  \\V  \/\
                                 / \\/ // \\\\\ \\ \/\
                                // // BLACK HILLS \/ \\
                               www.blackhillsinfosec.com

                  ____   ____   ____   ____ _____ _  ____   ____  ____
                 |____] | ___/ |____| |       |   | |____  |____ |
                 |      |   \_ |    | |____   |   |  ____| |____ |____
                                   www.practisec.com

                      [recon-ng v5.1.2, Tim Tomes (@lanmaster53)]                       

[*] No modules enabled/installed.

[recon-ng][default] > 

```
__Paso 2: Ver los comandos disponibles__

Para tener una idea de los comandos disponibles en la herramienta de línea de comandos Recon-ng, simplemente escribe *help* y presiona Enter.
```bash
[recon-ng][default] > help

Commands (type [help|?] <topic>):
---------------------------------
back            Exits the current context
dashboard       Displays a summary of activity
db              Interfaces with the workspace's database
exit            Exits the framework
help            Displays this menu
index           Creates a module index (dev only)
keys            Manages third party resource credentials
marketplace     Interfaces with the module marketplace
modules         Interfaces with installed modules
options         Manages the current context options                                                                               
pdb             Starts a Python Debugger session (dev only)                                                                       
script          Records and executes command scripts                                                                              
shell           Executes shell commands                                                                                           
show            Shows various framework items                                                                                     
snapshots       Manages workspace snapshots                                                                                       
spool           Spools output to a file                                                                                           
workspaces      Manages workspaces                                                                                                
                                                                                                                                  
[recon-ng][default] >       
```
__Paso 3: Busca módulos disponibles__

Antes de comenzar a recopilar información con la herramienta de reconocimiento, debes comprender qué módulos están disponibles. Recon-ng incluye un "mercado" donde puedes buscar módulos disponibles para instalar. Puedes utilizar el comando *marketplace search* para buscar todos los módulos disponibles en Recon-ng.
```bash
[recon-ng][default] > marketplace search                                                                                          
                                                                                                                                  
  +--------------------------------------------------------------------------------------------------+                            
  |                        Path                       | Version |     Status    |  Updated   | D | K |                            
  +--------------------------------------------------------------------------------------------------+                            
  | discovery/info_disclosure/cache_snoop             | 1.1     | not installed | 2020-10-13 |   |   |                            
  | discovery/info_disclosure/interesting_files       | 1.2     | not installed | 2021-10-04 |   |   |                            
  | exploitation/injection/command_injector           | 1.0     | not installed | 2019-06-24 |   |   |                            
  | exploitation/injection/xpath_bruter               | 1.2     | not installed | 2019-10-08 |   |   |                            
  | import/csv_file                                   | 1.1     | not installed | 2019-08-09 |   |   |                            
  | import/list                                       | 1.1     | not installed | 2019-06-24 |   |   |                            
  | import/masscan                                    | 1.0     | not installed | 2020-04-07 |   |   |                            
  | import/nmap                                       | 1.1     | not installed | 2020-10-06 |   |   |                            
  | recon/companies-contacts/bing_linkedin_cache      | 1.0     | not installed | 2019-06-24 |   | * |                            
  | recon/companies-contacts/censys_email_address     | 2.1     | not installed | 2022-01-31 | * | * |                            
  | recon/companies-contacts/pen                      | 1.1     | not installed | 2019-10-15 |   |   |                            
  | recon/companies-domains/censys_subdomains         | 2.1     | not installed | 2022-01-31 | * | * |                            
  | recon/companies-domains/pen                       | 1.1     | not installed | 2019-10-15 |   |   |                            
  | recon/companies-domains/viewdns_reverse_whois     | 1.1     | not installed | 2021-08-24 |   |   |                            
  | recon/companies-domains/whoxy_dns                 | 1.1     | not installed | 2020-06-17 |   | * |                            
  | recon/companies-multi/censys_org                  | 2.1     | not installed | 2022-01-31 | * | * |                            
  | recon/companies-multi/censys_tls_subjects         | 2.1     | not installed | 2022-01-31 | * | * |                            
  | recon/companies-multi/github_miner                | 1.1     | not installed | 2020-05-15 |   | * |                            
  | recon/companies-multi/shodan_org                  | 1.1     | not installed | 2020-07-01 | * | * |                            
  | recon/companies-multi/whois_miner                 | 1.1     | not installed | 2019-10-15 |   |   |                            
  | recon/contacts-contacts/abc                       | 1.0     | not installed | 2019-10-11 | * |   |                            
  | recon/contacts-contacts/mailtester                | 1.0     | not installed | 2019-06-24 |   |   |                            
  | recon/contacts-contacts/mangle                    | 1.0     | not installed | 2019-06-24 |   |   |                            
  | recon/contacts-contacts/unmangle                  | 1.1     | not installed | 2019-10-27 |   |   |                            
  | recon/contacts-credentials/hibp_breach            | 1.2     | not installed | 2019-09-10 |   | * |                            
  | recon/contacts-credentials/hibp_paste             | 1.1     | not installed | 2019-09-10 |   | * |                            
  | recon/contacts-domains/censys_email_to_domains    | 2.1     | not installed | 2022-01-31 | * | * |                            
  | recon/contacts-domains/migrate_contacts           | 1.1     | not installed | 2020-05-17 |   |   |                            
  | recon/contacts-profiles/fullcontact               | 1.1     | not installed | 2019-07-24 |   | * |                            
  | recon/credentials-credentials/adobe               | 1.0     | not installed | 2019-06-24 |   |   |                            
  | recon/credentials-credentials/bozocrack           | 1.0     | not installed | 2019-06-24 |   |   |                            
  | recon/credentials-credentials/hashes_org          | 1.0     | not installed | 2019-06-24 |   | * |                            
  | recon/domains-companies/censys_companies          | 2.1     | not installed | 2022-01-31 | * | * |                            
  | recon/domains-companies/pen                       | 1.1     | not installed | 2019-10-15 |   |   |                            
  | recon/domains-companies/whoxy_whois               | 1.1     | not installed | 2020-06-24 |   | * |                            
  | recon/domains-contacts/hunter_io                  | 1.3     | not installed | 2020-04-14 |   | * |                            
  | recon/domains-contacts/metacrawler                | 1.1     | not installed | 2019-06-24 | * |   |                            
  | recon/domains-contacts/pen                        | 1.1     | not installed | 2019-10-15 |   |   |                            
  | recon/domains-contacts/pgp_search                 | 1.4     | not installed | 2019-10-16 |   |   |                            
  | recon/domains-contacts/whois_pocs                 | 1.0     | not installed | 2019-06-24 |   |   |                            
  | recon/domains-contacts/wikileaker                 | 1.0     | not installed | 2020-04-08 |   |   |                            
  | recon/domains-domains/brute_suffix                | 1.1     | not installed | 2020-05-17 |   |   |                            
  | recon/domains-hosts/binaryedge                    | 1.2     | not installed | 2020-06-18 |   | * |                            
  | recon/domains-hosts/bing_domain_api               | 1.0     | not installed | 2019-06-24 |   | * |                            
  | recon/domains-hosts/bing_domain_web               | 1.1     | not installed | 2019-07-04 |   |   |                            
  | recon/domains-hosts/brute_hosts                   | 1.0     | not installed | 2019-06-24 |   |   |                            
  | recon/domains-hosts/builtwith                     | 1.1     | not installed | 2021-08-24 |   | * |                            
  | recon/domains-hosts/censys_domain                 | 2.1     | not installed | 2022-01-31 | * | * |                            
  | recon/domains-hosts/certificate_transparency      | 1.3     | not installed | 2019-09-16 |   |   |                            
  | recon/domains-hosts/google_site_web               | 1.0     | not installed | 2019-06-24 |   |   |                            
  | recon/domains-hosts/hackertarget                  | 1.1     | not installed | 2020-05-17 |   |   |                            
  | recon/domains-hosts/mx_spf_ip                     | 1.0     | not installed | 2019-06-24 |   |   |                            
  | recon/domains-hosts/netcraft                      | 1.1     | not installed | 2020-02-05 |   |   |                            
  | recon/domains-hosts/shodan_hostname               | 1.1     | not installed | 2020-07-01 | * | * |                            
  | recon/domains-hosts/spyse_subdomains              | 1.1     | not installed | 2021-08-24 |   | * |                            
  | recon/domains-hosts/ssl_san                       | 1.0     | not installed | 2019-06-24 |   |   |                            
  | recon/domains-hosts/threatcrowd                   | 1.0     | not installed | 2019-06-24 |   |   |                            
  | recon/domains-hosts/threatminer                   | 1.0     | not installed | 2019-06-24 |   |   |                            
  | recon/domains-vulnerabilities/ghdb                | 1.1     | not installed | 2019-06-26 |   |   |                            
  | recon/domains-vulnerabilities/xssed               | 1.1     | not installed | 2020-10-18 |   |   |
  | recon/hosts-domains/migrate_hosts                 | 1.1     | not installed | 2020-05-17 |   |   |
  | recon/hosts-hosts/bing_ip                         | 1.0     | not installed | 2019-06-24 |   | * |
  | recon/hosts-hosts/censys_hostname                 | 2.1     | not installed | 2022-01-31 | * | * |
  | recon/hosts-hosts/censys_ip                       | 2.1     | not installed | 2022-01-31 | * | * |
  | recon/hosts-hosts/censys_query                    | 2.1     | not installed | 2022-01-31 | * | * |
  | recon/hosts-hosts/ipinfodb                        | 1.2     | not installed | 2021-08-24 |   | * |
  | recon/hosts-hosts/ipstack                         | 1.0     | not installed | 2019-06-24 |   | * |
  | recon/hosts-hosts/resolve                         | 1.0     | not installed | 2019-06-24 |   |   |
  | recon/hosts-hosts/reverse_resolve                 | 1.0     | not installed | 2019-06-24 |   |   |
  | recon/hosts-hosts/ssltools                        | 1.0     | not installed | 2019-06-24 |   |   |
  | recon/hosts-hosts/virustotal                      | 1.0     | not installed | 2019-06-24 |   | * |
  | recon/hosts-locations/migrate_hosts               | 1.0     | not installed | 2019-06-24 |   |   |
  | recon/hosts-ports/binaryedge                      | 1.0     | not installed | 2019-06-24 |   | * |
  | recon/hosts-ports/shodan_ip                       | 1.2     | not installed | 2020-07-01 | * | * |
  | recon/locations-locations/geocode                 | 1.0     | not installed | 2019-06-24 |   | * |
  | recon/locations-locations/reverse_geocode         | 1.0     | not installed | 2019-06-24 |   | * |
  | recon/locations-pushpins/flickr                   | 1.0     | not installed | 2019-06-24 |   | * |
  | recon/locations-pushpins/shodan                   | 1.1     | not installed | 2020-07-07 | * | * |
  | recon/locations-pushpins/twitter                  | 1.1     | not installed | 2019-10-17 |   | * |
  | recon/locations-pushpins/youtube                  | 1.2     | not installed | 2020-09-02 |   | * |
  | recon/netblocks-companies/censys_netblock_company | 2.1     | not installed | 2022-01-31 | * | * |
  | recon/netblocks-companies/whois_orgs              | 1.0     | not installed | 2019-06-24 |   |   |
  | recon/netblocks-hosts/censys_netblock             | 2.1     | not installed | 2022-01-31 | * | * |
  | recon/netblocks-hosts/reverse_resolve             | 1.0     | not installed | 2019-06-24 |   |   |
  | recon/netblocks-hosts/shodan_net                  | 1.2     | not installed | 2020-07-21 | * | * |
  | recon/netblocks-hosts/virustotal                  | 1.0     | not installed | 2019-06-24 |   | * |
  | recon/netblocks-ports/census_2012                 | 1.0     | not installed | 2019-06-24 |   |   |
  | recon/netblocks-ports/censysio                    | 1.0     | not installed | 2019-06-24 |   | * |
  | recon/ports-hosts/migrate_ports                   | 1.0     | not installed | 2019-06-24 |   |   |
  | recon/ports-hosts/ssl_scan                        | 1.1     | not installed | 2021-08-24 |   |   |
  | recon/profiles-contacts/bing_linkedin_contacts    | 1.2     | not installed | 2021-08-24 |   | * |
  | recon/profiles-contacts/dev_diver                 | 1.1     | not installed | 2020-05-15 |   |   |
  | recon/profiles-contacts/github_users              | 1.0     | not installed | 2019-06-24 |   | * |
  | recon/profiles-profiles/namechk                   | 1.0     | not installed | 2019-06-24 |   | * |
  | recon/profiles-profiles/profiler                  | 1.2     | not installed | 2023-12-30 |   |   |
  | recon/profiles-profiles/twitter_mentioned         | 1.0     | not installed | 2019-06-24 |   | * |
  | recon/profiles-profiles/twitter_mentions          | 1.0     | not installed | 2019-06-24 |   | * |
  | recon/profiles-repositories/github_repos          | 1.1     | not installed | 2020-05-15 |   | * |
  | recon/repositories-profiles/github_commits        | 1.0     | not installed | 2019-06-24 |   | * |
  | recon/repositories-vulnerabilities/gists_search   | 1.0     | not installed | 2019-06-24 |   |   |
  | recon/repositories-vulnerabilities/github_dorks   | 1.0     | not installed | 2019-06-24 |   | * |
  | reporting/csv                                     | 1.0     | not installed | 2019-06-24 |   |   |
  | reporting/html                                    | 1.0     | not installed | 2019-06-24 |   |   |
  | reporting/json                                    | 1.0     | not installed | 2019-06-24 |   |   |
  | reporting/list                                    | 1.0     | not installed | 2019-06-24 |   |   |
  | reporting/proxifier                               | 1.0     | not installed | 2019-06-24 |   |   |
  | reporting/pushpin                                 | 1.0     | not installed | 2019-06-24 |   | * |
  | reporting/xlsx                                    | 1.0     | not installed | 2019-06-24 |   |   |
  | reporting/xml                                     | 1.1     | not installed | 2019-06-24 |   |   |
  +--------------------------------------------------------------------------------------------------+

  D = Has dependencies. See info for details.
  K = Requires keys. See info for details.

[recon-ng][default] > 
```
La letra **D** indica que el módulo tiene dependencias. La letra **K** indica que se necesita una clave de API para utilizar los recursos utilizados en un módulo en particular. Por ejemplo, el módulo con la ruta *recon/companies-contacts/censys_email_adress* tiene dependencias y necesita una clave API para consultar la base de datos de Censys. (Censys es un recurso muy popular para consultar datos OSINT)


__Paso 4: Actualice el mercado__

Puedes actualizar los datos sobre los módulos disponibles mediante el comando *marketplace refesh.
```bash
[recon-ng][default] > marketplace refresh
[*] Marketplace index refreshed.
[recon-ng][default] > 
```
__Paso 5: Busca en el mercado__

Realicemos una búsqueda rápida para encontrar diferentes subdominios de uno de mis dominios (h4cker.org). Podemos usar el módulo bing_domain_web para intentar encontrar cualquier subdominio que aproveche el motor de búsqueda de Bing. Puede realizar una búsqueda por palabra clave para cualquier módulo con el comando marketplace search [palabra clave]

```bash
[recon-ng][default] > marketplace search bing
[*] Searching module index for 'bing'...

  +-----------------------------------------------------------------------------------------------+
  |                      Path                      | Version |     Status    |  Updated   | D | K |
  +-----------------------------------------------------------------------------------------------+
  | recon/companies-contacts/bing_linkedin_cache   | 1.0     | not installed | 2019-06-24 |   | * |
  | recon/domains-hosts/bing_domain_api            | 1.0     | not installed | 2019-06-24 |   | * |
  | recon/domains-hosts/bing_domain_web            | 1.1     | not installed | 2019-07-04 |   |   |
  | recon/hosts-hosts/bing_ip                      | 1.0     | not installed | 2019-06-24 |   | * |
  | recon/profiles-contacts/bing_linkedin_contacts | 1.2     | not installed | 2021-08-24 |   | * |
  +-----------------------------------------------------------------------------------------------+

  D = Has dependencies. See info for details.
  K = Requires keys. See info for details.

[recon-ng][default] >
```
__Paso 6: Instalar un módulo__

Varios resultados coincidieron con la palabra clave de *bing*. Sin embargo, el que nos interesa es *recon/domains-hosts/bing_domain_web*. Puedes instalar el módulo mediante el comando *marketplace install*.
```bash
[recon-ng][default] > marketplace install recon/domains-hosts/bing_domain_web
[*] Module installed: recon/domains-hosts/bing_domain_web
[*] Reloading modules...
[recon-ng][default] > 
```
__Paso 7: Mostrar los módulos instalados__

Puedes utilizar el comando *module search* para mostrar todos los módulos que se han instalado en Recon-ng.
```bash
[recon-ng][default] > modules search

  Recon
  -----
    recon/domains-hosts/bing_domain_web

[recon-ng][default] > 
```
__Paso 8: Cargar un módulo__

Para cargar el módulo que deseas utilizar, utiliza el comando *modules lead*. Observa que la solicitud cambió para incluir el nombre del módulo cargado. Después de cargar el módulo, puedes mostrar las opciones del módulo mediante el comando *info*.
```bash
[recon-ng][default] > modules load recon/domains-hosts/bing_domain_web
[recon-ng][default][bing_domain_web] > info

      Name: Bing Hostname Enumerator
    Author: Tim Tomes (@lanmaster53)
   Version: 1.1

Description:
  Harvests hosts from Bing.com by using the 'site' search operator. Updates the 'hosts' table with the
  results.

Options:
  Name    Current Value  Required  Description
  ------  -------------  --------  -----------
  SOURCE  default        yes       source of input (see 'info' for details)

Source Options:
  default        SELECT DISTINCT domain FROM domains WHERE domain IS NOT NULL
  <string>       string representing a single input
  <path>         path to a file containing a list of inputs
  query <sql>    database query returning one column of inputs

[recon-ng][default][bing_domain_web] > 
```
__Paso 9: Cambiar la fuente__
Puedes cambiar la fuente (el dominio que se utilizará para encontrar sus subdominios) mediante el comando *options set SOURCE*. Una vez establecido el dominio de origen, puedes escribir *run* para ejecutar la consulta. El ejemplo muestra que se encontraron cuatro subdominios con el módulo *bing_domain_web*.
```bash
 [recon-ng][default][bing_domain_web] > options set SOURCE h4cker.org
 SOURCE => h4cker.org
 [recon-ng][default][bing_domain_web] > run
 ----------
 H4CKER.ORG
 ----------
 [*] URL: https://www.bing.com/search?first=0&q=domain%3Ah4cker.org
 [*] Country: None
 [*] Host: bootcamp.h4cker.org
 [*] Ip_Address: None
 [*] Latitude: None
 [*] Longitude: None
 [*] Notes: None
 [*] Region: None
 [*] --------------------------------------------------
 [*] Country: None
 [*] Host: webapps.h4cker.org
 [*] Ip_Address: None
 [*] Latitude: None
 [*] Longitude: None
 [*] Notes: None
 [*] Region: None
 [*] --------------------------------------------------
 [*] Country: None
 [*] Host: lpb.h4cker.org
 [*] Ip_Address: None
 [*] Latitude: None
 [*] Longitude: None
 [*] Notes: None
 [*] Region: None
 [*] --------------------------------------------------
 [*] Country: None
 [*] Host: malicious.h4cker.org
 [*] Ip_Address: None
 [*] Latitude: None
 [*] Longitude: None
 [*] Notes: None
 [*] Region: None
 [*] --------------------------------------------------
 [*] Sleeping to avoid lockout...
 [*] URL:
 https://www.bing.com/search?first=0&q=domain%3Ah4cker.org+-domain%3Abootcamp.h4cker.
 org+-domain%3Awebapps.h4cker.org+-domain%3Alpb.h4cker.org+-domain%3Amalicious.h4cker.org
 
 -------
 SUMMARY
 -------
 [*] 4 total (0 new) hosts found.
 [recon-ng][default][bing_domain_web] > 
```