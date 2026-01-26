require 'nmap/command'
Nmap::Command.sudo do |nmap|
  nmap.syn_scan       = true
  nmap.os_fingerprint = true
  nmap.service_scan   = true
  nmap.output_xml     = 'scan.xml'
  nmap.verbose        = true
  nmap.ports = [20, 21, 22, 23, 25, 80, 110, 443, 512, 522, 8080, 1080]
  nmap.targets = '10.6.6.*'
end
# Analizar resultados del escaneo en el archivo XML
require 'nmap/xml'
Nmap::XML.open('scan.xml') do |xml|
  xml.each_host do |host|
    puts "[#{host.ip}]"
    host.each_port do |port|
      puts "  #{port.number}/#{port.protocol}     #{port.state}   #{port.service}"
    end
  end
end

