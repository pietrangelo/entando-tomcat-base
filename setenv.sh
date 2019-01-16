export STOREPASS=kabubiForPresident!123
export CATALINA_OPTS="$CATALINA_OPTS -Xmx2048m -verbose:gc -XX:+PrintGCTimeStamps -XX:+PrintGCDetails -Xloggc:gc.log -XX:+UseGCLogFileRotation -XX:NumberOfGCLogFiles=5 -XX:GCLogFileSize=3M -XX:-HeapDumpOnOutOfMemoryError -XX:+UseG1GC"
