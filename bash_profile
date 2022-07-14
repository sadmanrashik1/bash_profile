alias s='echo 1122 | sudo -S '
alias dl='diskutil list'
alias dfu='diskutil unmountDisk force'
alias dfe='diskutil eject'
alias sshr='ssh root@192.168.1.1'
alias editb='echo 1122 | sudo -S open -a "Sublime Text" /Users/man/.bash_profile'
alias sub='open -an "Sublime Text"'
alias in='inpu'
alias ou='open -a "Sublime Text" /Users/man/Programming/cpp_PRJCTS/CPP_submit/outPutTerminal.txt'
alias i='open -a "Sublime Text" /Users/man/Movies/Programming/cpp_PRJCTS/cpp/input.txt 
sleep .4
open -a "Sublime Text" /Users/man/Movies/Programming/cpp_PRJCTS/cpp/outPutTerminal.txt'
alias dt='cd Desktop/'
alias dd='cd /Volumes/EXt/dloads2'
# alias play='find ./ -type f \( -iname \*.webm -o -iname \*.flv -o -iname \*.vob -o -iname \*.ogg -o -iname \*.ogv -o -iname \*.drc -o -iname \*.gifv -o -iname \*.mng -o -iname \*.avi -o -iname \*.mov -o -iname \*.qt -o -iname \*.wmv -o -iname \*.yuv -o -iname \*.rm -o -iname \*.rmvb  -o -iname \*.amv -o -iname \*.mp4 -o -iname \*.m4v -o -iname \*.mp* -o -iname \*.m?v -o -iname \*.svi -o -iname \*.3gp -o -iname \*.flv -o -iname \*.f4v \) -exec /Applications/VLC.app/Contents/MacOS/VLC {} +'
alias play='find  -regextype egrep -iregex '\''.*.webm|.*.flv|.*.vob|.*.ogg|.*.mov|.*.wmv|.*.rmvb|.*.mp4|.*.m4v|.*.3gp|.*.srt'\'' |  sort -V |awk '\'' {printf "\x27"$0"\x27"" "}'\'' | xargs vlc'
alias wgetm='wget_retrym'
alias o='open '
alias afix='echo 1122 | sudo -S kill $(ps aux | egrep -i '.*[c]oreaudiod.*'| awk "{print \$2}")
            echo 1122 | sudo -S kill $(ps aux | egrep -i '.*[b]oom.*'| awk "{print \$2}")
            open -a /Applications/Boom\ 3D.app/Contents/MacOS/Boom\ 3D'

alias python='python3'

alias res='echo 1122 | sudo -S shutdown -r now'
alias lsm='ls -lt --time-style="+%d-%m-%Y  %l:%M %p"'
alias and='adb connect 192.168.1.145'
alias ans='
and
sleep 1
/Applications/sndcpy-v1.1/sndcpy'
alias xc='/Applications/Xcode.app/Contents/MacOS/Xcode'
alias pt='~/ProperTree/ProperTree.command'
alias vs='./voltageshift turbo '
alias at='adb shell input keyevent KEYCODE_POWER' #toggle android display
alias bp='code /Users/man/Movies/Development/bashPractise/' #open bash practise file
alias bap='code /Users/man/Movies/Development/bashPractise/awkPractise/allChapters/' #open bash awk practise file
alias rus='s launchctl stop com.apple.usbd; s launchctl start com.apple.usbd'
alias dr='diskutil randomDisk 5 '
alias tm='transmission-remote'
alias tmr='brew services restart transmission-cli'
alias td='transmission-daemon'
alias chr='open /Applications/Autos/openChromeTestwindow.app'

# alias date='date +"%d/%m/%Y %l:%M:%S %p"'
#impbcopy converts img file to clip board



