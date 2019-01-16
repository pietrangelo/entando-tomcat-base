# tomcat 8 image release 8.5.35

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