import numpy as np 
from random import randint, choice
import csv
import pandas


num= 50 #num of instances to be generated

#USERS
first_names=['Louise','Janna','Roshane', 'Kyra','Olive','Soraya','Tara','Misgana','Noreen', 'Bahar'
				'Maanav', 'Thomas', 'Sam', 'Karim', 'Max', 'Elio', 'Theo', 'Kian', 'Zhang', 'Magnus']
last_names=['Wang','Jones','Porta','Kourilsky','Garcia','Patel','Nguyen','Meijer','Markoski',\
			'Wilson','Williams','Rodriguez','D\'Angelo','Leone','Castelli']
countries=['Canada','United States','Mexico','France','Egypt','Bolivia','Vietnam','China','Italy','Russia','England','Spain']
email_tails=['@gmail.com',"@yahoo.com","@aol.com","@mail.mcgill.ca"]

name_list=[]
username_list=[]
email_list=[]
country_list=[]
birthday_list=[]
credit_info_list=[]
uid_list=[]

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

# with open('user.csv', 'w') as myfile:
#      wr = csv.writer(myfile, quoting=csv.QUOTE_ALL)
#      wr.writecolumn(mylist)

df = pandas.DataFrame(data={"uid": uid_list, "name": name_list, "username": username_list, "country":country_list,"email":email_list, 
	"birthday":birthday_list,"credit info":credit_info_list})
df.to_csv("./user.csv", sep=',',index=False)
