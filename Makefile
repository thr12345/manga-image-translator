build-image:
	docker rmi manga-image-translator || true
	docker build . --tag=manga-image-translator

run-web-server:
	docker run --gpus all -p 5003:5003 --ipc=host --rm manga-image-translator python -m /app/manga_translator \
		--target-lang=ENG \
		--manga2eng \
		--verbose \
		--mode web \
		--use-cuda \ 
		--host=0.0.0.0 \
		--port=5003
