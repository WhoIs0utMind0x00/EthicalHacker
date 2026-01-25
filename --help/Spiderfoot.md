<h1 style="text-align:center;">Menú de ayuda Spiderfoot</h1>
uso: sf.py [`-h`] [`-d`] [`-l IP:puerto`] [`-m mód1,mód2,...`] [`-M`] [`-C ID de Escaneo`]
[`-s OBJETIVO`] [`-t tipo1,tipo2,...`]
[`-u {all,footprint,investigate,passive}`] [`-T`]
             [`-o {tab,csv,json}`] [`-H`] [`-n`] [`-r`] [`-S LONGITUD`] [`-D DELIMITADOR`]
             [`-f`] [`-F tipo1,tipo2,...`] [`-x`] [`-q`] [`-V`]
             [`-max-threads MAX_HILOS`]

### SpiderFoot 4.0.0: Open Source Intelligence Automation.

| <h3 style="text-align:center;">Comando</h3> | <h3 style="text-align:center;">Descripción</h3> |
|---------|-------------|
| `-h`, `--help`       |     Muestra este mensaje de ayuda y sale.
  `-d`, `--debug`      |     Habilitar depuración de salida.
  `-l IP:Puerto`     |     IP y puerto para escuchar.
  `-m mód1,mód2,...` |     Módulos a habilitar.
  `-M`, `--modules`    |     Lista de módulos disponibles.
  `-C`, `--correlate scanID` | Ejecuta reglas de correlación contra un ID de escaneo.
  `-s OBJETIVO`       |    Objetivo para escanear.
  `-t tipo1,tipo2,...`|    Tipos de evento a guardar (módulos seleccionados automáticamente).
  `-u {all,footprint,investigate,passive}` | Selecciona módulos automáticamente por caso de uso.
  `-T`, `--types`      |     Lista de tipos de evento disponibles.
  `-o {tab,csv,json}` |    Formato de salida. Tab por defecto.
  `-H`                |    No imprime encabezados de campo, solo datos.
  `-n`                |    Elimina saltos de línea en los datos.
  `-r`                |    Incluye el campo de origen de datos en salida tab/csv.
  `-S LONGITUD`       |    Longitud máxima de datos mostrados. Por defecto, todos los datos son mostrados.
  `-D DELIMITADOR`    |    Delimitador a usar en salida CSV. Por defecto es ,.
  `-f`                |    Filtra otros tipos de evento que no fueron solicitados con -t.
  `-F tipo1,tipo2,...`|    Muestra solo un conjunto de tipos de evento, separados por comas.
  `-x`                |    MODO ESTRICTO. Solo habilitará módulos que directamente puedan consumir a tu objetivo, y si se especificaron eventos con -t serán consumidos por los módulos. Esto sobreescribe opciones de -t y -m.
  `-q`                |    Deshabilita el logging. ¡Esto puede ocultar errores!
  `-V`, `--version`     |    Muestra la versión de Spiderfoot y sale.
  `-max-threads MAX_HILOS` | Número máximo de módulos ejecutándose al mismo tiempo.

