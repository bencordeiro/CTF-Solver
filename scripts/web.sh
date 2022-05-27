#!/bin/bash

# Script: Recurisvely search for keywords in site mirror.

############## Search -R ##############

func() {
echo
    read -p "What is the url?(input)" var_url
    wget -m $var_url
    var_url1=$(echo $var_url | cut -c 8- | rev | cut -c2- | rev)
    grep -R $var_word $var_url
    grep -R $var_word $var_url1
}

#http://saturn.picoctf.net:61941/
GET=y
    read -p "Scour mirror of a URL? (Y/n)" var_get
    [ -n "$var_get" ] && GET=$var_get

if [ $GET = y ]; then
	read -p "What is the keyword?(input)" var_word
	func
fi
########### Check for robots.txt ###########
var_bot="robots.txt"

if curl $var_url/robots.txt | grep User-agent || curl $var_url$var_bot; then
    echo "You should look in robots.txt"
else
    echo "Nothing found in robots.txt"
fi
