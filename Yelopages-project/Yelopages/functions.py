import mysql.connector

def setupdb():
	mydb = mysql.connector.connect(
		host="localhost",
		user="root",				#select the user
		passwd="")					#Provide the password for your root user or some other user in which you have created the database
	return mydb

def getpid(profession):
	pidlist = {'Cook':1,'Plumber':2,'Electrician':3,'House Cleaner':4,'Carpenter':5,'Painter':6,'Gardener':7,'Driver':8,'Pool Cleaner':9,'Guard':10,'Delivery Person':11,'Vegetable Seller':12,'Baby Sitter':13,'Pet Keeper':14,'Party Decorator':15,'Tutor':16,'Dentist':17,'ENT':18,'Washer':19,'Dry Cleaner':20}
	pid = pidlist[profession]
	return pid

def login(username, password):
	mydb = setupdb()
	mycursor= mydb.cursor()
	mycursor.execute("USE yelopages")
	query= "SELECT name from USER where username = '{}' and password = '{}'".format(username, password)
	mycursor.execute(query)
	exist=mycursor.fetchall();
	if(len(exist)==0):
		return False
	else:
		return True

def check_username(username):
	mydb = setupdb()
	mycursor= mydb.cursor()
	mycursor.execute("USE yelopages")
	query="SELECT * from user where username = '{}'".format(username)
	mycursor.execute(query)
	exist=mycursor.fetchall();
	if(len(exist)==0):
		return True
	else:
		return False

def signup(name, username, password, age, aadharNumber, serviceProvider, pid):
	mydb = setupdb()				#Provide the password for your root user or some other user in which you have created the database
	mycursor= mydb.cursor()
	mycursor.execute("USE yelopages")
	query= "INSERT INTO user (username, password, name, age, aadharNumber, serviceProvider, pid) VALUES(%s, %s, %s, %s, %s, %s,%s)"
	values = (username, password, name, age, aadharNumber, serviceProvider, pid)
	mycursor.execute(query, values)
	mydb.commit()
	print("signup success")


