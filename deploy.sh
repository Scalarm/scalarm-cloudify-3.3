#!/bin/bash

CFY_SERVICE=$1
CFY_ACTION=$2

if [ ! -d /tmp/scalarm-distributed ]; then
  pushd /tmp
    rm -f distributed.tar.gz
    wget https://github.com/Scalarm/scalarm/archive/distributed.tar.gz
    tar -zxvf distributed.tar.gz
  popd # /tmp
fi

export INFORMATION_SERVICE_URL=localhost:11300
export INFORMATION_SERVICE_LOGIN=scalarm
export INFORMATION_SERVICE_PASSWORD=scalarm1024

export SECRET_KEY_BASE=dfjeiwu38r782781j38nx9

export GIT_BRANCH=development
export RAILS_ENV=production
export SCALARM_ROOT=$HOME/scalarm

# only if each service is started separately
export PUBLIC_LOG_BANK_ADDRESS="localhost:20000"
export PUBLIC_EXPERIMENT_MANAGER_ADDRESS="localhost:3001"
export PUBLIC_DATA_EXPLORER_ADDRESS="localhost:25000"
export PUBLIC_PATHFINDER_ADDRESS="localhost:21000"

mkdir -p $SCALARM_ROOT
/tmp/scalarm-distributed/deployment_scripts/${CFY_SERVICE}/${CFY_ACTION}.sh
