#!/bin/bash -e
working_dir=`pwd`
master_node_id='1'
node_directory='riak-node'
node_name_prefix='node'
master_node_name=$node_name_prefix$master_node_id
echo "Checking if Riak is downloaded"
if [ ! -f "riak-1.3.*.tar" ]; then
  rm -rf riak-1.3.*.tar
  wget http://s3.amazonaws.com/downloads.basho.com/riak/1.3/1.3.1/osx/10.6/riak-1.3.1-osx-x86_64.tar.gz
fi
echo "Unzip and Set up Riak"
gunzip riak-1.3.1-osx-x86_64.tar.gz
tar -xf riak-1.3.1-osx-x86_64.tar
echo "Setting up 10 nodes"
for i in {1..10}
do
  protocolbuffer_port=`expr 8000 + $i`
  http_port=`expr 8100 + $i`
  handoff_port=`expr 8200 + $i`
  cd $working_dir
  nodeid=$node_directory$i
  cp -r riak-1.3.1 $nodeid
  sed -e s/8087/$protocolbuffer_port/g -i '' $nodeid/etc/app.config
  sed -e s/8098/$http_port/g -i '' $nodeid/etc/app.config
  sed -e s/8099/$handoff_port/g -i '' $nodeid/etc/app.config
  sed -e s/riak@/$node_name_prefix$i@/g -i '' $nodeid/etc/vm.args
  cd $nodeid/bin
  ./riak start
  if [ $i -ne $master_node_id ]; then
    ./riak-admin cluster join $master_node_name@127.0.0.1
  fi
done
cd $working_dir/$node_directory$master_node_id/bin/
./riak-admin cluster plan
./riak-admin cluster commit
./riak-admin status | grep 'node.@'
echo "10 node Riak cluster setup"