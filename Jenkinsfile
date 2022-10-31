pipeline {
    agent any
    
    environment{
        registry = "pavleche/maven-project"
        dockerImage = ''
        korImeILozinka = "dockerKorImeILozinka"
    }
     parameters {
        string(name: 'COMMENT', defaultValue: 'test-params', description: 'desc')
        string(name: 'BRANCH', defaultValue: 'master', description: 'desc')
    }


   stages {
        stage('Checkout gita') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: '', url: 'https://github.com/psnajdarche/poslednji.git/']]])
                sh 'mvn -D maven.test.failure.ignore=true clean package'
                
            }
        }
      
        stage('triger build') {
            steps {
                script {
                    def comm = readJSON text: "$commits"
                    echo comm.toString()
                   
                    def msg = "$comm_message"
                    echo msg
                    jobs.each {
                        echo it
                        if (msg.contains(it)) {
                            echo 'contains'
                            build job: it, parameters: [[$class: 'StringParameterValue', name: 'BRANCH', value: "${params.BRANCH}"],
                            [$class: 'StringParameterValue', name: 'REF', value: "$ref"]]
                        }
                    }

                }

            }
        }
       
   }
}
