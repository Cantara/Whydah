# whydah-openldap
Docker build for a basic openldap image that will work with Whydah UIB

Builds on this guide https://wiki.cantara.no/display/whydah/Install+OpenLDAP+for+UIB by Erik Drolshammer


### Build Docker image
```
$ ./build.sh
```

### Create data volume container
```
$ ./create-data.sh
```

### Run Docker image
```
$ ./run.sh
```

### Initialize OpenLDAP interactively.
```
$ ./exec-init-ldap.sh
```
This will prompt for: domain, superuser-username, superuser-password, uib-admin-user-username, and uib-admin-user-password. Example:
```
Enter new domain: mycompany.com
Enter username of openldap super user: admin
New password: ubersecret
Re-enter new password: ubersecret
Enter username of uib admin user: uibadmin
New password: mysecret123
Re-enter new password: mysecret123
```
Should yield the following output
```
SASL/EXTERNAL authentication started
SASL username: gidNumber=0+uidNumber=0,cn=peercred,cn=external,cn=auth
SASL SSF: 0
modifying entry "olcDatabase={1}hdb,cn=config"

adding new entry "dc=mycompany,dc=com"

adding new entry "ou=users,dc=mycompany,dc=com"

adding new entry "ou=administrators,dc=mycompany,dc=com"

adding new entry "cn=uibadmin,ou=administrators,dc=mycompany,dc=com"

SASL/EXTERNAL authentication started
SASL username: gidNumber=0+uidNumber=0,cn=peercred,cn=external,cn=auth
SASL SSF: 0
modifying entry "olcDatabase={1}hdb,cn=config"

**************************************************************
** Successfully imported LDAP superuser and UIB admin user. **
**************************************************************
```

### Verify LDAP setup
Connect with super user and list everything in the domain.
```
$ ldapsearch -D cn=admin,dc=mycompany,dc=com -w ubersecret -p 13389 -h localhost -b "dc=mycompany,dc=com" -s sub "(objectclass=*)"
```
Also, check that it's possible to connect using the uibadmin user.
```
$ ldapsearch -D cn=uibadmin,ou=administrators,dc=mycompany,dc=com -w mysecret123 -p 13389 -h localhost -b "dc=mycompany,dc=com" -s sub "(objectclass=*)"
```
Both these commands should produce an output similar to the following:
```
# extended LDIF
#
# LDAPv3
# base <dc=mycompany,dc=com> with scope subtree
# filter: (objectclass=*)
# requesting: ALL
#

# mycompany.com
dn: dc=mycompany,dc=com
objectClass: top
objectClass: extensibleObject
objectClass: domain
dc: mycompany

# users, mycompany.com
dn: ou=users,dc=mycompany,dc=com
objectClass: top
objectClass: organizationalUnit
ou: users

# administrators, mycompany.com
dn: ou=administrators,dc=mycompany,dc=com
objectClass: top
objectClass: organizationalUnit
ou: users
ou: administrators

# uibadmin, administrators, mycompany.com
dn: cn=uibadmin,ou=administrators,dc=mycompany,dc=com
objectClass: top
objectClass: inetOrgPerson
objectClass: organizationalPerson
objectClass: person
cn: uibadmin
sn: uibadmin
givenName: uibadmin
initials: uibadmin
uid: uibadmin
userPassword:: e1NTSEF9SHAxVi9FN0ZlbFR5Z3hNM05kVTNpUEdTUmdkV0RMREo=

# search result
search: 2
result: 0 Success

# numResponses: 5
# numEntries: 4
```

### Connect from UserIdentityBackend
To connect from a locally running UIB to this OpenLDAP container as the uibadmin user you would enter the following information in uib.properties file:
```
ldap.primary.url=ldap://localhost:13389/dc=mycompany,dc=com
ldap.primary.admin.principal=cn=uibadmin,ou=administrators,dc=mycompany,dc=com
ldap.primary.admin.credentials=mysecret123
```
