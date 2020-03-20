node {
  stage 'Checkout'
  git 'ssh://git@github.com:sayalitoraskar/node.git'
 
  stage 'Docker build'
  docker.build('node')
 
  stage 'Docker push'
  docker.withRegistry('718183984017.dkr.ecr.ap-south-1.amazonaws.com', 'ecr:ap-south-1:node-ecr-credentials') {
    docker.image('node').push('latest')
  }
