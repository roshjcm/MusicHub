import numpy as np 
from random import randint, choice
import csv
import pandas

#*************************************** USERS *********************************************************
first_names=['Louise','Janna','Roshane', 'Kyra','Olive','Soraya','Tara','Misgana','Noreen', 'Bahar',\
				'Maanav', 'Thomas', 'Sam', 'Karim', 'Max', 'Elio', 'Theo', 'Kian', 'Zhang', 'Magnus']
last_names=['Wang','Jones','Porta','Kourilsky','Garcia','Patel','Nguyen','Meijer','Markoski',\
			'Wilson','Williams','Rodriguez','D\'Angelo','Leone','Castelli']
countries=['Canada','United States','Mexico','France','Egypt','Bolivia','Vietnam','China','Italy','Russia','England','Spain']
email_tails=['@gmail.com','@yahoo.com','@mail.mcgill.ca']

name_list=[]
username_list=[]
email_list=[]
country_list=[]
birthday_list=[]
credit_info_list=[]
uid_list=[]

def generateUserData(num):
	for i in range(num):
		first=choice(first_names)
		last=choice(last_names)
		name=first+" "+last
		name_list.append(name)

		email= first+"."+last+choice(email_tails)
		email_list.append(email)

		country_list.append(choice(countries))

		username= name[0:3]+str(randint(0,400))
		username_list.append(username)

		birthday=str(randint(1950,2007))+"-"+str(randint(1,12))+"-"+str(randint(1,29))
		birthday_list.append(birthday)

		credit_info=str(randint(1111111111111111,9999999999999999)) #16 digits credit card info
		credit_info_list.append(credit_info)

		uid= randint(0,400)
		while (uid in uid_list):
			uid=randint(0,400)
		uid_list.append(uid)


	df_users = pandas.DataFrame(data={"uid": uid_list, "name": name_list, "username": username_list, "country":country_list,"email":email_list, 
		"birthday":birthday_list,"credit info":credit_info_list})
	df_users.to_csv("./datasets/user.csv", sep=',',index=False)



def generateArticleID():
	# Now need to add articleID to the article.csv file
	df_articles= pandas.read_csv("./datasets/articles.csv", index_col=False, encoding='ISO-8859-1')
	numRows=np.shape(df_articles)[0]
	articleID_list=[]
	for i in range(numRows):
		articleID= randint(0,500)
		while (articleID in articleID_list):
			articleID=randint(0,500)
		articleID_list.append(articleID)
	df_articles['articleID']=articleID_list
	df_articles.to_csv('./datasets/articles.csv', index=False)

def main_menu():
	answer=-1
	print("Main Menu")
	while (not(answer==1 or answer==2)):
		print("Enter 1 to generate User data \nEnter 2 to generate Article IDs\n")
		answer=int(input())
	if (answer==1):
		print("How many users do you want?")
		num= int(input())
		generateUserData(num)
	else:
		generateArticleID()



main_menu()
