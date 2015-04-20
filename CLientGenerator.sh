#create the ca and vertificate for signing client certs
#openssl genrsa -des3 -out ca.key 4096
#openssl req -new -x509 -days 99999 -key ca.key -out ca.crt
#create the ca and vertificate for signing client certs
openssl dsaparam -out dsaparam.pem 1024
openssl gendsa -aes256 -out ca.key dsaparam.pem
openssl req -new -x509 -days 99999 -key ca.key -out ca.crt

#create the server key, csr and cert
openssl genrsa -des3 -out server.key 4096
openssl req -new -key server.key -out server.csr
#we're self signing our own server cert here
openssl x509 -req -days 99999 -in server.csr -CA ca.crt -CAkey ca.key -set_serial 01 -out server.crt

# 1 ###################################################
#create client key and csr -- des_rsa_x509v1_sha256
openssl genrsa -des3 -out des_rsa_client.key 4096
openssl req -new -sha256 -key des_rsa_client.key -out des_rsa_sha256_client.csr
#sign the client cert with ca cert
openssl x509 -req -days 99999 -in des_rsa_sha256_client.csr -CA ca.crt -CAkey ca.key -set_serial 01 -out des_rsa_x509v1_sha256_client.crt
#convert client cert into pkcs and pem format
openssl pkcs12 -export -clcerts -in des_rsa_x509v1_sha256_client.crt -inkey des_rsa_client.key -out des_rsa_x509v1_sha256_client.p12
openssl pkcs12 -in des_rsa_x509v1_sha256_client.p12 -out des_rsa_x509v1_sha256_client.pem -clcerts

# 2 ###################################################
#create client key and csr -- des_rsa_x509v1_md5
openssl req -new -md5 -key des_rsa_client.key -out des_rsa_md5_client.csr
#sign the client cert with ca cert
openssl x509 -req -days 99999 -in des_rsa_md5_client.csr -CA ca.crt -CAkey ca.key -set_serial 01 -out des_rsa_x509v1_md5_client.crt
#convert client cert into pkcs and pem format
openssl pkcs12 -export -clcerts -in des_rsa_x509v1_md5_client.crt -inkey des_rsa_client.key -out des_rsa_x509v1_md5_client.p12
openssl pkcs12 -in des_rsa_x509v1_md5_client.p12 -out des_rsa_x509v1_md5_client.pem -clcerts

# 3 ###################################################
#create client key and csr -- des_dsa_x509v1_sha256
openssl gendsa -des3 -out des_dsa_client.key dsaparam.pem
openssl req -new -sha256 -key des_dsa_client.key -out des_dsa_sha256_client.csr
#sign the client cert with ca cert
openssl x509 -req -days 99999 -in des_dsa_sha256_client.csr -CA ca.crt -CAkey ca.key -set_serial 01 -out des_dsa_x509v1_sha256_client.crt
#convert client cert into pkcs and pem format
openssl pkcs12 -export -clcerts -in des_dsa_x509v1_sha256_client.crt -inkey des_dsa_client.key -out des_dsa_x509v1_sha256_client.p12
openssl pkcs12 -in des_dsa_x509v1_sha256_client.p12 -out des_dsa_x509v1_sha256_client.pem -clcerts

# 4 ###################################################
#create client key and csr -- des_dsa_x509v1_md5
openssl req -new -md5 -key des_dsa_client.key -out des_dsa_md5_client.csr
#sign the client cert with ca cert
openssl x509 -req -days 99999 -in des_dsa_md5_client.csr -CA ca.crt -CAkey ca.key -set_serial 01 -out des_dsa_x509v1_md5_client.crt
#convert client cert into pkcs and pem format
openssl pkcs12 -export -clcerts -in des_dsa_x509v1_md5_client.crt -inkey des_dsa_client.key -out des_dsa_x509v1_md5_client.p12
openssl pkcs12 -in des_dsa_x509v1_md5_client.p12 -out des_dsa_x509v1_md5_client.pem -clcerts

# 5 ###################################################
#create client key and csr -- aes_rsa_x509v1_sha256
openssl genrsa -aes256 -out aes_rsa_client.key 4096
openssl req -new -sha256 -key aes_rsa_client.key -out aes_rsa_sha256_client.csr
#sign the client cert with ca cert
openssl x509 -req -days 99999 -in aes_rsa_sha256_client.csr -CA ca.crt -CAkey ca.key -set_serial 01 -out aes_rsa_x509v1_sha256_client.crt
#convert client cert into pkcs and pem format
openssl pkcs12 -export -clcerts -in aes_rsa_x509v1_sha256_client.crt -inkey aes_rsa_client.key -out aes_rsa_x509v1_sha256_client.p12
openssl pkcs12 -in aes_rsa_x509v1_sha256_client.p12 -out aes_rsa_x509v1_sha256_client.pem -clcerts

# 6 ###################################################
#create client key and csr -- aes_rsa_x509v1_md5
openssl req -new -md5 -key aes_rsa_client.key -out aes_rsa_md5_client.csr
#sign the client cert with ca cert
openssl x509 -req -days 99999 -in aes_rsa_md5_client.csr -CA ca.crt -CAkey ca.key -set_serial 01 -out aes_rsa_x509v1_md5_client.crt
#convert client cert into pkcs and pem format
openssl pkcs12 -export -clcerts -in aes_rsa_x509v1_md5_client.crt -inkey aes_rsa_client.key -out aes_rsa_x509v1_md5_client.p12
openssl pkcs12 -in aes_rsa_x509v1_md5_client.p12 -out aes_rsa_x509v1_md5_client.pem -clcerts

# 7 ###################################################
#create client key and csr -- aes_dsa_x509v1_sha256
openssl gendsa -aes256 -out aes_dsa_client.key dsaparam.pem
openssl req -new -sha256 -key aes_dsa_client.key -out aes_dsa_sha256_client.csr
#sign the client cert with ca cert
openssl x509 -req -days 99999 -in aes_dsa_sha256_client.csr -CA ca.crt -CAkey ca.key -set_serial 01 -out aes_dsa_x509v1_sha256_client.crt
#convert client cert into pkcs and pem format
openssl pkcs12 -export -clcerts -in aes_dsa_x509v1_sha256_client.crt -inkey aes_dsa_client.key -out aes_dsa_x509v1_sha256_client.p12
openssl pkcs12 -in aes_dsa_x509v1_sha256_client.p12 -out aes_dsa_x509v1_sha256_client.pem -clcerts

# 8 ###################################################
#create client key and csr -- aes_dsa_x509v1_md5
openssl req -new -md5 -key aes_dsa_client.key -out aes_dsa_md5_client.csr
#sign the client cert with ca cert
openssl x509 -req -days 99999 -in aes_dsa_md5_client.csr -CA ca.crt -CAkey ca.key -set_serial 01 -out aes_dsa_x509v1_md5_client.crt
#convert client cert into pkcs and pem format
openssl pkcs12 -export -clcerts -in aes_dsa_x509v1_md5_client.crt -inkey aes_dsa_client.key -out aes_dsa_x509v1_md5_client.p12
openssl pkcs12 -in aes_dsa_x509v1_md5_client.p12 -out aes_dsa_x509v1_md5_client.pem -clcerts

