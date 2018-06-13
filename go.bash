#!/bin/bash

for a in *; do { 

  if [ -d $a ] 
  then

    ### 
    ## GIT ADD/COMMIT/PUSH
    ### 
    # cd $a;
    # git add .;
    # git commit -m "alterações realizadas para publicação no OpenShift e 3scale."
    # git pull origin master;
    # git push origin master;
    # cd ..;

    ### 
    ## GIT PULL
    ### 
    # echo $a;
    # cd $a;
    # git pull origin master
    # cd ..;

    ### 
    ## ADD DOCKERFILE
    ### 
    # cp /Users/anderson/homeoffice/projects/cabal/sippe-integration-issuer-microservice-card/src/main/docker/Dockerfile $a/src/main/docker/Dockerfile;
    # ARTIFACT_ID=`cat $a/pom.xml | grep artifactId | grep sippe-integration | awk -F '<artifactId>' '{ print $2 }' | awk -F '</artifactId>' '{print $1}'`;
    # sed -i '' 's/sippe-integration-issuer-microservice-card/'$ARTIFACT_ID'/g' $a/src/main/docker/Dockerfile;
    # sed -i '' 's/sippe-microservice-image-base\/sippe-microservice-image-base/sippe\/sippe-microservice-image-base/g' $a/src/main/docker/Dockerfile;

    ### 
    ## MAVEN CLEAN/INSTALL/TESTS/DOCKER BUILD/DOCKER PUSH
    ### 
    # mvn clean install docker:build docker:push -f $a/pom.xml;

    ### 
    ## CHECK SUCCESS
    ### 
    # echo $a;
    # ls -la $a/target/*.jar;


  fi;

}; done
