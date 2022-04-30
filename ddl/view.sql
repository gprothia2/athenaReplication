# Step 3 : Create a View using Athena that returns a sequence of rows of integers.o

CREATE OR REPLACE VIEW "replication_scale_v" AS
SELECT x
FROM UNNEST("sequence"(1, 10)) t (x)


# Step 4 : Create a View using Athena that returns max ids in users table and max id in the listing table.  


CREATE OR REPLACE VIEW "max_user_v" AS
SELECT "max"(userid) max_userid
FROM users

CREATE OR REPLACE VIEW "max_listing_v" AS
SELECT "max"(listid) max_listingid
FROM listings
