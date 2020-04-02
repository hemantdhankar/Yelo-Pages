"""
	First of all create the database "yelopages" and then run the file tables.sql using the command
	mysql -u root -p yelopages < tables.sql		, this will create all tables (you will have to run it only once)
	Check the tables before proceeding.
	Lines you MUST edit before running this file ---- 73
	use python main.py to run this file  
	
"""




import mysql.connector

def signup(mycursor):
	serviceProvider="No"
	pid=1									#Currently providing pid 1 to service seekers, will update this soon
	print("1. Signup as Service Provider")
	print("2. Signup as Service Seeker")
	choice = int(input())
	if(choice==1):
		serviceProvider="yes"
		print("Enter pid")							#Just for now, will provide options later on.
		pid=int(input())
	print("Enter Your Full Name")
	name = input()
	print("Enter Username")
	while(True):
		username=input()
		query="SELECT * from user where username = '{}'".format(username)

		mycursor.execute(query)
		exist=mycursor.fetchall();
		if(len(exist)==0):
			print("Username is available")
			break
		else:
			print("Username already exist. Please Enter something else.")

	print("Enter Password")
	passwd = input()
	print("Age")
	age=int(input())
	print("Enter Aadhar Number")
	aadharnumber=int(input())

	query= "INSERT INTO user (username, password, name, age, aadharNumber, serviceProvider, pid) VALUES(%s, %s, %s, %s, %s, %s,%s)"
	values = (username, passwd, name, age, aadharnumber, serviceProvider, pid)
	mycursor.execute(query, values)






def login():
	print("Enter Username")
	while(True):
		username=input()
		query="SELECT * from user where username = '{}'".format(username)
		mycursor.execute(query)
		exist=mycursor.fetchall();
		if(len(exist)==0):
			print("Incorrect Username. Enter Again")
		else:
			print("Enter Password")
			passwd= input()
			query= "SELECT name from USER where username = '{}' and password = '{}'".format(username, passwd)
			mycursor.execute(query)
			exist=mycursor.fetchall();
			if(len(exist)==0):
				print("Incorrect password for the given username. Please try again.")
				print("Enter Username")
			else:
				print("Successfully logged in.\n Hi, {}, Welcomeback to yelopages.".format(exist[0][0]))
				break;


def menu():
	print("*************************** Welcome to Yelo Pages ********************************")
	print("What you want to do?")
	print("1 Login")
	print("2 Signup")
	print("3 Exit")
	while(True):
		choice=int(input())
		if(choice<1 or choice >3):
			print("Invalid Choice. Please Enter Again.")
			continue
		else:
			break
	return choice


if __name__ == '__main__':

	mydb = mysql.connector.connect(
		host="localhost",
		user="root",				#select the user
		passwd="")					#Provide the password for your root user or some other user in which you have created the database
									#Remember to remove the password before pushing it to the repo

	mycursor= mydb.cursor()
	mycursor.execute("USE yelopages")					#Please keep the name of the database = "yelopages", it will not create confusion on further stages.
	choice=menu()
	if(choice==1):
		login()
	elif(choice==2):
		signup(mycursor)
		mydb.commit()
		print("successfully signed up.")
	elif(choice==3):
		sys.exit()