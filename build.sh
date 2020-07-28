docker kill timerApi || :
docker rm timerApi || :
docker build -t timerapi .
docker run --name timerApi -d -p 8080:8080 timerapi
sleep 3
timerID=$(curl localhost:8080/start)
echo $timerID
curl localhost:8080/end/$timerID
docker logs -f timerApi
