#!/bin/bash

sudo chown -R 1000:1000 jenkins
docker-compose build
docker-compose up -d

sleep 10s
sudo cp inspectit/businessContext.xml inspectit_cmr/ci/businessContext.xml
sudo cp inspectit/petclinic_base_services.xml inspectit_cmr/ci/profiles/petclinic_base_services.xml
sudo cp inspectit/petclinic_remote.xml inspectit_cmr/ci/profiles/petclinic_remote.xml
sudo cp inspectit/petclinic_sql_monitoring.xml inspectit_cmr/ci/profiles/petclinic_sql_monitoring.xml

docker restart inspectit_cmr
