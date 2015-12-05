Whydah Java 9 Preview in Zulu minimal docker image
####

This is a minimal docker image with the latest snapshot of Whydah running in the early preview of Java 9 from the Azul Zulu OpenJDK distribution.

Commands:
```
sudo docker pull whydah/java9-whydah-all-in-one
sudo docker run -it -p 80:9999 -p 9990:9990 -p 9992:9992 -p 9995:9995 -p 9996:9996 -p 9997:9997 -p 9998:9998  whydah/java9-whydah-all-in-one 
```

* Go to Whydah [http://localhost:9997/sso/welcome]  
** (admin/whydahadmin)
