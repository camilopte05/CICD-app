#!/bin/bash
echo "Actualizando el índice de paquetes"
sudo apt-get update -y
echo "Instalando el paquete unzip"
sudo apt-get install unzip -y
echo "Instalando el paquete apache2"
sudo apt-get install apache2 -y
echo "Comprobando la versión de Apache instalada"
sudo apache2ctl -v
echo "Iniciando Apache"
sudo systemctl start apache2
echo "Habilitando Apache"
sudo systemctl enable apache2
echo "Permitiendo el tráfico en el puerto 80"
sudo ufw allow 'Apache'
echo "Verificando los  cambios"
sudo ufw status
echo "Verificando el funcionamiento de Apache"
sudo systemctl status apache2
sudo rm -rf /var/www/html/
sudo cp -r /vagrant/html/ /var/www/
echo "Instalando Java"
sudo apt-get install openjdk-8-jdk -y
echo "Comprobando la versión de Java instalada"
sudo java -version
echo "Instalando Apache JMeter"
sudo wget https://dlcdn.apache.org//jmeter/binaries/apache-jmeter-5.4.1.zip
echo "Descomprimiendo de Apache JMeter"
sudo unzip apache-jmeter-5.4.1.zip
sudo rm /home/vagrant/apache-jmeter-5.4.1/bin/jmeter.properties
sudo cp /vagrant/jmeter.properties /home/vagrant/apache-jmeter-5.4.1/bin/
sudo cp /vagrant/TestPlan.jmx /home/vagrant/
echo "Cambiando de directorio"
cd apache-jmeter-5.4.1/bin/
echo "Iniciando Apache JMeter"
./jmeter -n -t /home/vagrant/TestPlan.jmx -l testLogFile -e -o /home/vagrant/output
sudo cp -r /home/vagrant/output/ /var/www/html/