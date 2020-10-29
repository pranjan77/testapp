#!/bin/bash

# Docker container entry point script
# When you run docker run my-app xyz, then this script will get run

# Persistent server mode (aka "dynamic service"):
# This is run when there are no arguments
if [ $# -eq 0 ] ; then
  cp /kb/module/scripts/server_new.xml "/usr/local/tomcat/conf"
  cd "/usr/local/tomcat/bin"
  ./catalina.sh run -config conf/server_new.xml 
  echo -e "\n\n\tTomcat Server Stopped, container script has finished\n"

# Run tests
elif [ "${1}" = "test" ] ; then
  echo "Running tests..."
  echo "...done running tests."

# One-off jobs
elif [ "${1}" = "async" ] ; then
  echo "Running a one-off job... nothing to do."

# Initialize?
elif [ "${1}" = "init" ] ; then
  echo "Initializing module... nothing to do."

# Bash shell in the container
elif [ "${1}" = "bash" ] ; then
  echo "Launching a bash shell in the docker container."
  bash

# Required file for registering the module on the KBase catalog
elif [ "${1}" = "report" ] ; then
  echo "Generating report..."
  cp /kb/module/compile_report.json /kb/module/work/compile_report.json

else
  echo "Unknown command. Valid commands are: test, async, init, bash, or report"
fi




