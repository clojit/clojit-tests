#!/bin/bash

cd tests

for f in *.clj; 
do 
    echo "Processing $f file.."; 
    java -jar clojit.jar $f > "`basename $f .clj`.c-report"
    ./"clojit-vm" "`basename $f .clj`.json" > "`basename $f .clj`.cvm-result"
    echo "Clojit-VM output: "
    cat "`basename $f .clj`.cvm-result"
    printf "\n"

    java -jar "clojure-1.6.0.jar" $f > "`basename $f .clj`.jvm-report"
    echo "Clojure-JVM output: "
    cat "`basename $f .clj`.jvm-report"
    printf "\n"

    if diff "`basename $f .clj`.cvm-result" "`basename $f .clj`.jvm-report" >/dev/null ; then
      echo "$f runs correctly"
    else
      echo "$f not the same"
    fi
    printf "\n\n"
    

done

