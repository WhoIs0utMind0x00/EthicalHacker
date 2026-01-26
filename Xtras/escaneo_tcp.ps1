$nmapExe = "Program Files (x86) Nmap map.exe"
# Definir objetivos
$objetivo = "10.6.6.0/24", "172.17.0.02/29"

# Ejecutar escaneo a cada objetivo
foreach ($objetivo in $objetivo) {
    $filename = "resultados_nmap"
    $nmapfile = ". emp" + $filename + $objetivo + ".xml"
    cmd.exe /c "$nmapExe -p 20-25,80,443,3389,8080 -oX $nmapfile -A -v $objetivo"
}