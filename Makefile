build:
	docker build -t joshhsoj1902/docker-linuxgsm-scripts:latest .

publish:
	docker push joshhsoj1902/docker-linuxgsm-scripts:latest

test:
	cd tests && ./run-tests.sh