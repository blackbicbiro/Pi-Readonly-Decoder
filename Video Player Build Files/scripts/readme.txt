
#READ/Write
#By default the file system is set to Read only when booted. This is to protect the SD card from Corruption 
	#set filesystem as Read/Write
		$sudo rpi-rw			(allows files to be edited)

	#set file sytem as Read Only
		$sudo rpi-ro			(re locks file system to read only)







#Editing stream URL
#URL can be edited and stream restarted 
        $nano url.conf					(edit url in file and save)
	$sudo service videoPlayer restart		(restart player script)




	









