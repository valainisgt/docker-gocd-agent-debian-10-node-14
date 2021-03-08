FROM  gocd/gocd-agent-debian-10:v21.1.0

# switch to root user to install node
USER root

# Install Node
ADD https://deb.nodesource.com/setup_14.x ./InstallNode.sh
RUN bash InstallNode.sh
RUN apt-get install -y nodejs

# switch back to non root user
USER go
