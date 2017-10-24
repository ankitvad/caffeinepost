'''This is used only to add the Entry into the main
	blog.html file..
'''
import os

f=open("blog_entry_test.txt", "r")
post_entry = f.read()
f.close
#print(post_entry)

with open("blog.html","r") as f:
     data = f.read()
some_index_you_want_to_insert_at = 608
some_text_to_insert = post_entry

new_data = data[:some_index_you_want_to_insert_at] + some_text_to_insert + data[some_index_you_want_to_insert_at:]

with open("blog2.html","w") as f:
     f.write(new_data)

print ("all done, added Entry!")
