# Use
Big Data Environment created by

Amer Milhem <amer.milhem100@gmail.com>

Issam Aljaluodi <issam.aljaluodi@outlook.com>

Mohamed Abdelgalil Ali Elghannam <magic_developer@hotmail.com>


### Run all necessary code:

    docker network create hadoop-net
    docker-compose -f docker-compose_ldap.yml up
    docker-compose -f docker-compose_postgresql.yaml up
    docker-compose -f docker-compose_namenode.yml up
    docker-compose -f docker-compose_resourcemanager.yml up
    docker-compose -f docker-compose_historyserver.yml up
    docker-compose -f docker-compose_hive-metastore.yml up
    docker-compose -f docker-compose_hive-server.yml up
    docker-compose -f docker-compose_spark.yaml up
    docker-compose -f docker-compose_hue.yml up
### Application links
| APP | URL|
| ------ | ------ |
| ldap-admin| http://localhost:6080 |
| hadoop-NameNode | http://localhost:9870 |
| hadoop-DataNode | http://localhost:9864 |
| hadoop-resourcemanager | http://localhost:8088 |
| hadoop-historyserver | http://localhost:8188|
| spark-master | http://localhost:5480 |
| zeppelin | http://localhost:5780 |
| Hue | http://localhost:8888 |

# Description

 `docker network create hadoop-net`  create network name: hadoop-net in docker
- `docker-compose -f docker-compose_ldap.yml up` create two contianers:
	 1. **openldap** from image: osixia/openldap:1.2.5 
	 2. **ldap-admin** from image: osixia/phpldapadmin:latest
- `docker-compose -f docker-compose_postgresql.yaml up` create two contianers:
	 1. **hive-metastore-postgresql** from image: mdt/metastore:9.6-hive2.3.4 
	 2. **postgresql-database** from image: mdt/postgresql:9.6
- `docker-compose -f docker-compose_namenode.yml up` create two contianers:
	 1. **namenode** from image: mdt/hadoop-namenode 
	 2. **datanode1** from image: mdt/hadoop-datanode
- `docker-compose -f docker-compose_resourcemanager.yml up` create one contianer:
	 1. **resourcemanager** from image: mdt/hadoop-resourcemanager 
- `docker-compose -f docker-compose_historyserver.yml up` create one contianer:
	 1. **historyserver** from image: mdt/hadoop-historyserver 
- `docker-compose -f docker-compose_hive-metastore.yml up` create one contianer:
	 1. **hive-metastore** from image: mdt/hive
- `docker-compose -f docker-compose_hive-server.yml up` create one contianer:
	 1. **hive-server** from image: mdt/hive
- `docker-compose -f docker-compose_spark.yaml up` create four contianers:
	 1. **spark-master** from image: mdt/spark-master
	 2. **spark-worker1** from image: mdt/spark-worker
	 3. **spark-worker2** from image: mdt/spark-worker
	 4. **zeppelin** from image: mdt/zeppelin
- `docker-compose -f docker-compose_hue.yml up` create one contianer:
	 1. **hue** from image: mdt/hue 
#### openldap
to test ldap contianer use this

    docker exec ldap ldapsearch -x -H ldap://localhost -b dc=example,dc=org -D "cn=admin,dc=example,dc=org" -w admin

#### Create user login to LDAP Admin

Access the LDAP Admin webui url:  http://localhost:6080

Log in with the addmin user information:

 * User: cn = admin, dc = example, dc = org
 * Password: admin

After logging in, create user Hue:

`
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
`

Create group:

`
dn: cn = hue, dc = example, dc = org
objectClass: top
objectClass: groupOfNames
cn: hue
member: uid = nvtienanh, dc = example, dc = org
`
#### hadoop-resourcemanager
Go to http://localhost:8088
#### hadoop-historyserver
Go to http://localhost:8188
#### hadoop-NameNode
Go to http://localhost:9870
#### hadoop-DataNode
Go to http://localhost:9864
#### spark-master
Go to http://localhost:5480
#### Log in to Hue
Go to http://localhost:8888 with account information created with LDAP Admin
#### Log in to Zeppelin
Go to http://localhost:5780 with account information created with LDAP Admin
