# Balcuisine

## Description

**balcuisine** est une application mobile Flutter permettant de visualiser en temps réel les mesures collectées par une balance électronique de cuisine connectée. L’application propose une interface intuitive pour accéder aux données de poids ainsi qu’aux capteurs environnementaux tels que la température, l’humidité et la détection de fumée.

Les données sont synchronisées instantanément via Firebase Realtime Database, tandis que Firebase Authentication assure la gestion sécurisée des utilisateurs.

---

## Développeurs et Contexte

Cette application a été développée par **Exaucé Maruba** (main developer) et **Nelson Mukabi**,  
dans le cadre du cours de **Mesures électroniques** à la  
**Faculté Polytechnique, Département de Génie Électrique et Informatique**,  
à l'Université de Kinshasa.

---

## Fonctionnalités principales

- Authentification sécurisée via email et mot de passe grâce à Firebase Auth.  
- Lecture et affichage en temps réel des mesures (poids, température, humidité).  
- Navigation fluide entre écrans : connexion, lecture des mesures, menu, et section « À propos ».  
 - Support multiplateforme (Android et iOS) via Flutter.

---

## Technologies utilisées

- [Flutter](https://flutter.dev) — framework de développement mobile multiplateforme.  
- [Dart](https://dart.dev) — langage de programmation principal.  
- [Firebase Realtime Database](https://firebase.google.com/docs/database) — gestion des données en temps réel.  
- [Firebase Authentication](https://firebase.google.com/docs/auth) — authentification sécurisée des utilisateurs.  
- ESP32 / PSoC — matériel embarqué pour acquisition et transmission des données.

---

## Installation

### Prérequis

- Installer Flutter (version stable recommandée) : https://flutter.dev/docs/get-started/install  
- Configurer un émulateur Android/iOS ou un appareil physique.

### Étapes

1. Cloner le dépôt :

   ```bash
   git clone https://github.com/Maruba22/balcuisine.git
   cd balcuisine





Configurer Firebase :
Créer un projet Firebase sur https://console.firebase.google.com

Télécharger et placer google-services.json (Android) et/ou GoogleService-Info.plist (iOS) dans les dossiers appropriés.

Activer l’authentification par email/mot de passe et configurer la Realtime Database.



## Lancer l’application :
 flutter run




## Contribution
Les contributions sont les bienvenues !
Merci de :
- Forker ce dépôt.
- Créer une branche dédiée (git checkout -b feature/ma-fonctionnalité).
- Soumettre une Pull Request claire et documentée.

## Licence
Ce projet est sous licence MIT — voir le fichier LICENSE pour plus de détails.


### Contact
Pour toute question ou suggestion, veuillez contacter :

Exaucé Maruba — exauce.kambale@unikin.ac.cd
GitHub : https://github.com/Maruba22
