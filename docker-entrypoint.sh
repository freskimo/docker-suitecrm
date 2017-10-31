#!/bin/sh
set -e

# mysql -u {username} -p{password} -h {remote server ip} {DB name}
if [ $1 = "init" ]; then
  echo "[init] Installing..."
  cp /config_si.php /var/www/html/
  php -r "\$_SERVER['HTTP_HOST'] = 'localhost'; \$_SERVER['REQUEST_URI'] = 'install.php';\$_REQUEST = array('goto' => 'SilentInstall', 'cli' => true); require_once 'install.php';";
elif [ $1 = "dbdump" ]; then
  echo "[dbdump] Dumping DB..."
  mysqldump -u $DB_USER -p '$DB_PASSWORD' -h $DB_HOST $DB_NAME
elif [ $1 = "dbimport" ]; then
  echo "[dbimport] Importing DB..."
  mysql -u $DB_USER -p $DB_PASSWORD -h $DB_HOST $DB_NAME < /dev/stdin
else
  exec "$@"  
fi
