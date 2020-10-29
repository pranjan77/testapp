FROM tomcat:8.0-alpine
ADD sample.war /usr/local/tomcat/webapps/
EXPOSE 5000
RUN mkdir -p /kb/module
RUN chmod a+rw /kb/module
copy . /kb/module

RUN mkdir -p /kb/module/work
RUN chmod a+rwx /kb/module/work

ENTRYPOINT ["sh", "/kb/module/scripts/entrypoint.sh"]

