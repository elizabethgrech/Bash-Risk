#!/bin/bash
########################################################################
###### Created by Elizabeth Grech
###### Date Created: March 31, 2016
###### Purpose: Bash version of the$rISK board game
########################################################################
###### TODO:
######      1) md5sum for integrity
######      
######      
########################################################################
######      INDEX:
######            Variable Declaration
######            Functions
######            Start Logic
######            
######            
######            
########################################################################
#-----------------------------------------------------------------------Variable Declaration
#--------------------Non Game logic specific setup---------------------#
#-----Colors
BLACK='\033[0;30m'
DARKGRAY='\033[1;30m'
RED='\033[0;31m'
LIGHTRED='\033[1;31m'
GREEN='\033[0;32m'
LIGHTGREEN='\033[1;32m'
BROWNORANGE='\033[0;33m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
LIGHTBLUE='\033[1;34m'
PURPLE='\033[0;35m'
LIGHTPURPLE='\033[1;35m'
CYAN='\033[0;36m'
LIGHTCYAN='\033[1;36m'
LIGHTGRAY='\033[0;37m'
WHITE='\033[1;37m'
NOCOLOR='\033[0m'
#-----Mission Selections
mission1="World Domination!!!"
mission2="Secret Mission."
#----------------------------------------------------------------------#




gamename=""
gamefile=""


numberoftotalplayers=0
playerturnfinished=false
chosenmission="World Domination!!!"

declare -a playhistory

for i in {0..51}; do 
  playhistory+=("               ")
done

#-------Player Map-------#
#--index--|--description-#
#----0----|--userid------##echo -e "currentplayer[0] = ${currentplayer[0]}"
#----1----|--User Name---##echo -e "currentplayer[1] = ${currentplayer[1]}"
#----2----|--User Color--##echo -e "currentplayer[1] = ${currentplayer[2]}"
#----3----|--Phase-------##echo -e "currentplayer[1] = ${currentplayer[3]}"
#----4----|--Avail Troops##echo -e "currentplayer[1] = ${currentplayer[4]}"
#----x----|--xxxxxxxxxxx-#
#------------------------#
declare -a currentplayer
#test player crap
currentplayer+=(1234)
currentplayer+=("Liz")
currentplayer+=(${BLUE})
currentplayer+=("Attack!")
currentplayer+=(7)

#-----------------------Troup count per teritory-----------------------#
#-----------------------
#-----NORTHAMERICA
#-----------------------
declare -a northamerica

NAcolorboarder="${RED}"
NAcolortroops="${LIGHTGRAY}"


NAdrawtopxxx="${NAcolorboarder}____${NOCOLOR}"
NAdrawsidexx="${NAcolorboarder}|${NOCOLOR}"
NAdrawbottom="${NAcolorboarder}¯¯¯¯${NOCOLOR}"

r1x="${NAcolortroops}0000${NOCOLOR}"
r2x="${NAcolortroops}0000${NOCOLOR}"
r3x="${NAcolortroops}0000${NOCOLOR}"
r4x="${NAcolortroops}0000${NOCOLOR}"
r5x="${NAcolortroops}0000${NOCOLOR}"
r6x="${NAcolortroops}0000${NOCOLOR}"
r7x="${NAcolortroops}0000${NOCOLOR}"
r8x="${NAcolortroops}0000${NOCOLOR}"
r9x="${NAcolortroops}0000${NOCOLOR}"

#-----------------------
#-----SOUTHAMERICA
#-----------------------
declare -a southamerica

SAcolorboarder="${YELLOW}"
SAcolortroops="${LIGHTGRAY}"


SAdrawtopxxx="${SAcolorboarder}____${NOCOLOR}"
SAdrawsidexx="${SAcolorboarder}|${NOCOLOR}"
SAdrawbottom="${SAcolorboarder}¯¯¯¯${NOCOLOR}"

d1x="${SAcolortroops}0000${NOCOLOR}"
d2x="${SAcolortroops}0000${NOCOLOR}"
d3x="${SAcolortroops}0000${NOCOLOR}"
d4x="${SAcolortroops}0000${NOCOLOR}"
#-----------------------
#-----EUROPE
#-----------------------
declare -a europe

EUcolorboarder="${CYAN}"
EUcolortroops="${LIGHTGRAY}"

EUdrawtopxxx="${EUcolorboarder}____${NOCOLOR}"
EUdrawsidexx="${EUcolorboarder}|${NOCOLOR}"
EUdrawbottom="${EUcolorboarder}¯¯¯¯${NOCOLOR}"

b1x="${EUcolortroops}0000${NOCOLOR}"
b2x="${EUcolortroops}0000${NOCOLOR}"
b3x="${EUcolortroops}0000${NOCOLOR}"
b4x="${EUcolortroops}0000${NOCOLOR}"
b5x="${EUcolortroops}0000${NOCOLOR}"
b6x="${EUcolortroops}0000${NOCOLOR}"
b7x="${EUcolortroops}0000${NOCOLOR}"
#-----------------------
#-----AFRICA
#-----------------------
declare -a africa

AFcolorboarder="${BROWNORANGE}"
AFcolortroops="${LIGHTGRAY}"


AFdrawtopxxx="${AFcolorboarder}____${NOCOLOR}"
AFdrawsidexx="${AFcolorboarder}|${NOCOLOR}"
AFdrawbottom="${AFcolorboarder}¯¯¯¯${NOCOLOR}"

o1x="${AFcolortroops}0000${NOCOLOR}"
o2x="${AFcolortroops}0000${NOCOLOR}"
o3x="${AFcolortroops}0000${NOCOLOR}"
o4x="${AFcolortroops}0000${NOCOLOR}"
o5x="${AFcolortroops}0000${NOCOLOR}"
o6x="${AFcolortroops}0000${NOCOLOR}"
#-----------------------
#-----ASIA
#-----------------------
declare -a asia

AScolorboarder="${PURPLE}"
AScolortroops="${LIGHTGRAY}"


