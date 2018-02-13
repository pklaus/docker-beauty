## A Docker Version of the CSS EPICS Archiver

This is split into two containers:

* one container running the PostgreSQL database (`epics-css-archiver-db`)
* one container running the archiver application (`epics-css-archiver-app`)

They need to be connected to the same docker network.
