#create the ca and vertificate for signing client certs
#openssl genrsa -des3 -out ca.key 4096
#openssl req -new -x509 -days 99999 -key ca.key -out ca.crt
#create the ca and vertificate for signing client certs
#openssl dsaparam -out dsaparam.pem 1024
#openssl gendsa -aes256 -out ca.key dsaparam.pem
#openssl req -new -x509 -days 99999 -key ca.key -out ca.crt

#create the server key, csr and cert
#openssl genrsa -des3 -out server.key 4096
#openssl req -new -key server.key -out server.csr
#we're self signing our own server cert here
#openssl x509 -req -days 99999 -in server.csr -CA ca.crt -CAkey ca.key -set_serial 01 -out server.crt

# 1 ###################################################
echo "**********************************************start generate rsa+des3+sha256 cert *************************"
#create the ca and vertificate for signing client certs
#openssl genrsa -des3 -out ca.key 4096
#openssl req -new -x509 -days 99999 -key ca.key -out ca.crt
#create the ca and vertificate for signing client certs
openssl genrsa -des3 -out ca_rsa_des3.key 4096
openssl req -new -x509 -days 99999 -key ca_rsa_des3.key -out ca_rsa_des3.crt
#create the server key, csr and cert
openssl genrsa -des3 -out server_rsa_des3.key 4096
openssl req -new -key server_rsa_des3.key -out server_rsa_des3.csr
#we're self signing our own server cert here
openssl x509 -req -days 99999 -in server_rsa_des3.csr -CA ca_rsa_des3.crt -CAkey ca_rsa_des3.key -set_serial 01 -out server_rsa_des3.crt

#create client key and csr -- des_rsa_x509v1_sha256
openssl genrsa -des3 -out des_rsa_client.key 4096
openssl req -new -sha256 -key des_rsa_client.key -out des_rsa_sha256_client.csr
#sign the client cert with ca cert
openssl x509 -req -days 99999 -in des_rsa_sha256_client.csr -CA ca_rsa_des3.crt -CAkey ca_rsa_des3.key -set_serial 01 -out des_rsa_x509v1_sha256_client.crt
#convert client cert into pkcs and pem format
openssl pkcs12 -export -clcerts -in des_rsa_x509v1_sha256_client.crt -inkey des_rsa_client.key -out des_rsa_x509v1_sha256_client.p12
echo "*************************************************************************************************1 is done"

# 2 ###################################################
echo "**********************************************start generate rsa+des3+md5 cert *************************"
#create client key and csr -- des_rsa_x509v1_md5
openssl genrsa -des3 -out des_rsa_client.key 4096
openssl req -new -md5 -key des_rsa_client.key -out des_rsa_md5_client.csr
#sign the client cert with ca cert
openssl x509 -req -md5 -days 99999 -in des_rsa_md5_client.csr -CA ca_rsa_des3.crt -CAkey ca_rsa_des3.key -set_serial 01 -out des_rsa_x509v1_md5_client.crt
#convert client cert into pkcs and pem format
openssl pkcs12 -export -clcerts -in des_rsa_x509v1_md5_client.crt -inkey des_rsa_client.key -out des_rsa_x509v1_md5_client.p12
echo "*************************************************************************************************2 is done"

# 3 ###################################################
echo "**********************************************start generate dsa+des3+sha256 cert *************************"
#create the ca and vertificate for signing client certs
openssl dsaparam -out dsaparam.pem 1024
openssl gendsa -des3 -out ca_dsa_des3.key dsaparam.pem
openssl req -new -x509 -days 99999 -key ca_dsa_des3.key -out ca_dsa_des3.crt
#create the server key, csr and cert
openssl gendsa -des3 -out server_dsa_des3.key dsaparam.pem
openssl req -new -key server_dsa_des3.key -out server_dsa_des3.csr
#we're self signing our own server cert here
openssl x509 -req -days 99999 -in server_dsa_des3.csr -CA ca_dsa_des3.crt -CAkey ca_dsa_des3.key -set_serial 01 -out server_dsa_des3.crt

