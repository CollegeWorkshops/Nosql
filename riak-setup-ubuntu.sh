#!/bin/bash -e
working_dir=`pwd`
if [ ! -f "riak-1.4.*.tar" ]; then
  rm -rf riak-1.4.*.tar
  wget http://s3.amazonaws.com/downloads.basho.com/riak/1.4/1.4.2/riak-1.4.2.tar.gz
fi

tar zxvf riak-1.4.2.tar.gz
cd riak-1.4.2
make all

#create and start 5 different nodes

make devrel DEVNODES=5
cd dev
dev1/bin/riak start
dev2/bin/riak start
dev3/bin/riak start
dev4/bin/riak start
dev5/bin/riak start

#create cluster
dev2/bin/riak-admin cluster join dev1@127.0.0.1
dev3/bin/riak-admin cluster join dev1@127.0.0.1
dev4/bin/riak-admin cluster join dev1@127.0.0.1
dev5/bin/riak-admin cluster join dev1@127.0.0.1

dev1/bin/riak-admin cluster plan

dev2/bin/riak-admin cluster commit
