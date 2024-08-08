#!/bin/bash
input="templates"
while IFS= read -r line
do
	echo "Install theme $line..."

	echo "npm install jsonresume-theme-$line"
	npm install jsonresume-theme-$line
done < "$input"
npm install