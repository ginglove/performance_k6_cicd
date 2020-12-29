pipeline {
//None parameter in the agent section means that no global agent will be allocated for the entire Pipeline’s
//execution and that each stage directive must specify its own agent section.
    agent {docker 
           {
               image 'ginglove/docker_k6:0.1'
               args '-u root --privileged'
           }
          }
  parameters {
    string(name: 'TIME_1', defaultValue: '', description: 'Config time for K6 Stage 1 , must input with time format ==>1s,1m,1h')
    string(name: 'USER_1', defaultValue: '', description: 'Config User for K6 Stage 1')
    string(name: 'TIME_2', defaultValue: '', description: 'Config time for K6 Stage 2 , must input with time format ==>1s,1m,1h')
    string(name: 'USER_2', defaultValue: '', description: 'Config User for K6 Stage 2')
    string(name: 'TIME_3', defaultValue: '', description: 'Config time for K6 Stage 3 , must input with time format ==>1s,1m,1h')
    string(name: 'USER_3', defaultValue: '', description: 'Config User for K6 Stage 3')
  }
    stages {
        stage('Check Dependencies Requirement') {
            steps {
                sh  'echo "test"'
                sh  'k6 version'
            }
        }
        stage('Running K6 Scripts'){
            steps{
                sh 'sh ./Scripts/run.sh     TIME_1  USER_1  TIME_2  USER_2  TIME_3  USER_3'
            }
        }
    }
}
