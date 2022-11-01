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
                    def  para= readJSON text: "$ref"
                    def ev=readJSON text:["$x_github_event"]
                    echo para.toString()
                    echo ev.toString()
                   
                    echo para.toString()
                    echo 'Ovaj pull je ' + para
                    if(ev=="push"){
                    build job:"PokrenutOdStraneDrugog"
                    }else{
                        echo "Job nije pokrenut"
                    }  
                    }
            }
        }
      

     
 }
}
