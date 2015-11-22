#!/usr/bin/env bash

#
# The main function where program execution begin and end
#

function main {

# Use location of this script as current working directory
cd "$(dirname $(readlink -f ${0}))"

DOMAINBASE=$(capture_domainbase)
ADMINUSERNAME=$(capture_username "Enter username of openldap super user: ")
ADMINPASSPLAIN=$(capture_plaintext_password)
ADMINPASSWORD=$(slappasswd -h {SSHA} -s "$ADMINPASSPLAIN")
UIBUSERNAME=$(capture_username "Enter username of uib admin user: ")
UIBPASSWORD=$(capture_hashed_password "Enter username of uib admin user: ")

mkdir -p ldifs

create_admin_ldif "ldifs/admin.ldif" $DOMAINBASE $ADMINUSERNAME $ADMINPASSWORD
create_uibadmin_ldif "ldifs/uibadmin.ldif" $DOMAINBASE $UIBUSERNAME $UIBPASSWORD
create_uibadmin-acl_ldif "ldifs/uibadmin-acl.ldif" $DOMAINBASE $UIBUSERNAME $ADMINUSERNAME

exit_on_fail ldapmodify -Y EXTERNAL -H ldapi:/// -f ldifs/admin.ldif
exit_on_fail ldapadd -x -D cn=$ADMINUSERNAME,$DOMAINBASE -w "$ADMINPASSPLAIN" -f ldifs/uibadmin.ldif
exit_on_fail ldapmodify -Y EXTERNAL -H ldapi:/// -f ldifs/uibadmin-acl.ldif

echo "**************************************************************"
echo "** Successfully imported LDAP superuser and UIB admin user. **"
echo "**************************************************************"

}


#
# Helper functions and a call to main at bottom
#

function exit_on_fail {
$*
status=$?
if [ $status -ne 0 ]; then
  echo "LDAP command FAILED:"
  echo "$*"
  exit $status
fi
}

function capture_domainbase {
read -p "Enter new domain: " domain
echo $(convert_domain_to_dn $domain)
}

function convert_domain_to_dn {
echo dc=$(echo $1|sed s/[.]/,dc=/g)
}

function capture_username {
read -p "$1" username
echo $username
}

function capture_plaintext_password {
while :
do
  read -s -p "New password: " plaintextpass
  echo "" >&2
  read -s -p "Re-enter new password: " replaintextpass
  echo "" >&2
  if [[ "$plaintextpass" == "$replaintextpass" ]]; then
    break
  else
    echo Re-entered password does not match, please try again. >&2
  fi
done
echo $plaintextpass
}

function  capture_hashed_password {
while :
do
  hashed_password=$(slappasswd -h {SSHA})
  if [ $? -eq 0 ]; then
    break
  fi
done
echo $hashed_password
}

function create_admin_ldif {
cat <<EOF > $1
dn:  olcDatabase={1}hdb,cn=config
changetype: modify
replace: olcSuffix
olcSuffix: $2
-
replace: olcRootDN
olcRootDN: cn=$3,$2
-
replace: olcRootPW
olcRootPW: $4
EOF
}

function create_uibadmin_ldif {
cat <<EOF > $1
version: 1

dn: $2
objectClass: top
objectClass: extensibleObject
objectClass: domain

dn: ou=users,$2
objectClass: top
objectClass: organizationalUnit
ou: users

dn: ou=administrators,$2
objectClass: top
objectClass: organizationalUnit
ou: users

dn: cn=$3,ou=administrators,$2
objectClass: top
objectClass: inetOrgPerson
objectClass: organizationalPerson
objectClass: person
cn: $3
sn: $3
givenName: $3
initials: $3
uid: $3
userPassword: $4
EOF
}

function create_uibadmin-acl_ldif {
cat <<EOF > $1
dn: olcDatabase={1}hdb,cn=config
changetype: modify
replace: olcAccess
olcAccess: {0}to attrs=userPassword,shadowLastChange
  by self write 
  by anonymous auth 
  by dn="cn=admin,$2" write
  by dn="cn=$3,ou=administrators,$2" write
  by * none 
olcAccess: {1}to dn.base=""
  by * read
olcAccess: {2}to dn.subtree="ou=users,$2"
  by self write 
  by dn="cn=$3,ou=administrators,$2" write
  by * read
olcAccess: {3}to * 
  by self write 
  by dn="cn=$4,$2" write
  by * read
EOF
}

main