#create client key and csr -- des_dsa_x509v1_sha256
openssl gendsa -des3 -out des_dsa_client.key dsaparam.pem
openssl req -new -sha256 -key des_dsa_client.key -out des_dsa_sha256_client.csr
#sign the client cert with ca cert
openssl x509 -req -days 99999 -in des_dsa_sha256_client.csr -CA ca_dsa_des3.crt -CAkey ca_dsa_des3.key -set_serial 01 -out des_dsa_x509v1_sha256_client.crt
#convert client cert into pkcs and pem format
openssl pkcs12 -export -clcerts -in des_dsa_x509v1_sha256_client.crt -inkey des_dsa_client.key -out des_dsa_x509v1_sha256_client.p12
echo "*************************************************************************************************3 is done"

# 4 ###################################################
echo "**********************************************start generate dsa+des3+md5 cert *************************"
#create client key and csr -- des_dsa_x509v1_md5
openssl gendsa -des3 -out des_dsa_client.key dsaparam.pem
openssl req -new -md5 -key des_dsa_client.key -out des_dsa_md5_client.csr #using md5 by default
#sign the client cert with ca cert
openssl x509 -req -md5 -days 99999 -in des_dsa_md5_client.csr -CA ca_dsa_des3.crt -CAkey ca_dsa_des3.key -set_serial 01 -out des_dsa_x509v1_md5_client.crt
#convert client cert into pkcs and pem format
openssl pkcs12 -export -clcerts -in des_dsa_x509v1_md5_client.crt -inkey des_dsa_client.key -out des_dsa_x509v1_md5_client.p12
echo "*************************************************************************************************4 is done"

# 5 ###################################################
echo "**********************************************start generate rsa+aes+sha256 cert *************************"
#create the ca and vertificate for signing client certs
openssl genrsa -aes256 -out ca_rsa_aes.key 4096
openssl req -new -x509 -days 99999 -key ca_rsa_aes.key -out ca_rsa_aes.crt
#create the server key, csr and cert
openssl genrsa -aes256 -out server_rsa_aes.key 4096
openssl req -new -key server_rsa_aes.key -out server_rsa_aes.csr
#we're self signing our own server cert here
openssl x509 -req -days 99999 -in server_rsa_aes.csr -CA ca_rsa_aes.crt -CAkey ca_rsa_aes.key -set_serial 01 -out server_rsa_aes.crt

#create client key and csr -- aes_rsa_x509v1_sha256
openssl genrsa -aes256 -out aes_rsa_client.key 4096
openssl req -new -sha256 -key aes_rsa_client.key -out aes_rsa_sha256_client.csr
#sign the client cert with ca cert
openssl x509 -req -days 99999 -in aes_rsa_sha256_client.csr -CA ca_rsa_aes.crt -CAkey ca_rsa_aes.key -set_serial 01 -out aes_rsa_x509v1_sha256_client.crt
#convert client cert into pkcs and pem format
openssl pkcs12 -export -clcerts -in aes_rsa_x509v1_sha256_client.crt -inkey aes_rsa_client.key -out aes_rsa_x509v1_sha256_client.p12
echo "*************************************************************************************************5 is done"

# 6 ###################################################
echo "**********************************************start generate rsa+aes+md5 cert *************************"
#create client key and csr -- aes_rsa_x509v1_md5
openssl genrsa -aes256 -out aes_rsa_client.key 4096
openssl req -new -key aes_rsa_client.key -out aes_rsa_md5_client.csr
#sign the client cert with ca cert
openssl x509 -req -md5 -days 99999 -in aes_rsa_md5_client.csr -CA ca_rsa_aes.crt -CAkey ca_rsa_aes.key -set_serial 01 -out aes_rsa_x509v1_md5_client.crt
#convert client cert into pkcs and pem format
openssl pkcs12 -export -clcerts -in aes_rsa_x509v1_md5_client.crt -inkey aes_rsa_client.key -out aes_rsa_x509v1_md5_client.p12
echo "*************************************************************************************************6 is done"

# 7 ###################################################
#create the ca and vertificate for signing client certs
openssl dsaparam -out dsaparam.pem 1024
openssl gendsa -aes256 -out ca_dsa_aes.key dsaparam.pem
openssl req -new -x509 -days 99999 -key ca_dsa_aes.key -out ca_dsa_aes.crt
#create the server key, csr and cert
openssl gendsa -aes256 -out server_dsa_aes.key dsaparam.pem
openssl req -new -key server_dsa_aes.key -out server_dsa_aes.csr
#we're self signing our own server cert here
openssl x509 -req -days 99999 -in server_dsa_aes.csr -CA ca_dsa_aes.crt -CAkey ca_dsa_aes.key -set_serial 01 -out server_dsa_aes.crt

