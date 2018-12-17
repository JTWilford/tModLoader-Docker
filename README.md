This project creates an instance of a modded terraria server inside a docker container. \
Before deploying the docker stack, you must create a volume for storing worlds:
```
docker volume create terraria
```
Also, just in case you want to add docker flow proxy to your server in the furture, create a proxy network:
```
docker network create --scope swarm proxy
```
To add mods to the server, copy their files into the mods directory, then run the following command:
```
docker build -t custom-tmod-server .
```
Then update the image name in the docker-compose file. \
When you deploy the stack, the server will be running in an tty terminal. This means that you must use the ```--raw``` option to view console output.