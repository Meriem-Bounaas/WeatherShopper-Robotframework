# Installation et Execution

## 1. Créer un environnement virtuel
`python -m venv venv`

## 2. Activer l'environnement
`.\venv\Scripts\activate.bat`
ou  
`.\venv\Scripts\Activate.ps1`

## 3. Installer les bibliothèques
`pip install -r requirements.txt`

ou  

```
pip install robotframework
pip install --upgrade robotframework-seleniumlibrary
pip install -U robotframework-pabot
```

## 4. Exécuter les tests en fonction de leurs tags
`robot -i "tags à inclure" -e "tags à exclure" -d results .`

## 5. Exécuter les tests en parallèle avec pabot
`pabot --testlevelsplit --processes 8 -d results .`

## 6. Spécifier le navigateur à utiliser
Par defaut, le navigateur utilisé est chrome mais il peut être changé depuis la ligne de commande  
`robot --variable BROWSER:edge -d results .`
