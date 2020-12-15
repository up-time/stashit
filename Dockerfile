FROM python:3.6
COPY . /app
WORKDIR /app
RUN apt-get update -y
RUN apt-get install -y openssh-server
RUN pip install -r requirements.txt
EXPOSE 8080 22
ENTRYPOINT ["bin/startup.sh"]
