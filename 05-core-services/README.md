# WHY SUPABASE POSTGRES FOR N8N
We have chosen Supabase as the database for N8N because it provides a reliable data layer for our Docker Swarm setup.
It offers a VERY generous free plan and is quick and easy to set up.
Consider a Swarm cluster with three manager nodes: manager1, manager2, and manager3. 
While it's bad practice for manager nodes to also run application workloads (they should ideally be dedicated to cluster management), let's assume this setup for this example.
Initially, the N8N service is running on manager1, which is also the Swarm leader. If manager1 fails, the Swarm orchestrator will automatically promote a new leader (e.g., manager2) and reschedule the N8N containers to another node.
Since the new containers connect to the same external Supabase database, they can resume operations seamlessly without data loss.
This architecture ensures that even in the event of a node failure, the system maintains availability.
I chose Supabase because it's easier to set up and allows for faster application deployment.
But Supabase DOES NOT have true High Availability yet.
If you require true High Availability from the database perspective to eliminate a single point of failure, you can use Azure or AWS services."

Docker swarm doc https://docs.docker.com/engine/swarm/admin_guide/
AWS doc https://docs.aws.amazon.com/prescriptive-guidance/latest/migration-databases-postgresql-ec2/ha-postgresql-databases-ec2.html
Azure doc https://learn.microsoft.com/en-us/azure/reliability/reliability-postgresql-flexible-server
Supabase doc https://supabase.com/docs/guides/database/overview


# HOW INTEGRATE SUPABASE INTO N8N STACK
Variables:
    - DB_TYPE=postgresdb    
    - DB_POSTGRESDB_DATABASE=postgres
    - DB_POSTGRESDB_HOST=SUPABASE_HOST
    - DB_POSTGRESDB_PORT=SUPABASE_PORT
    - DB_POSTGRESDB_USER=SUPABASE_USER
    - DB_POSTGRESDB_PASSWORD=SUPABASE_PASSWORD
    - DB_POSTGRESDB_SCHEMA=YOUR_SUPABASE_SCHEMA

Supabase exemple:
    - DB_TYPE=postgresdb
    - DB_POSTGRESDB_DATABASE=postgres
    - DB_POSTGRESDB_HOST=aws-0-us-east-1.pooler.supabase.com
    - DB_POSTGRESDB_PORT=6543
    - DB_POSTGRESDB_USER=postgres.xaailbkjasdbnfkjlabnfdl
    - DB_POSTGRESDB_PASSWORD=hZyyGeUVlApdzG8Q
    - DB_POSTGRESDB_SCHEMA=n8n


DB_TYPE
Description: The database type used by n8n.
Value: postgresdb (fixed value)

DB_POSTGRESDB_DATABASE
Description: The name of the PostgreSQL database.
Default: postgres (commonly used by Supabase)

DB_POSTGRESDB_HOST 
Description: The Supabase PostgreSQL host address. Replace with the actual host from your Supabase project settings.
Format: aws-0-[REGION].pooler.supabase.com

DB_POSTGRESDB_PORT
Description: The port used to connect to the Supabase PostgreSQL database.
While both 5432 and 6543 may work, Supabase documentation recommends using 5432 for direct connections (ideal for virtual machines or server-based deployments).
Recommended Value: 5432
- DB_POSTGRESDB_PORT=SUPABASE_PORTS

DB_POSTGRESDB_USERr ### 
Description: The database user provided by Supabase. Found in your Supabase project under database settings.
Format: postgres.[SUPABASE_PROJECT_ID]

DB_POSTGRESDB_PASSWORD
Description: The password associated with your Supabase database user.
Available in your Supabase dashboard under: 
https://supabase.com/dashboard/project/YOUR_PROJECT_ID/database/

DB_POSTGRESDB_SCHEMA
Description: The PostgreSQL schema to be used by n8n. You must create this schema manually.
my_n8n_database with your desired schema name.
Replace my_n8n_database with your desired schema name.
CREATE SCHEMA my_n8n_database AUTHORIZATION postgres;


### Reference
N8N Database environment variables doc https://docs.n8n.io/hosting/configuration/environment-variables/database/#postgresql
Supabase Connect to your database doc https://supabase.com/docs/guides/database/connecting-to-postgres