
# Compte Rendu INFO910 - Introduction DevOps
#### Antoine Depoisier : antoine.depoisier@etu.univ-smb.fr

## Détails de l'application

Cette application a été créée en M1 lors d'un projet avec un autre étudiant, il est référencé dans ```Sujet.md```, mais il n'a pas participé au déploiement de cette application.

Cette application est un genre de réseau social entre développeur qui permet aux développeurs de partager des anecdotes avec les autres développeurs, en les postant en ligne. Les autres utilisateurs de codeshort peuvent ajouter des réactions et des commentaires aux anecdotes. Il faut bien sûr créer un compte pour utiliser l'application.

Plus de détails sont sur ```Sujet.md```.

## Création des images Docker

### codeshort-front : 
- être sous node 18
- npm install
- npm run buildDev
- docker build -t tannndev/codeshort-frontend:dev .
- docker push tannndev/codeshort-frontend:dev

### codeshort-back : 
- être sous java 17
- mvn clean install
- docker build -t tannndev/codeshort-backend:dev .
- docker push tannndev/codeshort-backend:dev

## Lancement kube avec minikube

Dans le dossier kube, exécuter les commandes suivantes :

- minikube delete
- minikube start

- Postgres
  - kubectl create configmap postgres-initdb-config --from-file=./postgres/init.sql
  - kubectl apply -f postgres

- Adminer (optionnel)
  - kubectl apply -f adminer

- back
  - kubectl apply -f back

- front
  - kubectl apply -f front

- Dès que tous les services run :
  - minikube service --all
  - kubectl port-forward service/codeshort-front 80:80
  - kubectl port-forward service/codeshort-back 8090:8080
  - kubectl port-forward service/adminer 8070:8080

L'application est disponible sur l'URL ```http://localhost:80```

Adminer disponible sur l'URL ```http://localhost:8070```, et pour se connecter à la base de donnée, il faut se connecter à la base ```codeshort``` avec pour identifiant et mot de passe ```codeshort```.