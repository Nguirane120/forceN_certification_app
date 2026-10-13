# Gestionnaire de tâches — certification Force-N

Application mobile Flutter de gestion de tâches (to-do list), réalisée dans le cadre de la certification Force-N. Les données sont stockées localement sur l'appareil avec SQLite.

<!-- Ajouter une capture d'écran ici, par exemple : ![Accueil](docs/home.png) -->

## Fonctionnalités

- **Création de tâches** : titre, note, date, heure et catégorie (travail, études, santé, maison, courses, voyage…).
- **Modification et suppression** des tâches.
- **Suivi de l'avancement** : séparation des tâches à faire et des tâches terminées.
- **Filtre par date** : affichage des tâches du jour choisi par l'utilisateur.
- **Stockage local** avec SQLite : les tâches sont conservées sans connexion internet.

## Architecture

Le code suit une architecture en couches :

- `data/` : source de données SQLite, modèles et repository ;
- `providrs/` : gestion d'état avec Riverpod (StateNotifier) ;
- `config/` : navigation (go_router) et thème ;
- `screens/` et `widgets/` : interface utilisateur.

## Stack technique

| Couche | Technologies |
| --- | --- |
| Mobile | Flutter, Dart |
| Gestion d'état | Riverpod, Equatable |
| Données | SQLite (sqflite) |
| Navigation & UI | go_router, FlexColorScheme, Google Fonts |

## Lancer le projet

```bash
git clone https://github.com/Nguirane120/forceN_certification_app.git
cd forceN_certification_app
flutter pub get
flutter run
```

## Auteur

**Alioune Badara Nguirane** — Développeur Full Stack Web & Mobile
[GitHub](https://github.com/Nguirane120) · [LinkedIn](https://www.linkedin.com/in/alioune-badara-nguirane-711820197/)
