import numpy as np 
import random


num= 50 #num of instances to be generated

#USERS
first_names=['Louise','Janna','Roshane', 'Kyra','Olive','Soraya','Tara','Misgana','Noreen', 'Bahar'
				'Maanav', 'Thomas', 'Sam', 'Karim', 'Max', 'Elio', 'Theo', 'Kian', 'Zhang', 'Magnus']
last_names=['Wang','Jones','Porta','Kourilsky','Garcia','Patel','Nguyen','Meijer','Markoski',\
			'Wilson','Williams','Rodriguez','D\'Angelo','Leone','Castelli']

name_list=[]
for i in range(num):
	name=random.choice(first_names)+" "+random.choice(last_names)
	name_list.append(name)

print(name_list)


username_list=[]
for i in range(num):
	username= name_list[i][0:2]+str(randint(0,400))
	username_list.append()

countries=['Canada','United States','Mexico','France','Egypt','Bolivia','Vietnam','China','Italy','Russia','England','Spain']
country_list
for i in range(num):
	country_list.append(random.choice(countries))

birthday_list=[]
for i in range(num):
	birthday=str(randint(1950,2007))+"-"+str(randint(1,12))+"-"+str(randint(1,29))
	birthday_list.append(birthday)