ASdrawtopxxx="${AScolorboarder}____${NOCOLOR}"
ASdrawsidexx="${AScolorboarder}|${NOCOLOR}"
ASdrawbottom="${AScolorboarder}¯¯¯¯${NOCOLOR}"

p1x="${AScolortroops}0000${NOCOLOR}"
p2x="${AScolortroops}0000${NOCOLOR}"
p3x="${AScolortroops}0000${NOCOLOR}"
p4x="${AScolortroops}0000${NOCOLOR}"
p5x="${AScolortroops}0000${NOCOLOR}"
p6x="${AScolortroops}0000${NOCOLOR}"
p7x="${AScolortroops}0000${NOCOLOR}"
p8x="${AScolortroops}0000${NOCOLOR}"
p9x="${AScolortroops}0000${NOCOLOR}"
p10="${AScolortroops}0000${NOCOLOR}"
p11="${AScolortroops}0000${NOCOLOR}"
p12="${AScolortroops}0000${NOCOLOR}"
#-----------------------
#-----AUSTRALIA
#-----------------------
declare -a australia

AUcolorboarder="${GREEN}"
AUcolortroops="${LIGHTGRAY}"


AUdrawtopxxx="${AUcolorboarder}____${NOCOLOR}"
AUdrawsidexx="${AUcolorboarder}|${NOCOLOR}"
AUdrawbottom="${AUcolorboarder}¯¯¯¯${NOCOLOR}"

g1x="${AUcolortroops}0000${NOCOLOR}"
g2x="${AUcolortroops}0000${NOCOLOR}"
g3x="${AUcolortroops}0000${NOCOLOR}"
g4x="${AUcolortroops}0000${NOCOLOR}"
#----------------------------------------------------------------------#

bonusarmies=0

numberofinfantry=0


playercurrentphase=0




#-----------------------------------------------------------------------Functions
check_arguments_v4up ()
{
  while [[ $# -gt 0 ]]
  do
     case $1 in
      -create)
         setup_screen
         #create risk world file
         #--read in "game file name"
         shift
         filename=""
         filename=$1
         filecheck=0
         #--Check for current game with same file
         if [[ -e $filename ]]; then
           echo "Game already exists do you want to overwrite?"
           read userin
           if [ ${userin^^}=="YES" ] || [ ${userin^^}=="Y"]; then
             filecheck=0
           else
             filecheck=1
           fi
         fi
         ;;
      -status)
         #Return the satus of a game
         welcomeback_screen
         ;;
      -myturn)
         #Enter your turn
         welcomeback_screen
         ;;
      *)
         #dono yet
         echo "dono yet"
         ;;
      esac
      shift
  done
}

check_arguments_prev4 ()
{
  echo "check_arguments_ prev4"
  read instuff
  while [[ $# -gt 0 ]]
  do
     case $1 in
      -create)
         setup_screen
         #create risk world file
         #--read in "game file name"
         shift
         filename=""
         filename=$1
         filecheck=0
         #--Check for current game with same file
         if [[ -e $filename ]]; then
           echo "Game already exists do you want to overwrite?"
           read userin
           
           #get userin to uppercase

           if [ ${userin^^}=="YES" ] || [ ${userin^^}=="Y"]; then
             filecheck=0
           else
             filecheck=1
           fi
         fi
         ;;
      -status)
         #Return the satus of a game
         ;;
      -myturn)
         #Enter your turn
         ;;
      *)
         #dono yet
         ;;
      esac
      shift
  done
}

game_init_setup()
{
  #-- startup Armies logic --#
  case $numberoftotalplayers in
    2)
       numberofinfantry=40
       ;;
    3)
       numberofinfantry=35
       ;;
    4)
       numberofinfantry=30
       ;;
    5)
       numberofinfantry=25
       ;;
    6)
       numberofinfantry=20
       ;;
    *)
       ;;
  esac
}

game_upkeep ()
{
  #-- Contenent Armies logic --#
  case $currentContenent in
    ASIA)
       bonusarmies+=7
       ;;
    NORTHAMERICA)
       bonusarmies+=5
       ;;
    EUROPE)
       bonusarmies+=5
       ;;
    AFRICA)
       bonusarmies+=3
       ;;
    AUSTRALIA)
       bonusarmies+=2
       ;;
    SOUTHAMERICA)
       bonusarmies+=2
       ;;
    *)
       ;;
  esac
}

