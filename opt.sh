#!/bin/bash

# Variables:
output_dir=""
variant=0

# Help page:
display_help() {
	echo "Usage: $0 "
	
	echo "-m mode					Directly choose a mode"
	echo "-o output_directory		Set output directory, if none is set $0 will use current working Directory"
	echo "-h						Help Page"
}

# Do what the options do
while getopts 'ho:' opt; do
	case ${opt} in 
		i ) 
			if [ ${OPTARG:0:1} -eq 1 ]; then
				echo "1"
	        elif [ ${OPTARG:0:1} -eq 2 ]; then
				echo "2"
			elif [ ${OPTARG:0:1} -eq 3 ]; then
				echo "3"
			else
				echo "An error has occured. Please enter a number between 1 and 3. " 
			fi
			;;
		o ) 
			# Check if the output directory starts with '/'
			if [[ ${OPTARG:0:1} != "/" ]]; then
				# If it doesn't, prepend the current working directory
				output_dir="$(pwd)/${OPTARG}"
			else
				# Otherwise, just assign the provided path
				output_dir="${OPTARG}"
			fi
			;;
		h ) 
			display_help
			exit 0
			;;
	esac
done
shift $((OPTIND -1))


# Check if no options were given
if (( OPTIND == 1 )); then
	while true; do
		read -p "[1] Search by name \n[2] Seach by Video id \n[3] Download from URL \nChoose option: " variant
   read -p "Please enter a number between 1 and 3: " variant
   if (( variant >= 1 && variant <= 3 )); then
		if [ $option -eq 1 ]; then
			echo "1"
		elif [ $option -eq 2 ]; then
			echo "2"
		elif [ $option -eq 3 ]; then
			echo "3"
		else
			echo "A critical error has occured. Please contact Support immediately!"
		fi
   else
     echo "Invalid option. Please try again."
   fi
 done
fi








opt1(){
    yt-dlp -f ba --extract-audio --audio-format mp3 --format bestaudio --audio-quality 0 --add-metadata --embed-thumbnail --output "%(title)s.%(ext)s" -i https://youtube.com/watch?v=$(yt-dlp "ytsearch1:$*" --get-id)
}

opt2(){
    yt-dlp -f ba --extract-audio --audio-format mp3 --format bestaudio --audio-quality 0 --add-metadata --embed-thumbnail --output "%(title)s.%(ext)s" -i https://youtube.com/watch?v=$(yt-dlp "ytsearch1:$*" --get-id)
}

opt3(){
    yt-dlp -f ba --extract-audio --audio-format mp3 --format bestaudio --audio-quality 0 --add-metadata --embed-thumbnail --output "%(title)s.%(ext)s" -i https://youtube.com/watch?v=$(yt-dlp "ytsearch1:$*" --get-id)
}
