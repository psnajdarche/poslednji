pipeline {
    agent any
    
    environment{
        dockerImage = ''
        korImeILozinka = "dockerKorImeILozinka"
    }



   stages {
        stage('Checkout gita') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: 'b4ba09f8-bba3-407b-a3d6-a9b7e36e2354', url: 'https://github.com/StevaRmnk/MavenRepository']]])
                sh 'mvn -D maven.test.failure.ignore=true clean package'
                
            }
        }
        stage('Pravljenje docker image') {
            steps {
                script{
                    dockerImage = sh 'docker build -t stevarmnk/my-app-1.0 .'
                }
            }
        }
        stage('Pushovanje na dockerHub') {
            steps {
                script{
                    docker.withRegistry('',korImeLozinka){
                    dockerImage.push()
                }
                
                }
            }
        }
    }
    
}
