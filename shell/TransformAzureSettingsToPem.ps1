(Select-Xml -Path .\downloaded.publishsettings -XPath '//PublishData/PublishProfile/Subscription[@Name="YOURSUBSCRIPTIONNAME"]/@ManagementCertificate').Node.Value.ToString() | Out-File .\mgmtcert.pfx
openssl base64 -d -in mgmtcert.pfx -out decoded.der
openssl pkcs12 -in decoded.der -out mgmtcert.pem -nodes
