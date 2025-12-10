# Identificación de contactos técnicos y administrativos
Puede identificar fácilmente los contactos técnicos y administrativos del dominio mediante la herramienta Whois. Muchas organizaciones mantienen la privacidad de sus datos de registro y, en cambio, utilizan los contactos de la organización del registrador de dominios. Por ejemplo, veamos los contactos técnicos y administrativos de h4cker.org (que se muestran en el ejemplo 3-4). Omar Santos posee el dominio h4cker.org; sin embargo, los detalles técnicos y administrativos son privados. Solo se muestran el correo electrónico de contacto de abuso y el número de teléfono de Google (el registrador de dominios).

### *Información de Whois para el dominio h4cker.org*
```bash
|--[omar@websploit]--[~]
|--- $ whois h4cker.org
Domain Name: H4CKER.ORG
Registry Domain ID: D402200000006011258-LROR
Registrar WHOIS Server: whois.google.com
Registrar URL: https://domains.google.com
Updated Date: 2018-07-03T03:48:35Z
Creation Date: 2018-05-04T03:43:52Z
Registry Expiry Date: 2028-05-04T03:43:52Z
Registrar Registration Expiration Date:
Registrar: Google LLC
Registrar IANA ID: 895
Registrar Abuse Contact Email: registrar-abuse@google.com
Registrar Abuse Contact Phone: +1.8772376466
Reseller:
Domain Status: ok https://icann.org/epp#ok
Registrant Organization: Contact Privacy Inc. Customer 1242605855
Registrant State/Province: ON
Registrant Country: CA
Name Server: NS-CLOUD-C1.GOOGLEDOMAINS.COM
Name Server: NS-CLOUD-C2.GOOGLEDOMAINS.COM
Name Server: NS-CLOUD-C4.GOOGLEDOMAINS.COM
Name Server: NS-CLOUD-C3.GOOGLEDOMAINS.COM
DNSSEC: signedDelegation
URL of the ICANN Whois Inaccuracy Complaint Form https://www.icann.org/wicf/)
```
Ahora, veamos los detalles de Whois para tesla.com.

### Información de Whois para el dominio tesla.com
```bash
|--[omar@websploit]--[~]
|--- $whois tesla.com
   Domain Name: TESLA.COM
   Registry Domain ID: 187902_DOMAIN_COM-VRSN
   Registrar WHOIS Server: whois.markmonitor.com
   Registrar URL: http://www.markmonitor.com
   Registrar: MarkMonitor Inc.
   Registrar IANA ID: 292
   Registrar Abuse Contact Email: abusecomplaints@markmonitor.com
   Registrar Abuse Contact Phone: +1.2083895740
   Domain Status: serverUpdateProhibited
https://icann.org/epp#serverUpdateProhibited
   Name Server: A1-12.AKAM.NET
   Name Server: A10-67.AKAM.NET
   Name Server: A12-64.AKAM.NET
   Name Server: A28-65.AKAM.NET
   Name Server: A7-66.AKAM.NET
   Name Server: A9-67.AKAM.NET
   Name Server: EDNS69.ULTRADNS.BIZ
   Name Server: EDNS69.ULTRADNS.COM
   Name Server: EDNS69.ULTRADNS.NET
   Name Server: EDNS69.ULTRADNS.ORG
   DNSSEC: unsigned
   URL of the ICANN Whois Inaccuracy Complaint Form:
https://www.icann.org/wicf/
<output omitted for brevity>
The Registry database contains ONLY .COM, .NET, .EDU domains and Registrars.
Domain Name: tesla.com
Registry Domain ID: 187902_DOMAIN_COM-VRSN
Registrar WHOIS Server: whois.markmonitor.com
Registrar URL: http://www.markmonitor.com
Updated Date: 2020-10-02T02:07:57-0700
Creation Date: 1992-11-03T21:00:00-0800
Registrar Registration Expiration Date: 2022-11-02T00:00:00-0700
Registrar: MarkMonitor, Inc.
Registrar IANA ID: 292
Registrar Abuse Contact Email: abusecomplaints@markmonitor.com
Registrar Abuse Contact Phone: +1.2083895770
Domain Status: clientUpdateProhibited (https://www.icann.org/epp#clientUpdateProhibited)
Domain Status: clientTransferProhibited (https://www.icann.org/epp#clientTransferProhibited)
Domain Status: clientDeleteProhibited (https://www.icann.org/epp#clientDeleteProhibited)
Domain Status: serverUpdateProhibited (https://www.icann.org/epp#serverUpdateProhibited)
Domain Status: serverTransferProhibited (https://www.icann.org/epp#serverTransferProhibited)
Domain Status: serverDeleteProhibited (https://www.icann.org/epp#serverDeleteProhibited)
Registry Registrant ID:
Registrant Name: Domain Administrator
Registrant Organization: DNStination Inc.
Registrant Street: 3450 Sacramento Street, Suite 405
Registrant City: San Francisco
Registrant State/Province: CA
Registrant Postal Code: 94118
Registrant Country: US
Registrant Phone: +1.4155319335
Registrant Phone Ext:
Registrant Fax: +1.4155319336
Registrant Fax Ext:
Registrant Email: admin@dnstinations.com
Registry Admin ID:
Admin Name: Domain Administrator
Admin Organization: DNStination Inc.
Admin Street: 3450 Sacramento Street, Suite 405
Admin City: San Francisco
Admin State/Province: CA
Admin Postal Code: 94118
Admin Country: US
Admin Phone: +1.4155319335
Admin Phone Ext:
Admin Fax: +1.4155319336
Admin Fax Ext:
Admin Email: admin@dnstinations.com
Registry Tech ID:
Tech Name: Domain Administrator
Tech Organization: DNStination Inc.
Tech Street: 3450 Sacramento Street, Suite 405
Tech City: San Francisco
Tech State/Province: CA
Tech Postal Code: 94118
Tech Country: US
Tech Phone: +1.4155319335
Tech Phone Ext:
Tech Fax: +1.4155319336
Tech Fax Ext:
Tech Email: admin@dnstinations.com
Name Server: edns69.ultradns.org
Name Server: edns69.ultradns.net
Name Server: a10-67.akam.net
Name Server: a12-64.akam.net
Name Server: edns69.ultradns.biz
Name Server: a1-12.akam.net
Name Server: a9-67.akam.net
Name Server: a28-65.akam.net
Name Server: a7-66.akam.net
Name Server: edns69.ultradns.com
<output omitted for brevity>
MarkMonitor reserves the right to modify these terms at any time.
By submitting this query, you agree to abide by this policy.
MarkMonitor Domain Management(TM)
Protecting companies and consumers in a digital world.
Visit MarkMonitor at https://www.markmonitor.com
Contact us at +1.8007459229
In Europe, at +44.02032062220
```

### *Visualización de contactos técnicos y administrativos por correo electrónico*
``` bash
|--[omar@websploit]--[~]
|--- $whois cisco.com | grep '@cisco.com'
Registrant Email: infosec@cisco.com
Admin Email: infosec@cisco.com
Tech Email: infosec@cisco.com
```