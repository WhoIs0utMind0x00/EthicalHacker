# Práctica de laboratorio - Investigación de fuentes de información de vulnerabilidades

# Objetivos
Utilice varias fuentes útiles para investigar más a fondo las vulnerabilidades.

- Parte 1: Investigar vulnerabilidades y exposiciones comunes (CVE)
- Parte 2: Explorar las enumeraciones de debilidades comunes (CWE)
- Parte 3: Investigar los recursos de vulnerabilidades del Instituto Nacional de Estándares y Tecnología (NIST)
- Parte 4: Investigar las vulnerabilidades en el sistema común de puntuación de vulnerabilidades (CVSS)
## Trasfondo / Escenario
En una práctica de laboratorio anterior, encontró varias vulnerabilidades después de escanear un sistema de destino. Ahora utilizará varias fuentes ampliamente disponibles para profundizar en los detalles de las vulnerabilidades. Asignará e investigará las vulnerabilidades en la lista de vulnerabilidades y exposiciones comunes (CVE), la enumeración de debilidades comunes (CWE), la base de datos nacional de vulnerabilidades del NIST y el sistema de puntuación de vulnerabilidades comunes (CVSS).

## Recursos necesarios
- Computadora con conexión a Internet

## Parte 1: Investigue las vulnerabilidades y exposiciones comunes (CVE)
__Paso 1: Explore las CVE__<br>
- Inicie el sitio web de CVE y vaya a www.cve.org.
- Lea la descripción general del programa CVE.
- Seleccione About > Overview en el menú.
- Vea el video de descripción general del programa CVE.
- Consulte los podcasts disponibles para obtener información más detallada sobre el programa CVE.
__Paso 2: Utilice el programa CVE para recopilar información sobre las vulnerabilidades__<br>
En una práctica de laboratorio anterior, analizó un sistema de destino en busca de vulnerabilidades. La lista de vulnerabilidades encontradas arrojó los siguientes seis CVE:
- CVE-2021-41617
- CVE-2020-14145
- CVE-2019-16905
- CVE-2019-6111
- CVE-2019-6110
- CVE-2019-6109
 
Ingrese CVE-2021-41617 en la ventana de búsqueda y haga clic en Find.
En la parte inferior de la página, haga clic en CVE-2021-41617 para ver información adicional sobre la CVE de la Base de datos nacional de vulnerabilidades (NVD) del NIST.

En el sitio de CVE (www.cve.org), ingrese CVE-2019-6111 en el cuadro de búsqueda y haga clic en Find.
Desplácese hasta la parte inferior de la página CVE y haga clic en CVE-2019-6111 para ver información adicional sobre el NVD.
En la página NVD para CVE-2019-6111, desplácese hacia abajo hasta la sección Weakness Enumeration.

Registre esta ID de CWE para usar en la Parte 2.

Repita los pasos del a al d. para obtener los ID de CWE asociados con las otras CVE devueltas.

## Parte 2: Explore la enumeración de debilidades comunes (CWE)
__Paso 1: Explore CWE__<br>
- Inicie el sitio web de CWE y vaya a https://cwe.mitre.org.
- Explore el programa CVE seleccionando About > Overview en el menú.
- ID que grabó en el paso 2 de la parte 1.
- Introduzca 22 en el cuadro ID Lookup en la parte superior derecha de la página de CWE. (Este es el ID de CWE para CVE-2019-6111)
- Desplácese por la información disponible sobre esta CWE.
- Repita el paso c. Busque los ID de CWE restantes que registró en la parte 1, paso 2g.

## Parte 3: Investigue los recursos de vulnerabilidades del Instituto Nacional de Estándares y Tecnología (NIST)
__Paso 1: Explore el NIST__
- Inicie el sitio web de NIST navegando a https://www.nist.gov.
- Seleccione About NIST > About Us en el menú y revise la descripción general de NIST.

- Explore la base de datos nacional de vulnerabilidad (NVD)
- Regrese a la página de inicio de NIST y seleccione Topics > Information Technology en el menú.
- Seleccione National Vulnerability Database en la lista Featured Content.
- Haga clic en General para ver y revisar la información general sobre el NVD.
- Expanda el menú en General y haga clic en NVD Dashboard
- Vuelva a la página de la Base de datos nacional de vulnerabilidades https://nvd.nist.gov/.
- Haga clic en Vulnerability Metrics en el menú a la izquierda de la página.
## Parte 4: Investigue las vulnerabilidades en el sistema común de puntuación de vulnerabilidades (CVSS)
__Paso 1: Explore CVSS__
- Inicie el sitio web de CVSS y vaya a https://first.org/cvss
- Revise la información en CVSS.
- Investigue las calificaciones CVSS haciendo clic en Specification Document en el menú de la izquierda.

- Haga clic en Examples en el menú de la izquierda.
- Haga clic en el enlace CVSS version 3.1 para ver ejemplos.
- Desplácese hacia abajo en la página y revise los ejemplos de CVE y cómo se calcularon sus puntuaciones base de CVSS v3.1.
- Observe los valores proporcionados para cada métrica que conforma la puntuación del CVSS.
- Investigue las calificaciones CVSS de los CWE registradas en la parte 1, paso 2.
- Vaya a www.cve.org.
- En el cuadro de búsqueda, introduzca CVE-2021-41617 y haga clic en Find.
- Desplácese hasta la parte inferior de la página y haga clic en CVE-2021-41617 para ver información adicional sobre el NVD. Esto abre la base de datos nacional de vulnerabilidades para ver los detalles sobre la CVE.
- Desplácese hasta la sección Severity y asegúrese de seleccionar CVSS Version 3.x.
- Observe los valores de las ocho métricas base de CVSS en el Vector. La puntuación numérica correspondiente de estos valores se combina para dar una puntuación base de 7,0 ALTA.

- En una ventana separada del navegador, vaya a la calculadora de CVSS 3.1 en https://www.first.org/cvss/calculator/3.1.
- En la calculadora de puntuación base, haga clic en los nombres de las métricas que correspondan al vector en la página de NVD. (Vector: CVSS:3.1/AV:L/AC:H/PR:L/UI:N/S:U/C:H/I:H/A:H)