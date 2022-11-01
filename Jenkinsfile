pipeline {
    agent any
    
    environment{
        registry = "pavleche/maven-project"
        dockerImage = ''
        korImeILozinka = "dockerKorImeILozinka"
        
        
    }
     


   stages {
       
        
        stage('Checkout gita') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[ url: 'https://github.com/psnajdarche/poslednji.git']]])
                sh 'mvn -D maven.test.failure.ignore=true clean package'
                
            }
        }
           stage("Parsiranje odgovora"){
               steps{ 
                   script{ 
                    
                   
                    echo 'Ovaj pull je ' + $ref
                    }
            }
        }
       
   }
}
