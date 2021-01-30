#!/bin/sh
 
TARGET_HOST=${TARGET_HOST:-root@remote}
TARGET_DIR=${TARGET_DIR:-data}
TARGET_PORT=${TARGET_PORT:-22}
EXCLUDE_FILE=${EXCLUDE_FILE:-\{\}}
 
cat <<EOF >/etc/lsyncd.conf
settings {
  logfile = "/dev/stdout",
  statusFile = "/var/run/lsyncd.status",
  pidfile = "/var/run/lsyncd.pid",
  nodaemon = "true"
}
sync {
  default.rsyncssh,
  source = '/mnt/data',
  host = '${TARGET_HOST}',
  targetdir = '${TARGET_DIR}',
  exclude = ${EXCLUDE_FILE},
  rsync = {
     archive = true,
     compress = false,
     whole_file = false
  },
  ssh = {
    port = ${TARGET_PORT}
  }
}
EOF
cat /etc/lsyncd.conf
echo 'StrictHostKeyChecking=no' >> /etc/ssh/ssh_config
 
exec /usr/bin/lsyncd -nodaemon -delay 0 /etc/lsyncd.conf

