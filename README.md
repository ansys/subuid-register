subuid-register
=======

A simple tool to let user to register subuid / subgid range.

```
$ subuid-register -q  # query subuid / subgid range
Subuid does not exist
Subgid does not exist
$ subuid-register     # register for the current user (returns subuid / subgid range)
username:713097216:65536
username:713097216:65536
$ subuid-register
Subuid exists
Subgid exists
$ subuid-register -q
username:713097216:65536
username:713097216:65536
```

Design notes
=======

The username is used to generate the subuid and subgid's.  The username is used insted of the uid as usernames are more stable from system to system compared to uid's.

The username is hashed using XXHash64 based on https://github.com/Cyan4973/xxHash.  We wanted a hash function with a low probability of collisions for short strings that are typically found in usernames.  In case of collisions, the search for an available ID range continues until one is found.  The possibility of collisions implies that subuid/subgid may not be consistent from host to host.
