# Use

Run all necessary containers:

`` `bash
make up
`` `
If run successfully, the terminal will return output:

`` `bash
docker network create spark-net
9386f8b306cd221ddb3b111301d621d17245b9410ba0bc3e56476be733d1e762
docker-compose up -d
Creating phpldapadmin ... done
Creating namenode ... done
Creating openldap ... done
Creating hue ... done
Creating datanode ... done
Creating spark-master ... done
Creating zeppelin ... done
Creating spark-worker ... done
`` `

Stop all running contianers:

`` `
make down
`` `
Then the terminal will return:

`` `bash
docker-compose down
Stopping spark-worker ... done
Stopping zeppelin ... done
Stopping spark-master ... done
Stopping datanode ... done
Stopping hue ... done
Stopping namenode ... done
Stopping openldap ... done
Stopping phpldapadmin ... done
Removing spark-worker ... done
Removing zeppelin ... done
Removing spark-master ... done
Removing datanode ... done
Removing hue ... done
Removing namenode ... done
Removing openldap ... done
Removing phpldapadmin ... done
Network spark-net is external, skipping
docker network rm spark-net
spark-net
`` `

## Create user login to LDAP Admin

Access the LDAP Admin webui url: https: // localhost: 6443

Log in with the addmin user information:

 * User: cn = admin, dc = example, dc = org
 * Password: admin

After logging in, create user Hue:

`` `
dn: uid = nvtienanh, dc = example, dc = org
cn: ServiceAccount
ou: People
displayname: Test Bela
givenname: Firstname
mail: nvtienanh@example.org
objectclass: top
objectclass: person
objectclass: organizationalPerson
objectclass: inetOrgPerson
sn: Lastname
uid: nvtienanh
userpassword: 12345
`` `

Create group:

`` `
dn: cn = hue, dc = example, dc = org
objectClass: top
objectClass: groupOfNames
cn: hue
member: uid = nvtienanh, dc = example, dc = org
`` `

## Log in to Hue

Go to http: // localhost: 8888 with account information created with LDAP Admin


## Log in to Zeppelin

http: // localhost: 8080 with account information created with LDAP Admin
