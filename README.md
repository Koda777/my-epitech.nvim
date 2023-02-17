# Générateur de fichiers d'en-tête Epitech
Cet outil permet de générer facilement des fichiers d'en-tête formatés selon les normes d'Epitech.

## Prérequis
Neovim (ou Vim)
Lua

## Installation
- Clonez ce dépôt : git clone https://github.com/votre-nom/generateur-headers-epitech.git
- Copiez le fichier generer_header.lua dans votre dossier ~/.config/nvim/
- Ajoutez la ligne suivante à votre fichier de configuration Neovim (généralement init.vim) : nnoremap <leader>h :lua require('generer_header')()<CR>

## Utilisation
- Ouvrez le fichier pour lequel vous voulez générer un en-tête dans Neovim.
- Appuyez sur <leader>h pour générer l'en-tête.
- Suivez les instructions à l'écran pour renseigner les informations nécessaires (nom du projet, description, etc.).
- Le fichier d'en-tête sera automatiquement inséré en haut du fichier courant.

## Exemple
Voici un exemple de ce à quoi ressemblera le fichier d'en-tête généré :

```c
/*
** EPITECH PROJECT, 2023
** My Project
** File description:
** The file description goes here.
*/

#ifndef MY_PROJECT_H_
#define MY_PROJECT_H_

#endif /* !MY_PROJECT_H_ */
```
## Crédits
Cet outil a été développé par Koda. N'hésitez pas à contribuer en signalant des problèmes ou en proposant des améliorations.
