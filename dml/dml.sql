# Script to replicate data in users table

insert into users
select *
from (
        select (m.max_userid * r.x) + u.userid,
            concat(u.username, cast(r.x as varchar)),
            u.firstname,
            u.lastname,
            u.city,
            u.state,
            u.email,
            u.phone,
            u.likesports,
            u.liketheatre,
            u.likeconcerts,
            u.likejazz,
            u.likeclassical,
            u.likeopera,
            u.likerock,
            u.likevegas,
            u.likebroadway,
            u.likemusicals,
            u.userid source_userid
        from replication_scale_v r,
            max_user_v m,
            users u
    )
    
    
    
# Script to replicate data in listings table
insert into listings
select (m.max_listingid * u.rank) + listid listid,
    u.userid sellerid,
    l.eventid,
    l.dateid,
    l.numtickets,
    l.priceperticket,
    l.totalprice,
    l.listtime
from replicated_users_v u,
    listings l,
    max_listing_v m
where u.original_userid = l.sellerid
    and u.source_userid is not null
