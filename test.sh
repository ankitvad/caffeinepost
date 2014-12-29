post_entry=$(<blog_entry_test.txt)
	#post_entry=$(<search.txt)
sed "2i$post_entry" search.txt > search2.txt