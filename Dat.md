# **BRIEF 7 - Automatisation de l'Application**

## **Contexte du projet**

L'objectif principal de ce projet est de mettre en place une pipeline d'intégration et de déploiement continu (CI/CD) pour déployer automatiquement les mises à jour d'une application de vote. Chaque nouvelle version de l'application devra remplacer l'ancienne et être déployée automatiquement toutes les heures.

## **Besoins fonctionnels**

L'application de vote, déployée sur un cluster AKS (Azure Kubernetes Service), permet à l'utilisateur de voter entre Windows et Linux, ou de réinitialiser le compteur. L'infrastructure et l'automatisation sont mises en place grâce à divers outils, notamment Terraform pour provisionner une machine virtuelle (VM) Jenkins.



## **Représentation technique**

* **Déploiement**:

**1. Création de la machine virtuelle (VM) :**
- Développement d'un script Terraform pour créer et configurer une machine virtuelle.

**2. Installation de Jenkins et Java :**
- Installation des outils nécessaires, dont Jenkins pour gérer les pipelines CI/CD.

**3. Création du cluster AKS :**
- Configuration du cluster Kubernetes pour héberger et gérer l'application.


## **Outils utilisés**

*Azure :* Plateforme cloud pour héberger les ressources (AKS, VM).
*Git :* Gestion des versions du code source.
*Terraform :* Provisionnement de l’infrastructure en tant que code.
*Jenkins :* Automatisation des pipelines CI/CD.
*Docker :* Conteneurisation de l'application.

## **Outils installés sur la machine virtuelle Jenkins :**
- **kubectl :** Outil CLI pour interagir avec Kubernetes.
- **git :** Gestionnaire de versions pour cloner les dépôts.
- **jq :** Outil pour manipuler des données JSON.
- **Azure CLI :** Interface en ligne de commande pour gérer les ressources Azure.

## **Configuration d'accès au cluster AKS :**
Pour accéder au cluster AKS, on utilise la commande suivante :

```bash
az aks get-credentials --name AKSCluster --resource-group Brief7-RC

```

## **Récupération du mot de passe initial Jenkins :**
Pour déverrouiller Jenkins après l'installation :

```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```
       
![](https://i.imgur.com/RtSI7G7.png)

Une fois connecté, les plugins suivants ont été installés :

* Pipeline : Création de pipelines CI/CD.
* Kubernetes CLI : Interaction avec Kubernetes via Jenkins.
* Workspace Cleanup : Nettoyage automatique de l’espace de travail après exécution.
  
## **Pipeline Jenkins**

Le pipeline Jenkins est configuré pour effectuer les tâches suivantes :

- Cloner le dépôt de l’application de vote.
- Extraire la dernière version de l’image Docker de l’application.
- Mettre à jour et appliquer les fichiers de configuration Kubernetes (manifests).

Voici le script du pipeline :

```groovy

pipeline {
    agent any 
    stages {
        stage('Stage 1') {
            steps {
                withKubeConfig([credentialsId: 'aks']) {
                    sh('''
                    git clone https://github.com/simplon-choukriraja/brief7-votinapp.git app
                    TAG=\044(curl -sSf https://registry.hub.docker.com/v2/repositories/simplonasa/azure_voting_app/tags |jq '."results"[0]["name"]'| tr -d '"')
                    sed -i "s/TAG/\044{TAG}/" ./app/vote.yml
                    kubectl apply -f ./app
                    ''')
                }
            }
        }
    }
    post {
        always {
            // Nettoyage de l'espace de travail Jenkins
            step([$class: 'WsCleanup'])
        }
    }
}

```

## **Configuration des mises à jour automatiques :**
Pour que les mises à jour soient effectuées toutes les heures :

Allez dans Build Triggers dans Jenkins.
Sélectionnez Construire périodiquement et configurez l’intervalle :
H * * * * (toutes les heures).


## **Représentation fonctionnelle**

* *Image Docker*

L’image utilisée pour l’application de vote est disponible ici :
https://hub.docker.com/r/simplonasa/azure_voting_app

Cette image contient l’application permettant de voter entre Windows et Linux. Elle est configurée pour être mise à jour automatiquement avec une nouvelle version toutes les heures.

Sécurité de la machine virtuelle Jenkins
La VM Jenkins est sécurisée avec deux règles :

* **Port SSH (22) :** Pour accéder au serveur.
* **Port HTTP (8080) :** Pour accéder à l’interface Jenkins.

## **Topologie**

![](https://i.imgur.com/5VNPS8M.png)


