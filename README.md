## 1 Conformité d'un document médical
Ce document expose l’organisation et le contenu de testContenuCDA du Cadre d’interopérabilité des systèmes d’information de santé (CI-SIS).
## 2 Conformité d'un document médical

Tout document médical au format CDA R2 doit être conforme :

- **au standard CDA R2 utilisé pour les documents médicaux** (schéma xml _CDA\_extended.xsd)_ **.**
- **aux spécifications internationales IHE de l'en-tête,**
- **aux spécifications françaises de l'en-tête** (Volet Structuration minimale des documents de santé) **,**
- **aux spécifications internationales IHE du corps (sections, entrées et jeux de valeurs),**
- **aux spécifications françaises du corps (sections, entrées et jeux de valeurs IHE)** (Volet Modèles de contenus CDA) **,**
- **aux spécifications françaises du corps (sections et entrées créées par l'ANS pour les volets français)** (Volet Modèles de contenus CDA) **,**
- **aux spécifications d'un document (en-tête et corps)** (Volet du document)

Le répertoire **testContenuCDA** contient un outil permettant de vérifier la conformité d'un document médical au format CDA R2.

## 3 Contenu du répertoire testContenuCDA

## 3.1 Arborescence générale du répertoire



**IMPORTANT :**  **Une utilisation correcte des exemples CDA suppose la préservation impérative de cette arborescence – structure et noms des fichiers.**

## 3. 2 Répertoire racine testContenuCDA

Ce répertoire contient :

- Les **exemples de documents CDA** conformes aux modèles spécifiés dans les volets de contenus publiés dans le CI-SIS.
- La feuille de style par défaut _ **cda\_asip.xsl** _ et ses fichiers annexes _ **headers.xsl** _, _ **style.xsl** _, _ **utility.xsl** _ et _ **cda.css** _.
- Le présent document « 00 CI-SIS\_TEST-CDA-LISEZ-MOI\_vX.XX.docx ».
- Les sous-répertoires suivants :


### 3.2. 1Les exemples de documents CDA

**Les exemples**** de documents CDA** conformes aux modèles spécifiés dans les volets de contenu publiés dans le CI-SIS sont visualisables dans un navigateur web, soit à l'aide de la feuille de style par défaut _cda\_asip.xsl_, soit avec leur propre feuille de style pour les exemples auto-présentables.

**INFORMATION UTILE :** Un éditeur qui souhaite tester ses propres exemples de documents peut le faire en les copiant dans le répertoire racine testContenuCDA.

La version actuelle de testContenuCDA contient les exemples suivants :

| **Document** | **Contenu** |
| --- | --- |
| ANEST-CR-ANEST\_2021.01.xml | Anesthésie-Réanimation - CR de consultation pré-anesthésique |
| --- | --- |
| ANEST-CR-CPA\_2021.01.xml | Anesthésie-Réanimation - CR d'anesthésie |
| AVC-AUNV\_2.2.xml | AVC - Admission en Unité Neuro-Vasculaire |
| AVC-EUNV\_2.2.xml | AVC - Épisode de soins en Unité Neuro-Vasculaire |
| AVC-PAVC\_2.2.xml | AVC - CR de consultation d'évaluation pluri-professionnelle Post-AVC |
| AVC-SUNV\_2.2.xml | AVC - Sortie de l'Unité Neuro-Vasculaire |
| CANCER-CR-GM\_2021.01\_AnalyseNonRealisee.xml | CANCER - CR de génétique moléculaire avec analyse non réalisée |
| CANCER-CR-GM\_2021.01\_AnalyseRealisee.xml | CANCER - CR de génétique moléculaire avec analyse réalisée |
| CANCER-D2LM-FIDD\_2021.01.xml | CANCER - Dématérialisation de la seconde lecture de la mammographie (Fiche d'Interprétation de Diagnostic Différé) |
| CANCER-D2LM-FIN\_2021.01.xml | CANCER - Dématérialisation de la seconde lecture de la mammographie (Fiche d'Interprétation Nationale) |
| CANCER-FRCP\_2021.01\_Appareil.xml | CANCER - Fiche de concertation pluridisciplinaire de cancérologie – RCP Appareil |
| CANCER-FRCP\_2021.01\_Transversale.xml | CANCER - Fiche de concertation pluridisciplinaire de cancérologie – RCP Transversale |
| CANCER-PPS\_2021.01\_Autopresentable.xml | CANCER - PPS en cancérologie – Auto-présentable |
| CNAM-HR\_2020.01\_sans-info.xml | Historique de remboursements (sans données de remboursement) |
| CNAM-HR\_2020.01.xml | Historique de remboursements |
| CR-BIO\_2021.01\_Auto-Presentable.xml | CR d'analyses biologiques médicales (document auto-présentable) |
| CR-BIO\_2021.01\_Auto-Presentable\_avec-image.xml | CR d'analyses biologiques médicales (document auto-présentable) avec image et PDF |
| CR-BIO\_2021.01\_CDA-R2-Niveau-1.xml | CR d'analyses biologiques médicales au format CDA R2 niveau 1 (non structuré) |
| CR-BIO\_2021.01\_Electrophorese.xml | CR d'analyses biologiques médicales (biologie générale) |
| CR-BIO\_2021.01\_Microbiologie\_V1.xmlCR-BIO\_2021.01\_Microbiologie\_V2.xml | CR d'analyses biologiques médicales (microbiologie V1 et V2 qui remplace V1) |
| CR-BIO\_2021.01\_PDF.xml | CR d'analyses biologiques médicales (avec une section au format PDF) |
| CSE-CS8\_2021.01.xml | Certificat de santé de l'enfant au 8ème jour |
| CSE-CS9\_2021.01.xml | Certificat de santé de l'enfant au 9ème mois |
| CSE-CS24\_2021.01.xml | Certificat de santé de l'enfant au 24ème mois |
| DLU-DLU\_2021.01.xml | Document de liaison d'urgence |
| DLU-FLUDR\_2021.01.xml | Fiche de liaison d'urgence / document de retour du service des urgences vers l'EHPAD |
| DLU-FLUDT\_2021.01.xml | Fiche de liaison d'urgence / document de transfert de l'EHPAD vers le service des urgences |
| F-PRC-AVK\_1.4.xml | Fiche cardio de patient sous AVK |
| F-PRC-DCI\_1.4.xml | Fiche cardio de porteur de défibrillateur cardiaque |
| F-PRC-PPV\_1.4.xml | Fiche cardio de porteur de prothèse valvulaire |
| F-PRC-PSC\_1.4.xml | Fiche cardio de porteur de stimulateur cardiaque |
| F-PRC-TAP\_1.4.xml | Fiche cardio stent et traitement antiaggrégant plaquettaire |
| LDL-EES\_2020.01.xml | Lettre de liaison à l'entrée en établissement de santé |
| LDL-SES\_2020.01.xml | Lettre de liaison à la sortie de l'établissement de santé |
| OBP-SAP\_2021.01.xml | Obstétrique et Périnatalité - Synthèse antepartum |
| OBP-SCE\_2021.01.xml | Obstétrique et Périnatalité - Synthèse Suites de Couches Enfant |
| OBP-SCM\_2021.01.xml | Obstétrique et Périnatalité - Synthèse Suites de Couches Mère |
| OBP-SNE\_2020101.xml | Obstétrique et Périnatalité - Synthèse Salle de Naissance Enfant |
| OBP-SNM\_2021.01.xml | Obstétrique et Périnatalité - Synthèse Salle de Naissance Mère |
| OPH-BRE\_2021.01.xml | Ophtalmologie – Bilan de réfraction |
| OPH-CR-RTN\_2021.01.xml | Ophtalmologie – CR de rétinographie |
| PPS-PAERPA\_1.2.xml | Plan Personnalisé de Santé – PAERPA |
| PPS-PAERPA\_2021.01.xml | Plan Personnalisé de Santé – PAERPA |
| SDM-MR\_2021.01.xml | Set de Données Minimum – Maladie Rare |
| TLM-CR\_2021.01.xml | Compte Rendu d'acte de télémédecine |
| TLM-DA\_2021.01\_TCG.xml | Demande d'acte de télémédecine – télé-consultation |
| TLM-DA\_2021.01\_TCG\_anamnèse-non-structurée.xml | Demande d'acte de télémédecine – télé-consultation (section anamnèse non structurée) |
| TLM-DA\_2021.01\_TE1\_anamnèse-non-structurée.xml | Demande d'acte de télémédecine – télé-expertise (section anamnèse non structurée) |
| VAC\_2021.01.xml | Historique des vaccinations |
| VAC-NOTE\_2021.01.xml | Note de vaccination |
| VSM\_1.4.xml | Volet de synthèse médicale |

Dans le tableau ci-dessus :

- Les exemples de documents **surlignés en gris** sont ceux dont le volet correspondant est publié pour « **concertation** » dans l'[espace de publication du CI-SIS](https://esante.gouv.fr/interoperabilite/ci-sis/espace-publication). Ils ne sont donc pas encore définitivement stables pour une mise en œuvre dans les logiciels mais ils peuvent être consultés pour participer à la concertation. Si vous avez des commentaires, sur ces documents et les volets correspondants, n'hésitez pas à les envoyer par messagerie électronique à l'adresse [ci-sis@esante.gouv.fr](mailto:ci-sis@esante.gouv.fr) à l'aide du formulaire de recueil de commentaires.
- Les exemples de documents en vert sont ceux correspondant à une nouvelle version de l'exemple (par rapport à la version précédente de testContenuCDA).

### 3.2.2 Répertoire infrastructure

![](RackMultipart20220115-4-1qp1a5_html_62f7eb0afa4a8d47.png)

#### 3.2.2.1 Répertoire infrastructure\cda

Ce répertoire contient :

- Le schéma xml _ **CDA.xsd** _ qui vérifie la conformité de tout exemple de document au standard CDA release 2. Ce schéma fait partie de l'édition normative CDA release 2, de 2005.
- Le schéma xml _ **CDA\_extended.xsd** _ qui inclue en plus du _ **CDA.xsd** _ une extension pour les documents de biologie. Ce schéma est celui utilisé pour les documents CDA produits par l'ANS.
- Le schéma xml _ **CDA\_SDTC.xsd** _ qui inclue en plus du _ **CDA.xsd** _, une extension SDTC. Utilisé pour SDM-MR.

#### 3.2.2.2 Répertoire infrastructure\infoButton

Ce répertoire contient les schémas xml qui vérifient la conformité des messages au standard infoButton.

### 3.2.3 Répertoire jeuxDeValeurs

![](RackMultipart20220115-4-1qp1a5_html_78877e7d3c5f84cf.png)

etc…

Ce répertoire contient les jeux de valeurs exploités par les Volets de contenus du CI-SIS, mis au format d'une réponse à une requête de jeu de valeurs selon le profil SVS. Un jeu de valeur est un document xml dont l'élément racine est du type complexe _RetrieveValueSetResponseType_ défini dans le schéma _SVS.xsd_.

### 3.2.4 Répertoire processable

![](RackMultipart20220115-4-1qp1a5_html_3233249e4619a7f1.png)

#### 3.2.4.1 Répertoire processable\coreschemas

Ce répertoire contient les sous-schémas xml appelés par _CDA\_extended.xsd_. Ces sous-schémas font partie de l'édition normative CDA release 2 de 2005.

#### 3.2.4.2Répertoire processable\extensions

Ce répertoire contient le sous-schéma xml _ihelab.xsd_ appelés par _CDA\_extended.xsd_. Ce sous-schéma est une extension utilisée pour le profil XD-LAB du domaine IHE LAB.

### 3.2.5 Répertoire schematrons

![](RackMultipart20220115-4-1qp1a5_html_a2cbce008dcf096e.png)

Ce répertoire contient :

- Les schématrons de vérification de conformité aux modèles de documents CDA du CI-SIS. Chaque schématron est présent sous sa forme source _ **unSchematron.sch** _ et sous sa forme compilée en xslt2 _ **unSchematron.xsl** _.
- Des répertoires contenant des sous-schématrons appelés par les schématrons des documents.

Les schématrons contenus dans ce répertoire et ses sous-répertoires sont conformes à la norme ISO IEC 19757-3, référencée depuis [http://www.schematron.com/](http://www.schematron.com/) et disponible en accès libre
# 1
.

#### 3.2.5.1 Répertoire schematrons/abstract

![](RackMultipart20220115-4-1qp1a5_html_85cb481541015137.png)

Ce répertoire contient des sous-schématrons contenant des _abstract patterns_, exploitables par d'autres patterns depuis n'importe quel schématron.

#### 3.2.5.2 Répertoire schematrons/include

![](RackMultipart20220115-4-1qp1a5_html_274fc5197ca0289e.png)

Ces sous-répertoires contiennent l'ensemble des autres sous-schématrons classés dans les sous-répertoires présentés ci-dessus.

##### 3.2.5.2.1 Répertoire schematrons/include/en-tete

Ce sous-répertoire contient les schématrons internationaux et français des éléments de l'en-tête

![](RackMultipart20220115-4-1qp1a5_html_512de16819c4bae8.png)

etc…

##### 3.2.5.2.2 Répertoire schematrons/include/entrées

Ce sous-répertoire contient les schématrons internationaux et français des entrées

![](RackMultipart20220115-4-1qp1a5_html_9ab08d9da42e61d0.png)

_etc…_

##### 3.2.5.2.3 Répertoire schematrons/include/jeuxDeValeurs

Ce sous-répertoire contient les schématrons de jeux de valeurs **génériques** et des sous-répertoires par modèle de document contenant les schématrons de jeux de valeurs spécifiques à ce modèle.

- **Des schématrons de JDV génériques** (JDV utilisés dans plusieurs documents, sections ou entrées)

![](RackMultipart20220115-4-1qp1a5_html_eb8fdaba97968d1d.png)

- **Un sous-répertoire pour l'en-tête** contenant les schématrons des jeux de valeurs spécifiques à l'en-tête et **un sous-répertoire par volet métier** (ex FRCP) contenant les schématrons des jeux de valeurs spécifiques à ce volet

![](RackMultipart20220115-4-1qp1a5_html_c3f9dd229daf456a.png)

_etc…_

##### 3.2.5.2.4 Répertoire schematrons/include/sections

Ce sous-répertoire contient les schématrons internationaux et français des sections

![](RackMultipart20220115-4-1qp1a5_html_9d2c23092d32301.png)

_etc…_

##### 3.2.5.2.5 Répertoire schematrons/include/specificationsVolets

Ce sous-répertoire contient **un sous-répertoire par volet métier** (ex FRCP) contenant les schématrons d'en-tête, corps, sections ou entrées spécifiques à ce volet.

![](RackMultipart20220115-4-1qp1a5_html_ccb74e46a7c0c37d.png)

_etc…_

#### 3.2.5.3 Répertoire schematrons/moteur

Ce répertoire contient les éléments permettant d'effectuer les contrôles de conformité des documents CDA.

##### 3.2.5.3.1 Le script de lancement compilverif.bat

Le fichier _ **compilverif.bat** _ est un script de lancement des deux moteurs de vérification de la conformité (conformité d'un document au schéma CDA\_extended.xsd + conformité aux schématrons) pour l'environnement Windows et qui comporte :

- **Un premier paramètre d'appel obligatoire** qui est le **nom du document CDA à vérifier**. Le document à vérifier doit se trouver dans le répertoire _testContenuCDA_.
- **Un second paramètre d'appel optionnel** qui est le **nom du schématron à utiliser** pour la vérification. Le schématron doit être présent dans le répertoire _schematrons_.

Si ce second paramètre n'est pas indiqué, la vérification réalisée est la conformité au volet _Structuration Minimale de Documents Médicaux._

##### 3.2.5.3.2 L'outil GUI

GUI (Graphical User Interface) est un utilitaire développé par l'ANS qui encapsule le script de lancement _ **compilverif.bat** _ dans une interface graphique utilisateur.

**Pour utiliser l'outil GUI, voir §4Procédure pour vérifier un document CDA.**

##### 3.2.5.3.3 Moteur de vérification de la conformité d'un document au schéma CDA\_extended.xsd

Le moteur de vérification de la conformité d'un document au schéma CDA\_extended.xsdest le moteur **xsdvalidator-1.2.jar.**

Ce moteur est open source, libre de droits et écrit en Java et exécutable sous tout OS supportant l'environnement Java.

##### 3.2.5.3.4 Moteur de vérification de la conformité d'un document aux schématrons

Le moteur utilisé pour la vérification de la conformité d'un document aux schématrons est le moteur _ **saxon9he.jar.** _ Ce moteur SAXON version 9.3 de l'édition HE ('home edition') est téléchargeable gratuitement depuis le site de SAXONICA : [http://www.saxonica.com/welcome/welcome.xml](http://www.saxonica.com/welcome/welcome.xml). Il est livré sans aucune modification et il est utilisable sous les termes de la licence Saxon-HE disponibles sur la page [http://www.saxonica.com/license/license.xml](http://www.saxonica.com/license/license.xml) et qui renvoient à la licence générique MPL 1.0 détaillée sur la page [http://www.mozilla.org/MPL/MPL-1.0.html](http://www.mozilla.org/MPL/MPL-1.0.html).

Ce moteur, écrit en Java, est exécutable sur tout OS supportant l'environnement Java, indépendamment du système d'exploitation sous-jacent.

##### 3.2.5.3.5 Les feuilles de transformation xslt2

Ces feuilles de transformation xslt2, listées ci-après, servent à compiler les schématrons sous la forme xslt2, suivant l'implémentation de la norme ISO IEC 19757-3 (pour plus d'information voir [http ://schematron.com/](http://schematron.com/)) :

- _ **iso\_dsdl\_include.xsl** _ ** ** : intégration des sous-schématrons ;
- _ **iso\_abstract\_expand.xsl** _ ** ** : expansion des abstract patterns ;
- _ **iso\_svrl\_for\_xslt2.xsl** _ ** ** : transformation du .sch en .xsl. Cette feuille de style a été modifiée par l'ANS, pour adapter les rapports de vérification de conformité au format SVRL ;
- _ **iso\_schematron\_skeleton\_for\_saxon.xsl** _ ** ** : squelette de transformation appelé par la feuille précédente.

Elles sont utilisées par le moteur SAXON.

### 3.2.6 Répertoire schematrons/profils

Ce sous-répertoire contient les schématrons par profil (format source **.sch** et compilée en xslt2 **.xsl** ).

![](RackMultipart20220115-4-1qp1a5_html_8ad9f745255a5365.png)

- IHE\_XDS-SD.sch spécifications IHE (en-tête)
- CI-SIS\_StructurationMinimale.sch spécifications françaises (en-tête)
- IHE.sch spécifications IHE (corps)
- CI-SIS\_ModelesDeContenusCDA.sch spécifications françaises (corps : sections, entrées, JDV IHE)
- CI-SIS\_Modeles\_ANS spécifications françaises (corps : sections, entrées, JDV ANS)
- terminologies\schematron\terminologie.sch terminologies

### 3.2.7 Répertoire schematrons/rapports

Ce répertoire contient les rapports de vérification de la conformité des documents.

La vérificationdu document _ **Exemple.xml** _ produit le rapport :

| Nom du rapport | Type de rapport |
| --- | --- |
| _Exemple\_validCDA.xml_ | Rapport de conformité des documents par rapport au **schéma** _ **CDA\_extended.xsd** _ |
| _Exemple\_verif.xml_ | Rapport de conformité du document aux **spécifications du volet**  **du document** |
| _Exemple\_verif\_IHE\_corps.xml_ | Rapport de conformité du document aux **spécifications IHE (corps)** |
| _Exemple\_verif\_IHE\_entete.xml_ | Rapport de conformité du document aux **spécifications**** IHE (en-tête)** |
| _Exemple\_verif\_ModelesDeContenusCDA.xml_ | Rapport de conformité du document aux **spécifications françaises (corps – sections, entrées, jeux de valeurs)**  **des sections de IHE** |
| _Exemple\_verif\_Modeles\_ANS.xml_ | Rapport de conformité du document aux **spécifications françaises (corps – sections, entrées, jeux de valeurs)**  **des sections et entrée de l'ANS** |
| _Exemple\_verif\_StructurationMinimale.xml_ | Rapport de conformité du document aux **spécifications françaises (en-tête)** |
| _Exemple\_verif\_terminologies.xml_ | Rapport de conformité des codes utilisés aux **terminologies** |

Les rapports de vérification de la conformité des documents aux schématrons sont au format SVRL (Schematron Validation Report Language) partie intégrante de la norme ISO IEC 19757-3.

## 4 Procédure pour vérifier un document CDA

**ÉTAPE 1 : Préparer son environnement de vérification**

- Extraire le zip _ **testContenuCDA.zip** _ sur _votre bureau_.

**ÉTAPE 2 : Se positionner sur le bon répertoire pour lancer la vérification**

- Aller sur _ **testContenuCDA\_V2\schematrons\moteur\gui** _

**ÉTAPE 3 : Lancer la vérification**

- Lancer l'utilitaire _ **TCC-GUI.exe** _

## 4.1 Sélection du fichier CDA à tester et du schématron correspondant

Pour sélectionner le fichier CDA à vérifier, cliquez sur la première icône ![](RackMultipart20220115-4-1qp1a5_html_8fd7f40249b8e879.png).

Pour sélectionner le schématron à utiliser, cliquez sur la seconde icone ![](RackMultipart20220115-4-1qp1a5_html_8fd7f40249b8e879.png).

_Si vous ne sélectionnez aucun schématron, seule la conformité du fichier CDA au Volet Structuration minimale des documents de santé sera vérifiée._

![](RackMultipart20220115-4-1qp1a5_html_8456a75ad3f72b18.png)

**Figure 2 : Sélection du fichier à tester**

## 4.2 Lancement de la procédure de vérification de conformité du fichier CDA

Pour lancer la vérification de la conformité du fichier CDA et la création des rapports de conformité, cliquez sur le bouton « Création des rapports ».

![](RackMultipart20220115-4-1qp1a5_html_8456a75ad3f72b18.png)

**Figure 3 : Lancement de la vérification**

Une fenêtre DOS s'ouvre et affiche les logs de l'exécution du contrôle de conformité.

Il s'agit d'une fenêtre modale qui interdit l'accès à l'outil TCC-GUI durant toute son exécution.

![](RackMultipart20220115-4-1qp1a5_html_3cdf07dbc7f9aa51.png)

**Figure 4 : Ligne de commande lancée**

Une fois le traitement terminé, la fenêtre DOS se ferme.

Les rapports de conformité ont été créés.

## 4.3 Visualisation des rapports de conformité

La liste des rapports produits s'affiche sur la partie gauche de la fenêtre suivante :

![](RackMultipart20220115-4-1qp1a5_html_4218461168204ae7.png)

**Figure 5 : Control des résultats**

En cliquant sur le nom d'un rapport, on affiche le détail du rapport sur l'écran de visualisation situé à droite de la fenêtre.

_ **Exemple 1 : rapport sans erreur.** _

![](RackMultipart20220115-4-1qp1a5_html_48b18f3de72f7408.png)

**Figure 6 : Exemple sans erreurs**

_ **Exemple 2 : Rapport faisant état d'une non-conformité au schéma CDA :** _

![](RackMultipart20220115-4-1qp1a5_html_e055eeb523ff51ed.png)

**Figure 7 : Exemple non conforme au schéma**

_ **Exemple 3 : Rapport faisant état d'erreurs :** _

![](RackMultipart20220115-4-1qp1a5_html_736c318215c6528b.png)

**Figure 8 : Exemple avec erreurs**

## 5 Convention de nommage

Afin de faciliter la gestion des schématrons, la convention de nommage des schématrons suivante a été définie :

_Type\_NomModèle\_Domaine.sch_

- _ **Type** _ **(obligatoire)** :

- **S**  : pour les schématrons de section,
- **E**  : pour les schématrons d'entrée,
- **JDV**  : pour les schématrons de jeu de valeurs.

- _ **NomModèle** _ **(obligatoire) :** Le nom du modèle correspond au nom de la section, de l'entrée ou du JDV qui doit être testé. Le nom suivra la logique de l'UpperCamelCase, qui signifie que la première lettre de chaque mot sera en majuscule.

Les extensions **\_ANS** des sections et des entrées permettent d'identifier celles créées par l'ANS.

Les noms des JDV contiennent une extension **\_CISIS**.

- _ **Domaine** _ **(sous condition) :**
  - **\_int**  : pour les contrôles aux spécifications internationales IHE ( **pour les entrées uniquement** car il n'y a pas de spécificités FR pour les sections)
  - **\_fr :** pour les contrôles aux spécifications françaises du CI-SIS ( **pour les entrées uniquement** car il n'y a pas de spécificités FR pour les sections)
  - **\_NomDuDocument**  : pour les contrôles spécifiques à un modèle de document du CI-SIS français. Les schématrons spécifiques à un document du CI-SIS français peuvent porter sur un élément de l'en-tête, une section ou une entrée. Dans ce cas, il n'y a pas d'extension \_fr ni \_int.

Exemples :

- Le fichier _S\_CodedCarePlan.sch_ est le schématron qui vérifie la **conformité aux**** spécifications IHE de la section** « Coded Care Plan ».

- Le fichier _S\_codedPhysicalExam\_CSE-CS24.sch_ est le schématron qui vérifie la conformité aux **spécifications** du modèle CSE-CS24 **de la section « ** _Coded Physical Exam »_.

- Le fichier _E\_concernEntry\_int.sch_ est le schématron qui vérifie la **conformité aux**** spécifications IHE de l'entrée** « Concern Entry ».

- Le fichier _E\_concernEntry\_fr.sch_ est le schématron qui vérifie la **conformité aux**** spécifications françaises de l'entrée** « Concern Entry ».

## 6 Historique des évolutions

| **Date de publication** | **Version** | **Modifications apportées** |
| --- | --- | --- |
| 28/06/11 |
 |
- Fourniture de la boite à outils schématrons de vérification de conformité
- Fourniture des premiers jeux de valeurs au format SVS
- Fourniture du schématron du volet « Structuration minimale des documents médicaux »
- Fourniture du schématron des modèles CS24 et CS9 du volet « Certificats de santé de l'enfant »
- Correction de tous les exemples de documents CDA pour mise en conformité
 |
| 03/08/11 |
 |
- Schématrons des modèles de documents CS8, CS9, CS24, CR-biologie
- Patterns d'entrées et de sections
- Mise à jour du script verif.bat de vérification de conformité des documents, pour ajouter la validation par rapport au schéma CDA.xsd
- Ajout du moteur de validation / CDA.xsd
- Correction des exemples de documents CDA r2 conformes au CI-SIS
- Complétude des contrôles du schématron CI-SIS\_StructurationCommuneCDAr2 et des schématrons dérivés
 |
| 08/09/11 |
 |
- Schématrons des documents CS8, CS9, CS24, PPV, DCI, AVK, PSC, TAP
- Patterns d'entrées et de sections correspondants
 |
| 19/12/11 |
 |
- Version définitive et approuvée du schématron Certificats de Santé de l'Enfant et des exemples CS8, CS9, CS24
- Ajout du contrôle de la valeur du code de confidentialité dans le schématron « Structuration commune ». Ajout du jeu de valeurs correspondant dans le répertoire jeuxDeValeurs
- Correction du code profession G15\_40 «Chirurgien-dentiste» dans le jeu de valeurs CI-SIS\_jdv\_authorSpecialty.xml
 |
| 04/01/12 |
 |
- Mise à jour du jeu de valeurs authorSpecialty : Ajout d'une spécialité pour les chirurgiens-dentistes (SCD01)
 |
| 29/03/12 |
 |
- Mise à jour du jeu de valeurs authorSpecialty : Ajout d'une spécialité pour les chirurgiens-dentistes (PAC00)
- Retrait provisoire des exemples RCP, CSE et fiches cardio en attendant la publication du CI-SIS 1.1 fin avril
- Exemple de CR-ACP amélioré : « CR-ACP\_cancer\_sein\_DCC.xml »
- Exemple de CR de biologie amélioré : « Electrophoresis.xml »
 |
| 25/04/12 |
 |
- Exemples CSE et fiches cardios mis à jour et inclus
- Nouveaux exemples : Directives anticipées, carnet de vaccination, CR de biologie auto-présentable
- Mises à jour de schématrons
 |
| 18/10/12 |
 |
- Tous les exemples mis à jour, en conformité avec le CI-SIS 1.3, notamment pour l'assouplissement des cardinalités des éléments \&lt;addr\&gt;, \&lt;telecom\&gt;, ainsi que pour la structuration de l'élément \&lt;addr\&gt;.
- Tous les schématrons mis à jour pour les mêmes raisons.
- xsdvalidator-1.2.jar et XSDValidator.java remplacent la version précédente de ce moteur de validation par rapport au schéma CDA.xsd : Correction de bug d'affichage de caractères accentués dans le rapport.
- Verif.bat et compilverif.bat mis à jour pour appeler la nouvelle version du moteur xsdvalidator et pour valider aussi bien les documents auto-présentables ou avec signature englobante que les autres documents.
- Mise à jour des jeux de valeurs CI-SIS\_jdv\_authorSpecialty.xml et CI-SIS\_jdv\_observationInterpretation.xml et CI-SIS\_jdv\_healthcareFacilityTypeCode
 |
| 22/10/12 |
 |
- Correction des exemples de carnet de vaccins, CSE, fiches cardio pour corriger l'OID de SNOMED 3.5 [1.2.250.1.213.2.11 -\&gt; 1.2.250.1.213.2.12]
 |
| 07/11/12 |
 |
- Amélioration des exemples de documents CDA auto-présentables : Déclaration du namespace CDA, pour rétro-compatibilité
- Une correction mineure de la feuille de style cda\_asip.xsl
 |
| 22/01/13 |
 |
- Ajout du schématron et de l'exemple « Fiche RCP» correspondant au nouveau volet «Fiche RCP».
- Correction d'erreurs résiduelles dans tous les exemples de contenus
 |
| 15/03/13 |
 |
- Amélioration des exemples CR de biologie, fiche RCP, et VSM
- Mise à jour du schématron du VSM.
 |
| 08/04/13 |
 |
- Ajout des schémas CDA\_extended.xsd et POCD\_MT000040\_ext\_ihelab.xsd dans le répertoire infrastructure/cda
- Ajout du schéma processable/extensions/ihelab.xsd
- Modification du script verif.bat pour valider les documents par rapport au schéma CDA\_extended.xsd
- Modification du schématron CI-SIS\_StructurationCommuneCDAr2.sch pour contrôler que l'extension serviceEvent/lab:statusCode n'est utilisée que dans les CR de biologie ou d'anatomo-cyto-pathologie.
- Création du sous-schématron include/serviceEventLabStatusCode20130408.sch à cet effet.
 |
| 08/03/17 | V1.3.3 |
- Correction de fichiers exemples
- Ajout des fichiers exemples :
- FRCP
- PPS
- Mise à jour du présent document
- Suppression du répertoire « Documents Annexes »
- Ajout de la procédure d'utilisation du script _compilverif.bat_
 |
| 04/04/17 | V1.3.4 |
- Intégration de la procédure de vérification des documents CDA dans le présent document
 |
| 19/04/17 | V1.3.5 |
- Mise à jour des volets de la LDL et du DLU pour publication finale
 |
| 07/06/17 | V1.3.6 |
- Mise à jour du volet SDM\_MR pour publication finale
 |
| 27/09/17 | V1.3.7 |
- Ajout du volet D2LM pour publication finale
 |
| 03/10/17 | V1.3.8 |
- Ajout des exemples :
- CR\_BIO\_PDF
- CR\_BIO\_Chikungunya\_AUTO-PRES
- Mise à jour des schématron de section BIOsectionN1Struct et BIOsectionN1Code et du schématron d'entrée BIOentry et ajout du templateId du CR non structuré
 |
| 07/11/17 | V1.3.9 |
- Mise à jour du volet Carnet de vaccination
 |
| 07/11/17 | V1.3.10 |
- Mise à jour du testContenuCDA en mettant à jour certains shématrons
 |
| 24/11/17 | V1.3.11 |
- Mise à jour du testContenuCDA en mettant à jour :

- Le volet LDL (exemples)
- Le volet CSE (exemples, schématrons et jeux de valeurs)
- Le schématron serviceEventPerformer
 |
| 06/12/17 | V1.3.12 |
- Correction du volet LDL
 |
| 06/04/18 | V1.3.13 |
- Correction du volet LDL
- Correction de l'exemple AVC\_postAVC
- Correction de l'exemple CSE
 |
| 15/05/18 | V1.3.14 |
- Correction du volet CSE
 |
| 19/07/18 | V2.0 |
- Refonte du testContenuCDA
 |
| 21/12/18 | V2.1 |
- Mise à jour du volet LDL, des Jeux de valeurs et du CSE
 |
| 28/12/18 | V2.2 |
- Mise à jour du volet SDM-MR
 |
| 17/01/19 | V2.3 |
- Génération des fichier xsl dans le répertoire schématrons et renommage du schématron IHE\_PCC.sch en IHE.sch
 |
| 23/01/19 | V2.4 |
- Ajout du volet Compte rendu de la génétique moléculaire
- Correction d'erreurs sur les exemples FRCP, CR-ACP\_sein et OBS-SNM
 |
| 22/02/19 | V2.5 |
- Mise à jour des volets SDMMR, CSE et FRCP
- Correction sur les CDA auto-présentables
- Correction de différents schématrons
 |
| 25/02/19 | V2.6 |
- Ajout de l'outil GUI
 |
| 01/03/19 | V2.7 |
- Correction schématron FRCP V2.0
 |
| 08/03/19 | V2.8 |
- Mise à jour de l'exemple CDA du SDMMR
- Mise à jour du schématron E\_BIOentry\_CRBIO.sch
 |
| 02/04/19 | V2.9 |
- Mise à jour de la feuille de style ANS corrigée (cda\_asip.xsl)
- Mise à jour des exemples CDA du volet AVC
- Mise à jour des jeux de valeurs
- Mise à jour des versions des documents en conformité avec les versions des volets publiés
 |
| 08/04/19 | V2.10 |
-
 |
| 26/04/19 | V2.11 |
- Mise à jour des schématrons du Participant et des signes vitaux pour le CSE
- Mise à jour des codes LOINC pour le CSE
- Mise à jour de l'outil GUI
 |
| 29/04/19 | V2.12 |
- Autorisation de l'attribut nullFlavor sur l'élément Time des éléments :
  - legalAuthenticator
  - authenticator
 |
| 02/08/19 | V2.13 |
- Nouveaux documents exemples CNAM-HR (volet en concertation jusqu'au 30/09/2019)
- Nouvelle version du document exemple SDM-MR v2.2
- Nouvelle version du document exemple VAC v3.0 (qui remplace le CVA)
 |
| 03/09/19 | V2.14 |
- Mise en conformité avec les spécifications internationales IHE du volet VAC
 |
| 22/10/19 | V2.15 |
- Mises à jour suite à concertation du volet CNAM-HR.
- Création du schématron du VSM.
 |
| 25/10/19 | V2.16 |
- Mise à jour du volet Vaccination
 |
| 12/11/19 | V2.17 |
- Mise à jour du JDV\_SocialHistoryCodes-CISIS
 |
| 20/01/2020 | V2.18 |
- Correctif CNAM-HR v0.8
- Publication du volet TLM v0.6
- Mise à jour SDM-MR V2.3
- Mise à jour CSE v2.2
 |
| 14/02/2020 | V2.19 |
- Mise à jour des Jeux de valeurs JDV\_BIO\_Chapitres-CISIS et JDV\_BIO\_SousChapitres-CISIS
 |
| 17/02/2020 | V2.20 |
- Création du schématron abstrait dansTypeCode et du schématron JDV\_participationType.sch
 |
| 27/03/2020 | V2.21 |
- Mise à jour du volet TLM
- Mise à jour de la feuille de style pour l'affichage de l'entête.
 |
| 02/04/2020 | V2.22 |
- Correction exemple FRCP V2.0
 |
| 05/05/2020 | V2.23 |
- Mise à jour suite à publication du volet IDL 2020.01
  - LDL-SES\_v2020.02.xml
  - LDL-EES\_v2020.02.xml
- Correction des schématrons suivants :
  - chématrons\include\entrees : E\_medications\_int.sch
  - chématrons\include\sections : S\_dispositifs\_medicaux\_ASIP.sch, S\_documentSummary.sch, S\_codedListOfSurgeries.sch
  - chématrons\include\specificationsVolets\CSE : E\_CodedVitalSigns\_CSE.sch
  - chématrons\include\specificationsVolets\TLM : Entete\_TLM-DA.sch et Entete\_TLM-CR.sch
- Correction de quelques exemples suite à correction des schématrons :
  - AVC\_AUNV\_v2.2.xml
  - AVC\_SUNV\_v2.2.xml
  - CNAM-HR\_concertation\_sans-info\_V0.8.xml
  - CNAM-HR\_concertation\_V0.8.xml
  - DLU\_DLU\_v1.2.xml
  - DLU\_FLUDR\_v1.2.xml
  - DLU\_FLUDT\_v1.2.xml
  - F-PRC\_AVK\_v1.4.xml
  - F-PRC\_PPV\_v1.4.xml
  - F-PRC\_PSC\_v1.4.xml
  - F-PRC\_TAP\_v1.4.xml
  - OBP\_SAP\_v1.2.xml
  - OBP\_SCM\_v1.2.xml
  - OBP\_SNM\_v1.2.xml
  - PPS-PAERPA\_v1.2.xml
  - TLM-CR\_v1.0.xml
  - TLM-DA\_v1.0.xml
  - TLM-DA\_v1.0\_anamnèse-non-structurée.xml
  - VAC\_v3.1.xml
  - VSM\_v1.4.xml
 |
| 18/05/2020 | V2.24 |
- Mise à jour suite à publication du volet CNAM-HR V1.0
  - CNAM-HR\_v2020.01.xml
  - CNAM-HR\_sans-info\_v2020.01.xml
- Correction des schématrons LDL
 |
| 09/06/2020 | V2.25 | **Pour SDM-MR V2020.02**
- Modification fichier exemple SDM\_MR\_v2020.02 pour ajouter la version du modèle dans le templateId 1.2.250.1.213.1.1.1.30 (extension)
**Pour VSM V1.4**
- Modification du schématron CI-SIS\_VSM.sch (schematrons) pour supprimer le contrôle de la section Traitement au long court qui est déjà réalisé dans le schématron S\_traitementAuLongCours\_ASIP.sch (schematrons\include\sections)
**Pour SCE v2020.01**
- Modification des exemples CSE suite à évolutions demandées par la DGOS.
- Modification du schématron JDV\_causeAccidentDom\_CSE.sch (schematrons\include\jeuxDeValeurs\CSE) qui va contrôler le code contenu dans code et plus dans value suite à la correction des entrées Problème des CSE (remplacement de la sous-entrée Problème qui n'est pas autorisée dans une entrée Problème pour les causes par une sous-entrée Simple observation. Le code de la cause de l'accident domestique ou du motif d'hospitalisation est porté par l'élément « code » et plus « value »).
- Modification du schématron E\_eatingSleeping\_CSE.sch (schematrons\include\specificationsVolets\CSE) suite à création de la nouvelle section Allergies et intolérances pour l'allergie alimentaire (uniquement CS24).
- Modification des schématrons CI-SIS\_CSE\_CS8.sch, CI-SIS\_CSE\_CS9.sch et CI-SIS\_CSE\_CS24.sch pour ajouter le contrôle de présence des sections obligatoires.
 |
| 03/11/2020 | V2.26 | **Pour VSM V1.4**
- Modification exemple pour mettre à jour des libellés de profession/spécialité de PS
**Pour LDL-EES et LDL-SES**
- Modification des exemples pourmettre à jour des libellés de profession/spécialité de PS et ajouter '1' devant le FINESS de l'HEGP.
- Modification des OIDs pour les DM (utilisation des OIDs de test)
**Pour les autres documents :**
- Amélioration mise en forme des exemples

**Feuille de style :**
- headers.xsl : Modification pour afficher le commentaire sur l'auteur (qui est dans author/functionCode/originalText)
- cda.css : Modification des styles des tableaux pour le corps des documents
- cda\_asip.xsl et utility.xsl : modifiés pour ne plus afficher la table de matières dans les documents non structurés et pour afficher le suffix si présent ou le prefix dans le nom des personnes.
**Schématrons**
- Création des schématrons de JDV génériques suivants :
  - JDV\_administrativeGenderCode.sch,
  - JDV\_authorFunctionCode.sch,
  - JDV\_participantFunctionCode.sch
  - JDV\_substanceAdministration\_approachSiteCode.sch
- Modification des schématrons de JDV génériques suivants
  - JDV\_authorSpecialty.sch pour le rendre générique (et donc ne pas le limiter l'en-tête)
  - JDV\_ClinicalStatusCodes.sch pour le rendre générique
- Suppression du schématron de JDV génériques suivants :
  - JDV\_participationType.sch (schematrons\include\jeuxDeValeurs) car le participant/typecode est contrôlé par le schéma CDA : implique aussi la suppression de l'abstract dansTypeCode.sch (schematrons\abstract) et la modification du schématron CI-SIS\_StructurationMinimale.sch pour supprimer l'appel (voir ci-dessous)
- Modification du nom du répertoire include\jeuxDeValeurs\FRCP en include\jeuxDeValeurs\FRCP-2015 (en prévision de la création d'un nouveau répertoire pour la nouvelle version)
- Suppression des schématrons abstract suivants :
  - personName20110627.sch (qui n'est pas utilisé) et suppression de cet abstract dans tous les schématrons des documents
  - dansTypeCode.sch (qui n'est pas utile) et suppression de cet abstract dans le schématron SIS\_StructurationMinimale.sch
- Création des schématrons de JDV spécifiques à l'en-tête suivants :
  - JDV\_authenticatorSpecialty.sch,
  - JDV\_componentOfResponsibleSpecialty.sch,
  - JDV\_healthcareFacilityTypeCode.sch,
  - JDV\_informantRelatedEntityCode.sch,
  - JDV\_legalAuthenticatorSpecialty.sch,
  - JDV\_typeCode.sch
et du répertoire les contenant (schematrons\include\jeuxDeValeurs\en-tête)
- Modification des schématrons suivants
  - ER\_severity\_int.sch pour supprimer un JDV qui n'est pas obligatoire
  - Entete\_FLUDR\_FLUDT pour supprimer le contrôle sur informant
- Création des schématrons sections et entrées D2LM
- Modification schématron IHE.sch pour ajouter les section et entrées du profil IHE PRE
 |
| 07/12/2020 | V2.27 | **Pour CSE**
- Remplacement du JDV\_ImmunizationCode-CISIS (1.2.250.1.213.1.1.5.12) par le JDV\_HL7\_ActSubstanceAdministrationImmunizationCode-CISIS (2.16.840.1.113883.1.11.19709)
**Schématrons**
- Création des schématrons de JDV génériques suivants :
  - JDV\_actSubstanceAdministrationImmunizationCode.sch
  - JDV\_observationIntoleranceType.sch
  - JDV\_substanceAdministration\_ImmunizationRouteCodes.sch
  - JDV\_substanceAdministration\_RouteOfAdministration.sch
  - JDV\_vitalSignCode.sch
 |
| 15/01/2021 | V2.28 | **Modification des schématrons suite à publication de la nouvelle version du volet Structuration minimale des documents de santé V1.7**
- Modification shematrons/include/en-tete/ **recordTarget\_fr.sch** en supprimant les contrôles sur la présence obligatoire des deux éléments « addr » et « telecom »
- Création shematron/include/jeuxDeValeurs/en-tête/ **JDV\_authorFunctionCode.sch** qui fait appel au nouveau shematron/abstract/ **abstractAuthorFunctionCode.sch** qui contrôle si la valeur de author/functionCode est issue d'une des 3 nouvelles TRE créées dans le répertoire jeuxDeValeurs :
  - TRE\_R258-RelationPriseCharge OID : 1.2.250.1.213.1.1.4.2.280
  - TRE\_R259-HL7ParticipationFunction OID : 2.16.840.1.113883.5.88
  - TRE\_R85-RolePriseCharge OID : 1.2.250.1.213.1.6.1.107
- Création shematron/include/jeuxDeValeurs/en-tête/ **JDV\_authorSpecialty.sch** qui fait appel au nouveau shematron/abstract/ **abstractAuthorSpecialty.sch** qui contrôle si la valeur de author/assignedAuthor/code est issue d'une des 6 nouvelles TRE créées dans le répertoire jeuxDeValeurs :
  - TRE\_A00-ProducteurDocNonPS OID : 1.2.250.1.213.1.1.4.6
  - TRE\_R85-RolePriseCharge OID : 1.2.250.1.213.1.6.1.107
  - TRE\_R94-ProfessionSocial OID : 1.2.250.1.213.1.6.1.4
  - TRE\_R95-UsagerTitre OID : 1.2.250.1.213.1.6.1.109
  - TRE\_R96-AutreProfDomSanitaire OID : 1.2.250.1.213.1.6.1.110
  - TRE\_A02-ProfessionSavFaire-CISIS OID : 1.2.250.1.213.1.1.4.5
- Création shematron/include/jeuxDeValeurs/en-tête/ **assignedAuthor\_fr.sch** qui contrôle si la cardinalité de l'élément prefix est [0..1] et si la valeur de author/assignedAuthor/assignedPerson/name/prefix est issue de la nouvelle TRE créée dans le répertoire jeuxDeValeurs :
  - TRE\_R81-Civilite.
Et si la cardinalité de l'élément suffix est [0..1] et si la valeur de author/assignedAuthor/assignedPerson/name/suffix est issue de la nouvelle TRE créée dans le répertoire jeuxDeValeurs :

  - TRE\_R11-CiviliteExercice.
- Création shematron/include/jeuxDeValeurs/en-tête/ **JDV\_informantRelatedEntityCode.sch** qui fait appel au nouveau shematron/abstract/ **abstractInformantRelatedEntityCode** qui contrôle si la valeur de informant/relatedEntity/code est issue d'une des 2 nouvelles TRE créées dans le répertoire jeuxDeValeurs :
  - TRE\_R216-HL7RoleCode
  - TRE\_R217-ProtectionJuridique
- Modification du shematrons/include/en-tete/ **informantRelatedEntity\_fr.sch** en supprimant les contrôles sur la présence obligatoire des éléments « addr » et « telecom »
- Modification du shematrons/include/en-tete/ **informationRecipient\_fr.sch** pour :
  - Modifier les contrôles sur les cardinalités des éléments « id », « informationRecipient » et « informationRecipient/name »
  - Ajouter le contrôle sur l'élément « suffix » [0..1] et dont la valeur doit appartenir à la o TRE\_R11-CiviliteExercice
  - Ajouter le contrôle sur l'élément « prefix » dont la valeur doit appartenir à la TRE\_R81-Civilite.
  - Modifier les contrôles sur les cardinalités des éléments « receivedOrganization/id » et « receivedOrganization/name »
  -
- Création du shematron/include/jeuxDeValeurs/en-tête/ **JDV\_participantFunctionCode.sch** qui fait appel au nouveau shematron/abstract/ **abstractAuthorFunctionCode.sch** qui contrôle si la valeur de participant/functionCode est issue d'une des 3 nouvelles TRE créées dans le répertoire jeuxDeValeurs :
  - TRE\_R258-RelationPriseCharge OID : 1.2.250.1.213.1.1.4.2.280
  - TRE\_R259-HL7ParticipationFunction OID : 2.16.840.1.113883.5.88
  - TRE\_R85-RolePriseCharge OID : 1.2.250.1.213.1.6.1.107
- Création du shematron/include/jeuxDeValeurs/en-tête/ **JDV\_participantAssociatedEntityCode.sch** qui fait appel au nouveau shematron/abstract/ **abstractAuthorSpecialty.sch** qui contrôle si la valeur de participant/associatedEntity/code est issue d'une des 6 nouvelles TRE créées dans le répertoire jeuxDeValeurs :
  - TRE\_A00-ProducteurDocNonPS OID : 1.2.250.1.213.1.1.4.6
  - TRE\_R85-RolePriseCharge OID : 1.2.250.1.213.1.6.1.107
  - TRE\_R94-ProfessionSocial OID : 1.2.250.1.213.1.6.1.4
  - TRE\_R95-UsagerTitre OID : 1.2.250.1.213.1.6.1.109
  - TRE\_R96-AutreProfDomSanitaire OID : 1.2.250.1.213.1.6.1.110
  - TRE\_A02-ProfessionSavFaire-CISIS OID : 1.2.250.1.213.1.1.4.5
- Création shematron/include/jeuxDeValeurs/en-tête/ **associatedEntity\_fr.sch** qui contrôle si la cardinalité de l'élément prefix est [0..1] et si la valeur de author/assignedAuthor/assignedPerson/name/prefix est issue de la nouvelle TRE créée dans le répertoire jeuxDeValeurs :
  - TRE\_R81-Civilite.
Et si la cardinalité de l'élément suffix est [0..1] et si la valeur de author/assignedAuthor/assignedPerson/name/suffix est issue de la nouvelle TRE créée dans le répertoire jeuxDeValeurs :

  - TRE\_R11-CiviliteExercice.
- Création du shematron/include/jeuxDeValeurs/en-tête/ **JDV\_standardIndustryClassCode.sch** qui fait appel au nouveau shematron/abstract/ **abstractStandardIndustryClassCode.sch** qui contrôle si la valeur de assignedEntity/representedOrganization/standardIndustryClassCode/code est issue d'une des 2 nouvelles TRE créées dans le répertoire jeuxDeValeurs :
  - TRE\_A00-ProducteurDocNonPS OID : 1.2.250.1.213.1.1.4.6
  - TRE\_A01-CadreExercice OID : 1.2.250.1.213.1.1.4.9
- Modification du schematrons\include\jeuxDeValeurs\en-tête/healthcareFacilityCode.sch qui fait au nouveau shematron/abstract/ **abstractHealthcareFacilityTypeCode.sch** qui contrôle si la valeur de componentOf/encompassingEncounter/location/healthCareFacility/code est issue de l'un des 2 TRE :
  - TRE\_A00-ProducteurDocNonPS (1.2.250.1.213.1.1.4.6)
  - TRE\_R02-SecteurActivite (1.2.250.1.71.4.2.4)
- Modification du schematrons\include/en-tete/ **componentOf\_fr.sch** pour modifier le contrôle de la cardinalité de l'élément « location »
- Modification du schéma **processable/coreschemas/voc.xsd** pour compléter la liste des valeurs autorisées pour l'élément componentOf/encompassingEncounter/encounterParticipant@typeCode

**Modification de la feuille de style suite à publication par HL7 d'un correctif pour corriger une faille de sécurité :**
- Les paramètres de sécurité permettaient d'intégrer du contenu tel que des images de fichiers PDF d'être rendus dans une iframe sans « sandbox » active, créant ainsi une vulnérabilité à l'insertion de contenu malveillant.
- Correction appliquée dans le **fichier style.xsl**  :
  - Sécuriser une iframe avec l'attribut sandbox : avec ce plugin n'importe quel « iframe » est maintenant bac à sable. « Sandboxed iframes » permet au navigateur de refuser les plugins et un certain nombre d'autres choses qui rendent le rendu plus sûr. Ce plugin limite également ce qui peut être rendu.
  - Un nouveau paramètre « limit-pdf » a été mis en œuvre. Si l'environnement veut autoriser le rendu pdf, on peut définir ce paramètre en « non ». Ce paramètre est défini par défaut à « non » dans notre feuille de style.
  - Notez que l'attribut sandbox n'est pas pris en charge avant Internet Explorer 9, donc pour éviter les contenus potentiellement dangereux dans les anciennes versions d'Internet Explorer, un commutateur a été ajouté qui empêche complètement les iframes sous ces versions de navigateur.
  - Pour en savoir plus : [https://github.com/HL7/cda-core-xsl/releases/tag/v4.0.2-beta10](https://github.com/HL7/cda-core-xsl/releases/tag/v4.0.2-beta10).

**Autres modifications de la feuille de style :**
- **Fichier cda\_asip.xsl**  : Ajout de la balise \&lt;meta http-equiv= »Content-Type » content= »text/html ; charset=utf-8 »/\&gt; au niveau de l'élément \&lt;head\&gt; de la balise \&lt;html\&gt; : métadonnées placées dans l'entête qui vont permettre de donner au navigateur des informations sur la page web à afficher.
- **Fichiers CDAHeaderToXDM.xsl et cda\_asip.xsl**  : Ajout de la balise \&lt;exclude-result-prefixes\&gt; : Cette balise permet d'éviter d'émettre des préfixes d'espace de noms dans le document de sortie.
- **Fichiers CDAHeaderToXDM.xsl et cda\_asip.xsl**  : Modification de l'encodage de l'élément \&lt;xsl :output\&gt; de « ISO-8859-1 » en « UTF-8 » (comme dans la feuille de style HL7). L'élément \&lt;xsl :output\&gt; contrôle les caractéristiques du document de sortie. Pour fonctionner correctement dans Netscape, cet élément doit être utilisé, avec l'attribut method. À partir de Netscape 7.0, method= »text » fonctionne comme prévu.

**Publication en concertation des documents CR de consultation pré-anesthésique et CR d'anesthésie v2020.01 :**
- Ajout des exemples CDA
- Ajout des schématrons correspondants

**Publication en concertation des documents DLU v2021.01 :**
- Ajout des exemples CDA

**CR-BIO :**
- Mise à jour des exemples (ajout des références entre résultats et bloc narratif)
- Mise à jour des schématrons

 |
| 26/01/2021 | V2.29 | **Modification de tous les exemples CDA :**
- Utilisation de la même patiente dans tous les exemples, plus complet en terme de données.
**Modification pour volet CSE 2021.01**
- Mise à jour des documents CDA CS8, CS9 et CS24
- Mise à jour des schématrons CI-SIS\_CSE\_CS8.sch, CI-SIS\_CSE\_CS9.sch et CI-SIS\_CSE\_CS24.sch
**Corrections de l'exemples CR-BIO\_v2.0\_Electrophorese :**
- Correction de l'entrée FR-Image-illustrative
- Modification de la structuration de la section Microbiologie
 |
| 16/03/2021 | V2.30 | **Exemples CDA :**
- Exemples CSE-CS8, CSE-CS9 et CSE-CS24 mis à jour pour nouvelle version 2021.01\_20210308
- Suppression des exemples DLU\_1.2 suite à publication DLU\_2021.01
- Mise à jour des noms des schématrons dans tous les exemples
- Mise à jour de l'exemple SDM-MR\_2020.02 (pour remplacer le libellé « Techniques sur lesquelles repose le diagnostic » par « Précision de(s) technique(s) génétique(s) utilisée(s) »)
- Mise à jour de l'exemple CDA VAC\_3.1
**jeuxDeValeurs :**
- Mise à jour des JDV JDV\_TypeGarde-CISIS, JDV\_EvenementsAccouchement-CISIS, JDV\_AntecedentsObstetricaux-CISIS et JDV\_Addictions-CISIS
**Schématrons :**
- Séparation des sous-schématrons par type de documents (schematrons\include\specificationsVolets et sous-répertoires schematrons\include\jeuxDeValeurs). Schématrons de documents impactés : CSE, TLM, D2LM, LDL, DLU
- Modification des noms des schématrons/profils : CI-SIS\_Modeles\_ANS.sch et CI-SIS\_ModelesDeContenusCDA.sch
- Modification de compilverif.bat et compilverifSDMMR.bat (suite au renommage des schématrons CI-SIS\_Modeles\_ANS.sch et CI-SIS\_ModelesDeContenusCDA.sch)
 |
| 12/05/2021 | V2.31 | **Exemples CDA mis à jour :**
- AVC-AUNV\_2.2.xml (suite à la mise à jour du JDV\_Lateralite-CISIS)
- LDL-EES\_2020.01.xml

- LDL-SES\_2020.01.xml
- CR-BIO\_2.0\_Auto-Presentable.xml (modification de la feuille de style)
- VAC\_3.1.xml (correction du templateId du document)
- VSM\_1.4.xml

**Exemples CDA (nouveaux exemples suite à publication en concertation du CR-BIO\_2021.01) :**
- CR-BIO\_2021.01\_Auto-Presentable.xml
- CR-BIO\_2021.01\_Auto-Presentable\_avec-image.xml : nouvel exemple CR-BIO autoprésentable avec image et PDF.
- CR-BIO\_2021.01\_CDA-R2-Niveau-1.xml
- CR-BIO\_2021.01\_Chikungunya.xml
- CR-BIO\_2021.01\_Electrophorese.xml
- CR-BIO\_2021.01\_PDF.xml

**Exemples CDA (nouveaux exemples suite à publication en concertation du CR-GM\_2021.01) :**
- CANCER-CR-GM\_2021.01\_AnalyseNonRealisee.xml
- CANCER-CR-GM\_2021.01\_AnalyseRealisee.xml

**Schématrons :**
- Mise à jour du schématron IHE.sch pour corriger une erreur d'appel
- Mise à jour du schématron du recordTarget suite à la mise en place de l'INS
- Ajout du schématron pour tester l'interpretationCode dans les exemples de CR-BIO\_2021.01

**Feuille de style :**
- **Fichier style.xsl**  : Modification pour permettre l'affichage par Firefox d'un PDF dans une section / entrée directement (à la place d'un lien).
- **Ficher utility.xsl :** Modification pour l'affichage des données patient dans l'entête pour tenir compte des nouvelles spécifications de l'INS.
- **Fichier headers.xsl :** Modification pour des données PS et ES dans l'entête pour déplier/plier ces données pour voir plus ou moins de détails.

 |
| 09/06/2021 | V2.32 | **Exemples CDA mis à jour :**
- ANEST-CR-ANEST\_2021.01.xml (suite à la publication des spécifications 2021.01)
- ANEST-CR-CPA\_2021.01.xml (suite à la publication des spécifications 2021.01)

**Schématrons mis à jour :**
- CI-SIS\_ANEST-CR-CPA\_2021.01.sch
- CI-SIS\_ANEST-CR-ANEST\_2021.01.sch
- CI-SIS\_TLM-DA\_2020.01.sch
- CI-SIS\_CR-BIO\_2021.01.sch
- CI-SIS\_CSE-CS24\_2021.01.sch
- CI-SIS\_CSE-CS9\_2021.01.sch
- CI-SIS\_CSE-CS8\_2021.01.sch
- CI-SIS\_LDL-SES\_2020.01.sch
- CI-SIS\_DLU-FLUDT\_2021.01.sch
- CI-SIS\_DLU-FLUDR\_2021.01.sch

**schematrons\include\entrees créés :**
- E\_payers\_fr.sch
- E\_identificationMicroOrganismesMultiresistants\_fr.sch
- E\_accidentsTransfusionnels\_fr.sch
- E\_evenementIndesirableSuiteAdministrationDerivesSang\_fr.sch
- E\_evenementIndesirablePendantHospitalisation\_fr.sch
- E\_statutDuDocument\_fr.sch
- E\_disposition\_fr.sch

**schematrons\include\sections créés :**
- S\_travailEtAccouchement\_ANS.sch
- S\_dispositions\_ANS.sch

**schematrons\include\sections modifiés :**
- S\_facteursDeRisque-non-code\_ANS.sch
- S\_anamneseEtFacteursDeRisques\_ANS.sch

 |
| 02/07/2021 | 2.33 | **Mise à jour des exemples CDA :**
- ANEST-CR-ANEST\_2021.01.xml
- ANEST-CR-CPA\_2021.01.xml
- CR-BIO\_2021.01\_Chikungunya.xml
- CR-BIO\_2021.01\_PDF.xml
- CR-BIO\_2021.01\_CDA-R2-Niveau-1.xml
- CR-BIO\_2021.01\_Electrophorese.xml
- CR-BIO\_2021.01\_Auto-Presentable\_avec-image.xml
- CR-BIO\_2021.01\_Auto-Presentable.xml
- SDM-MR\_2020.02.xml

**Création de nouveaux exemples suite à mise en concertation :**
- CANCER-FRCP\_2021.01\_Appareil.xml
- CANCER-FRCP\_2021.01\_Transversale
- CANCER-PPS\_2021.01\_Autopresentable.xml
- VAC\_2021.01.xml
- VAC-NOTE\_2021.01.xml

**Mise à jour des schématrons :** notamment pour le renommage des JDV qui avaient des accents (non supporté sous LINUX), les accents ont été supprimés.
- CI-SIS\_AVC\_PostAVC\_2.2.sch
- CI-SIS\_LDL-EES\_2020.01.sch
- CI-SIS\_VAC\_3.1.sch
- CI-SIS\_TLM-DA\_2020.01.sch
- CI-SIS\_OBP\_SAP\_1.2.sch
- CI-SIS\_CSE-CS8\_2021.01.sch
- CI-SIS\_CSE-CS9\_2021.01.sch
- CI-SIS\_CSE-CS24\_2021.01.sch
- CI-SIS\_AVC\_PostAVC\_2.2.sch

**Création des schématrons :**
- CI-SIS\_CANCER-FRCP\_2021.01.sch
- CI-SIS\_CANCER-PPS\_2021.01.sch
- CI-SIS\_VAC\_2021.01.sch
- CI-SIS\_VAC-NOTE\_2021.01.sch

**Mise à jour des schematrons\profils :**
- CI-SIS\_Modeles\_ANS.sch
- IHE.sch

**Création des schematrons\include\sections :**
- S\_principalMotif-non-code\_ANS.sch

**Mise à jour des schematrons\include\sections :**
- S\_historyOfPresentIllness.sch

**Mise à jour des schematrons\include\jeuxDeValeurs\ANEST-CR-ANEST\_2021.01**
- JDV\_AbordVeineuxPeripherique-CISIS.sch
- JDV\_AbordVeineuxCentral-CISIS.sch

**Création des schematrons\include\ jeuxDeValeurs\ :**
- CANCER-FRCP\_2021.01
- CANCER-PPS\_2021.01

**Création des schématrons\include\specificationsVolets**
- CANCER-FRCP\_2021.01
- VAC\_2021.01
- VAC-NOTE\_2021.01

**Mise à jour des exemples IHE\_XDM** |
| 10/09/2021 | 2.34 | **Liste des éléments modifiés et créés :**
**Exemples CDA :**
- ANEST-CR-ANEST\_2021.01.xml
- ANEST-CR-CPA\_2021.01.xml
- AVC-AUNV\_2.2.xml
- AVC-EUNV\_2.2.xml
- AVC-PAVC\_2.2.xml
- CANCER-D2LM-FIDD\_1.1.13.xml
- CANCER-D2LM-FIN\_1.1.13.xml
- CANCER-D2LM-FIDD\_2021.01.xml (nouveau)
- CANCER-D2LM-FIN\_2021.01.xml (nouveau)
- CANCER-CR-GM\_2021.01\_AnalyseNonRealisee.xml
- CANCER-CR-GM\_2021.01\_AnalyseRealisee.xml
- CANCER-FRCP\_2021.01\_Appareil.xml
- CANCER-FRCP\_2021.01\_Transversale.xml
- CANCER-PPS\_2021.01.xml
- CANCER-PPS\_2021.01\_Autopresentable\_V2.xml
- CR-BIO\_2021.01\_Chikungunya.xml
- CR-BIO\_2021.01\_Electrophorese.xml
- CR-RTN\_1.1.xml
- CSE-CS8\_2021.01.xml
- CSE-CS9\_2021.01.xml
- CSE-CS24\_2021.01.xml
- F-PRC-DCI\_1.4.xml
- F-PRC-PSC\_1.4.xml
- F-PRC-PPV\_1.4.xml
- LDL-SES\_2020.01.xml
- OBP-SAP\_1.2.xml
- OBP-SNE\_1.3.xml
- OPH-BRE\_2021.01.xml (nouveau)
- PPS-PAERPA\_2021.01.xml (nouveau)
- SDM-MR\_2020.02.xml
- TLM-DA\_2020.01\_TCG.xml
- TLM-DA\_2020.01\_TCG\_anamnèse-non-structurée.xml
- TLM-DA\_2020.01\_TE1\_anamnèse-non-structurée.xml
- VAC-NOTE\_2021.01.xml
- VSM\_1.4.xml

**Feuille de style :**
- headers.xsl

**Schématrons de documents :**
- CI-SIS\_AVC-AUNV\_2.2.sch (renommé)
- CI-SIS\_AVC-EUNV\_2.2.sch (renommé)
- CI-SIS\_AVC-PAVC\_2.2.sch (renommé)
- CI-SIS\_AVC-SUNV\_2.2.sch (renommé)
- CI-SIS\_CANCER-D2LM-FIN\_1.1.13
- CI-SIS\_CANCER-D2LM-FIDD\_1.1.13
- CI-SIS\_CANCER-D2LM-FIDD\_2021.01.sch (nouveau)
- CI-SIS\_CANCER-D2LM-FIN\_2021.01.sch (nouveau)
- CI-SIS\_CR-BIO\_2021.01.sch (renommé)
- CI-SIS\_CSE-CS8\_2021.01.sch
- CI-SIS\_CSE-CS9\_2021.01.sch
- CI-SIS\_CSE-CS24\_2021.01.sch
- CI-SIS\_DLU-DLU\_2021.01.sch (renommé)
- CI-SIS\_DLU-FLUDR\_2021.01.sch (renommé)
- CI-SIS\_DLU-FLUDT\_2021.01.sch (renommé)
- CI-SIS\_LDL-EES\_2020.01.sch (renommé)
- CI-SIS\_LDL-SES\_2020.01.sch (renommé)
- CI-SIS\_F-PRC\_1.4.sch (renommé)
- CI-SIS\_OBP-SAP\_1.3 (renommé)
- CI-SIS\_OBP-SCE\_1.3 (renommé)
- CI-SIS\_OBP-SCM\_1.3 (renommé)
- CI-SIS\_OBP-SNE\_1.3 (renommé)
- CI-SIS\_OBP-SNM\_1.3 (renommé)
- CI-SIS\_OPH-BRE\_2021.01.sch (nouveau)
- CI-SIS\_OPH-CR-RTN\_1.1.sch (renommé)
- CI-SIS\_PPS-PAERPA\_2021.01.sch (nouveau)
- CI-SIS\_VAC\_2021.01.sch
- CI-SIS\_VAC-NOTE\_2021.01.sch
- CI-SIS\_TLM-CR\_2020.01.sch
- CI-SIS\_TLM-DA\_2020.01.sch

**schematrons\profils :**
- CI-SIS\_Modeles\_ANS.sch

**schematrons\include\sections :**
- S\_bilan-diagnostic-immediat\_ANS.sch
- S\_informationsAssure\_ANS.sch

**schematrons\include\entrees :**
- E\_observationRequest\_int.sch

**schematrons\include\jeuxDeValeurs :**
- JDV\_administrativeGenderCode.sch : pour remplacement du code &quot;U&quot; par &quot;UN&quot;
- CANCER-DL2M-FIDD\_2021.01 (nouveau)
- CANCER-DL2M-FIN\_2021.01 (nouveau)
- OPH-BRE\_2021.01 (nouveau)
- PPS-PAERPA\_2021.01 (nouveau)
- Ajout du numéro de version dans tous les répertoires

**schematrons\include\specificationsVolets :**
- Ajout du numéro de version dans tous les répertoires
- Modification des schématrons suivants :
- CANCER-DL2M-FIDD\_2021.01 (nouveau)
- CANCER-DL2M-FIN\_2021.01 (nouveau)
- CSE-CS8\_2021.01\Entrees\E\_abdomen\_CSE-CS8.sch
- CSE-CS8\_2021.01\Entrees\E\_ears\_CSE-CS8.sch
- CSE-CS8\_2021.01\Entrees\E\_generalApp\_CSE-CS8.sch
- CSE-CS8\_2021.01\Entrees\E\_genitalia\_CSE-CS8.sch
- CSE-CS8\_2021.01\Entrees\E\_heart\_CSE-CS8.sch
- CSE-CS8\_2021.01\Entrees\E\_musculo\_CSE-CS8.sch
- CSE-CS8\_2021.01\Entrees\E\_neurologic\_CSE-CS8.sch
- CSE-CS8\_2021.01\Entrees\E\_teeth\_CSE-CS8.sch
- CSE-CS9\_2021.01\Entrees\E\_abdomen\_CSE-CS9.sch
- CSE-CS9\_2021.01\Entrees\E\_ears\_CSE-CS9.sch
- CSE-CS9\_2021.01\Entrees\E\_endocrine\_CSE-CS9.sch
- CSE-CS9\_2021.01\Entrees\E\_eyes\_CSE-CS9.sch
- CSE-CS9\_2021.01\Entrees\E\_generalApp\_CSE-CS9.sch
- CSE-CS9\_2021.01\Entrees\E\_genitalia\_CSE-CS9.sch
- CSE-CS9\_2021.01\Entrees\E\_heart\_CSE-CS9.sch
- CSE-CS9\_2021.01\Entrees\E\_integumentary\_CSE-CS9.sch
- CSE-CS9\_2021.01\Entrees\E\_lymphatic\_CSE-CS9.sch
- CSE-CS9\_2021.01\Entrees\E\_musculo\_CSE-CS9.sch
- CSE-CS9\_2021.01\Entrees\E\_neurologic\_CSE-CS9.sch
- CSE-CS9\_2021.01\Entrees\E\_respiratory\_CSE-CS9.sch
- CSE-CS9\_2021.01\Entrees\E\_teeth\_CSE-CS9.sch
- CSE-CS24\_2021.01\Entrees\E\_abdomen\_CSE-CS24.sch
- CSE-CS24\_2021.01\Entrees\E\_ears\_CSE-CS24.sch
- CSE-CS24\_2021.01\Entrees\E\_endocrine\_CSE-CS24.sch
- CSE-CS24\_2021.01\Entrees\E\_eyes\_CSE-CS24.sch
- CSE-CS24\_2021.01\Entrees\E\_generalApp\_CSE-CS24.sch
- CSE-CS24\_2021.01\Entrees\E\_genitalia\_CSE-CS24.sch
- CSE-CS24\_2021.01\Entrees\E\_heart\_CSE-CS24.sch
- CSE-CS24\_2021.01\Entrees\E\_integumentary\_CSE-CS24.sch
- CSE-CS24\_2021.01\Entrees\E\_lymphatic\_CSE-CS24.sch
- CSE-CS24\_2021.01\Entrees\E\_musculo\_CSE-CS24.sch
- CSE-CS24\_2021.01\Entrees\E\_neurologic\_CSE-CS24.sch
- CSE-CS24\_2021.01\Entrees\E\_respiratory\_CSE-CS24.sch
- CSE-CS24\_2021.01\Entrees\E\_teeth\_CSE-CS24.sch
- OPH-BRE\_2021.01 (nouveau)
- VAC\_2021.01\Entete\Entete\_VAC\_2021.01.sch
- VAC-NOTE\_2021.01\Entete\Entete\_VAC-NOTE\_2021.01.sch

 |
| 07/10/2021 | 2.35 | **Liste des éléments modifiés et créés :**
**Exemples CDA :** Tous les exemples CDA ont été mis à jour notamment suite aux nouveaux contrôles des terminologies.
**Schématrons principaux :** CI-SIS\_OBP-SAP\_2021.01.sch (nouveau)CI-SIS\_OBP-SCE\_2021.01.sch (nouveau)CI-SIS\_OBP-SCM\_2021.01.sch (nouveau)CI-SIS\_OBP-SNE\_2021.01.sch (nouveau)CI-SIS\_OBP-SNM\_2021.01.sch (nouveau)CI-SIS\_TLM-CR\_2021.01.sch (nouveau)CI-SIS\_TLM-DA\_2021.01.sch (nouveau)
**schematrons\include\en-tete :** documentationOf\_fr.sch
**schematrons\include\entrees :** E\_mesuresAcuiteVisuelle\_intE\_mesuresAcuiteVisuelleObservation\_intE\_mesuresDeRefractionOrganizer\_intE\_mesureDeRefractionObservation\_intE\_mesuresDispositifsOculaires\_intE\_mesuresDispositifsOculairesObservation\_intE\_vitalSignsObservation\_int.sch
**schematrons\include\sections :** S\_analyseDesDispositifsOculairesS\_bilanOphtalmologiqueS\_examenPhysiqueOculaireS\_mesureDeLaRefractionS\_scoreRankin\_ANS
**schematrons\include\specificationsVolets :** TLM-CR\_2021.01 (nouveau)TLM-DA\_2021.01 (nouveau)OBP\_2021.01 (nouveau)
**schematrons\moteur :** compilverif.bat pour ajout des contrôles des terminologies.
**schematrons\profils :** Ajout d'un répertoire « Terminologies » contenant les éléments permettant le contrôle des codes utilisés dans les documents CDA pour les terminologies LOINC, CIM-10, ADICAP, CISP2, TA\_ASIP.
**schematrons\rapports :** rapportSchematronToHtml4.xsl (réintégration car avait été supprimé à tort)
**jeuxDeValeurs:** SVS.xsd (réintégration car avait été supprimé à tort)Tous les JDV ont été régénérés
 |
| 19/10/2021 | 2.36 | **Liste des éléments modifiés et créés :**
**Exemples CDA :** Voir dans le tableau du paragraphe 3.2.1
**Schématrons principaux :** CI-SIS\_CANCER-FRCP\_2021.01.sch
**schematrons\include\en-tete :** assignedAuthor\_fr.schassignedEntity\_fr.schassociatedEntity\_fr.schinformationRecipient\_fr.schparticipant\_fr.sch
**schematrons\include\jeuxDeValeurs :** JDV\_administrativeGenderCode.sch
**schematrons\include\jeuxDeValeurs\en-tête :** JDV\_encompassingEncounterCode.schJDV\_typeCode.sch
**schematrons\include\sections :** S\_cadrePropositionTherapeutique\_ANS.sch
**schematrons\abstract :** abstractEncompassingEncounterCode.schabstractHealthcareFacilityCode.schabstractTypeCode.sch
**schematrons\profils :** CI-SIS\_Modeles\_ANS.schCI-SIS\_StructurationMinimale.sch
**schematrons\profils\terminologies\terminologie** 2.16.840.1.113883.6.1.rdf |
| 10/11/2021 | 2.37 | **Liste des éléments modifiés et créés :**
**Exemples CDA :** Voir dans le tableau du paragraphe 3.2.1
**Schématrons principaux :** CI-SIS\_PPS-PAERPA\_2021.01.schCI-SIS\_OPH-CR-RTN\_2021.01.sch (nouveau)CI-SIS\_SDM-MR\_2021.01.sch (nouveau)
**schematrons\include\sections :** S\_intravenousFluidsAdministered.sch
**schematrons\include\entrees :** E\_SimpleObservation\_fr.schE\_SimpleObservation\_int.sch
**schematrons\include\specificationsVolets:** OPH-CR-RTN\_2021.01 (nouveau)SDM-MR\_2021.01 (nouveau)
**Feuille de style :** utility.xslheaders.xsl
**Exemples IHE\_XDM**
 |
| 02/12/2021 | 2.38 | **Liste des éléments modifiés et créés :**
**Exemples CDA :** Voir dans le tableau du paragraphe 3.2.1
**Schématrons principaux :** CI-SIS\_CANCER-D2LM-FIDD\_2021.01.sch
**schematrons\include\jeuxDeValeur :** CANCER-D2LM-FIN\_2021.01CANCER-D2LM-FIDD\_2021.01
**jeuxDeValeurs :** JDV\_J48-ProfessionNonPS-CISIS.xmlJDV\_J07-XdsTypeCode-CISIS.xml
 |
