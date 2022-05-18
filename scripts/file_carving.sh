file $flag_file
		echo "File Carving / Running Foremost"
		foremost $flag_file
		chmod -R +rwx output/
		ZIP=output/zip
		if [ -d "$ZIP" ]; then
			echo "$ZIP is a directory."
			echo "High probability of files hidden inside $flag_file!"
			echo
			echo "Please see $(pwd)/$ZIP for more info."
		fi
