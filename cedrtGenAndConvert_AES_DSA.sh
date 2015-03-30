#create the ca ke and vertificate for signing client certs
openssl dsaparam -out dsaparam.pem 1024
openssl gendsa -aes256 -out ca.key dsaparam.pem
openssl req -new -x509 -days 365 -key ca.key -out ca.crt

#create the server key, csr and cert
#openssl gendsa -aes256 -out server.key dsaparam2.pem
#openssl req -new -key server.key -out server.csr

#we're seld signing our own server cert here
#openssl x509 -req -days 365 -in server.csr -CA ca.crt -CAkey ca.key -set_serial 01 -out server.crt

#create client key and csr
openssl gendsa -aes256 -out client.key dsaparam.pem
openssl req -new -key client.key -out client.csr

#sign the client cert with ca cert
openssl x509v3 -req -days 365 -in client.csr -CA ca.crt -CAkey ca.key -set_serial 01 -out client.crt

#convert client cert into pkcs and pem format
openssl pkcs12 -export -clcerts -in client.crt -inkey client.key -out client.p12
openssl pkcs12 -in client.p12 -out client.pem -clcerts


#PUBLIC  KEY CRYPTOGRAPHY AND KEY AGREEMENT
# dsa, dh, rsa
#CERTIFICATES
# x509, x509v3
#HASH FUNCTIONS AND AUTHENTICATION CODES
# hmac, md2, md4, md5, mdc2, ripemd, sha
#SYMMETRIX CIPHERS
# aes, rc2, rc4, rc5, des, blowfish, cast, idea
# DATA ENCODING AND INPUT/OUPT
# pem, pkcs7, pkcs12, asn1, bio, evp
