import nmap
# Especificar el rango de puertos a escanear
inicio = 21
final = 80
objetivo = '10.6.6.23'
# Escanear el rango de puertos
for i in range(inicio, final+1):
    resultados = nmap.PortScanner(objetivo.str(i))
    resultados = resultados['scan'][objetivo]['tcp'][i]['state']
    print(f'Port {i} is {resultados}.')