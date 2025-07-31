#!/bin/bash

# Default values
continue_flag=false
output_dir=$(pwd)
mode=""

# Function to display help menu
show_help() {
    echo "Usage: $0 [options]"
    echo
    echo "-m mode                           Directly choose a mode"
    echo "-c                                Continue after first download and prompt again for input"
    echo "-o output_directory               Set output directory, if none is set $0 will use current working Directory"
    echo "-h                                Help Page"
    exit 0
}

# Parse command line options
while getopts ":m:co:h" opt; do
    case $opt in
        m) mode="$OPTARG" ;;
        c) continue_flag=true ;;
        o) # Check if the output directory starts with '/'
            if [[ ${OPTARG:0:1} != "/" ]]; then
                # If it doesn't, prepend the current working directory
                output_dir="$(pwd)/${OPTARG}"
            else
                # Otherwise, just assign the provided path
                output_dir="${OPTARG}"
            fi
            ;;
        h) show_help ;;
        \?) echo "Invalid option: -$OPTARG" >&2; exit 1 ;;
        :) echo "Option -$OPTARG requires an argument." >&2; exit 1 ;;
    esac
done

# Function for option 1
opt1() {
    while true; do
        read -p "Enter the name to search (or 'q' to quit): " name
        if [ "$name" = "q" ]; then
            exit 0
        fi
        echo "Searching for: $name"
        # Add your search by name logic here
        yt-dlp -f ba --extract-audio --audio-format mp3 --format bestaudio --audio-quality 0 --add-metadata --embed-thumbnail -P $output_dir --output "%(title)s.%(ext)s" -i https://youtube.com/watch?v=$(yt-dlp "ytsearch1:$name" --get-id)
        if [ "$continue_flag" = false ]; then
            break
        fi
    done
}

# Function for option 2
opt2() {
    while true; do
        read -p "Enter the Video ID (or 'q' to quit): " video_id
        if [ "$video_id" = "q" ]; then
            exit 0
        fi
        echo "Searching for Video ID: $video_id"
        # Add your search by Video ID logic here
        yt-dlp -f ba --extract-audio --audio-format mp3 --format bestaudio --audio-quality 0 --add-metadata --embed-thumbnail -P $output_dir --output "%(title)s.%(ext)s" -i https://youtube.com/watch?v=$video_id
        if [ "$continue_flag" = false ]; then
            break
        fi
    done
}

# Function for option 3
opt3() {
    while true; do
        read -p "Enter the URL (or 'q' to quit): " url
        if [ "$url" = "q" ]; then
            exit 0
        fi
        echo "Downloading from URL: $url"
        # Add your download from URL logic here
        yt-dlp -f ba --extract-audio --audio-format mp3 --format bestaudio --audio-quality 0 --add-metadata --embed-thumbnail -P $output_dir --output "%(title)s.%(ext)s" -i $url
        if [ "$continue_flag" = false ]; then
            break
        fi
    done
}

# Main script
echo "Output directory: $output_dir"
if [ -z "$mode" ]; then
    echo "Choose an option:"
    echo "1. Search by name"
    echo "2. Search by Video id"
    echo "3. Download from URL"
    read -p "Enter the number of your chosen option: " variant
else
    variant="$mode"
fi

case $variant in
    1) opt1 ;;
    2) opt2 ;;
    3) opt3 ;;
    q) exit 0 ;;
    *) echo "Invalid option. Please try again." ; exit 1 ;;
esac


