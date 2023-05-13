[Dockerhub](https://hub.docker.com/r/vekaverjj/amvstrmapiv1)
==

- ### Build Locally
```
git clone https://github.com/Ve-Ka/AmvStrmApiV1Docker
docker build -t amvstrm --no-cache .
docker run -p 1000:5000 -d --name amvstrmapi amvstrmapi
```
