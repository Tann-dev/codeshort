# Sujet

## Stack Techno :

* Maven
* Java
* Spring
* Junit 5
* SonarCloud
* React
* github actions
* Docker

*Sur le VPS de la classe :*
* docker-compose
* Base relationnelle (postgres)


## Critères d'évaluations :

* Toutes les fonctionnalités sont présentes
* Les contraintes techniques sont respectées
* Le code est propre et les responsabilités sont correctement distribuées
* La couverture de test du code java dépasse 50%
* L'application est déployée via le docker-compose partagé de la classe.
* L'application est polie et prête à être lancée.


## Si aucun projet ne vous convient ou vous avez une idée :

à discuter avec l'enseignant, la stack tech doit toutefois être respectée

## Creation du projet : 

Les repository sont a créer en publique (pour l'analyse SonarCloud) dans l'organization

par example pour le projet pipo : 
* pipo-api
* pipo-web


# CodeShort
#### Application de tips et d’anecdotes de codes

## But

L’application permet d’apprendre plein d’informations et divers annecdotes de code sous le format de petits posts en 150-200 caractères max.

## Participants

* Antoine DEPOISIER (@Tann-dev)
* Mathis TANGHE (@blurp748)

## Fonctionnalités

* Voir un ensemble de posts de manière infini
* On peut trier les posts par divers filtres (par langages, par back ou front, type humour ou sérieux ...)
* Système de compte (Login/Register)
    * Ajouter un post
    * Mettre un post en favori
    * Upvote/Downvote un post
    * Signaler un post
    * Ajouter un commentaire sous un post (par exemple pour demander une précision)
    * Possibilité d’ajouter un lien vers son compte git sur notre profil (afin que d’autres utilisateurs puissent le consulter)
    * Possible de suivre les autres utilisateurs
    * A la création de notre compte, entrer les différents sujets qui nous intéressent
    * Upvote/Downvote les commentaires d'un post
* Les posts seront sous différents formats (photo, vidéo, texte)
* Pas de système de message privé entre les utilisateurs
* On ne voit qu’un seul post à la fois (système de swipe pour changer de post)
* Voir les post les plus upvote du jour d’avant
* Algorithme de recommandations selon nos favoris et upvote (optionnel)
* Version web et version mobile (optionnel)

## Technologies

* PostgreSQL
* SpringBoot
* Angular