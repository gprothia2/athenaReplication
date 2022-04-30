# Replicating data using Athena scripts

This project helps you replicate test data in S3 buckets using Athena scripts

### Procedure to replicate data is explained using 2 sample data files

<b>Step1. Downlaod the data files</b>

Go to data folder. There are 2 files - users.txt and listinsg.txt. Upload these files to S3 bucket under the separate prefix. Yiu can name one as as  prefix users and other preifx as listings

<b>Step2. Create the tables </b>

Got to folder ddl, copy the code in script table.sql and run in in Athena console. This will create table users and listings. Ensure that you change the name of the bucket before running the script

LOCATION
  's3://<<bucket_name>>/users/'

<b>Step3. Create the views </b>

Got to folder ddl, copy the code in script view.sql and run in in Athena console. This will create  views that will be refernced in scripts that will replicate data.
Before executing the view scripts ,review the script for creating replication_scale_v. This controls the scale of replication. Default value is  10 to replicate the data 10x.. You can modiy to increase/decrease it as per your requirement

	CREATE OR REPLACE VIEW "replication_scale_v" AS
	SELECT x
	FROM UNNEST("sequence"(1, 10)) t (x)

	Change the value of 2nd parameter in sequence function from default value '10' to any other desired value.

<b>Step4. Run the Replication scripts </b>

Got to folder dml, copy the code in script dml.sql and execute it in Athena console. This will replicate the data in tables user and listings.
