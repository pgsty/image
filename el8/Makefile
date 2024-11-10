build:
	docker build -t el8 .
run:
	docker run -d --name vm --privileged --network pigsty --ip 10.10.11.10 el8
rmi:
	docker rmi el8
sh:
	docker exec -it vm /bin/bash
reboot:
	docker stop vm; docker start vm
clean:
	docker stop vm; docker rm vm

.PHONY: build run rmi sh ssh reboot clean