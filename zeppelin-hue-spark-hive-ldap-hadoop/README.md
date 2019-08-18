# Use

Run all necessary containers:

`` `bash
docker network create hadoop-net 
`` `
create network name: hadoop-net in docker

`` `bash
docker-compose -f docker-compose_ldap.yml up
`` `
create two contianers:
1 openldap from image: osixia/openldap:1.2.5 
2 ldap-admin from image: osixia/phpldapadmin:latest


`` `bash
docker network create hadoop-net 
`` `
create network name: hadoop-net in docker


`` `bash
docker network create hadoop-net 
`` `
create network name: hadoop-net in docker


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
