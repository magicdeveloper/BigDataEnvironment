# Install Docker on Ubuntu 19.04
#### First, add the GPG key for the official Docker repository to the system:
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
#### Add the Docker repository to APT sources:
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable edge"
#### Update the package database with the Docker packages from the newly added repo:
    sudo apt-get update
#### Make sure you are about to install from the Docker repo instead of the default Ubuntu 19.04 repo:
     apt-cache policy docker-ce
#### Finally, install Docker:
     sudo apt-get install -y docker-ce
#### Check docker running:
     sudo systemctl status docker
#### Add your username to the docker group:
     sudo usermod -aG docker ${USER}
     su ${USER}
     id -nG
     sudo usermod -aG docker username
## References
https://medium.com/@Grigorkh/how-to-install-docker-on-ubuntu-19-04-7ccfeda5935

