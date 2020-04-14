#!/bin/bash
# Get dependencies of list of pip packages

pip_file=dep.list
pip_sorted=sorted.list
array=( pip jupyterhub horovod common notebook protobuf tensorflow-serving-api google-cloud-storage boto3 jsonschema falcon cheroot seldon-core numpy  grpcio defusedxml grpcio-tools test-generator ) # add pip packages to find the dependencies for.

if [ -f $pip_file ]; then rm $pip_file; fi

for i in "${array[@]}"
do
    echo $i >> $pip_file
    pip show $i  | grep Requires | sed 's/Requires://g' | tr ',' '\n' | tr -d "[:blank:]" | sed '/^$/d' >> $pip_file 
done

cat $pip_file | sort | uniq > $pip_sorted

if [ -f $pip_file ]; then rm $pip_file; fi

