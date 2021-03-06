FROM python:3.6
WORKDIR /app
RUN apt-get update -y
RUN apt-get install -y openssh-server
COPY . .
RUN pip install -r requirements.txt
EXPOSE 8080 22
RUN chmod a+x entrypoint.sh
ENTRYPOINT ["bash","entrypoint.sh"]
