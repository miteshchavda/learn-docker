# Learn Docker

### Download repository in your machine.

```
cd /path/to/root/dir/of/code/
mkdir learn-docker && cd learn-docker
git clone https://github.com/miteshchavda/learn-docker .
```

**Build docker image**
```
make build
```

**Run docker image**
```
make up
```

**Stop container**
```
make down
```

**Ssh into container**
```
make shell
```

**Start Jupyter lab**
```
make up ARG="jupyter lab --no-browser --ip 0.0.0.0 --port 8888 --allow-root /home/notebooks"
```