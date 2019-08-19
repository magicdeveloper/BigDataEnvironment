# Start
```
docker-compose up -d
```

# Query
```
 docker exec openldap ldapsearch -x -H ldap://localhost -b dc=example,dc=org -D "cn=admin,dc=example,dc=org" -w admin
 ```