#create client key and csr -- aes_dsa_x509v1_sha256
openssl gendsa -aes256 -out aes_dsa_client.key dsaparam.pem
openssl req -new -sha256 -key aes_dsa_client.key -out aes_dsa_sha256_client.csr
#sign the client cert with ca cert
openssl x509 -req -days 99999 -in aes_dsa_sha256_client.csr -CA ca_dsa_aes.crt -CAkey ca_dsa_aes.key -set_serial 01 -out aes_dsa_x509v1_sha256_client.crt
#convert client cert into pkcs
openssl pkcs12 -export -clcerts -in aes_dsa_x509v1_sha256_client.crt -inkey aes_dsa_client.key -out aes_dsa_x509v1_sha256_client.p12
echo "*************************************************************************************************7 is done"

# 8 ###################################################
#create client key and csr -- aes_dsa_x509v1_md5
openssl req -new -key aes_dsa_client.key -out aes_dsa_md5_client.csr #using md5 by default
#sign the client cert with ca cert
openssl x509 -req -days 99999 -in aes_dsa_md5_client.csr -CA ca.crt -CAkey ca.key -set_serial 01 -out aes_dsa_x509v1_md5_client.crt
#convert client cert into pkcs and pem format
openssl pkcs12 -export -clcerts -in aes_dsa_x509v1_md5_client.crt -inkey aes_dsa_client.key -out aes_dsa_x509v1_md5_client.p12
echo "*************************************************************************************************8 is done"


# 9 ###################################################
#create client key and csr -- des_rsa_x509v3_sha256
openssl genrsa -des3 -out des_rsa_client.key 4096
openssl req -new -sha256 -key des_rsa_client.key -out des_rsa_sha256_client.csr
#sign the client cert with ca cert
openssl x509 -req -days 99999 -in des_rsa_sha256_client.csr -extfile v3.ext -CA _rsa_des3.crt -CAkey _rsa_des3.key -set_serial 01 -out des_rsa_x509v3_sha256_client.crt
#convert client cert into pkcs and pem format
openssl pkcs12 -export -clcerts -in des_rsa_x509v3_sha256_client.crt -inkey des_rsa_client.key -out des_rsa_x509v3_sha256_client.p12
echo "*************************************************************************************************9 is done"

# 10 ###################################################
#create client key and csr -- des_rsa_x509v3_md5
openssl req -new -md5 -key des_rsa_client.key -out des_rsa_md5_client.csr
#sign the client cert with ca cert
openssl x509 -req -md5 -days 99999 -in des_rsa_md5_client.csr -extfile v3.ext -CA _rsa_des3.crt -CAkey _rsa_des3.key -set_serial 01 -out des_rsa_x509v3_md5_client.crt
#convert client cert into pkcs and pem format
openssl pkcs12 -export -clcerts -in des_rsa_x509v3_md5_client.crt -inkey des_rsa_client.key -out des_rsa_x509v3_md5_client.p12
echo "*************************************************************************************************10 is done"

# 11 ###################################################
#create client key and csr -- des_dsa_x509v3_sha256
openssl gendsa -des3 -out des_dsa_client.key dsaparam.pem
openssl req -new -sha256 -key des_dsa_client.key -out des_dsa_sha256_client.csr
#sign the client cert with ca cert
openssl x509 -req -days 99999 -in des_dsa_sha256_client.csr -extfile v3.ext -CA ca_dsa_des3.crt -CAkey ca_dsa_des3.key -set_serial 01 -out des_dsa_x509v3_sha256_client.crt
#convert client cert into pkcs and pem format
openssl pkcs12 -export -clcerts -in des_dsa_x509v3_sha256_client.crt -inkey des_dsa_client.key -out des_dsa_x509v3_sha256_client.p12
openssl pkcs12 -in des_dsa_x509v3_sha256_client.p12 -out des_dsa_x509v3_sha256_client.pem -clcerts
echo "*************************************************************************************************11 is done"

