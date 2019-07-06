# Dockerfile References: https://docs.docker.com/engine/reference/builder/

# Start from base image
FROM gdpak/centos6-go-app:v1.0.0

# Add Maintainer Info
LABEL maintainer="Deepak Agrawal <deepacks@gmail.com>"

LABEL RUN='docker run --name ssh -d -p 2200:22 $IMAGE'

EXPOSE 22

RUN yum  -y --nogpgcheck install openssh-server
RUN yum -y --nogpgchec install openssh-clients
RUN service start sshd

CMD rm -f /var/run/nologin
VOLUME [ "/sys/fs/cgroup", "/tmp", "/run" ]
CMD ["/usr/sbin/init"]
