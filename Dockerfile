FROM python:3.6
WORKDIR /app
RUN apt-get update -y
RUN apt-get install -y openssh-server
COPY . .
RUN ls
RUN pip install -r requirements.txt
EXPOSE 8080 22
CMD [./startup.sh]
