#!/bin/bash

if [ ! -d "clojit-c" ]; then
    git clone https://github.com/clojit/clojit-c.git
    cd "clojit-c"
    lein uberjar
    cp target/"clojit-0.1.0-SNAPSHOT-standalone.jar" ..
    cd ..
    mv "clojit-0.1.0-SNAPSHOT-standalone.jar" "clojit.jar"
    mv "clojit.jar" ./tests/
fi

if [ ! -d "clojit-vm" ]; then
    git clone https://github.com/clojit/clojit-vm.git
    cd "clojit-vm"
    cargo build
    cp target/"clojit-vm" ../tests/
    cd ..
fi

cd tests

if [ ! -e "clojure-1.6.0.jar" ]
then
  wget "http://central.maven.org/maven2/org/clojure/clojure/1.6.0/clojure-1.6.0.jar"
fi