#alias sqr='/etc/init.d/squid restart'  #for router
#-----------------------------git aliases start -----------------------------
alias gi='git init'
alias gs='git status'
alias gsb='git branch'       #show branch
alias ga='git add .'
alias gc=commit
alias gu=undo 
alias gl='git log --pretty="format:%Cred<Commit>  %CgreenAuthor: %an%x09%x09%Cred%ad%x09%x09CommitHash->  %Cblue%H%n%w(0,10,0)Subject:%n%w(0,24,0)%s%n%w(0,10,0)Description:%n%w(0,24,24)%+b%n%w(0,0,0)" --date=format:%d/%m/%Y'
alias gls='git log --pretty="format:%Cred<Commit>  %CgreenAuthor: %an%x09%x09%Cred%ad%x09%x09CommitHash->  %Cblue%H%n%w(0,10,0)Subject:%n%w(0,24,0)%s%n%w(0,10,0)Description:%n%w(0,24,24)%+b%n%w(0,0,0)" --date=format:%d/%m/%Y  | sed '/^[[:space:]]*$/d''
alias gb='git checkout -b '        #new_branch_name
alias gsr='git remote -v'           #git show remote 
alias gr='git remote add origin '   #remote repo first add:use with remote_repo_url
alias gp='git push -u origin '           #local repo first push:use with local_Brance_Name
alias p='git push'           #local repo  push
alias gd='git diff'
alias gdf=difference  

function commit(){
    #Read/print the entire string 
    # a=$((($#)) && printf ' %q' "$@")
    # a="${a:1}"
    # #echo $a
    printf "Enter commit msg in single line Separated with ∆(acts as 'newline'):\n\n"
    read -e a
    execute="git commit -a"
    # Set ∆ as delimiter and make strarr array separated  by ∆
    IFS='∆'
    read -a strarr <<< "$a"

    # Print each value of the array by using the loop
    for val in "${strarr[@]}";
    do
        execute+="  -m \"$val\""
    #printf "$val\n"
done
    #echo $execute
    echo 1122 | sudo -S git add .
    eval $execute
    echo 1122 | sudo -S git push --force
}

