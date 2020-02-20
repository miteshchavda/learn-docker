APP_NAME=$(shell basename $(CURDIR))
DEST_NOTEBOOK_PATH="/home/notebooks"

build:
	docker build -t $(APP_NAME) -f Dockerfile .

up: build
	docker run -it -p 8888:8888 -v $(PWD)/notebooks:$(DEST_NOTEBOOK_PATH) $(APP_NAME) ${ARG}

down:
	docker stop $(APP_NAME)

shell: build
	docker run -it -v $(PWD)/notebooks:$(DEST_NOTEBOOK_PATH) $(APP_NAME) bash

notebook: build
	docker run -it -p 8888:8888 -v $(PWD)/notebooks:$(DEST_NOTEBOOK_PATH) $(APP_NAME) jupyter lab --no-browser --ip 0.0.0.0 --port 8888 --allow-root /home/notebooks
