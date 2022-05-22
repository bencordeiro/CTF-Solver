#!/bin/bash
# file $flag_file
# 		echo "File Carving / Running Foremost"
# 		foremost $flag_file
# 		chmod -R +rwx output/
# 		ZIP=output/zip
# 		if [ -d "$ZIP" ]; then
# 			echo "$ZIP is a directory."
# 			echo "High probability of files hidden inside $flag_file!"
# 			echo
# 			echo "Please see $(pwd)/$ZIP for more info."
# 		fi
   echo
		echo "Making a copy and decoding $flag_file with base64."
		base64 -d $flag_file | tee base64.$flag_file.txt
		#TODO -- Change this to cat base64 decoded | grep flag_form >> CTF.out
echo
ROT=y
	read -p "ROT13 String? (Y/n)" var_rot
	[ -n "var_rot" ] && ROT=$var_rot

	if [ $ROT = y ]; then
		read string_rot
		echo $string_rot | tr 'A-Za-z' 'N-ZA-Mn-za-m' | tee rot_string.out
		cat rot_string.out | grep -q $flag_form

		if [ $? -eq 0 ]; then
			exit
		fi
	else
		echo "no luck with rot13 (sad face)"
	fi
	# TODO
	# | tr 'A-Za-z' 'N-ZA-Mn-za-m'
	# | grep -oE "flag{.*}"
  
