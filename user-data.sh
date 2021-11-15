#!/bin/bash
yum update -y
yum install httpd php php-mysql docker -y
service docker start
usermod -aG docker $USER
cd /var/www/html
wget https://wordpress.org/wordpress-5.1.1.tar.gz
tar -xzf wordpress-5.1.1.tar.gz
cp -r wordpress/* /var/www/html/
rm -rf wordpress
rm -rf wordpress-5.1.1.tar.gz
chmod -R 755 wp-content
chown -R apache:apache wp-content
chkconfig httpd on
service httpd start
docker run -p 3306:3306 -e MYSQL_RANDOM_ROOT_PASSWORD=1 -e MYSQL_DATABASE=wordpress --name wordpressdb -v "$PWD/database":/var/lib/mysql -d mysql:5.7
sleep 10
sed -e "s/database_name_here/wordpress/" -e "s/username_here/root/" -e "s/password_here/$(docker logs wordpressdb  2>&1 | grep "GENERATED ROOT PASSWORD" | awk '{print $8}')/" -e "s/localhost/127.0.0.1/" /var/www/html/wp-config-sample.php > /var/www/html/wp-config.php