function undo(){
    printf "How you want to undo?\n1.Soft \n2.Hard(!Choose with  caution!)\n :"
    read x
    if [ $x -eq 1 ];then
        printf "tell the way\n1.As number of last commits will be ignored?\n2.Using commit hash(commits after this one will be ignored)\n :"
        read y
        if [[ $y -eq 1 ]]; then
            printf "How many last commits?\n :"
            read z
            eval git reset HEAD~$z
        else {
            printf "Paste commit hash?\n :"
            read z
            eval git reset $z

        }
    fi

else
    printf "Irreversible Process;Progress with caution!!!\n"
    printf "tell the way\n1.As number of last last commits will be deleted permanently?\n2.Using commit hash(commits after this one will be deleted permanently)\n :"
    read y
    if [[ $y -eq 1 ]]; then
        printf "How many last commits?\n :"
        read z
        eval git reset --hard HEAD~$z
    else {
        printf "Paste commit hash?\n :"
        read z
        eval git reset --hard $z

    }
fi
fi
}
function difference(){
    # get command line arguments as string separated with space; then omit space as first char of string
    # then split the string to array elements using delimeter space
    a=$((($#)) && printf ' %q' "$@")
    a="${a:1}"
    # printf "enter initial commit and last commit separated with space:\n"
    # read -e a
    execute="git diff "
    # Set " " as delimiter and make strarr array separated  by " " 
    IFS=' '
    read -a strarr <<< "$a"

    # Print each value of the array by using the loop
    for val in "${strarr[@]}";
    do
        execute+=" $val"
        # printf "$val\n"
    done
    eval $execute

}
#-----------------------------git end-----------------------------------------------------------------------------------------------------------------------------------------

#-----------------------------functions-----------------------------------------------------------------------------------------------------------------------------------------

##cpp input into /Users/man/input.txt from terminal  to input.text
function inpu(){
    echo "paste input: "
    read -e x 
    echo $x > /Users/man/Programming/cpp_PRJCTS/CPP_submit/input.txt
    echo "saved in /Users/man/Programming/cpp_PRJCTS/CPP_submit/input.txt"
}


#backup cpp_submit with given ternmanal name to /Users/man/CppRaw/
function backup_submitted_code_with_name(){
    # printf "enter name: \n"
    # read -e myInput
    # this line catches command line arguments 
    myInput=$((($#)) && printf ' %q' "$@") 
    myInput="${myInput:1}"
    cp /Users/man/Movies/Programming/cpp_PRJCTS/cpp/cpp/main.cpp /Users/man/Movies/Programming/CppRaw/   #copy 
    mv /Users/man/Movies/Programming/CppRaw/main.cpp "/Users/man/Movies/Programming/CppRaw/$myInput.cpp"
    echo "saved in  /Users/man/Movies/Programming/CppRaw/ as: $myInput.cpp"
}
alias cpp='backup_submitted_code_with_name'


#call wgetm url ->"to get download with retry ability manual input,catch whole link via read command!!!!"
function wget_retrym(){
    cd /Volumes/Ldat/wgetm/  ##to download in wgetm!!
    #myInvocation=$((($#)) && printf ' %q' "$@") ##to get url as argument of bash shell quite unuseful as url contain many shell characters which are mis interpreted
    echo "enter url:"
    read -e myInvocation
    #echo "$myInvocation"
    while [ 0 ]; do
        wget -rkpN --no-parent -e robots=off --retry-connrefused --waitretry=0 --read-timeout=5 --timeout=5 -t 0 --continue $myInvocation
        if [ $? = 0 ]; then break; fi; # check return value, break if successful (0)
            sleep 1s;
    done;
}


#<start> find  \bword\b / words inside all readable  files of current dir ;it uses && instead of typical | of regex.

function findInsideFile(){
    a=$((($#)) && printf ' %q' "$@")
    a="${a:1}"
    # Set " " as delimiter and make strarr array separated  by " " 
    IFS=' '
    read -a strarr <<< "$a"
    execute="egrep -rwil '${strarr[0]}' ."
    # echo $execute

    # Print each value of the array by using the loop
    # get length of an array
    arraylength=${#strarr[@]}

    # use for loop to read all values and indexes
    for (( i=1; i<${arraylength}; i++ ));
    do
      # echo "index: $i, value: ${strarr[$i]}"
      execute+=" | xargs egrep -iwl '${strarr[$i]}'"
    done
  # echo $execute
  eval $execute

}

alias seek='findInsideFile'

#<start>find  single word/string in all  filenames of current dir recursively 

function findFile(){
    a=$((($#)) && printf ' %q' "$@")
    a="${a:1}"

    # execute="find -iname '*$a*'"
    execute="find  -regextype egrep -iregex '.*$a.*'"
    # echo $execute

 
    eval $execute

}
# findFile~ff
alias ff='findFile' 

#</end>#

#<start> grab full document website (e.g. regex tutorial site/etc) that needs offline acces by me (install httrack via MacPorts/apt for linux)

function grabWeb(){

    printf "enter web address: \n"
    read -e a;
    execute="httrack $a"
    # echo $execute
    eval $execute

}

alias grab='grabWeb' 
#</end>#

#<start> update grabbed website in current dir

function updateMirror(){
    httrack --update
}
alias um='updateMirror' 

#</end>#

#<start> kill pathFinder allWindows

function kpf(){
    loop=$(ps -ef  | egrep -i ".*[P]ath Finder.*" | awk '{print $2}'|awk 'END{print NR}')
    for (( c=1; c<=$loop; c++ ))
do 
  #  echo "Welcome $c times"
    open -a /Applications/Autos/closeallPfinder.app/
    sleep 3
# echo 1122 | sudo -S kill $(ps aux | egrep -i ".*[P]ath Finder.*" | awk "{print \$2}")
done
}

alias kp='kpf' 

#</end>#


#-----------------------------functions_End-----------------------------------------------------------------------------------------------------------------------------------------

##path variable

export PATH="/opt/local/libexec/gnubin/:/opt/local/bin:/opt/local/sbin:/Applications/Visual Studio Code.app/Contents/Resources/app/bin/:/Applications/VLC.app/Contents/MacOS/:$PATH"


# export MANPATH=/opt/local/share/man:$MANPATH
#shows manual page for bash builtin commands which usually needs to be accessed via help cmd

man () {
  case "$(type -t "$1"):$1" in
    builtin:*) help "$1" | "${PAGER:-less}";;     # built-in
    *[[?*]*) help "$1" | "${PAGER:-less}";;       # pattern
    *) command -p man "$@";;  # something else, presumed to be an external command
                              # or options for the man command or a section number
  esac
}

# Finished adapting your PATH environment variable for use with MacPorts.


#git autocomplete
if [ -f ~/.gitcompletion.bash ]; then
  . ~/.gitcompletion.bash
fi


# MacPorts Installer addition on 2022-06-15_at_03:48:59: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

