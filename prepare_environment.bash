#!/bin/bash

clone() {
  git clone $1
}

checkout() {
  git checkout $1
}

install() {
  mvn clean install -Dmaven.test.skip=true -Dmaven.javadoc.skip=true
}

clean() {
  rm -rf $1
}

print() {
  echo ""
  echo "========================================"
  echo $1
  echo "========================================"
}

clean_env() {
  rm -rf ~/.m2/repository/br/com/sippe
}

prototype_method() {
  URL=$1
  DIR=$2
  BRANCH=$3

  print $DIR

  clone $URL
  cd $DIR
  checkout $BRANCH
  install
  cd ..
  clean $DIR
}

###
## MAIN
###

echo "Usuário para acesso ao Bitbucket: "
read BITBUCKET_USER

echo -n "Senha para acesso ao Bitbucket: "
read -s BITBUCKET_PASSWORD

clean_env

prototype_method https://$BITBUCKET_USER:$BITBUCKET_PASSWORD@bitbucket.org/cabalbrasil/super-pom-library.git super-pom-library master

prototype_method https://$BITBUCKET_USER:$BITBUCKET_PASSWORD@bitbucket.org/cabalbrasil/super-pom-java-app.git super-pom-java-app master

prototype_method https://$BITBUCKET_USER:$BITBUCKET_PASSWORD@bitbucket.org/cabalbrasil/super-pom-microservice-framework.git super-pom-microservice-framework master

prototype_method https://$BITBUCKET_USER:$BITBUCKET_PASSWORD@bitbucket.org/cabalbrasil/sippe-business-framework.git sippe-business-framework master 

prototype_method https://$BITBUCKET_USER:$BITBUCKET_PASSWORD@bitbucket.org/cabalbrasil/sippe-util-framework.git sippe-util-framework master

prototype_method https://$BITBUCKET_USER:$BITBUCKET_PASSWORD@bitbucket.org/cabalbrasil/sippe-logging-framework.git sippe-logging-framework master

prototype_method https://$BITBUCKET_USER:$BITBUCKET_PASSWORD@bitbucket.org/cabalbrasil/sippe-test-framework.git sippe-test-framework master

prototype_method https://$BITBUCKET_USER:$BITBUCKET_PASSWORD@bitbucket.org/cabalbrasil/sippe-messaging-framework.git sippe-messaging-framework master

prototype_method https://$BITBUCKET_USER:$BITBUCKET_PASSWORD@bitbucket.org/cabalbrasil/sippe-monitoring-framework.git sippe-monitoring-framework master

prototype_method https://$BITBUCKET_USER:$BITBUCKET_PASSWORD@bitbucket.org/cabalbrasil/sippe-app-microservice-framework.git sippe-app-microservice-framework master

prototype_method https://$BITBUCKET_USER:$BITBUCKET_PASSWORD@bitbucket.org/cabalbrasil/super-pom-microservice.git super-pom-microservice master

prototype_method https://$BITBUCKET_USER:$BITBUCKET_PASSWORD@bitbucket.org/cabalbrasil/sippe-service-registry.git sippe-service-registry master

prototype_method https://$BITBUCKET_USER:$BITBUCKET_PASSWORD@bitbucket.org/cabalbrasil/sippe-cloud-configuration.git sippe-cloud-configuration master

