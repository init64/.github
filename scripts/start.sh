# dxh.su
trap "tput reset; tput cnorm; exit" 2
clear
tput civis

echo -ne '\033]0;dxh.su\a'

w="\e[0m\e[1;38m" # white
g="\e[0;37m" # gray

text="kek"

preStart()
{
    for i in {1..$(($2 / 2 - $1))}; do
        echo -ne " ";
    done
}

c=0

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

    printf "\n$( preStart 2 $tc ) $r \b__$w"
    printf "\n$( preStart 4 $tc )  $r'_')$w"
    printf "\n$( preStart 10 $tc )         $r\(--$w-."
    printf "\n$( preStart 14 $tc )            $r(( )$w \b___\\"
    printf "\n$( preStart 11 $tc )      dx $r\bh//-$w\\\\\\ \\\\\\"
    printf "\n\n$( preStart $(( ${#text} / 2 )) $tc  )$g$text\n"

    sleep .5
done
