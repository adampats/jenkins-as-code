FROM jenkins/jenkins:lts

ENV JAVA_OPTS \
  -Dhudson.footerURL=http://${footerURL_host:-127.0.0.1} \
  -Djenkins.install.runSetupWizard=false
ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc_configs

COPY ./files/executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy
COPY ./files/*.yaml /var/jenkins_home/casc_configs/
COPY ./files/plugins.txt /usr/share/jenkins/ref/plugins.txt

RUN env | sort
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
RUN echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state
