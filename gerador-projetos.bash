#!/bin/bash 

set -e

curl -X POST -u anderson.feitosa:@nderson12 -H "Content-Type: application/json" "http://bitbucket.cabal.com.br/rest/api/1.0/projects/AR/repos" -d '{"name": "sippe-issuer-my-test", "scmId": "git", "forkable": true}'

curl -X PUT -u anderson.feitosa:@nderson12 -H "Content-Type: application/json" "http://bitbucket.cabal.com.br/rest/webhook/1.0/projects/AR/repos/sippe-issuer-my-test/configurations" -d '{"title": "Jenkins", "url": "http://jenkins.cabal.com.br/jenkins/bitbucket-hook/", "enabled": "true" }'

mvn archetype:generate -DinteractiveMode=false -DarchetypeGroupId=br.com.sippe.architecture.pom.archetype -DarchetypeArtifactId=microservice-archetype-crud -DarchetypeVersion=0.0.1-SNAPSHOT -DarchetypeRepository=nexus -DartifactId=sippe-issuer-my-test -Dversion=1.0.0-SNAPSHOT -Dentity=User -Dbusiness=issuer -Dmodule=my.test -Dproject-name=sippe-issuer-my-test -Dproject-description="Meu Test" -Dproject-url="ssh://git@bitbucket.cabal.com.br:7999/AR/sippe-issuer-my-test.git"

cd sippe-issuer-my-test
mvn versions:update-properties versions:use-latest-releases -Dincludes=br.com.sippe*:*
mvn versions:commit

git init 
git add .
git commit -m "initial commit"
git remote add origin ssh://git@bitbucket.cabal.com.br:7999/AR/sippe-issuer-my-test.git
git push -u origin master
git checkout -b develop
git push origin develop
git checkout -b feature/initial-functionality
git push origin feature/initial-functionality
cd ..

curl -X POST -u anderson.feitosa:@nderson12 -H "Content-Type:text/xml" "http://jenkins.cabal.com.br/jenkins/createItem?name=gegov-sippe-issuer-my-test" \
-d \
'<?xml version="1.1" encoding="UTF-8"?>
<flow-definition plugin="workflow-job@2.29">
  <actions>
    <org.jenkinsci.plugins.workflow.multibranch.JobPropertyTrackerAction plugin="workflow-multibranch@2.20">
      <jobPropertyDescriptors>
        <string>org.jenkinsci.plugins.workflow.job.properties.DurabilityHintJobProperty</string>
      </jobPropertyDescriptors>
    </org.jenkinsci.plugins.workflow.multibranch.JobPropertyTrackerAction>
  </actions>
  <description></description>
  <keepDependencies>false</keepDependencies>
  <properties>
    <jenkins.model.BuildDiscarderProperty>
      <strategy class="hudson.tasks.LogRotator">
        <daysToKeep>-1</daysToKeep>
        <numToKeep>3</numToKeep>
        <artifactDaysToKeep>-1</artifactDaysToKeep>
        <artifactNumToKeep>-1</artifactNumToKeep>
      </strategy>
    </jenkins.model.BuildDiscarderProperty>
    <org.jenkinsci.plugins.workflow.job.properties.DurabilityHintJobProperty>
      <hint>PERFORMANCE_OPTIMIZED</hint>
    </org.jenkinsci.plugins.workflow.job.properties.DurabilityHintJobProperty>
    <com.synopsys.arc.jenkinsci.plugins.jobrestrictions.jobs.JobRestrictionProperty plugin="job-restrictions@0.8"/>
    <hudson.model.ParametersDefinitionProperty>
      <parameterDefinitions>
        <org.jenkins.cabal.plugin.CabalBrasilParameterDefinition plugin="cabal-brasil-parameter-plugin@2.0.0">
          <name>CABAL</name>
          <description></description>
          <applicationType>microservice</applicationType>
          <uuid>'$(uuidgen)'</uuid>
        </org.jenkins.cabal.plugin.CabalBrasilParameterDefinition>
      </parameterDefinitions>
    </hudson.model.ParametersDefinitionProperty>
    <org.jenkinsci.plugins.workflow.job.properties.PipelineTriggersJobProperty>
      <triggers>
        <com.cloudbees.jenkins.plugins.BitBucketTrigger plugin="bitbucket@1.1.8">
          <spec></spec>
        </com.cloudbees.jenkins.plugins.BitBucketTrigger>
      </triggers>
    </org.jenkinsci.plugins.workflow.job.properties.PipelineTriggersJobProperty>
  </properties>
  <definition class="org.jenkinsci.plugins.workflow.cps.CpsScmFlowDefinition" plugin="workflow-cps@2.60">
    <scm class="hudson.plugins.git.GitSCM" plugin="git@3.9.1">
      <configVersion>2</configVersion>
      <userRemoteConfigs>
        <hudson.plugins.git.UserRemoteConfig>
          <url>ssh://git@bitbucket.cabal.com.br:7999/ar/sippe-issuer-my-test.git</url>
          <credentialsId>c5a4de0f-b330-47ad-8c08-d3aaa86059f6</credentialsId>
        </hudson.plugins.git.UserRemoteConfig>
      </userRemoteConfigs>
      <branches>
        <hudson.plugins.git.BranchSpec>
          <name>*/master</name>
        </hudson.plugins.git.BranchSpec>
        <hudson.plugins.git.BranchSpec>
          <name>*/develop</name>
        </hudson.plugins.git.BranchSpec>
        <hudson.plugins.git.BranchSpec>
          <name>*/hotfix/*</name>
        </hudson.plugins.git.BranchSpec>
        <hudson.plugins.git.BranchSpec>
          <name>*/feature/*</name>
        </hudson.plugins.git.BranchSpec>
      </branches>
      <doGenerateSubmoduleConfigurations>false</doGenerateSubmoduleConfigurations>
      <submoduleCfg class="list"/>
      <extensions>
        <hudson.plugins.git.extensions.impl.CleanBeforeCheckout/>
      </extensions>
    </scm>
    <scriptPath>Jenkinsfile</scriptPath>
    <lightweight>true</lightweight>
  </definition>
  <triggers/>
  <disabled>false</disabled>
</flow-definition>'