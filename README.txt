### Création des images Docker

dans codeshort-front : 
- être sous node 18
- npm install
- npm run buildDev
- docker build -t tannndev/codeshort-frontend:dev .
- docker push tannndev/codeshort-frontend:dev

dans codeshort-back : 
- être sous java 17
- mvn clean install
- docker build -t tannndev/codeshort-backend:dev .
- docker push tannndev/codeshort-backend:dev

### Lancement kube

- minikube delete
- minikube start

dans kube :
- kubectl apply -f postgres/postgres-secret.yaml
- kubectl apply -f postgres/postgres-deployment.yaml
- kubectl apply -f postgres/postgres-service.yaml
- minikube service postgres

- kubectl apply -f adminer/adminer-deployment.yaml
- minikube service adminer
- kubectl port-forward service/adminer 8070:8080

- kubectl apply -f back/codeshort-back-deployment.yaml
- kubectl apply -f back/codeshort-back-service.yaml
- minikube service codeshort-back
- kubectl port-forward service/codeshort-back 8090:8080

TODO mettre l'url en tant que variable d'env dans le kube
- kubectl apply -f front/codeshort-front-deployment.yaml
- kubectl apply -f front/codeshort-front-service.yaml
- minikube service codeshort-front
- kubectl port-forward service/codeshort-front 8080:8080