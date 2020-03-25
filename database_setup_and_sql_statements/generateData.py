import numpy as np 
from random import randint, choice
import csv
import pandas

#*************************************** USERS *********************************************************
first_names=['Louise','Janna','Roshane', 'Kyra','Olive','Soraya','Tara','Misgana','Noreen', 'Bahar',\
				'Maanav', 'Thomas', 'Sam', 'Karim', 'Max', 'Elio', 'Theo', 'Kian', 'Zhang', 'Magnus']
last_names=['Wang','Jones','Porta','Kourilsky','Garcia','Patel','Nguyen','Meijer','Markoski',\
			'Wilson','Williams','Rodriguez','Angelo','Leone','Castelli']
countries=['Canada','United States','Mexico','France','Egypt','Bolivia','Vietnam','China','Italy','Russia','England','Spain']
email_tails=['@gmail.com','@yahoo.com','@mail.mcgill.ca']

name_list=[]
username_list=[]
email_list=[]
country_list=[]
birthday_list=[]
credit_info_list=[]
uid_list=[]


# ************** Generates random user data, stores it in a csv file and picks some users to be artists ********************
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
	df_users.to_csv("../datasets/users.csv", sep=',',index=False)

	#Pick n users to be the artists and assign their uid to the artists.
	artists_uid_list=[]
	df_users= pandas.read_csv("../datasets/users.csv", index_col=False, encoding='ISO-8859-1')
	df_artists= pandas.read_csv("../datasets/artists.csv", index_col=False, encoding='ISO-8859-1')
	numRows=np.shape(df_artists)[0]
	print(numRows)
	for i in range(numRows):
		artist_uid=df_users['uid'][i]
		while (artist_uid in artists_uid_list):
			artist_uid=df_users['uid'][i]
		artists_uid_list.append(artist_uid)
	print(len(artists_uid_list))
	df_artists['uid']=artists_uid_list
	df_artists.to_csv("../datasets/artists.csv", sep=',',index=False)


# ************** Generates random articleIDs ********************
def generateArticleID():
	# Now need to add articleID to the article.csv file
	df_articles= pandas.read_csv("../datasets/articles.csv", index_col=False, encoding='ISO-8859-1')
	numRows=np.shape(df_articles)[0]
	articleID_list=[]
	for i in range(numRows):
		articleID= randint(0,500)
		while (articleID in articleID_list):
			articleID=randint(0,500)
		articleID_list.append(articleID)
	df_articles['articleID']=articleID_list
	df_articles.to_csv('../datasets/articles.csv', index=False)
	
# ************** Updates the articleIDs for the albums.csv and songs.csv ********************
def updateAlbumAndSongCSV():
	df_songs= pandas.read_csv("../datasets/songs.csv", index_col=False, encoding='ISO-8859-1')
	df_albums= pandas.read_csv("../datasets/albums.csv", index_col=False, encoding='ISO-8859-1')
	df_articles= pandas.read_csv("../datasets/articles.csv", index_col=False, encoding='ISO-8859-1')

	numRows_art=np.shape(df_articles)[0]

	albumID_list=[]
	songsID_list=[]

	for i in range(numRows_art):
		if (df_articles['ISA Album'][i]==1):
			albumID=df_articles['articleID'][i]
			albumID_list.append(albumID)
		elif (df_articles['ISA Album'][i]==0):
			songID=df_articles['articleID'][i]
			songsID_list.append(songID)
	df_albums['articleID']=albumID_list
	df_albums.to_csv('../datasets/albums.csv', index=False)
	df_songs['articleID']=songsID_list
	df_songs.to_csv('../datasets/songs.csv', index=False)


# ********* Helper function to print Insert Statements **********
def helperPrintInsert(table,table_list,insert_list):
	path="../datasets/"+table+".csv"
	df=pandas.read_csv(path, index_col=False, encoding='ISO-8859-1')
	numRows,numCols =np.shape(df)
	for i in range(numRows):
		if (pandas.api.types.is_string_dtype(df.iloc[:,0])):
			values="(\'"+str(df.iat[i,0])+"\'"
		elif (pandas.api.types.is_numeric_dtype(df.iloc[:,0])):
			values="("+str(df.iat[i,0])
		for j in range(1,numCols):
			curEntry=df.iat[i,j]
			if (pandas.api.types.is_string_dtype(df.iloc[:,j])):
				values=values+",\'"+str(df.iat[i,j])+"\'"
			elif (pandas.api.types.is_numeric_dtype(df.iloc[:,j])):
				values=values+","+str(df.iat[i,j])
		values=values+");"
		print(insert_list[table_list.index(table)],values)


