'''This Is Used the Entry text in the main
	post HTML file created..
	The passed argument HTMLPAGE contains the name of the HTML
	Webpage..
'''
import os
import fileinput

f=open("post.txt", "r")
post_entry = f.read()
f.close
#print(post_entry)
#print post_entry

for line in fileinput.input('blog2.html', inplace=1):
	print line,
	if line.startswith('  <p><!--Content after this-->'):
		print post_entry

print("all done, added entry text.")