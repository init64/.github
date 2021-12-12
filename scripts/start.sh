#!/bin/sh
trap "tput reset; tput cnorm; exit" 2
clear
tput civis

echo -ne '\033]0;dxh.su\a'

w="\e[0m\e[1;38m" # white
g="\e[0;37m" # gray

text="dxh.su"

preStart()
{
    for i in {1..$(($2 / 2 - $1))}; do
        echo -n \*
    done
}

c=0

# tput sgr0; tput setaf 3

while true; do
    clear
    tc=$(tput cols)
    tl=$(tput lines)

    if [ "$c" = "0" ]
    then
        r="\e[31m"
        c=1
    elif [ "$c" = "1" ]
    then
        r="\e[38m"
        c=0
    fi

    for i in {..$(($tl / 2 - 4))}; do echo "$w "; done

    echo "$( for i in {1..$(($2 / 2 - $1))}; do echo -n \* done )$r \b__$w"
    echo "$( preStart 2 $tc )$r'_')$w"
    echo "$( preStart 1 $tc )$r\(--$w-."
    echo "$( preStart 2 $tc )$r(( )$w \b___\\"
    echo "$( preStart 5 $tc )dx $r\bh//-$w\\\\\\ \\\\\\"
    echo "\n$( preStart $(( ${#text} / 2 )) $tc  )$g$text\n"

    sleep .5
done
