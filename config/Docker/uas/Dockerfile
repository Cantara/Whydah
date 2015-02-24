# This is a comment
FROM azul/zulu-openjdk-centos:latest
MAINTAINER Totto <totto@totto.org>
RUN yum install -y yum-cron
RUN yum -y update
RUN yum install -y wget

# Install sshd - should probably be fortified
RUN yum install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:kjempehemmelig' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
RUN echo "export VISIBLE=now" >> /etc/profile
RUN /usr/sbin/sshd-keygen


RUN adduser  UserAdminService


## Install UserAdminService
RUN su -  UserAdminService -c "/usr/bin/wget -O update-service.sh -q -N https://raw.githubusercontent.com/altran/Whydah-UserAdminService/master/update-service.sh"
RUN su -  UserAdminService -c "/usr/bin/wget -O start-service.sh -q -N  https://raw.githubusercontent.com/altran/Whydah-UserAdminService/master/start-service.sh"
RUN chmod 755 /home/UserAdminService/*.sh
RUN su -  UserAdminService -c "/usr/bin/wget -O useradminservice.PROD.properties -q -N https://raw.githubusercontent.com/altran/Whydah-UserAdminService/master/src/main/resources/useradminservice.TEST_LOCALHOST.properties"
RUN su - UserAdminService -c "/home/UserAdminService/update-service.sh"
#RUN su - UserAdminService -c "/home/UserAdminService/start-service.sh &"


## Install Apache and set up proxypasses
RUN yum install -y httpd
RUN /usr/bin/wget -O /etc/httpd/conf.d/whydah.conf -q -N https://raw.githubusercontent.com/altran/Whydah/master/config/apache/whydah.conf


## Set up start of services

RUN yum -y install python-setuptools
RUN easy_install supervisor
RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN ln -s /etc/supervisor/conf.d/supervisord.conf /etc/supervisord.conf
EXPOSE 22 80 9992
CMD ["/usr/bin/supervisord"]
