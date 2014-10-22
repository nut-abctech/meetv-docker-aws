# Tviller Server Dockerfile

Dockerfile manages to downloading and installing ***meetv-chat-server*** from ***Startsiden APT repo*** into Debain wheezy environment.

## Quick start 

The Tviller server requires **TWO** databases 1. MongoDB 2. Redis. 
Before run the server we need to provide both containers present in the docker.

### Docker Run MongoDB container
	$ docker run -d -p 28017:28017 --name mongodb dockerfile/mongodb mongod --smallfiles

### Docker Run Redis container
	$ docker run -d -p 6379:6379 --name redis dockerfile/redis
**Note.** All MongoDB and Redis are availabe on docker hub. when we `dock run` this will check if there is no image in your docker, it will automatically pull the image before running. 

### Build & Run Tviller Server
After done runing both containers, we can build our app image

	$ docker build -t meetv/tviller-server /Users/Pradit/Workspaces/projects/meetv/meetv-docker-aws/tviller-docker/

**Note.** This works under *boot2docker* version 1.3.0 which automatically expose share dir to `/Users/`. Having that access, you can point into your Dockerfile directory.

Final step is run the app in background

	$ docker run -d -p 8088:8088 --name app --link mongodb:db --link redis:redis meetv/tviller-server
 

#All tips
1. Get to know boot2docker ip address `boot2docker ip`
2. Get to know the container ip address (e.g mongodb, redis)

	`$ docker inspect --format '{{ .NetworkSettings.IPAddress }}' mongodb`