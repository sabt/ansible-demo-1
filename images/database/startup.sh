service ssh start
service postgresql start
sleep 1
mkdir -p /var/log/postgresql
exec tail -f /var/log/postgresql/postgresql-16-main.log