player_turn ()
{

for (( j = 0; j < 10; j++ )); do
  echo "Messin around with stuff 10 times. time: $j"
  read inhist
  shuffle_playhistory
  inhist_length=${#inhist}
  for (( i = 0; i < 15-${inhist_length}; i++ )); do
    inhist+=" "
  done
  playhistory[0]=${inhist:0:15}
  draw_map
done
}

shuffle_playhistory ()
{
  for (( i = 51; i >= 0; i-- )); do
    playhistory[$i]=${playhistory[$i-1]}
  done
}

roll_die ()
{
  dsize=6
  roll=$RANDOM
}


splash_screen ()
{
  printf "\033[2J"
  echo -e "|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|"
  echo -e "|                                                                                                                              |"
  echo -e "|                     _____                    _____                    _____                    _____                         |"
  echo -e "|                    /\    \                  /\    \                  /\    \                  /\    \                        |"
  echo -e "|                   /::\    \                /::\    \                /::\    \                /::\____\                       |"
  echo -e "|                  /::::\    \               \:::\    \              /::::\    \              /:::/    /                       |"
  echo -e "|                 /::::::\    \               \:::\    \            /::::::\    \            /:::/    /                        |"
  echo -e "|                /:::/\:::\    \               \:::\    \          /:::/\:::\    \          /:::/    /                         |"
  echo -e "|               /:::/__\:::\    \               \:::\    \        /:::/__\:::\    \        /:::/____/                          |"
  echo -e "|              /::::\   \:::\    \              /::::\    \       \:::\   \:::\    \      /::::\    \                          |"
  echo -e "|             /::::::\   \:::\    \    ____    /::::::\    \    ___\:::\   \:::\    \    /::::::\____\________                 |"
  echo -e "|            /:::/\:::\   \:::\____\  /\   \  /:::/\:::\    \  /\   \:::\   \:::\    \  /:::/\:::::::::::\    \                |"
  echo -e "|           /:::/  \:::\   \:::|    |/::\   \/:::/  \:::\____\/::\   \:::\   \:::\____\/:::/  |:::::::::::\____\               |"
  echo -e "|           \::/   |::::\  /:::|____|\:::\  /:::/    \::/    /\:::\   \:::\   \::/    /\::/   |::|~~~|~~~~~                    |"
  echo -e "|            \/____|:::::\/:::/    /  \:::\/:::/    / \/____/  \:::\   \:::\   \/____/  \/____|::|   |                         |"
  echo -e "|                  |:::::::::/    /    \::::::/    /            \:::\   \:::\    \            |::|   |                         |"
  echo -e "|                  |::|\::::/    /      \::::/____/              \:::\   \:::\____\           |::|   |                         |"
  echo -e "|                  |::| \::/____/        \:::\    \               \:::\  /:::/    /           |::|   |                         |"
  echo -e "|                  |::|  ~|               \:::\    \               \:::\/:::/    /            |::|   |                         |"
  echo -e "|                  |::|   |                \:::\    \               \::::::/    /             |::|   |                         |"
  echo -e "|                  \::|   |                 \:::\____\               \::::/    /              \::|   |                         |"
  echo -e "|                   \:|   |                  \::/    /                \::/    /                \:|   |                         |"
  echo -e "|                    \|___|                   \/____/                  \/____/                  \|___|                         |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo    "|                                                                                                                              |"
  echo    "|                                                                                                                              |"
  echo    "|                                                          ______   _                            ,___                          |"
  echo    "|                                           Created by:   (  /     //o           /    _/_ /     /   /          /               |"
  echo -e "|                                                           /--   //,  __, __,  /  _  /  /_    /  ___   _  _, /_               |"
  echo -e "|                                                         (/____/(/_(_/_/_(_/(_/_)(/_(__/ /_  (___// (_(/_(__/ /_              |"
  echo -e "|                                                                     (/                                                       |"
  echo -e "|                                                                                                                              |"
  echo -e "|______________________________________________________________________________________________________________________________|"
  sleep 3
}



setup_screen ()
{
  printf "\033[2J"
  echo -e "|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|"
  echo -e "|                                                                                                                              |"
  echo -e "|                     _____                    _____                    _____                    _____                         |"
  echo -e "|                    /\    \                  /\    \                  /\    \                  /\    \                        |"
  echo -e "|                   /::\    \                /::\    \                /::\    \                /::\____\                       |"
  echo -e "|                  /::::\    \               \:::\    \              /::::\    \              /:::/    /                       |"
  echo -e "|                 /::::::\    \               \:::\    \            /::::::\    \            /:::/    /                        |"
  echo -e "|                /:::/\:::\    \               \:::\    \          /:::/\:::\    \          /:::/    /                         |"
  echo -e "|               /:::/__\:::\    \               \:::\    \        /:::/__\:::\    \        /:::/____/                          |"
  echo -e "|              /::::\   \:::\    \              /::::\    \       \:::\   \:::\    \      /::::\    \                          |"
  echo -e "|             /::::::\   \:::\    \    ____    /::::::\    \    ___\:::\   \:::\    \    /::::::\____\________                 |"
  echo -e "|            /:::/\:::\   \:::\____\  /\   \  /:::/\:::\    \  /\   \:::\   \:::\    \  /:::/\:::::::::::\    \                |"
  echo -e "|           /:::/  \:::\   \:::|    |/::\   \/:::/  \:::\____\/::\   \:::\   \:::\____\/:::/  |:::::::::::\____\               |"
  echo -e "|           \::/   |::::\  /:::|____|\:::\  /:::/    \::/    /\:::\   \:::\   \::/    /\::/   |::|~~~|~~~~~                    |"
  echo -e "|            \/____|:::::\/:::/    /  \:::\/:::/    / \/____/  \:::\   \:::\   \/____/  \/____|::|   |                         |"
  echo -e "|                  |:::::::::/    /    \::::::/    /            \:::\   \:::\    \            |::|   |                         |"
  echo -e "|                  |::|\::::/    /      \::::/____/              \:::\   \:::\____\           |::|   |                         |"
  echo -e "|                  |::| \::/____/        \:::\    \               \:::\  /:::/    /           |::|   |                         |"
  echo -e "|                  |::|  ~|               \:::\    \               \:::\/:::/    /            |::|   |                         |"
  echo -e "|                  |::|   |                \:::\    \               \::::::/    /             |::|   |                         |"
  echo -e "|                  \::|   |                 \:::\____\               \::::/    /              \::|   |                         |"
  echo -e "|                   \:|   |                  \::/    /                \::/    /                \:|   |                         |"
  echo -e "|                    \|___|                   \/____/                  \/____/                  \|___|                         |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                         Welcome! Please select your setup:                                                                   |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                   2   3   4   5   6                                                          |"
  echo -e "|                              Number of players:  [ ] [ ] [ ] [ ] [ ]                                                         |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                             World Domination!!!      Secret Mission.       Quick Game Setup                  |"
  echo -e "|                              Game Mode:           [   ]                  [   ]                  [   ]                        |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo    "|                                                                                                                              |"
  echo    "|                                                                                                                              |"
  echo    "|                                                          ______   _                            ,___                          |"
  echo    "|                                           Created by:   (  /     //o           /    _/_ /     /   /          /               |"
  echo -e "|                                                           /--   //,  __, __,  /  _  /  /_    /  ___   _  _, /_               |"
  echo -e "|                                                         (/____/(/_(_/_/_(_/(_/_)(/_(__/ /_  (___// (_(/_(__/ /_              |"
  echo -e "|                                                                     (/                                                       |"
  echo -e "|                                                                                                                              |"
  echo -e "|______________________________________________________________________________________________________________________________|"
}


welcomeback_screen ()
{
  printf "\033[2J"
  echo -e "|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|"
  echo -e "|                                                                                                                              |"
  echo -e "|                     _____                    _____                    _____                    _____                         |"
  echo -e "|                    /\    \                  /\    \                  /\    \                  /\    \                        |"
  echo -e "|                   /::\    \                /::\    \                /::\    \                /::\____\                       |"
  echo -e "|                  /::::\    \               \:::\    \              /::::\    \              /:::/    /                       |"
  echo -e "|                 /::::::\    \               \:::\    \            /::::::\    \            /:::/    /                        |"
  echo -e "|                /:::/\:::\    \               \:::\    \          /:::/\:::\    \          /:::/    /                         |"
  echo -e "|               /:::/__\:::\    \               \:::\    \        /:::/__\:::\    \        /:::/____/                          |"
  echo -e "|              /::::\   \:::\    \              /::::\    \       \:::\   \:::\    \      /::::\    \                          |"
  echo -e "|             /::::::\   \:::\    \    ____    /::::::\    \    ___\:::\   \:::\    \    /::::::\____\________                 |"
  echo -e "|            /:::/\:::\   \:::\____\  /\   \  /:::/\:::\    \  /\   \:::\   \:::\    \  /:::/\:::::::::::\    \                |"
  echo -e "|           /:::/  \:::\   \:::|    |/::\   \/:::/  \:::\____\/::\   \:::\   \:::\____\/:::/  |:::::::::::\____\               |"
  echo -e "|           \::/   |::::\  /:::|____|\:::\  /:::/    \::/    /\:::\   \:::\   \::/    /\::/   |::|~~~|~~~~~                    |"
  echo -e "|            \/____|:::::\/:::/    /  \:::\/:::/    / \/____/  \:::\   \:::\   \/____/  \/____|::|   |                         |"
  echo -e "|                  |:::::::::/    /    \::::::/    /            \:::\   \:::\    \            |::|   |                         |"
  echo -e "|                  |::|\::::/    /      \::::/____/              \:::\   \:::\____\           |::|   |                         |"
  echo -e "|                  |::| \::/____/        \:::\    \               \:::\  /:::/    /           |::|   |                         |"
  echo -e "|                  |::|  ~|               \:::\    \               \:::\/:::/    /            |::|   |                         |"
  echo -e "|                  |::|   |                \:::\    \               \::::::/    /             |::|   |                         |"
  echo -e "|                  \::|   |                 \:::\____\               \::::/    /              \::|   |                         |"
  echo -e "|                   \:|   |                  \::/    /                \::/    /                \:|   |                         |"
  echo -e "|                    \|___|                   \/____/                  \/____/                  \|___|                         |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|   __          __  _                            ____             _                                                            |"
  echo -e "|   \ \        / / | |                          |  _ \           | |                                                           |"
  echo -e "|    \ \  /\  / /__| | ___ ___  _ __ ___   ___  | |_) | __ _  ___| | __                                                        |"
  echo -e "|     \ \/  \/ / _ \ |/ __/ _ \| '_ \` _ \ / _ \ |  _ < / _\` |/ __| |/ /                                                        |"
  echo -e "|      \  /\  /  __/ | (_| (_) | | | | | |  __/ | |_) | (_| | (__|   < _ _ _                                                   |"
  echo -e "|       \/  \/ \___|_|\___\___/|_| |_| |_|\___| |____/ \__,_|\___|_|\_(_|_|_)                                                  |"
  echo -e "|            _                     _ _                _____                          _      _____                              |"
  echo -e "|           | |                   | (_)              / ____|                        | |    / ____|                             |"
  echo -e "|           | |     ___   __ _  __| |_ _ __   __ _  | |    _   _ _ __ _ __ ___ _ __ | |_  | |  __  __ _ _ __ ___   ___         |"
  echo -e "|           | |    / _ \ / _\` |/ _\` | | '_ \ / _\` | | |   | | | | '__| '__/ _ \ '_ \| __| | | |_ |/ _\` | '_ \` _ \ / _ \        |"
  echo -e "|           | |___| (_) | (_| | (_| | | | | | (_| | | |___| |_| | |  | | |  __/ | | | |_  | |__| | (_| | | | | | |  __/_ _ _   |"
  echo -e "|           |______\___/ \__,_|\__,_|_|_| |_|\__, |  \_____\__,_|_|  |_|  \___|_| |_|\__|  \_____|\__,_|_| |_| |_|\___(_|_|_)  |"
  echo -e "|                                             __/ |                                                                            |"
  echo -e "|                                            |___/                                                                             |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo    "|                                                                                                                              |"
  echo    "|                                                                                                                              |"
  echo    "|                                                          ______   _                            ,___                          |"
  echo    "|                                           Created by:   (  /     //o           /    _/_ /     /   /          /               |"
  echo -e "|                                                           /--   //,  __, __,  /  _  /  /_    /  ___   _  _, /_               |"
  echo -e "|                                                         (/____/(/_(_/_/_(_/(_/_)(/_(__/ /_  (___// (_(/_(__/ /_              |"
  echo -e "|                                                                     (/                                                       |"
  echo -e "|                                                                                                                              |"
  echo -e "|______________________________________________________________________________________________________________________________|"
  sleep 2
}


draw_map ()
{
  #-- Map display --#
  #line totals = 112 charachters
  #half = 56 charachters
  mapstatusline1="|  Current Player: ${currentplayer[1]}"
  mapstatusline2="|  Player Phase: ${currentplayer[3]}"
  mapstatusline3="|  Number of available troops to deploy: ${currentplayer[4]}"
  
  mapstatusline4="|  Mission Objective: ${chosenmission}"
  mapstatusline5="|  Message Slot 5"
  mapstatusline6="|  Message Slot 6"
  
  mapstatuslength1=${#mapstatusline1}-1
  mapstatuslength2=${#mapstatusline2}-1
  mapstatuslength3=${#mapstatusline3}-1
  
  mapstatuslength4=${#mapstatusline4}
  mapstatuslength5=${#mapstatusline5}
  mapstatuslength6=${#mapstatusline6}
  
  for (( i = 0; i < 56-${mapstatuslength1}; i++ )); do
    mapstatusline1+=" "
  done
  for (( i = 0; i < 56-${mapstatuslength2}; i++ )); do
    mapstatusline2+=" "
  done
  for (( i = 0; i < 56-${mapstatuslength3}; i++ )); do
    #echo "i:$i"
    mapstatusline3+=" "
  done
  
  
  for (( i = 0; i < 56-${mapstatuslength4}; i++ )); do
    mapstatusline4+=" "
  done
  for (( i = 0; i < 56-${mapstatuslength5}; i++ )); do
    mapstatusline5+=" "
  done
  for (( i = 0; i < 56-${mapstatuslength6}; i++ )); do
    #echo "i:$i"
    mapstatusline6+=" "
  done
  
  mapstatusline4+="|"
  mapstatusline5+="|"
  mapstatusline6+="|"
  
  
  
  printf "\033[2J"
  echo -e "|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|"
  echo -e "|      ##############                                                                                          |    History    |"
  echo -e "|      #NORTHAMERICA#                                                                                          |_______________|"
  echo -e "|      ##############                                                                                          |${playhistory[51]}|"
  echo -e "|   $NAdrawtopxxx    $NAdrawtopxxx    $NAdrawtopxxx    $NAdrawtopxxx                                                                               |${playhistory[50]}|"
  echo -e "|  $NAdrawsidexx$r1x$NAdrawsidexx--$NAdrawsidexx$r2x$NAdrawsidexx--$NAdrawsidexx$r3x$NAdrawsidexx--$NAdrawsidexx$r4x$NAdrawsidexx                                  $ASdrawtopxxx                                        |${playhistory[49]}|"
  echo -e "|  |$NAdrawbottom    $NAdrawbottom    $NAdrawbottom    $NAdrawbottom ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯\        $ASdrawsidexx$p2x$ASdrawsidexx       ##############                  |${playhistory[48]}|"
  echo -e "|  |  \    /    \  /    \    /                            \        $ASdrawbottom        #    ASIA    #                  |${playhistory[47]}|"
  echo -e "|  |   $NAdrawtopxxx     $NAdrawtopxxx     $NAdrawtopxxx                              \      /   \        ##############                  |${playhistory[46]}|"
  echo -e "|  |  $NAdrawsidexx$r5x$NAdrawsidexx---$NAdrawsidexx$r6x$NAdrawsidexx---$NAdrawsidexx$r7x$NAdrawsidexx                              \ $ASdrawtopxxx     $ASdrawtopxxx               $ASdrawtopxxx     $ASdrawtopxxx        |${playhistory[45]}|"
  echo -e "|  |   $NAdrawbottom     $NAdrawbottom     $NAdrawbottom                                $ASdrawsidexx$p1x$ASdrawsidexx---$ASdrawsidexx$p3x$ASdrawsidexx-------------$ASdrawsidexx$p4x$ASdrawsidexx---$ASdrawsidexx$p5x$ASdrawsidexx       |${playhistory[44]}|"
  echo -e "|  |      \    /    \    /                                    $ASdrawbottom\   /$ASdrawbottom              /$ASdrawbottom\    $ASdrawbottom ¯¯¯\   |${playhistory[43]}|"
  echo -e "|  |       $NAdrawtopxxx      $NAdrawtopxxx                                      |   \ /  |           /¯¯¯¯  |   ¯\    |      |  |${playhistory[42]}|"
  echo -e "|  |      $NAdrawsidexx$r8x$NAdrawsidexx----$NAdrawsidexx$r9x$NAdrawsidexx                                     |  $ASdrawtopxxx  |          /      $ASdrawtopxxx   \ $ASdrawtopxxx     |  |${playhistory[41]}|"
  echo -e "|  |       $NAdrawbottom      $NAdrawbottom\                                     | $ASdrawsidexx$p6x$ASdrawsidexx |     /¯¯¯¯      $ASdrawsidexx$p9x$ASdrawsidexx---$ASdrawsidexx$p10$ASdrawsidexx    |  |${playhistory[40]}|"
  echo -e "|  |                      \                                    |  $ASdrawbottom  |    /          / $ASdrawbottom\    $ASdrawbottom     |  |${playhistory[39]}|"
  echo -e "|  |                       \                                   |   ||   |   /      $ASdrawtopxxx/   |   ¯\    |      |  |${playhistory[38]}|"
  echo -e "|  |                        \                                 $ASdrawtopxxx/  \ $ASdrawtopxxx/   /¯¯$ASdrawsidexx$p8x$ASdrawsidexx   |     \ $ASdrawtopxxx     |  |${playhistory[37]}|"
  echo -e "|  |                         \                               $ASdrawsidexx$p11$ASdrawsidexx---$ASdrawsidexx$p7x$ASdrawsidexx  /    $ASdrawbottom    |      $ASdrawsidexx$p12$ASdrawsidexx    |  |${playhistory[36]}|"
  echo -e "|  |                          \                               $ASdrawbottom     $ASdrawbottom ¯¯       |     |      /$ASdrawbottom/    |  |${playhistory[35]}|"
  echo -e "|  |                           \                                                     |     |     /    /     |  |${playhistory[34]}|"
  echo -e "|  |                            \      ##############                                |     |    /    /     /   |${playhistory[33]}|"
  echo -e "|  |                             \     #   EUROPE   #                                |     |   /    /     /    |${playhistory[32]}|"
  echo -e "|  |$SAdrawtopxxx     $SAdrawtopxxx                 \    ##############                                |     |  /    /     /     |${playhistory[31]}|"
  echo -e "|  $SAdrawsidexx$d1x$SAdrawsidexx---$SAdrawsidexx$d2x$SAdrawsidexx                 |$EUdrawtopxxx    $EUdrawtopxxx    $EUdrawtopxxx                             |     | /    /     /      |${playhistory[30]}|"
  echo -e "|   $SAdrawbottom   / $SAdrawbottom                  $EUdrawsidexx$b1x$EUdrawsidexx--$EUdrawsidexx$b2x$EUdrawsidexx--$EUdrawsidexx$b3x$EUdrawsidexx ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯    /     /       |${playhistory[29]}|"
  echo -e "|    |    /   |                     $EUdrawbottom    $EUdrawbottom    $EUdrawbottom                                        /     /        |${playhistory[28]}|"
  echo -e "|   $SAdrawtopxxx /   $SAdrawtopxxx                     \    /   \   /    \                                      /     /         |${playhistory[27]}|"
  echo -e "|  $SAdrawsidexx$d3x$SAdrawsidexx---$SAdrawsidexx$d4x$SAdrawsidexx                     $EUdrawtopxxx     $EUdrawtopxxx    $EUdrawtopxxx                                  /     /          |${playhistory[26]}|"
  echo -e "|   $SAdrawbottom     $SAdrawbottom                     $EUdrawsidexx$b4x$EUdrawsidexx---$EUdrawsidexx$b5x$EUdrawsidexx--$EUdrawsidexx$b6x$EUdrawsidexx ¯¯¯\                           /     /           |${playhistory[25]}|"
  echo -e "|    ##############                    $EUdrawbottom\    $EUdrawbottom   /$EUdrawbottom|     \                         /     /            |${playhistory[24]}|"
  echo -e "|    #SOUTHAMERICA#                         \    |    /     |      |                       /     /             |${playhistory[23]}|"
  echo -e "|    ##############                          \ $EUdrawtopxxx  /      |      |                      /     /              |${playhistory[22]}|"
  echo -e "|                                             $EUdrawsidexx$b7x$EUdrawsidexx        |      |                     /     |               |${playhistory[21]}|"
  echo -e "|                                              $EUdrawbottom\        |      |                    /      |               |${playhistory[20]}|"
  echo -e "|                                                   \       |      |                   /       |$AUdrawtopxxx    $AUdrawtopxxx   |${playhistory[19]}|"
  echo -e "|                                                    \   $AFdrawtopxxx     $AFdrawtopxxx                /        $AUdrawsidexx$g1x$AUdrawsidexx--$AUdrawsidexx$g2x$AUdrawsidexx  |${playhistory[18]}|"
  echo -e "|                                                     ¯¯$AFdrawsidexx$o1x$AFdrawsidexx---$AFdrawsidexx$o2x$AFdrawsidexx--------------/          $AUdrawbottom\  /$AUdrawbottom   |${playhistory[17]}|"
  echo -e "|                                                        $AFdrawbottom\    $AFdrawbottom              /            |   \/   |    |${playhistory[16]}|"
  echo -e "|   ####################                                  |   ¯\   |               /             |   /\   |    |${playhistory[15]}|"
  echo -e "|   #      Legend      #                                 $AFdrawtopxxx   \ $AFdrawtopxxx            /             $AUdrawtopxxx/  \ $AUdrawtopxxx  |${playhistory[14]}|"
  echo -e "|   ####################                                $AFdrawsidexx$o3x$AFdrawsidexx---$AFdrawsidexx$o4x$AFdrawsidexx ¯¯¯¯¯¯¯¯¯¯             $AUdrawsidexx$g3x$AUdrawsidexx---$AUdrawsidexx$g4x$AUdrawsidexx |${playhistory[13]}|"
  echo -e "|   # ${NAcolorboarder}NORTHAMERICA - 5${NOCOLOR} #                                 $AFdrawbottom    /$AFdrawbottom                          $AUdrawbottom     $AUdrawbottom  |${playhistory[12]}|"
  echo -e "|   # ${SAcolorboarder}SOUTHAMERICA - 2${NOCOLOR} #                                  |    /¯  |                           ##############  |${playhistory[11]}|"
  echo -e "|   # ${EUcolorboarder}      EUROPE - 5${NOCOLOR} #                                 $AFdrawtopxxx/¯   $AFdrawtopxxx                         #  AUSTRALIA #  |${playhistory[10]}|"
  echo -e "|   # ${AFcolorboarder}      AFRICA - 3${NOCOLOR} #                                $AFdrawsidexx$o5x$AFdrawsidexx---$AFdrawsidexx$o6x$AFdrawsidexx                        ##############  |${playhistory[9]}|"
  echo -e "|   # ${AScolorboarder}        ASIA - 7${NOCOLOR} #                                 $AFdrawbottom     $AFdrawbottom                                         |${playhistory[8]}|"
  echo -e "|   # ${AUcolorboarder}   AUSTRALIA - 2${NOCOLOR} #                                ##############                                         |${playhistory[7]}|"
  echo -e "|   ####################                                #   AFRICA   #                                         |${playhistory[6]}|"
  echo -e "|                                                       ##############                                         |${playhistory[5]}|"
  echo -e "|______________________________________________________________________________________________________________|${playhistory[4]}|"
  echo    "|                                                                                                              |${playhistory[3]}|"
  echo    "$mapstatusline1$mapstatusline4${playhistory[2]}|"
  echo    "$mapstatusline2$mapstatusline5${playhistory[1]}|"
  echo    "$mapstatusline3$mapstatusline6${playhistory[0]}|"
  echo -e "|______________________________________________________________________________________________________________|_______________|"
  echo -e "|                                                      Available Actions                                                       |"
  echo -e "|¯¯¯¯¯¯|¯¯¯¯¯¯¯¯|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|"
  echo -e "| Move | Attack |                                                                                                              |"
  echo -e "|______|________|______________________________________________________________________________________________________________|"
}


exit_message ()
{
  printf "\033[2J"
  echo -e "|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                     Thanks for Playing                                                                                       |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                            Your turn is now finished                                                         |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                     check back to see the status of the game                 |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                    or to take your next turn                                                 |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|       risk.sh                                                                                                                |"
  echo -e "|                    -status                                                                                                   |"
  echo -e "|                                                                                                                              |"
  echo -e "|                    -taketurn                                                                                                 |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                               .                                              |"
  echo -e "|                                                                              / \                                             |"
  echo -e "|                                                                              | |                                             |"
  echo -e "|                                                                              |.|                                             |"
  echo -e "|                                                                              |.|                                             |"
  echo -e "|                                                                              |:|      __                                     |"
  echo -e "|                                                                            ,_|:|_,   /  )                                    |"
  echo -e "|                                                                              (Oo    / _I_                                    |"
  echo -e "|                                                                               +\ \  || __|                                   |"
  echo -e "|                                                                                  \ \||___|                                   |"
  echo -e "|                                                                                    \ /.:.\-\                                 |"
  echo -e "|                                                                                     |.:. /-----\                             |"
  echo -e "|                                                                                     |___|::oOo::|                            |"
  echo -e "|                                                                                     /   |:<_T_>:|                            |"
  echo -e "|                                                                                    |_____\ ::: /                             |"
  echo -e "|                                                                                     | |  \ \:/                               |"
  echo    "|                                                                                     | |   | |                                |"
  echo    "|                                                                                     \ /   | \__                              |"
  echo    "|                                                                                     / |   \____\                             |"
  echo    "|                                                                                     \`-'                                      |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|                                                                                                                              |"
  echo -e "|______________________________________________________________________________________________________________________________|"
}
#-----------------------------------------------------------------------Start Logic
clear

splash_screen

#----------------------------Argument logic----------------------------#

if [[ ${BASH_VERSION%%[^0-9]*}==4 ]]; then
  echo "check_arguments_ v4up"
  check_arguments_v4up $*
else
  echo "check_arguments_ prev4"
  check_arguments_prev4 $*
fi

#-----------------------------Logic note area--------------------------#



while [[ true ]]; do
  draw_map
  player_turn
  if [[ playerturnfinished ]]; then
    exit_message
    exit
  fi
done



#-----------------------------------------------------------------------Testing Area
#-----Colors
#BLACK='\033[0;30m'
#DARKGRAY='\033[1;30m'
#RED='\033[0;31m'
#LIGHTRED='\033[1;31m'
#GREEN='\033[0;32m'
#LIGHTGREEN='\033[1;32m'
#BROWNORANGE='\033[0;33m'
#YELLOW='\033[1;33m'
#BLUE='\033[0;34m'
#LIGHTBLUE='\033[1;34m'
#PURPLE='\033[0;35m'
#LIGHTPURPLE='\033[1;35m'
#CYAN='\033[0;36m'
#LIGHTCYAN='\033[1;36m'
#LIGHTGRAY='\033[0;37m'
#WHITE='\033[1;37m'
#NOCOLOR='\033[0m'

echo -ne "  ${BLACK}BLACK#######${NOCOLOR}"
echo -ne "  ${DARKGRAY}DARKGRAY#######${NOCOLOR}"
echo -ne "  ${RED}RED#######${NOCOLOR}"
echo -ne "  ${LIGHTRED}LIGHTRED#######${NOCOLOR}"
echo -ne "  ${GREEN}GREEN#######${NOCOLOR}"
echo -ne "  ${LIGHTGREEN}LIGHTGREEN#######${NOCOLOR}"
echo -ne "  ${BROWNORANGE}BROWNORANGE#######${NOCOLOR}"
echo -ne "  ${YELLOW}YELLOW#######${NOCOLOR}"
echo -ne "  ${BLUE}BLUE#######${NOCOLOR}"
echo -ne "  ${LIGHTBLUE}LIGHTBLUE#######${NOCOLOR}"
echo -ne "  ${PURPLE}PURPLE#######${NOCOLOR}"
echo -ne "  ${LIGHTPURPLE}LIGHTPURPL#######${NOCOLOR}"
echo -ne "  ${CYAN}CYAN#######${NOCOLOR}"
echo -ne "  ${LIGHTCYAN}LIGHTCYAN#######${NOCOLOR}"
echo -ne "  ${LIGHTGRAY}LIGHTGRAY#######${NOCOLOR}"
echo -e "  ${WHITE}WHITE#######${NOCOLOR}"



exit


























#NORTHAMERICA
# ____    ____    ____    ____ 
#|$r1 |--|$r2 |--|$r3 |--|$r4 |
# ¯¯¯¯    ¯¯¯¯    ¯¯¯¯    ¯¯¯¯ 
#   \    /    \  /    \    /   
#    ____     ____     ____    
#   |$r5 |---|$r6 |---|$r7 |   
#    ¯¯¯¯     ¯¯¯¯     ¯¯¯¯    
#       \    /    \    /       
#        ____      ____        
#       |$r8 |----|$r9 |       
#        ¯¯¯¯      ¯¯¯¯        

#SOUTHAMERICA
# ____     ____ 
#| d1 |---| d2 |
# ¯¯¯¯   / ¯¯¯¯ 
#  |    /   |   
# ____ /    ____
#| d3 |---| d4 |
# ¯¯¯¯     ¯¯¯¯ 


#EUROPE
# ____    ____    ____     
#| b1 |--| b2 |--| b3 |    
# ¯¯¯¯    ¯¯¯¯    ¯¯¯¯     
#   \    /   \   /    \    
#    ____     ____    ____ 
#   | b4 |---| b5 |--| b6 |
#    ¯¯¯¯\    ¯¯¯¯   /¯¯¯¯ 
#         \    |    /      
#          \ ____  /       
#           | b7 |¯        
#            ¯¯¯¯          


#AFRICA
# ____     ____ 
#| o1 |---| o2 |
# ¯¯¯¯\    ¯¯¯¯ 
#  |   ¯\   |   
# ____   ¯\____ 
#| o3 |---| o4 |
# ¯¯¯¯    /¯¯¯¯ 
#  |    /¯  |   
# ____/¯   ____ 
#| o5 |---| o6 |
# ¯¯¯¯     ¯¯¯¯ 



#ASIA
#      ____                                 
#     | p2 |                                
#      ¯¯¯¯                                 
#     /   \                                 
# ____     ____               ____     ____ 
#| p1 |---| p3 |-------------| p4 |---| p5 |
# ¯¯¯¯\   /¯¯¯¯              /¯¯¯¯\    ¯¯¯¯ 
#  |   \ /  |           /¯¯¯¯  |   ¯\    |  
#  |  ____  |          /      ____   ¯\____ 
#  | | p6 | |     /¯¯¯¯      | p9 |---| p10|
#  |  ¯¯¯¯  |    /          / ¯¯¯¯\    ¯¯¯¯ 
#  |   / \  |   /      ____/       ¯\    |  
# ____/   \____/   /¯¯| p8 |         ¯\____ 
#| p11|---| p7 |  /    ¯¯¯¯           | p12|
# ¯¯¯¯     ¯¯¯¯ ¯¯                     ¯¯¯¯ 



#AUSTRALIA
# ____    ____ 
#| G1 |--| G2 |
# ¯¯¯¯\  /¯¯¯¯ 
#  |   \/   |  
#  |   /\   |  
# ____/  \____ 
#| G3 |--| G4 |
# ¯¯¯¯    ¯¯¯¯ 






#Special Characters 
#                  
#     ¯            
#                  
#     ‾‾           
#                  
#                  
#                  



#-- Map display PRISTINE --#
#                                                                                                          
#    ##############                                                                                        
#    #NORTHAMERICA#                                                                                        
#    ##############                                                                                        
# ____    ____    ____    ____                                                                             
#|$r1x|--|$r2x|--|$r3x|--|$r4x|                                  ____                                      
#|¯¯¯¯    ¯¯¯¯    ¯¯¯¯    ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯\       |$p2x|       ##############                
#|  \    /    \  /    \    /                             \       ¯¯¯¯        #    ASIA    #                
#|   ____     ____     ____                               \     /   \        ##############                
#|  |$r5x|---|$r6x|---|$r7x|                               \____     ____               ____     ____      
#|   ¯¯¯¯     ¯¯¯¯     ¯¯¯¯                                |$p1x|---|$p3x|-------------|$p4x|---|$p5x|     
#|      \    /    \    /                                    ¯¯¯¯\   /¯¯¯¯              /¯¯¯¯\    ¯¯¯¯¯¯¯¯\ 
#|       ____      ____                                      |   \ /  |           /¯¯¯¯  |   ¯\    |      |
#|      |$r8x|----|$r9x|                                     |  ____  |          /      ____   ¯\____     |
#|       ¯¯¯¯      ¯¯¯¯\                                     | |$p6x| |     /¯¯¯¯      |$p9x|---|$p10|    |
#|                      \                                    |  ¯¯¯¯  |    /          / ¯¯¯¯\    ¯¯¯¯     |
#|                       \                                   |   / \  |   /      ____/   |   ¯\    |      |
#|                        \                                 ____/   \____/   /¯¯|$p8x|   |     ¯\____     |
#|                         \                               |$p11|---|$p7x|  /    ¯¯¯¯    |      |$p12|    |
#|                          \                               ¯¯¯¯     ¯¯¯¯ ¯¯       |     |      /¯¯¯¯/    |
#|                           \                                                     |     |     /    /     |
#|                            \      ##############                                |     |    /    /     / 
#|                             \     #   EUROPE   #                                |     |   /    /     /  
#|____     ____                 \    ##############                                |     |  /    /     /   
#|$d1x|---|$d2x|                 |____    ____    ____                             |     | /    /     /    
# ¯¯¯¯   / ¯¯¯¯                  |$b1x|--|$b2x|--|$b3x|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯    /     /     
#  |    /   |                     ¯¯¯¯    ¯¯¯¯    ¯¯¯¯                                        /     /      
# ____ /    ____                    \    /   \   /    \                                      /     /       
#|$d3x|---|$d4x|                     ____     ____    ____                                  /     /        
# ¯¯¯¯     ¯¯¯¯                     |$b4x|---|$b5x|--|$b6x|¯¯¯¯\                           /     /         
#  ##############                    ¯¯¯¯\    ¯¯¯¯   /¯¯¯¯|     \                         /     /          
#  #SOUTHAMERICA#                         \    |    /     |      |                       /     /           
#  ##############                          \ ____  /      |      |                      /     /            
#                                           |$b7x|¯       |      |                     /     |             
#                                            ¯¯¯¯\        |      |                    /      |             
#                                                 \       |      |                   /       |____    ____ 
#                                                  \   ____     ____                /        |$G1x|--|$G2x|
#                                                   ¯¯|$o1x|---|$o2x|--------------/          ¯¯¯¯\  /¯¯¯¯ 
#                                                      ¯¯¯¯\    ¯¯¯¯              /            |   \/   |  
# ####################                                  |   ¯\   |               /             |   /\   |  
# #      Legend      #                                 ____   ¯\____            /             ____/  \____ 
# ####################                                |$o3x|---|$o4x|¯¯¯¯¯¯¯¯¯¯¯             |$G3x|--|$G4x|
# # NORTHAMERICA - 5 #                                 ¯¯¯¯    /¯¯¯¯                          ¯¯¯¯    ¯¯¯¯ 
# # SOUTHAMERICA - 2 #                                  |    /¯  |                           ##############
# #       EUROPE - 5 #                                 ____/¯   ____                         #  AUSTRALIA #
# #       AFRICA - 3 #                                |$o5x|---|$o6x|                        ##############
# #         ASIA - 7 #                                 ¯¯¯¯     ¯¯¯¯                                       
# #    AUSTRALIA - 2 #                                ##############                                       
# ####################                                #   AFRICA   #                                       
#                                                     ##############                                       
#                                                                                                          


