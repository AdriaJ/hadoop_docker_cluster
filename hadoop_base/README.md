## Key points of the image

Instantiating this image, we setup passwordless ssh connections between nodes, download and install haddop files on a new user account, and configurate it. This configuration is common to all of the nodes (master or data). Configuration files have been prepared and stored in separate folder (called **config**) then put on the image with Docker **COPY** command.  
  
I would like to put the emphasis on the configuration of the SSH connection. Public and private keys for passwordless ssh connection are instantiated once at build then put on the nodes (same key for all the connexions). Hadoop only need master-to-node connexion. Additionally, we need to setup some parameters for ssh connexion, which can be found on **ssh_config** file in **config**. We finally need to switch back to root user to launch openssh server.
