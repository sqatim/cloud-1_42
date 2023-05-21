# Cloud-1_42

## About

Cloud-1 is a project that focused on the automated deployment of a website and necessary docker infrastructure on a cloud provider's instance. The goal is to create a complete web server that can run several services in parallel, such as WordPress, PHPmyadmin, and a database. 

For a fully automated deployment process, it is recommended to use Ansible, although you have the flexibility to choose another tool. The script should be capable of functioning autonomously with the assumption that the target instance runs an SSH daemon and has Python installed, using an Ubuntu 20.04 LTS-like operating system.

The deployment process entails the creation of separate containers for WordPress and PHPMyAdmin, enabling communication between them. It is crucial to restrict public access to the server to enhance security and prevent direct database connections from the internet.

To ensure compatibility between your SQL database, WordPress, and PHPMyAdmin, you will need to generate a docker-compose.yml file. Additionally, your server should support TLS for secure communication whenever possible. Furthermore, it is necessary to configure your server to appropriately redirect requests to the correct site based on the URL.

## Subject

+ [Cloud-1 Subject](/Cloud-1.subject.pdf)

## Key Terms:

1. **`Ansible`**: Ansible is an open-source automation tool that allows you to automate IT tasks such as server configuration and application deployment. It uses a simple syntax called YAML to define tasks and playbooks.

2. **`Docker`**: Docker is a platform for building, shipping, and running applications in containers. Containers are lightweight, portable units that can run anywhere, making it easy to deploy applications across different environments.

3. **`Dockerfile`**: A Dockerfile is a script that contains instructions for building a Docker image. It includes commands such as FROM (to specify the base image), RUN (to execute commands during the build process), and CMD (to specify the command to run when the container starts).

4. **`Image`**: An image is a read-only template that contains the necessary files and configuration settings to run a container.

5. **`Container`**: A container is a lightweight, standalone executable package of software that includes everything needed to run an application, including code, libraries, system tools, and settings.

6. **`docker-compose.yml`**: A docker-compose.yml file is a script that defines how multiple Docker containers should work together. It includes information such as which images to use for each container, how they should be configured, and how they should communicate with each other.

7. **`Playbook`**: An Ansible playbook is a script that contains tasks for configuring servers and deploying applications. It uses YAML syntax to define tasks such as installing necessary packages, configuring the server, and deploying containers using Docker or docker-compose.

## Steps to Automate Deployment of the Web App

1. Create a Dockerfile that includes the necessary components for your WordPress site and PHPmyadmin.
2. Build and test your Docker image locally to ensure that it works as expected.
3. Create a docker-compose.yml file that defines how multiple Docker containers should work together, including your WordPress and PHPmyadmin containers.
4. Test your docker-compose.yml file locally to ensure that it works as expected.
5. Sign up for a cloud provider's instance and obtain the necessary credentials to access it.
6. Install Ansible on your local machine.
7. Create an Ansible playbook that includes tasks such as installing necessary packages, configuring the server, and deploying the necessary containers using your docker-compose.yml file from step 3.
8. Test your playbook on a single instance to ensure that it works as expected.
9. Modify your playbook to allow for deployment on multiple instances in parallel.
10. Configure your server to use TLS when possible and ensure that it redirects to the correct site depending on the URL requested.
11. Test your deployment process thoroughly to ensure that it meets all requirements.

## How to use

1. Clone this repo.
2. Run the CMD
    ```
    $ cd srcs
    ```
3. Run the `make` command.