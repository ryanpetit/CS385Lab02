.PHONY: run-images testnetserver mysql minibank 

run-images: testnetserver mysql minibank  


testnetserver:
	docker network create testnet

minibank: 
	docker build -t minibank ./minibank
	docker run -i -t -d --name minibank -p 8080:8080 --net testnet minibank

mysql:
	docker build -t mysql ./mysql
	docker run -i -t -d --name mysql --net testnet mysql	
	sleep 10

# Stop all docker containers and kill the testnet server
clean:
	docker stop minibank
	docker rm minibank
	docker stop mysql
	docker rm mysql
	docker network rm testnet
	

# Only use this if you need to remove all Unused or Dangling Images, Containers, Volumes, and Networks
remove-unused-ICVN: 
	docker system prune -a




