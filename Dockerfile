FROM  gocd/gocd-agent-debian-10:v21.1.0

# switch to root user to install dotnet
USER root

# Add microsoft package signing key to list of trusted keys
ADD https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb ./packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN rm ./packages-microsoft-prod.deb

# Update the package repository
RUN apt-get update

# Install .NET 5.0
RUN apt-get install -y apt-transport-https
RUN apt-get update
RUN apt-get install -y dotnet-sdk-5.0

# switch back to non root user
USER go
