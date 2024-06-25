### Build netcat Docker image
    docker build -t netcat_image .

### Create custom Docker network (supress error in case already exists)

    docker network create my_new_shiny_docker_network &> /dev/null

### run containers

    docker run -d --network=my_new_shiny_docker_network --name nc_server netcat-example --server

    docker run -d --network=my_new_shiny_docker_network --name nc_client netcat-example --client

### stop and clean all dockers
    docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q) && docker rmi netcat_image && docker network rm my_new_shiny_docker_network

