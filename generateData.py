import numpy as np 
import random


num= 50 #num of instances to be generated

#USERS
first_names=['Louise','Janna','Roshane', 'Kyra','Olive','Soraya','Tara','Misgana','Noreen', 'Bahar'
				'Maanav', 'Thomas', 'Sam', 'Karim', 'Max', 'Elio', 'Theo', 'Kian', 'Zhang', 'Magnus']
last_names=['Wang','Jones','Porta','Kourilsky','Garcia','Patel','Nguyen','Meijer','Markoski',\
			'Wilson','Williams','Rodriguez','D\'Angelo','Leone','Castelli']
countries=['Canada','United States','Mexico','France','Egypt','Bolivia','Vietnam','China','Italy','Russia','England','Spain']

name_list=[]
username_list=[]
country_list=[]
birthday_list=[]
credit_info_list=[]

for i in range(num):
	name=random.choice(first_names)+" "+random.choice(last_names)
	name_list.append(name)
	country_list.append(random.choice(countries))
	username= name[0:2]+str(randint(0,400))
	username_list.append()
	birthday=str(randint(1950,2007))+"-"+str(randint(1,12))+"-"+str(randint(1,29))
	birthday_list.append(birthday)
	credit_info=str(randint(1111111111111111,9999999999999999)) #16 digits credit card info
	credit_info_list.append(credit_info)
	


