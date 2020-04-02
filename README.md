# Yelo-Pages

It is recomended to run the main-old.py file before you run the server as it will let you know if you are missing any requirements. The main-old.py file is well documented so open it and follow the instructions.

IMPORTANT: Keep the name of your database "yelopages" only.

#Reqirements
1. django2
2. mysql 
3. mysql pip package
4. python connector (check if its working fine by runing the main-old.py file before running server)
    

#Deploying
1. Go to the ../Yelopages-project/
2. Run command python manage.py runserver   OR  python3 manage.py runserver         (You must use python3 version)
3. Site will be hosted at localhost:8000
4. Ctrl + c to exit 
    
Changes you have to do:
1. If you are running main-old.py file then you will have to provide the database details like user, password, etc. Most probably you'll just have to change the password.

2. Before running the server you'll have to do the same in functions.py file. In the function setupdb you will have to update the password. 

#extra
I've updated the professioncategory table (added pid 0 for profession 'None')
The exported schema is given in the root folder so you can import it.
