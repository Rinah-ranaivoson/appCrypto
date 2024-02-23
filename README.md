# crypto_app

Ce dépôt contient le code source d'une application de démonstration pour illustrer le chiffrement et le déchiffrement de messages à l'aide de l'algorithme RSA dans le cadre d'un projet de groupe du cours UST-IO L2.

## Prérequis

Avant de commencer, assurez-vous d'avoir installé les éléments suivants :
- [Flutter](https://flutter.dev/docs/get-started/install) : Framework de développement d'applications mobiles multiplateformes.
- [Dart SDK](https://dart.dev/get-dart) : Langage de programmation utilisé pour le développement d'applications Flutter.
- [Encrypto Flutter Package](https://pub.dev/packages/encrypto_flutter) : Package Flutter utilisé pour le chiffrement et le déchiffrement des messages.

## Installation

1. Clonez ce dépôt sur votre machine locale :
   ```bash
   git clone https://github.com/Rinah-ranaivoson/appCrypto.git
   ```

2. Naviguez vers le répertoire du projet :

3. Exécutez l'application sur un émulateur ou un appareil connecté :
   ```bash
   flutter run
   ```

## Utilisation

1. Lorsque l'application démarre, vous verrez trois champs de texte :
   - Le premier champ de texte est réservé pour le texte du "ZotPublicKey" stérilisé. Ce texte est nécessaire pour la génération de la clé publique utilisée dans le chiffrement RSA. Veuillez coller le texte stérilisé dans ce champ.
   - Le deuxième champ de texte est réservé pour le message que vous souhaitez chiffrer.
   - Le troisième champ de texte affiche le message chiffré.

2. Après avoir saisi le "ZotPublicKey" stérilisé et un message à chiffrer, appuyez sur le bouton "Encrypt and Decrypt" pour chiffrer le message et afficher le message chiffré.

3. Pour réinitialiser les champs de texte, appuyez sur le bouton "Reset All Fields".

## Fonctionnalités

- **Chiffrement et déchiffrement** : Cette application permet de chiffrer un message à l'aide de la clé publique RSA fournie et de déchiffrer le message chiffré.

- **Copie dans le presse-papiers** : Le message chiffré peut être copié dans le presse-papiers en appuyant sur l'icône de copie.
