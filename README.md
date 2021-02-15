# WS2019-packer-terraform-vsphere7
Template of WS2019 via Packer/Autounattend.xml to vSphere 7, then deployment via Terraform. French explanations are under the English ones.
#

## Introduction (English)
Set of scripts used to:

▶️ Create a template of Windows Server 2019, adding an autounattend.xml file for an automatic installation (*in French/Belgium*) ;

▶️ Once the VM has started, the vmtools.bat script launches and installs the vmware-tools as well as activates WinRM for Packer, then the VM shuts down ;

▶️ Via Terraform and the *terraform apply -var 'nombre=X'* command, creation of X virtual machines ;


⚠️ There is no Sysprep performed! You are free to attach a simple script to do so.

## Installation (English)

Simply clone the repository, then edit:

📌 The winserv2019.json script, where you have to replace the credentials and other informations to fix your infrastructure ;

📌 The Autounattend.xml file, where you have to change the language, and maybe the partitionning system if you want to ;

📌 The vmtools.bat, if you want to perform a Sysprep (*or if you want to attach other scripts*) ;

Then, just use the commands *packer build winserv2019.json* and then *terraform apply -var 'nombre=X'* to create the template/deploy the VMs.


I know this script set isn't perfect, but there is very few guides/docs that work with this builder, so I hope it helps you out anyway!



## Introduction (français)
Ensemble de scripts utilisés pour:

▶️ Créez un modèle de Windows Server 2019, en ajoutant un fichier autounattend.xml pour une installation automatique (*en français / Belgique*);

▶️ Une fois la VM démarrée, le script vmtools.bat est lancé, pour installer les vmware-tools ainsi que pour activer WinRM for Packer, puis la VM s'arrête;

▶️ Via Terraform et la commande *terraform apply -var 'nombre=X'*, création de X machines virtuelles;


⚠️ Il n'y a pas de Sysprep effectué! Vous êtes libre de joindre un script pour le faire si vous le désirez.

## Installation (français)

Clonez simplement le repo', puis modifiez:

📌 Le script winserv2019.json, où vous devez remplacer les credentials et autres informations à adapter pour votre infrastructure;

📌 Le fichier Autounattend.xml, où vous devez changer la langue, et peut-être le système de partitionnement si vous le souhaitez;

📌 Le vmtools.bat, si vous souhaitez effectuer un Sysprep (*ou si vous souhaitez attacher d'autres scripts*);

Ensuite, utilisez simplement les commandes *packer build winserv2019.json* puis *terraform apply -var 'number=X'* pour créer le modèle / déployer les VM.
#

Je sais que cet ensemble de scripts n'est pas parfait, mais il n'y avait pas beaucoup de guides/documentations qui fonctionnent avec ce builder, alors j'espère que cela vous aidera quand même!
#

Pour plus d'informations, voici l'article de mon blog qui en lien: https://notamax.be
