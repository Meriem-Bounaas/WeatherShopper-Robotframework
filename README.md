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

## 4. Exécuter un test avec un tag
`robot -i "nom de tag" -d results .`

## 5. Exécuter les tests en parallèle 
`pabot --testlevelsplit --processes 8 -d results .`