# *********** Function to generate insert statements for either one specific table or all tables at once ****************
def generateInsert(table):
	table_list=["users","listeners","artists","libraries","playlists","articles","albums","songs","shopping_carts",\
	"Releases","BelongsTo","ComprisesOf","IsAddedTo","IsPartOf","Contains","Uses","Creates","moneyEarned","Has","dummies"]

	insert_list=["INSERT INTO users(uid,name,username,country,email,dob,credit_info) values",\
	"INSERT INTO listeners(uid) values",\
	"INSERT INTO artists(uid,stage_name,balance) values",\
	"INSERT INTO libraries(lib_id,num_songs) values",\
	"INSERT INTO playlists(name,status,num_songs,lib_id) values",\
	"INSERT INTO articles(article_id,title,genre,release_date,price) values",\
	"INSERT INTO albums(article_id,type) values",\
	"INSERT INTO songs(article_id,duration) values",\
	"INSERT INTO shopping_carts(order_id,total_amount,num_articles) values",\
	"INSERT INTO Releases(artist_id,article_id) values",\
	"INSERT INTO BelongsTo(song_id,album_id) values",\
	"INSERT INTO ComprisesOf(lib_id,name,song_id) values",\
	"INSERT INTO IsAddedTo(lib_id,article_id) values",\
	"INSERT INTO IsPartOf(name,lib_id) values",\
	"INSERT INTO Contains(order_id, article_id) values",\
	"INSERT INTO Uses(order_id,listener_id) values",\
	"INSERT INTO Creates(listener_id,lib_id,name) values",\
	"INSERT INTO moneyEarned(artist_id,order_id,money_received) values",\
	"INSERT INTO Has(listener_id,lib_id) values",\
	"INSERT INTO users(uid,name,username,country,email,dob,credit_info) values"]

	if table=="all":
		for t in table_list:
			helperPrintInsert(t,table_list,insert_list)
			print("\n\n\n")
		return 1

	elif table in table_list:
		helperPrintInsert(table,table_list,insert_list)
		return 1

	else:
		print("Table does not exist")
		return -1



def main_menu():
	answer=-1
	print("MAIN MENU")
	while (not(answer==1 or answer==2 or answer==3)):
		print("Enter 1 to generate insert statement for a table\nEnter 2 for other data manipulations")
		answer=int(input())
	if (answer==1):
		print("Enter table name (or type q to quit):")
		table=input()
		if (table=="q"):
			print("Exiting")
		generateInsert(table)
	elif (answer==2):
		print("\nGENERATING DATA")
		print("Enter 1 to generate User data \nEnter 2 to generate Article IDs\nEnter 3 to quit")
		print("PLEASE DO NOT USE OPTION 1 unless necessary as it may break all the relation tables (not updating the IDs there yet)")
		print("Note: Option 2 will automatically update songs.csv and albums.csv with the new matching articleIDs")
		answer=int(input())
		if (answer==1):
			print("WARNING: If you do this, several INSERT statements WILL NO LONGER BE VALID")
			print("If you wish to continue, enter y. Otherwise, enter n:")
			answer=input()
			if answer==y:
				print("How many users do you want?")
				num= int(input())
				generateUserData(num)
			else: 
				print("Yep, probably safer. Exiting rn.")
		elif (answer==2):
			print("WARNING: Option 2 will automatically update songs.csv and albums.csv with the new matching articleIDs")
			print("Several INSERT statements WILL NO LONGER BE VALID")
			print("If you wish to continue, enter y. Otherwise, enter n:")
			answer=input()
			if answer=="y":
				generateArticleID()
				updateAlbumAndSongCSV()
			else: 
				print("Yep, probably safer. Exiting rn.")
		else:
			print("Successfull exit.")
	else:
		print("wrong input. Exiting.")


main_menu()



# print("Generating Credit info")
# dfu= pandas.read_csv("./datasets/users.csv", index_col=False, encoding='ISO-8859-1')
# numRows=np.shape(dfu)[0]
# credit_info_list=[]
# for i in range(numRows):
# 	credit_info=str(randint(1111111111111111,9999999999999999)) #16 digits credit card info
# 	credit_info_list.append(credit_info)
# dfu['credit info']=credit_info_list
# dfu.to_csv('./datasets/users.csv', index=False)
# credit_info_list.append(credit_info)
