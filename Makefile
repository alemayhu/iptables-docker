project ?=alemayhu/iptables-docker


docker:
	docker build -t ${project} .
docker_nocache:
	docker build --no-cache=true -t ${project} .
docker_deploy: docker docker_push
	echo "Pushed to docker, https://hub.docker.com/r/${project}"
docker_push:
	docker push ${project}
docker_shell:
	docker run -t -i alemayhu/iptables-docker /bin/bash
