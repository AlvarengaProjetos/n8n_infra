If you want to use n8n with a postgres container instead of Supabase you need to deploy `docker-compose.postgres.yaml` stack into portainer.

Also need to:
- Go to postgres container
- Click on `>_ Console` 
- change the Command to `/bin/sh` 
- type `postgres` in the User field
- type `psql` in the terminal
- type `CREATE DATABASE n8n_queue;`

With that we've created our database for n8n, now we can deploy it safely. Make sure you n8n env var is, `-DB_POSTGRESDB_DATABASE=n8n_queue`.
