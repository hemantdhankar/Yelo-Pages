from django.http import HttpResponse
from django.shortcuts import render
from .functions import *
def home(request):
	if request.method == 'POST':
		print("post")
		if'Sign_In' in request.POST:
			print("Sign_In")
			username = request.POST['Username']
			password = request.POST['Password']
			print(username,password)
			auth = login(username,password)
			if(auth):
				return render(request,"search.html",{'message':'Logged in successfully'})  
			else:
				return render(request,"home.html", {'error': 'Incorrect Username or Password', 'lusername':username, 'lpassword':password})
		else:
			print("register")
			name = request.POST['Name']
			username = request.POST['Username']
			password = request.POST['Password']
			age = request.POST['Age']
			aadhar = request.POST['Aadhar']
			service_provider = request.POST.getlist('Service_provider[]')
			print(name, username, password, age, aadhar, service_provider)
			if('yes' in service_provider):
				profession = request.POST['Profession']
			valid_username = check_username(username)
			if(not valid_username):
				return render(request,"home.html", {'usernameerror': '* Username already exists', 'name': name,'username':username, 'password':password, 'age':age, 'aadhar':aadhar})
			else:
				if(len(service_provider)==0):
					signup(name, username, password, age, aadhar, "no", 0)
				else:
					pid = getpid(profession)
					signup(name, username, password, age, aadhar, "yes", pid)
				return render(request,"search.html",{'message':'Signed up successfully'})
	else:
		return render(request,"home.html")


def search(request):
	return render(request,"search.html")
