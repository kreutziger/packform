#!/bin/bash -ex
TMP=$(mktemp -d)
cd $TMP
curl  -O -v -j -L -H "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/${major_version}u${minor_version}-b${build_number}/jdk-${major_version}u${minor_version}-linux-x64.rpm
yum install -y "$TMP/jdk-${major_version}u${minor_version}-linux-x64.rpm"
rm -f "$TMP/jdk-${major_version}u${minor_version}-linux-x64.rpm"
