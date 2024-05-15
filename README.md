# steps
1. Checks for postgres and grabs the container id
2. pgdump into sql file with appropriate file name.
3. scp into vm1 /tmp

## Prerequisits
1. ssh login into the vm1 form the target vm where backup.sh
2. configuration into crontab -e \n
    0 0 * * * /home/ubuntu/backup.sh (to run every midnight)
