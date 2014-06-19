# Tomcat memory settings
# -Xms<size> set initial Java heap size
# -Xmx<size> set maximum Java heap size
# -Xss<size> set java thread stack size
# -XX:MaxPermSize sets the java PermGen size
JAVA_OPTS="-Xms192m -Xmx512m -XX:MaxPermSize=64m ";   # memory settings

# needed by FR
# LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/opt/railo/fusionreactor/etc/lib

export JAVA_OPTS;