Whydah
======

Top-level repository for the Whydah components


Quick set-up (Using Docker on local machine)

* Install docker
* Start Whydah
```
sudo docker run -it -p 80:9999 -p 9990:9990 -p 9995:9995 -p 9996:9996 -p 9997:9997 -p 9998:9998  totto/whydah /usr/bin/supervisord 
```
* Go to Whydah [http://localhost/sso/welcome]  (admin/whydahadmin)


![Architectural Overview](https://wiki.cantara.no/download/attachments/37388694/Whydah+infrastructure.png)

Client code example

* (Example using Apache HTTP Components Fluent API and jOOX Fluent API)
```
//  Execute a POST to authenticate my application
String appToken = Request.Post("https://sso.whydah.net/sso/logon")
        .bodyForm(Form.form().add("applicationcredential", myAppCredential).build())
        .execute().returnContent().asBytes();

//  authenticate with username and password (user credential)
String usertoken = Request.Post("https://sso.whydah.net/sso/user/"+appTokenID+"/"+new UserTicket(UUID.randomUUID()).toString()+"/usertoken/")
        .bodyForm(Form.form().add("apptoken", appToken)
        .add("usercredential", new UserCredential(username,password).asXML()).build())
        .execute().returnContent().asBytes();

//  Execute a POST  to SecurityTokenService with userticket to get usertoken
String usertoken = Request.Post("https://sso.whydah.net/sso/user/"+appTokenID+"/get_usertoken_by_userticket/")
        .bodyForm(Form.form().add("apptoken", appToken)
        .add("userticket", userTicket).build())
        .execute().returnContent().asBytes();

// That's all you need to get a full user database, IAM/SSO, Facebook/OAUTH support ++
boolean hasEmployeeRoleInMyApp = $(usertoken).xpath("/usertoken/application[@ID="+myAppId+"]/role[@name=\"Employee\"");
```
