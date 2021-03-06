import numpy as np 
from random import randint, choice
import csv
import pandas

#*************************************** USERS *********************************************************
first_names=['Arya','Lili','Roshane', 'Kyra','Olive','Evy','Tara','Nova','Noreen', 'Azadeh',\
				'Ayden', 'Leandre', 'Syrus', 'Markus', 'Max', 'Elio', 'Theo', 'Kian', 'Zhang', 'Nima']
last_names=['Ling','Johnson','Porta','Blaese','Martinez','Patel','Aziz','Meijer','Markoski',\
			'Wilson','Watson','Rodriguez','Bianchi','Leone','Giordano']
countries=['Canada','United States','Mexico','France','Egypt','Bolivia','Vietnam','China','Italy','Russia','England','Spain']
email_tails=['@gmail.com','@yahoo.com','@mail.mcgill.ca']

name_list=[]
username_list=[]
email_list=[]
country_list=[]
birthday_list=[]
credit_info_list=[]
uid_list=[]

uid_list_prev=[]
df=pandas.read_csv("../datasets/users.csv", index_col=False, encoding='ISO-8859-1')
numRows =np.shape(df)[0]
for i in range(numRows):
	uid_list_prev.append(df['uid'][i])
print(uid_list_prev)


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


	df_dummies = pandas.DataFrame(data={"uid": uid_list, "name": name_list, "username": username_list, "country":country_list,"email":email_list, 
		"birthday":birthday_list,"credit info":credit_info_list})
	df_dummies.to_csv("../datasets/dummies.csv", sep=',',index=False)

df_dummies=pandas.read_csv("../datasets/dummies.csv", index_col=False, encoding='ISO-8859-1')
numRows =np.shape(df_dummies)[0]
for i in range(numRows):
	print(df_dummies['uid'][i])

# generateUserData(50)