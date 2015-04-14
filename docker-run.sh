# set variables
DOCKER_REGISTRY="skypoc01:5000"
DOCKER_IMAGE="skypoc/dropwizard-rpm-example"

echo "Redeploying instance of $DOCKER_REGISTRY/$DOCKER_IMAGE ..."

echo "Stopping any existing containers running from $DOCKER_IMAGE image..."

# stop and delete any existing container
docker ps | grep "$DOCKER_IMAGE" | awk '{print $1}' | xargs -r docker stop | xargs -r docker rm | xargs -r echo Stopped and deleted these containers:

# delete old image? not implemented for now...

# pull latest docker image
echo "Pulling latest docker image..."
docker pull $DOCKER_REGISTRY/$DOCKER_IMAGE

# run docker image
echo "Running new docker container from image..."
docker run -d -p 8080:8080 -p 8081:8081 skypoc01:5000/skypoc/dropwizard-rpm-example
