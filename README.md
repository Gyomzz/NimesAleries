# NimesAleries
L’objectif principal du projet est de pouvoir proposer une plateforme fonctionnelle mettant en évidence les compétences acquises lors de ma formation sur les technologies suivantes : 
(Html/CSS , Javascript, PHP, Angular, Symfony, Wordpress)

Page accueil

La page d’accueil reprendra les grands classiques du ecom :
- Un header avec les catégories du site
- Une bannière ou un carrousel de bannières 
- Un texte sur l’entreprise
- Une section avec les produits phares
- Une section de réassurance client (témoignages, logos type livraison 24h, paiement 
sécurisé, remboursement 30jours)


Page produit

La page reprendra le minimum :
- Titre du produit
- Description du produit
- Prix du produit
- Photos du produit

Vue « Gérer mon compte »

La vue « Gérer mon compte » permet à un client connecté de modifier ses informations 
personnelles :
- Genre
- Nom
- Prénom
- Adresse mail
- Mot de passe
- Date de naissance
- Adresse complète

Page dashboard

L’application de dashboard aura sur sa vue principale l’affichage d’informations et de 
graphiques important, toutes les informations seront récupérées par rapport à une plage de 
dates sélectionnées :
- Montant Total des ventes
- Nb de commandes
- Nb de paniers
- Valeur d’un panier moyen
- Nb de nouveaux clients
- % de récurrence de commandes clients (un client déjà inscrit à re-commander, rapport 
entre le nb de commandes avec nouveaux clients sur la plage sélectionnée et le nb de 
commandes avec clients existants)
- % de paniers abandonnées (% de paniers qui n’ont pas été convertis en commandes)
- Nb de visites
- % de conversion paniers (% entre le nb de visites et le nombre de paniers créés)
- % de conversion commandes (% entre le nb de paniers et le nombre de commandes 
créées)
- Total de produits vendus triés par ordre décroissant (Le produit le plus vendu sera en 
tête de liste, afficher le nombre d’unités vendues pour chaque produit)

CONCEPTUALISATION BASE DE DONNEES

Un client devra fournir au moins :
- Genre
- Nom
- Prénom
- Adresse mail
- Mot de passe
- Date de naissance
- Adresse complète
Une catégorie sera composée d’au moins :
- Un nom
- Si elle est parente ou si elle appartient à une sous-catégorie (sélection d’une catégorie 
parente)
Pour un produit, il est possible d'ajouter : 
- Des photos
- Une marque
- Un titre
- Une description
- Un prix HT & TTC
- Une quantité
- La/les catégories auxquelles il appartient
- S’il est actif ou non
Enfin, pour une commande :
- Le client associé (vous afficherez sur la commande un récap du client, j’aime savoir à 
qui j’ai à faire (email, nb de commandes passées, date d’inscription, total dépensé sur 
mon site)
- Le/Les produits (nom, prix TTC, quantité, total TTC)
- Le total de la commande
- L’état de la commande changeable (acceptée, en cours de préparation, expédiée, 
remboursée
