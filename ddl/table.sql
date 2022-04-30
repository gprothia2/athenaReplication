/****Step 1 Create  table "Users"  using Athena on top of the customer data saved in the S3 bucket and prefix users ****/


CREATE EXTERNAL TABLE `users`(
  `userid` bigint,
  `username` string,
  `firstname` string,
  `lastname` string,
  `city` string,
  `state` string,
  `email` string,
  `phone` string,
  `likesports` boolean,
  `liketheatre` boolean,
  `likeconcerts` boolean,
  `likejazz` boolean,
  `likeclassical` boolean,
  `likeopera` boolean,
  `likerock` boolean,
  `likevegas` boolean,
  `likebroadway` boolean,
  `likemusicals` boolean,
  `original_userid` bigint
)
ROW FORMAT DELIMITED
  FIELDS TERMINATED BY '|'
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  's3://<<bucket_name>>/users/'
  
  
  /***** Step 2 : Create  table "Listings"  using Athena on top of the listings data saved in the S3 bucket and prefix Listings.  *****/

CREATE EXTERNAL TABLE `listings`(
  `listid` bigint,
  `sellerid` bigint,
  `eventid` bigint,
  `dateid` bigint,
  `numtickets` bigint,
  `priceperticket` double,
  `totalprice` double,
  `listtime` string)
ROW FORMAT DELIMITED
  FIELDS TERMINATED BY '|'
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  's3://<<bucket_name>>/listings/'
