# tomcat 8 image

## Tags
`latest` inline with the official tomcat 8 docker image

`8.5.35` tomcat 8 release 8.3.35

## Details

This image is published with these following database drivers:
-   Postgres
-   MySql
-   Oracle

It contains also the following extra packages:

- curl
- imageMagick
- nano

The JVM settings have been modified to limit the Max Heap size to 4GB of RAM
allocation and to use the G1 garbage collector.

## Volume

The following path can be externally mapped.

`/usr/local/tomcat/webapps`
