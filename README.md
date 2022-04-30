# Replicating data using Athena scripts

This project helps you replicate test data in S3 buckets using Athena scripts

### Procedure to replicate data is explained using 2 sample data files

<b>Step 1. Download the data files</b>

Go to data folder. There are 2 files - users.txt and listing.txt. Upload these files to S3 bucket under separate prefixes. For users.tx data name the   prefix users and for listings.txt name the prefix as listing

<b>Step 2. Create the tables </b>

Go to folder ddl, copy the code in script table.sql and run it in Athena console. This will create table users and listings. Ensure that you change the name of the bucket to point to bucket where you have downloaded the data before running the script.

LOCATION
  's3://<<bucket_name>>/users/'

<b>Step 3. Create the views </b>

Got to folder ddl, copy the code in script view.sql and run in in Athena console. This will create views that will be referenced in scripts that will replicate data.
Before executing the view scripts ,review the script for creating replication_scale_v. This controls the scale of replication. Default value is 10 to replicate the data 10x. You can modiy to increase/decrease it as per your requirement

	CREATE OR REPLACE VIEW "replication_scale_v" AS
	SELECT x
	FROM UNNEST("sequence"(1, 10)) t (x)

	Change the value of 2nd parameter in sequence function from default value '10' to any other desired value.

<b>Step 4. Run the Replication scripts </b>

Got to folder dml, copy the code in script dml.sql and execute it in Athena console. This will replicate the data in tables users and listings.
