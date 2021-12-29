FROM ubuntu
RUN apt-get update -y
RUN apt-get install curl sudo zip nano -y
RUN sudo apt -y install dirmngr apt-transport-https lsb-release ca-certificates
RUN sudo curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
RUN sudo apt -y install nodejs
RUN sudo apt -y  install gcc g++ make
RUN mkdir -p /opt/code
COPY functionhalls-frontend/ /opt/code/functionhalls-frontend/
#WORKDIR /functionhalls-frontend
RUN npm install --prefix /opt/code/functionhalls-frontend/
RUN npm install -g @angular/cli
EXPOSE 4200
WORKDIR /opt/code/functionhalls-frontend/
ENTRYPOINT [ "ng", "serve", "--host", "0.0.0.0" ]
