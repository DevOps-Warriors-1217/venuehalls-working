#!/bin/bash
sudo apt update -y
sudo apt install openjdk-11-jdk -y
sudo apt install zip -y
java -version
VERSION=6.5.1
wget https://services.gradle.org/distributions/gradle-${VERSION}-bin.zip -P /tmp
sudo unzip -d /opt/gradle /tmp/gradle-${VERSION}-bin.zip
sudo ln -s /opt/gradle/gradle-${VERSION} /opt/gradle/latest
#sudo nano /etc/profile.d/gradle.sh
echo "export GRADLE_HOME=/opt/gradle/latest
export PATH=${GRADLE_HOME}/bin:${PATH}" >> /etc/profile.d/gradle.sh
sudo chmod +x /etc/profile.d/gradle.sh
source /etc/profile.d/gradle.sh
gradle -v
cd functionhalls-backend
gradle clean build
docker-compose up -d --build 
docker exec -it mongodb bash