# 12 ###################################################
#create client key and csr -- des_dsa_x509v3_md5
openssl req -new -key des_dsa_client.key -out des_dsa_md5_client.csr #using md5 by default
#sign the client cert with ca cert
openssl x509 -req -days 99999 -in des_dsa_md5_client.csr -extfile v3.ext -CA ca_dsa_des3.crt -CAkey ca_dsa_des3.key -set_serial 01 -out des_dsa_x509v3_md5_client.crt
#convert client cert into pkcs and pem format
openssl pkcs12 -export -clcerts -in des_dsa_x509v3_md5_client.crt -inkey des_dsa_client.key -out des_dsa_x509v3_md5_client.p12
openssl pkcs12 -in des_dsa_x509v3_md5_client.p12 -out des_dsa_x509v3_md5_client.pem -clcerts
echo "*************************************************************************************************12 is done"

# 13 ###################################################
#create client key and csr -- aes_rsa_x509v3_sha256
openssl genrsa -aes256 -out aes_rsa_client.key 4096
openssl req -new -sha256 -key aes_rsa_client.key -out aes_rsa_sha256_client.csr
#sign the client cert with ca cert
openssl x509 -req -days 99999 -in aes_rsa_sha256_client.csr -extfile v3.ext -CA ca_rsa_aes.crt -CAkey ca_rsa_aes.key -set_serial 01 -out aes_rsa_x509v3_sha256_client.crt
#convert client cert into pkcs and pem format
openssl pkcs12 -export -clcerts -in aes_rsa_x509v3_sha256_client.crt -inkey aes_rsa_client.key -out aes_rsa_x509v3_sha256_client.p12
echo "*************************************************************************************************13 is done"

# 14 ###################################################
#create client key and csr -- aes_rsa_x509v3_md5
openssl req -new -md5 -key aes_rsa_client.key -out aes_rsa_md5_client.csr
#sign the client cert with ca cert
openssl x509 -req -md5 -days 99999 -in aes_rsa_md5_client.csr -extfile v3.ext -CA ca_rsa_aes.crt -CAkey ca_rsa_aes.key -set_serial 01 -out aes_rsa_x509v3_md5_client.crt
#convert client cert into pkcs and pem format
openssl pkcs12 -export -clcerts -in aes_rsa_x509v3_md5_client.crt -inkey aes_rsa_client.key -out aes_rsa_x509v3_md5_client.p12
echo "*************************************************************************************************14 is done"

# 15 ###################################################
#create client key and csr -- aes_dsa_x509v3_sha256
openssl gendsa -aes256 -out aes_dsa_client.key dsaparam.pem
openssl req -new -sha256 -key aes_dsa_client.key -out aes_dsa_sha256_client.csr
#sign the client cert with ca cert
openssl x509 -req -days 99999 -in aes_dsa_sha256_client.csr -extfile v3.ext -CA ca_dsa_aes.crt -CAkey ca_dsa_aes.key -set_serial 01 -out aes_dsa_x509v3_sha256_client.crt
#convert client cert into pkcs and pem format
openssl pkcs12 -export -clcerts -in aes_dsa_x509v3_sha256_client.crt -inkey aes_dsa_client.key -out aes_dsa_x509v3_sha256_client.p12
openssl pkcs12 -in aes_dsa_x509v3_sha256_client.p12 -out aes_dsa_x509v3_sha256_client.pem -clcerts
echo "*************************************************************************************************15 is done"

# 16 ###################################################
#create client key and csr -- aes_dsa_x509v3_md5
openssl req -new -key aes_dsa_client.key -out aes_dsa_md5_client.csr #using md5 by default
#sign the client cert with ca cert
openssl x509 -req -days 99999 -in aes_dsa_md5_client.csr -extfile v3.ext -CA ca_dsa_aes.crt -CAkey ca_dsa_aes.key -set_serial 01 -out aes_dsa_x509v3_md5_client.crt
#convert client cert into pkcs and pem format
openssl pkcs12 -export -clcerts -in aes_dsa_x509v3_md5_client.crt -inkey aes_dsa_client.key -out aes_dsa_x509v3_md5_client.p12
openssl pkcs12 -in aes_dsa_x509v3_md5_client.p12 -out aes_dsa_x509v3_md5_client.pem -clcerts
echo "*************************************************************************************************16 is done"
