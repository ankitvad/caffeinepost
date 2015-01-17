#!/bin/bash
#CaffeinePost- A Simple Static Website Blog Generator.
#Author: Ankit Vadehra
#Version: 0.01
#Contact: ankitvad@gmail.com
#GitHub Upload..
auth(){
	git add .
	git commit -m "adding new posts"
	git push origin master
	echo -e "The File Has Been Uploaded."
}

welcome(){
	echo -e "Welcome To CaffeinePost."
	echo -e "What do you want to do today ?"
	echo -e "1.Add a Post. \n2.Edit an old Post"
	echo  "Enter Choice: "
	read choice
	#Choice For Post...
	case "$choice" in
		1) echo -e "Initialising Post and VIM.."
			add_label_post
			;;
		2) echo -e "Loading Posts.."
			edit_post
			;;
		*) echo -e "Wrong Choice Entered."
			;;
	esac
}
#Initialising a Post..
#Adding a Label and Post...
add_label_post(){
	date_entry=$(date +'%d/%m/%Y')
	echo -e "Please Enter The Post Topic: "
	read PostTopic
	echo -e "Please Enter A Brief Description: "
	read brief_description
	#Doing Everything in Small Caps and removing whitespaces..
	NOSPACETOPIC=$(echo "$PostTopic"| tr -d ' ')
	nospacesmallcaps=$(echo $NOSPACETOPIC | tr '[:upper:]' '[:lower:]')
	#cp blog_entry.txt blog_entry_test.txt;
	#creating a new post-HTMLFile..
	#header_file="<!--The HTML File Starts Here-->"
	#echo $header_file >> "$nospacesmallcaps.html"
	#Adding The Date:
	sed "5i$date_entry" blog_entry.txt > blog_entry_test.txt
	cp blog_entry_test.txt blog_entry_test2.txt
	#Adding The URL...
	sed "10i$nospacesmallcaps.html" blog_entry_test2.txt > blog_entry_test.txt
	cp blog_entry_test.txt blog_entry_test2.txt
	#Adding The Post Topic:
	sed "13i$PostTopic" blog_entry_test2.txt > blog_entry_test.txt
	cp blog_entry_test.txt blog_entry_test2.txt
	#Adding The Brief Description...
	sed "17i$brief_description" blog_entry_test2.txt > blog_entry_test.txt
	cp blog_entry_test.txt blog_entry_test2.txt
	#Adding the New Post in Main Blog.HTML.. YOLO!!
	
######SOME ERROR HERE...!!! DUNNO!!! :?
##Hence Moving TO Awesome Python. YOO.!
	python3 writepost.py
	echo -e "Now Moving For The Original Post."
	#post_entry=$(<blog_entry_test.txt)
	#post_entry=$(<search.txt)
	#sed "22i$post_entry" blog.html > blog2.html

###OK after here...	

	cp blog2.html blog.html
	
	#Now to write the original Post and stuff..
	#cp post.html "$nospacesmallcaps.html"
	cp post.html blog2.html
	#Adding The Title for the Post..
	sed "21i$PostTopic" blog2.html > "$nospacesmallcaps.html"
	cp "$nospacesmallcaps.html" blog2.html
	#Adding the Date:
	sed "24i$date_entry" blog2.html > "$nospacesmallcaps.html"
	cp "$nospacesmallcaps.html" blog2.html
	#Now Opening Up VIM to save the post..
	#HTMLPAGE="$nospacesmallcaps.html"
	vim post.txt
	#Switching to python for post-entry as well so as to
	#ensure all syntax entry's.. "sed" failed me man..
	#Really Sad...
	python writepostentry.py
	cp blog2.html "$nospacesmallcaps.html"
	#POST=$(<post.txt)
	#Now Adding The stuff in the HTML File..
	#sed "27i$POST" blog2.html > "$nospacesmallcaps.html"
	#Removing Post.txt for next time.
	echo -e "Cleaning Up Temporary Files.."
	rm post.txt
	rm blog2.html
	rm blog_entry_test.txt
	rm blog_entry_test2.txt

}
edit_post(){
	echo -e "Have'nt Still Loaded the Edit Part.. Gotta Individually Edit That :/"
}
#Initialise the Script...
welcome
#auth