docker-compose up -d
sleep 30
source .env
docker exec -i wwwmaster mysql -uroot -p$MYSQL_ROOT_PASSWORD << EOF
source /usr/share/mysql-8.0/innodb_memcached_config.sql
UNINSTALL PLUGIN daemon_memcached;
INSTALL PLUGIN daemon_memcached soname "libmemcached.so";
EOF
echo "Installation passed successfully"