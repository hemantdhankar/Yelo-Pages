from django.http import HttpResponse
from django.shortcuts import render, redirect
from .functions import *


def home(request):
	if request.method == 'POST':
		print("post")
		if'Sign_In' in request.POST:
			print("Sign In Request")
			username = request.POST['Username']
			password = request.POST['Password']
			auth = login(username,password)
			if(auth):
				user = getUserObject(username)
				request.session["user"] = user 
				return redirect('search')  
			else:
				return render(request,"home.html", {'error': 'Incorrect Username or Password', 'lusername':username, 'lpassword':password})
		else:
			print("Sign Up request")
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
				return render(request,"home.html", {'usernameerror': '* Username already exists', 'sname': name,'susername':username, 'spassword':password, 'sage':age, 'saadhar':aadhar})
			else:
				if(len(service_provider)==0):
					signup(name, username, password, age, aadhar, "no", 0)
				else:
					pid = getpid(profession)
					signup(name, username, password, age, aadhar, "yes", pid)
				user = getUserObject(username)
				request.session["user"] = user
				localities = ['Anand Vihar', 'Azad Nagar East Delhi', 'Babarpur North East Delhi', 'Badarpur Khadar', 'Balbir Nagar', 'Bhajan Pura', 'Bhola Nath Nagar', 'Brahampuri', 'Chilla', 'Dayalpur', 'Dilshad Garden', 'Distt Court KKD', 'Gandhi Nagar Bazar', 'Gandhi Nagar East Delhi', 'Garhi Mandu', 'Geeta Colony', 'Ghazipur', 'Gokal Puri', 'Goverdhan Bihari Colony', 'Govind Pura', 'GTB Hospital', 'Harsh Vihar', 'Himmatpuri', 'Housing Complex Loni Road', 'IP Extension', 'Jafrabad East Delhi', 'Jagjit Nagar', 'Jhilmil HO', 'Jhilmil Tahirpur', 'Johripur', 'Kailash Nagar', 'Kalyanpuri', 'Kalyanvas', 'Karawal Nagar', 'Khajoori Khas', 'Krishna Nagar HO', 'Laxmi Nagar Extension', 'Laxmi Nagar East Delhi', 'Loni Road', 'Man Sarovar Park', 'Mandawali Fazalpur', 'Mandoli Saboli', 'Maujpur', 'Mayur Vihar PhI', 'Mayur Vihar PhIII', 'Nand Nagri A', 'Nand Nagri C', 'New Seemapuri', 'New Usmanpur', 'Nirman Vihar', 'Old Seemapuri', 'Patparganj', 'Raghubar Pura', 'Rajgarh Colony', 'Ram Nagar East Delhi', 'Rohtash Nagar', 'Sabhapur', 'Seelampur', 'Shahdara Mandi', 'Shahdara', 'Shaheed Bhagat Singh Colony', 'Shakarpur', 'Shastri Nagar East Delhi', 'Shivaji Park East Delhi', 'Shriram Colony Rajeev Nagar', 'Sonia Vihar', 'Sunder Nagari', 'Surajmal Vihar', 'Telewara', 'Trilok Puri', 'Vasundhra Enclave', 'Vishwakarma Nagar', 'Vishwas Nagar', 'Vivek Vihar', 'Yamuna Vihar', 'Yozna Vihar', 'Delhi GPO', 'Adrash Nagar', 'Alipur', 'Anandvas Shakurpur', 'Aruna Nagar', 'Ashok Vihar HO', 'Auchandi', 'Avantika', 'Badli North West Delhi', 'Bakhtawar Pur', 'Bakoli', 'Bankner', 'Baratooti', 'Barwala', 'Bawana', 'Begumpur', 'Bhalaswa', 'Bhorgarh', 'Budh Vihar', 'Burari', 'C4 Keshav Puram North West Delhi', 'Chand Pur', 'Chandni Chowk', 'Chawri Bazar', 'Civil Lines North Delhi', 'Dareeba', 'Delhi Engg College', 'Delhi Sadar Bazar', 'Delhi University', 'District Courts North Delhi', 'DrMukerjee Nagar', 'G T B Nagar extension', 'Ganeshpura', 'Gheora', 'Ghoga', 'GTB Nagar', 'Gujranwala Colony', 'Gulabi Bagh', 'H S School', 'Haiderpur', 'Hareveli', 'Hiranki', 'Holambi Kalan', 'HSSangh', 'INDERLOK', 'Jagatpur', 'Jahangir Puri A Block', 'Jahangir Puri D Block', 'Jahangir Puri H Block', 'Jat Khore', 'Jaunti', 'Jawahar Nagar North Delhi', 'Jharoda Majraa', 'Kadipur', 'Kamla Nagar North Delhi', 'Kanjhawla', 'Kanya Gurukul', 'Karala', 'Katewara', 'Keshavpuram', 'Khampur', 'Khera Kalan', 'Khera Khurd', 'KIRARI SULEMAN NAGAR', 'Lad Pur', 'Lampur', 'Majra Dabas', 'Malka Ganj', 'Mangolpuri A Block', 'Mangolpuri I  Block', 'Mangolpuri N Block', 'Mangolpuri S Block', 'Maurya Enclave', 'Model Town II', 'Model Town III', 'Mubarak Pur Dabas', 'Mukhmelpur', 'Mukundpur Village', 'Mungeshpur', 'Nangal Poona', 'Nangal Thakran', 'Narela', 'NARELA TOWN', 'Nathupura Village', 'Naya Bans', 'NEW Nathupura', 'Nimri', 'Nirankari Colony', 'Nizampur', 'NSMandi', 'Padam Nagar North Delhi', 'Palla', 'Patrachar Vidyalay', 'Pehlad Pur', 'Pooth Kalan', 'Pooth Kalan Resettlement', 'Pooth Khurd', 'Power House', 'Prashant Vihar', 'Prem Nagar', 'Punjab Khor', 'Qutabagarh', 'Rampura', 'Rana Pratap Bagh', 'Rani Bagh', 'Rani Khera', 'RCAO', 'Rithala', 'Rohini Courts', 'Rohini sec11', 'Rohini Sector 15 extension So', 'Rohini Sector 15', 'Rohini Sector 16', 'ROHINI SECTOR 23', 'Rohini Sector 5', 'Rohini Sector7', 'Roop Nagar', 'Roshan Ara Road', 'Samai Pur', 'Sant Nagar', 'Sarai Rohilla', 'Saraswati Vihar', 'Satyawati Nagar', 'Shakti Nagar North Delhi', 'Shakur Basti Depot', 'Shakur Pur I  Block', 'Shakurbasti Rs', 'Shalamar', 'Shalimar Bagh North West Delhi', 'Shastri Nagar North West Delhi', 'Singhu', 'Siraspur', 'Sri Nagar Colony', 'Sultanpuri B Block', 'Sultanpuri C Block', 'Sultanpuri F Block', 'Tikri Khurd', 'Timarpur', 'Wazir Pur III', 'Wazirabad Village', 'AGCR EXTENSION COUNTER', 'AGCR', 'Ajmeri Gate Extn', 'AKMarket', 'Anand Parbat Indl Area', 'Anand Parbat', 'Bank Street Central Delhi', 'Baroda House', 'Bengali Market', 'Bhagat Singh Market', 'CAT EXTENSION COUNTER', 'Civic Centre', 'Connaught Place', 'Dada Ghosh Bhawan', 'Darya Ganj', 'Delhi High Court Extension Counter', 'Delhi High Court', 'Desh Bandhu Gupta Road', 'Election Commission', 'Gandhi Smarak Nidhi', 'Guru Gobind Singh Marg', 'Hauz Qazi', 'IARI', 'Inderpuri', 'Indraprastha HO', 'IPEstate', 'Jama Masjid', 'Janpath', 'Karol Bagh', 'Krishi Bhawan', 'Lady Harding Medical College', 'Master Prithvi Nath Marg', 'Minto Road', 'Multani Dhanda', 'National Physical Laboratory', 'NGT EXTENSION COUNTER', 'Nirman Bhawan', 'North Avenue', 'Pahar Ganj', 'Pandara Road', 'Parliament House', 'Patel Nagar East', 'Patel Nagar Central Delhi', 'Patel Nagar South', 'Patel Nagar West', 'Patiala House', 'Pragati Maidan', 'Rail Bhawan', 'Rajender Nagar', 'Rashtrapati Bhawan', 'Rouse Avenue Extension Counter', 'Sansad Marg HO', 'Sansadiya Soudh', 'Sat Nagar', 'Secretariat North', 'Shastri Bhawan', 'South Avenue', 'SRT NAGAR EXTENSION COUNTER', 'Supreme Court', 'Swami Ram Tirth Nagar', 'Udyog Bhawan', 'Union Public Service Commission', 'New Delhi GPO', 'RML EXTN COUNTER NDHO', 'Abul Fazal EnclaveI', 'Air Force Station Tugalkabad', 'Alaknanda', 'Ali', 'Aliganj South Delhi', 'Amar Colony', 'Andrewsganj', 'Badarpur South Delhi', 'BSF Camp Tigri', 'BTPS South Delhi', 'C G O Complex', 'C R R I South Delhi', 'Chittranjan Park', 'Dakshinpuri PhaseI', 'Dakshinpuri PhaseII', 'Dakshinpuri PhaseIII', 'Dargah Sharif', 'Defence Colony South Delhi', 'Deoli', 'Distt Court Complex Saket', 'Dr Ambedkar Nagar South Delhi', 'East Of Kailash PhaseI', 'East Of Kailash', 'F F C Okhla', 'Gautam Nagar', 'Golf Links', 'Greater Kailash', 'Gulmohar Park', 'Hamdard Nagar', 'Hari Nagar Ashram', 'Hazrat Nizamuddin', 'Jaitpur', 'Jaitpur South Delhi', 'Jamia Nagar', 'Jeevan Nagar', 'Jungpura', 'Kailash Colony', 'Kalkaji HO', 'Kasturba Nagar South Delhi', 'Khanpur South Delhi', 'Krishna Market', 'Lajpat Nagar South Delhi', 'Lal Kuan', 'Lodi Road HO', 'Madanpur Khadar', 'Malviya Nagar South Delhi', 'Masjid Moth', 'Meethapur', 'MMTCSTC Colony', 'Molarband', 'Nehru Nagar South Delhi', 'Nehru Place', 'New Delhi South ExtII', 'New Friends Colony', 'Okhla Industrial Area Phasei', 'Okhla Industrial Estate', 'Panchsheel Enclave', 'Pragati Vihar', 'Pratap Market', 'Pul Pahladpur', 'Pushp Vihar', 'Pushpa Bhawan', 'Sadiq Nagar', 'Safdarjung Air Port', 'Sahpurjat', 'Saket South Delhi', 'Sangam Vihar', 'Sant Nagar South Delhi', 'Sarita Vihar', 'Sarvodya Enclave', 'South Malviya Nagar', 'Sriniwaspuri', 'Sukhdev Vihar', 'Talimabad', 'Tehkhand', 'Tugalkabad Railway Colony', 'Village Tugalkabad', 'Zakir Nagar', '505 A B Workshop', 'A F Palam', 'A F Rajokari', 'Anand Niketan', 'Ansari Nagar', 'Aps Colony', 'Arjungarh', 'Aya Nagar', 'BHATI VILLAGE', 'Bijwasan', 'Chanakya Puri', 'Chandanhoola', 'Chattarpur', 'COD South West Delhi', 'CSKM School', 'CVD', 'Delhi Cantt', 'Dera', 'Dhaula Kuan', 'Fatehpur Beri', 'Gadaipur', 'Ghitorni', 'Green Park Market', 'Gurgaon Road', 'Hauz Khas Market', 'Hauz Khas', 'IGI Airport', 'Ignou', 'IT Hauz Khas', 'Jaunapur', 'JNU New Campus', 'JNU', 'Kapashera', 'Kidwai Nagar East', 'Kidwai Nagar West', 'Kirby Place', 'Lado Sarai', 'Laxmi Bai Nagar', 'Mahipalpur', 'Maidan Garhi', 'Malcha Marg', 'Mandi', 'Masood Pur', 'Mehrauli', 'Moti Bagh', 'Munirka', 'Nanak Pura', 'Nangal Dewat', 'Nauroji Nagar', 'Netaji Nagar South West Delhi', 'NIE Campus', 'Palam Airport', 'Paryavaran Complex', 'Pinto Park', 'R K Puram Main', 'R K Puram Sect1', 'R K Puram Sect12', 'R K Puram Sect3', 'R K Puram Sect4', 'R K Puram Sect5', 'R K Puram Sect7', 'R K Puram Sect8', 'R K Puram Sector  6 Postal SB', 'R K Puram West', 'R R Hospital', 'Rajokari', 'Safdarjung Enclave', 'Sanjay Colony Bhati Mines', 'Sarojini Nagar HO', 'Satbari', 'Shahbad Mohammadpur', 'Signal Enclave', 'South Delhi Campus', 'Station Road South West Delhi', 'Subroto Park', 'Sultanpur', 'T B Hospital', 'Technology Bhawan', 'Vasant Kunj PktA', 'Vasant Kunj', 'Vasant Vihar1', 'Vasant Vihar2', 'Amberhai', 'Arjun Park', 'Ashok Nagar (West Delhi)', 'Ashoka Park Extn.', 'Badusarai', 'Bagdola', 'Bakkarwala', 'Baprola', 'Barthal', 'Chand Nagar', 'Chaukhandi', 'Chhawla', 'CRPF Jharoda Kalan', 'D. K. Mohan Garden', 'D.E.S.U. Colony', 'Dabri', 'Daulatpur', 'Dhansa', 'Dhulsiras', 'Dichaun Kalan', 'Dindarpur', 'District Court Complex Dwarka', 'Durga Park', 'Dwarka Sec 6', 'ESI', 'Fateh Nagar', 'Galib Pur', 'GGSIP University', 'Ghuman Hera', 'Gopal Nagar', 'Hari Nagar BE Block', 'Hari Nagar Dadb Block', 'Hari Nagar (West Delhi)', 'Hastal Village', 'Hirankudna', 'Indira Park', 'Issapur', 'Jafarpur', 'Jail Road (West Delhi)', 'Janakpuri A 3', 'Janakpuri B 1', 'Janakpuri C 4', 'Janta Market', 'Jawala Heri', 'Jeevan Park', 'Jharoda Kalan', 'Jhatikara', 'Jwala Puri', 'K5 Extn. Mohan Garden', 'Kair', 'Kakrola', 'Kangan Heri', 'Karam Pura', 'Khaira', 'Khera Dabur', 'Khyala Phase    I', 'Khyala Phase   II', 'Kunwar Singh Nagar', 'L. M. Nagar Indl. Area', 'M.B.S. Nagar', 'Madipur Slum Quarter', 'Madipur Village', 'Mahabir Nagar', 'Mahavir Enclave', 'Malik Pur', 'Mansarover Garden', 'Matiala', 'Maya Puri', 'Mayapuri Shopping Centre', 'Mitraon', 'Moti Nagar', 'Mundela Kalan', 'Mundka', 'N.S.I.T. Dwarka', 'Najafgarh', 'Nangal Raya', 'Nangloi   II', 'Nangloi   III', 'Nangloi', 'Naraina Industrial Estate H.O', 'Naraina Village', 'Nasirpur', 'Neelwal', 'Nilothi', 'Palam Extn (Harijan Basti)', 'Palam Village', 'Pandwala Kalan', 'Papravat', 'Paschim Vihar B Block', 'Paschim Vihar', 'Peeragarhi', 'Punjabi Bagh', 'Punjabi Bagh Sec   III', 'Quazipur', 'Qutub Vihar', 'Raj Nagar   II', 'Rajouri Garden J 6', 'Rajouri Market', 'Ramesh Nagar H.O', 'Ranhola', 'Raota', 'Rewla Khanpur', 'Sagarpur', 'Sanjay Enclave', 'Shivaji Park (West Delhi)', 'SHYAM VIHAR', 'Subhash Nagar (West Delhi)', 'Subhash Nagar West', 'Sunder Vihar', 'Surehra', 'Tagore Garden', 'Tikri Kalan', 'Tilak Nagar East', 'Tilak Nagar (West Delhi)', 'Tilangpur Kotla', 'Ujwa', 'Uttam Nagar', 'Vikas Puri', 'Vishnu Garden', 'Zakhira']
				pincodes = ['110092', '110025', '110090', '110031', '110035', '110028', '110066', '110009', '110038', '110037', '110049', '110043', '110073', '110004', '110022', '110075', '110013', '110029', '110051', '110048', '110084', '110076', '110019', '110017', '110023', '110064', '110059', '110082', '110057', '110070', '110020', '110069', '110067', '110061', '110018', '110058', '110053', '110085', '110063', '110093', '110072', '110041', '110083', '110045', '110027', '110033', '110044', '110087', '110012', '110080', '110046', '110026', '110042', '110078', '110039', '110040', '110001', '110094', '110006', '110068', '110091', '110071', '110065', '110096', '110060', '110099', '110014', '110074', '110010', '110032', '110055', '110005', '110008', '110036', '110030', '110056', '110089', '110081', '110062', '110034', '110021', '110088', '110086', '110016', '110052', '110007', '110097', '110003', '110015', '110024', '110054', '110077', '110011', '110002', '110095', '110047']
				request.session["localities"] = localities
				request.session["pincodes"] = pincodes
				return redirect('completeprofile')
	else:
		return render(request,"home.html")


def search(request):
	user = request.session["user"]
	print(user)
	return render(request,"search.html", {'user':user})


def completeprofile(request):
	if(request.method=='POST'):
		phone = request.POST['PhoneNumber']
		apartment = request.POST['Apartment']
		locality = request.POST.getlist('Locality[]')
		pincode = request.POST.getlist('Pincode[]')
		completeProfile(request.session["username"], phone, apartment, locality[0], pincode[0])
		return redirect('search')
	else:
		return render(request,"completeprofile.html", {'localities':request.session['localities'], 'pincodes':request.session['pincodes']})

def profile(request):
	return render(request, "profile.html", {'user': request.session["user"]})

