# 9 ###################################################
#create client key and csr -- des_rsa_x509v3_sha256
openssl genrsa -des3 -out des_rsa_client.key 4096
openssl req -new -sha256 -key des_rsa_client.key -out des_rsa_sha256_client.csr
#sign the client cert with ca cert
openssl x509 -req -days 99999 -in des_rsa_sha256_client.csr -extfile v3.ext -CA ca.crt -CAkey ca.key -set_serial 01 -out des_rsa_x509v3_sha256_client.crt
#convert client cert into pkcs and pem format
openssl pkcs12 -export -clcerts -in des_rsa_x509v3_sha256_client.crt -inkey des_rsa_client.key -out des_rsa_x509v3_sha256_client.p12
openssl pkcs12 -in des_rsa_x509v3_sha256_client.p12 -out des_rsa_x509v3_sha256_client.pem -clcerts

# 10 ###################################################
#create client key and csr -- des_rsa_x509v3_md5
openssl req -new -md5 -key des_rsa_client.key -out des_rsa_md5_client.csr
#sign the client cert with ca cert
openssl x509 -req -days 99999 -in des_rsa_md5_client.csr -extfile v3.ext -CA ca.crt -CAkey ca.key -set_serial 01 -out des_rsa_x509v3_md5_client.crt
#convert client cert into pkcs and pem format
openssl pkcs12 -export -clcerts -in des_rsa_x509v3_md5_client.crt -inkey des_rsa_client.key -out des_rsa_x509v3_md5_client.p12
openssl pkcs12 -in des_rsa_x509v3_md5_client.p12 -out des_rsa_x509v3_md5_client.pem -clcerts

# 11 ###################################################
#create client key and csr -- des_dsa_x509v3_sha256
openssl gendsa -des3 -out des_dsa_client.key dsaparam.pem
openssl req -new -sha256 -key des_dsa_client.key -out des_dsa_sha256_client.csr
#sign the client cert with ca cert
openssl x509 -req -days 99999 -in des_dsa_sha256_client.csr -extfile v3.ext -CA ca.crt -CAkey ca.key -set_serial 01 -out des_dsa_x509v3_sha256_client.crt
#convert client cert into pkcs and pem format
openssl pkcs12 -export -clcerts -in des_dsa_x509v3_sha256_client.crt -inkey des_dsa_client.key -out des_dsa_x509v3_sha256_client.p12
openssl pkcs12 -in des_dsa_x509v3_sha256_client.p12 -out des_dsa_x509v3_sha256_client.pem -clcerts

# 12 ###################################################
#create client key and csr -- des_dsa_x509v3_md5
openssl req -new -md5 -key des_dsa_client.key -out des_dsa_md5_client.csr
#sign the client cert with ca cert
openssl x509 -req -days 99999 -in des_dsa_md5_client.csr -extfile v3.ext -CA ca.crt -CAkey ca.key -set_serial 01 -out des_dsa_x509v3_md5_client.crt
#convert client cert into pkcs and pem format
openssl pkcs12 -export -clcerts -in des_dsa_x509v3_md5_client.crt -inkey des_dsa_client.key -out des_dsa_x509v3_md5_client.p12
openssl pkcs12 -in des_dsa_x509v3_md5_client.p12 -out des_dsa_x509v3_md5_client.pem -clcerts

# 13 ###################################################
#create client key and csr -- aes_rsa_x509v3_sha256
openssl genrsa -aes256 -out aes_rsa_client.key 4096
openssl req -new -sha256 -key aes_rsa_client.key -out aes_rsa_sha256_client.csr
#sign the client cert with ca cert
openssl x509 -req -days 99999 -in aes_rsa_sha256_client.csr -extfile v3.ext -CA ca.crt -CAkey ca.key -set_serial 01 -out aes_rsa_x509v3_sha256_client.crt
#convert client cert into pkcs and pem format
openssl pkcs12 -export -clcerts -in aes_rsa_x509v3_sha256_client.crt -inkey aes_rsa_client.key -out aes_rsa_x509v3_sha256_client.p12
openssl pkcs12 -in aes_rsa_x509v3_sha256_client.p12 -out aes_rsa_x509v3_sha256_client.pem -clcerts

# 14 ###################################################
#create client key and csr -- aes_rsa_x509v3_md5
openssl req -new -md5 -key aes_rsa_client.key -out aes_rsa_md5_client.csr
#sign the client cert with ca cert
openssl x509 -req -days 99999 -in aes_rsa_md5_client.csr -extfile v3.ext -CA ca.crt -CAkey ca.key -set_serial 01 -out aes_rsa_x509v3_md5_client.crt
#convert client cert into pkcs and pem format
openssl pkcs12 -export -clcerts -in aes_rsa_x509v3_md5_client.crt -inkey aes_rsa_client.key -out aes_rsa_x509v3_md5_client.p12
openssl pkcs12 -in aes_rsa_x509v3_md5_client.p12 -out aes_rsa_x509v3_md5_client.pem -clcerts

# 15 ###################################################
#create client key and csr -- aes_dsa_x509v3_sha256
openssl gendsa -aes256 -out aes_dsa_client.key dsaparam.pem
openssl req -new -sha256 -key aes_dsa_client.key -out aes_dsa_sha256_client.csr
#sign the client cert with ca cert
openssl x509 -req -days 99999 -in aes_dsa_sha256_client.csr -extfile v3.ext -CA ca.crt -CAkey ca.key -set_serial 01 -out aes_dsa_x509v3_sha256_client.crt
#convert client cert into pkcs and pem format
openssl pkcs12 -export -clcerts -in aes_dsa_x509v3_sha256_client.crt -inkey aes_dsa_client.key -out aes_dsa_x509v3_sha256_client.p12
openssl pkcs12 -in aes_dsa_x509v3_sha256_client.p12 -out aes_dsa_x509v3_sha256_client.pem -clcerts

# 16 ###################################################
#create client key and csr -- aes_dsa_x509v3_md5
openssl req -new -md5 -key aes_dsa_client.key -out aes_dsa_md5_client.csr
#sign the client cert with ca cert
openssl x509 -req -days 99999 -in aes_dsa_md5_client.csr -extfile v3.ext -CA ca.crt -CAkey ca.key -set_serial 01 -out aes_dsa_x509v3_md5_client.crt
#convert client cert into pkcs and pem format
openssl pkcs12 -export -clcerts -in aes_dsa_x509v3_md5_client.crt -inkey aes_dsa_client.key -out aes_dsa_x509v3_md5_client.p12
openssl pkcs12 -in aes_dsa_x509v3_md5_client.p12 -out aes_dsa_x509v3_md5_client.pem -clcerts
