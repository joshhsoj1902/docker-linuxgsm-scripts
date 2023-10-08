build:
	docker build -t joshhsoj1902/docker-linuxgsm-scripts:latest .

publish:
	docker push joshhsoj1902/docker-linuxgsm-scripts:latest

test:
	docker tag joshhsoj1902/docker-linuxgsm-scripts:latest joshhsoj1902/docker-linuxgsm-scripts:testing
	cd tests && ./run-tests.sh
