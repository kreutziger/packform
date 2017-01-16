#!/bin/bash -ex
curl  -L http://pkg.jenkins-ci.org/redhat/jenkins.repo -o /etc/yum.repos.d/jenkins.repo
rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
yum install -y jenkins-${version}
sed -i -e  's|JENKINS_LISTEN_ADDRESS=""|JENKINS_LISTEN_ADDRESS="127.0.0.1"|g'  /etc/sysconfig/jenkins
sed -i -e  's|JENKINS_JAVA_OPTIONS="-Djava.awt.headless=true"|JENKINS_JAVA_OPTIONS="-Dhudson.DNSMultiCast.disabled=true -Dhudson.udp=-1 -Djava.awt.headless=true  -Djava.io.tmpdir=/var/lib/jenkins/tmp"|g'  /etc/sysconfig/jenkins
mkdir -p /var/lib/jenkins/tmp
chown jenkins:jenkins /var/lib/jenkins/tmp
systemctl enable jenkins.service
