# vlabtestrepo

https://confluence.geodab.eu/display/ER/Publish+a+model+from+a+Git+repository

```
docker run --name vlabtest -v ./s2png:/s2png -v ./datafolder:/testdata -it continuumio/anaconda:4.4.0 /bin/bash
```

```
docker build --tag=vlabtest .
docker run -v $(pwd)/s2png:/s2png -v $(pwd)/datafolder:/testdata -it vlabtest /bin/bash

chmod +x run.sh
./run.sh
```