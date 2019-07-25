# Simple search app

## Build the container image
```sh
docker build -t python-app .
```

## Run the image
```
docker run -it -d \
       -l app=python-app \
       -e PORT=4000 \
       -p 4000:4000 \
       python-app
```

## Test the API
```sh
curl localhost:4000/s/sphere
```

### The result must be
```json
{"size": 1, "entries": [[613284, "March 3, 2017", "Big thumbs up! This was so easy and simple. The staff were lovely and helpful, made everything clear and translated into different languages if people didn&#039;t understand. There&#039;s also a shortcut into St Peters Basilica, the girls told us and it was a great experience. Don&#039;t forget to see the sphere in a sphere! In it&#039;s practically at the entrance of the second floor and I missed it :("]]}
```

## Clean up
```sh
docker rm -f $(docker ps -q --filter "label=app=python-app")
```