############################################################################### Un-Aliases
###############################################################################
unalias todo

unalias gr

unalias cdb

unalias gam

# unalias gcl

unalias c

unalias gb

unalias gi

# unalias e

unalias gra

unalias gbd

unalias sd

# unalias gg

unalias ga

unalias d

unalias s

unalias gst

# unalias lc

unalias sf

# unalias cd > /dev/null 2> /dev/null

unalias lsg

unalias ls

unalias rm


# Web Shortcuts/Bookmarks
alias q="question"

source $DOTFILES_HOME/bookmarks.zsh
source $DOTFILES_HOME/work_bookmarks.zsh

alias rd="rubydoc"

alias wk="wiki"

alias gg="google"


# Hashes
###############################################################################

hash -d robin="$PROG_HOME"

hash -d rby="$RUBY_HOME"

hash -d dotfiles="$DOTFILES_HOME"

hash -d javascript="$JS_HOME"

hash -d html-css="$HTMLCSS_HOME"


# Aliases
###############################################################################

# Global aliases
# alias -g p="prog"
#
# alias -g r="rby"
#
# alias -g d="dotfiles"
#
# alias -g css="html-css"
#
# alias -g L='| less'
#
# alias -g NUL="> /dev/null 2>&1"
#
# alias -g pr="practice"
#
# alias -g pro="projects"

# Hash aliases
alias js="javascript"


# GNU aliases
alias mv="gmv"

alias gecho="echo"

alias gegrep="gegrep"

alias grep="ggrep"

alias find="gfind"

alias sed="gsed"

alias ls="/usr/local/bin/gls --color"

alias cat="gcat"

alias awk="gawk"

alias "echo"="gecho"

# Shell Aliases
alias cwd="pwd"

alias lsltr="ls -ltr --color=none | awk '{print \$9}' | tail +2"

alias dt="date"

alias crl="crontab -l"

alias cre="crontab -e"

alias less='less -m -N -g -i -J --underline-special --SILENT'

alias more='less'

alias mkdir='mkdir -pv'

alias wh="which"

alias w="which"

alias chr="chrome"

alias lsl="ls -l"

alias isgit="show_git"

alias isg="isgit"

alias igi="isgit"

alias shell="echo $SHELL"

alias cdcocos="cd_dir $COCOS_HOME"

# Shell shortcuts
alias sshkey="cat ~/.ssh/id_rsa.pub | pbcopy"

alias rkls="rake each_sub['echo, quiet']"

alias cdgam="cd_dir $GAM_PATH"

alias cdrec="cd_dir $RECEIPTS_HOME"

alias strash="du -dh $TRASH_HOME"

alias mcol="$EDITOR $DOTFILES_HOME/colors.zsh"

alias syslog="tail -f /var/log/system.log"

# Applications/Tools
alias mvim="mvim -p"

alias sc="scala"

alias scc="scalac"

alias tran="trans :tl"

alias lessc="$LESSC_PATH"

alias lc="lessc"

alias book="safari"

alias firefoxp="/Applications/Firefox.app/Contents/MacOS/firefox-bin -p"

alias ffp="firefoxp"

alias firefoxr="/Applications/Firefox.app/Contents/MacOS/firefox-bin -p Robin &"

alias ffr="firefoxr"

alias firefoxc="/Applications/Firefox.app/Contents/MacOS/firefox-bin -p Cloudreach &"

alias ffc="firefoxc"

alias adobe="$ADOBE_PATH"

alias m="$EDITOR"

alias gimp="/Applications/GIMP.app/Contents/MacOS/GIMP-bin"

alias sublime="'/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl'"

# Navigation
alias cdd="cd_dir $DOTFILES_HOME"

alias cddocs="cd_dir $DOCS_HOME"

alias cdegr="/Users/msl/Programming/robin/sh/practice/egrep"

alias cdmr="cd_dir $RUBY_HOME/projects/mrrobinsmith.com"

alias cdbp="cd_dir $MRROBINSMITHCOM_HOME/public/blogposts"

alias cdq="cd_dir $RUBY_HOME/projects/quiz"

alias cdp2="cd_dir $PY_HOME/python2"

alias cdp3="cd_dir $PY_HOME/python3"

alias cdrk="cd_dir $RAKEFILE_HOME"

alias cdl="cd_dir $LOCAL_HOME"

alias cdw="cd_dir $WORK_HOME"

alias cdwr="cd_dir $WORK_RUBY_HOME"

alias cdwp="cd_dir $WORK_PYTHON_HOME"

alias cdjpr="cd_dir $JS_HOME practice"

alias cdrecipe="cd_dir $HTMLCSS_HOME/projects/recipe-finder"

alias cdscr="cd_dir $SCREENSHOTS_HOME"

alias cdcam="cd_dir '$CAMERA_HOME'"

alias cdt="cd $TRASH_HOME"

alias cddr="cd ~/Google\ Drive"

alias cdk="cd_dir $KITCHENPLAN_HOME"

alias cddl="cd_dir ~/Downloads"

alias cdmv="cd_dir ~/Movies"

alias cdaws="cd_dir `dirname $AWS_CONFIG`"

alias cdm="cd_dir $JS_HOME/projects"

alias cdmb="cd_dir $JS_HOME/projects/mobile-app-cordova"

alias cdg="cd_dir $JS_HOME/projects/mobile-game-cocos"

# Development operations
alias rgm="rvm_gem_list"

alias crv="cat .ruby-version"

alias crg="cat .ruby-gemset"

alias rgfl="rm Gemfile.lock"

alias gib="gem install bundler"

alias rge="rvm gemset empty"

alias rgl="rvm gemset list"

alias rvu="rvm use"

alias rgu="rvm gemset use"

alias rgc="rvm gemset create"

alias rgd="rvm gemset delete"

alias rvl="rvm list"

alias mrdb="psql -U msl -d mrrobinsmith_development"

alias rsc="rails console"

alias plrk="cd rake; green 'Git-pulling rake ...'; git pull origin master; cd - > /dev/null"

alias svrk="cd rake; green 'Rake-saving rake ...'; rake save; cd - > /dev/null"

alias rktr="rake each_sub['echo, quiet']"

alias rkser="rake_do server"

alias rls="rails server"

alias rkm="rake_do db:migrate"

alias rkt="rake_do test"

alias rkr="rake routes"

alias rkss="rake sub_sort"

alias rk="rake"

alias gnb="gem install bundler && bundle install"

alias gib="gem install bundler"

alias gi="gem install"

alias bi="bundle install"

alias bu="bundle update"

alias save="rake -f $GLOBAL_RAKEFILE_HOME/Rakefile save_code"

#alias rksr="rake -f $RAKEFILE_HOME/Rakefile save"

alias rkrn="rake run"

alias rkd="rake_do deploy"

alias rkp="rake_do pull"

alias rkup="rakeup"

alias rkdn="rakedown"

alias fbu="fabup"

alias fbd="fabdown"

alias anew="new_s awk awk"

alias pnew="new_s python py"

alias bnew="new_s bash sh"

alias snew="new_s sh sh"

alias onew="new_s ocaml ml"

alias znew="new_s zsh zsh"

# alias rnew="new -i ruby -e rb -o noopen -f"

alias jnew="jsnew"

alias cssnew="new -i '' -e css -f"

alias tnew="new -i '' -e txt -f"

alias demo="open $MOBILEAPP_HOME/www/index.html"

alias up2="pythonbrew use 2.7"

alias up3="pythonbrew use 3.2"

alias p2="~/.pythonbrew/pythons/Python-2.7/bin/python"

alias p3="~/.pythonbrew/pythons/Python-3.2/bin/python3"

alias pbrew="pythonbrew"

alias cen="count_non_empty $DOTFILES_HOME/env_variables.zsh"

alias cal="count_non_empty $DOTFILES_HOME/aliases.zsh"

alias cfn="cat $DOTFILES_HOME/functions.zsh"

# alias lfn='grep -o "function [a-zA-Z0-9_]* "'$DOTFILES_HOME/functions.zsh'| awk ''{print $2}'' | grep ''.*'''

# Git aliases
alias grH="git reset HEAD"

alias gas="git add *"

alias gst="git status"

alias gSt="git stash"

alias grrm="git remote rm"

alias gin="git init"

alias gRm="git rm -r --cached"

alias grm="git remote"

alias gbd="git branch develop && git checkout develop"

alias gbx="git branch -d"

alias gbm="git branch master && git checkout master	"

alias gch="git checkout"

alias gb="git branch"

alias gcmr="git submodule foreach 'git checkout master'"

alias gsf="git submodule foreach"

alias gpd="git push origin develop"

alias gpm="git push origin master"

alias gpld="git push origin develop"

alias gplm="git push origin master"

alias gcm="git checkout master"

alias gcmm="git commit -m"

alias gcd="git checkout develop"

alias ga="git add"

alias gsi="git submodule init"

alias gsu="git submodule update --init --recursive"

alias gsa="git submodule add"

alias cgm="cat .gitmodules"

alias gra="git remote add"

alias grao="git remote add origin"

alias gpom="git push origin master"

alias gplom="git pull origin master"

alias gsr="git submodule add git@bitbucket.org:robinrob/rakefile.git rake && ln -s rake/Rakefile Rakefile"

# Development operations
alias ccr="cocos run -p web"

alias pl="cd_pull"

alias st="cd_status"

alias sv="cd_save"

alias dpl="cd_pull $DOTFILES_HOME"

alias dsv="save_crontab; save_jetbrains; cd_save $DOTFILES_HOME"

alias dcm="cd_commit $DOTFILES_HOME"

alias ddi="cd_diff $DOTFILES_HOME"

alias dst="cd_status $DOTFILES_HOME"

repo_cmds

alias DSV="dsv"

alias fpl="fab pull"

alias bsv="cd_save $BACKUPS_HOME"

alias bpl="cd_pull $BACKUPS_HOME"

alias lpl="cd_pull $LOCAL_HOME"

alias lsv="cd_save $LOCAL_HOME"

alias lst="cd_status $LOCAL_HOME"

alias qpl="cd_pull $QUIZ_HOME"

alias qsv="cd_save $QUIZ_HOME"

# Chef
alias kel="knife environment list"

alias knl="knife node list"

# Viewing and editing files
alias toread="cat $LISTS_HOME/to_read.txt"

alias mtoread="m $LISTS_HOME/to_read.txt"

alias mbrew="$EDITOR $DOTFILES_HOME/homebrew.txt"

alias cbrew="cat $DOTFILES_HOME/homebrew.txt"

alias mprompt="$EDITOR ~/.zsh.prompts/prompt_robin_setup.zsh"

alias mpr="mprompt"

alias rs="source ~/.zshrc"

alias rsen="source $DOTFILES_HOME/env_variables.zsh"

alias rsfn="source $DOTFILES_HOME/functions.zsh"

alias rsal="source $DOTFILES_HOME/aliases.zsh"

alias RS="source ~/.zshrc"

alias save="rake -f $GLOBAL_RAKEFILE_HOME/Rakefile save_code"

alias vconf="vim ~/.ssh/config"

alias mssh="$EDITOR ~/.ssh/config"

alias mvrc="$EDITOR ~/.vimrc"

alias cvrc="cat ~/.vimrc"

alias mrvm="$EDITOR ~/.rvmrc"

alias mrvmrc="$EDITOR .rvmrc"

alias mconf="mssh"

alias essh="edit ~/.ssh/config"

alias ess="edit ~/.ssh/config"

alias econf="edit ~/.ssh/config"

alias vzsh="vim ~/.zshrc"

alias mzsh="$EDITOR ~/.zshrc"

alias ezsh="edit ~/.zshrc"

alias ezs="ezsh"

alias czsh="cat ~/.zshrc"

alias mbk="m $DOTFILES_HOME/bookmarks.zsh"

alias cbk="cat $DOTFILES_HOME/bookmarks.zsh"

alias mwbk="m $DOTFILES_HOME/work_bookmarks.zsh"

alias edit=$EDITOR

alias conf="$EDITOR ~/.ssh/config"

alias maws="$EDITOR $AWS_CONFIG"

alias caws="cat $AWS_CONFIG"

alias eaws="$EDITOR $AWS_CONFIG"

alias reminderrobin="reminder robin@mrrobinsmith.com"

alias reminderwork="reminder robin.smith@cloudreach.co.uk"

alias tagalog="cd_dir $QUIZ_HOME && ./quiz.rb -f $QUIZ_HOME/tagalog.csv -t 10 -g 3"

alias capitals="cd $QUIZ_HOME && ./quiz.rb -f $QUIZ_HOME/capitals.csv -t 10 -g 3"

alias erec="$EDITOR $RECORDS_PATH"

alias cms="edit $DOCS_HOME/commands.txt"

alias password="ruby $RUBY_HOME/projects/rbpassword/rbpassword.rb"

alias rnsall="cd $SCREENSHOTS_HOME && despace"

alias mal="$EDITOR $DOTFILES_HOME/aliases.zsh"

alias men="$EDITOR $DOTFILES_HOME/env_variables.zsh"

alias mfn="$EDITOR $DOTFILES_HOME/functions.zsh"

alias t="touch"

alias mmutt="$EDITOR ~/.mutt/muttrc"

alias gl="git log"

alias t2="t22"

alias t3="t3389"

alias jl="jsonlint"

alias bcodes="cat $IMPORTANT_HOME/passwords/Backup-codes-robin.smith.txt"

alias gcl="git clone"

alias cmd="$EDITOR $TEMP_HOME/commands.txt"

alias window="open /Users/robinsmith/Dropbox/Camera\ Uploads/gif/window.gif"

alias emptytrash="sudo rm -rf ~/.Trash/*"

alias cgi="cat .gitignore"

alias px="chmod +x"

alias mx="chmod -x"

alias kud="knife_upload_databag"

alias kne="knife node edit --editor vim"

alias kee="knife environment edit --editor vim"

alias rki="rake install"

alias fbs="fab save"

alias fcl="fab clean"

alias cgc="cat ~/.gitconfig"

alias mrd="m README.md"

alias crd="cat README.md"

alias mrk="$EDITOR Rakefile"

alias crk="cat Rakefile"

alias mgf="$EDITOR Gemfile"

alias cgf="cat Gemfile"

alias mgfl="$EDITOR Gemfile.lock"

alias cgfl="cat Gemfile.lock"

alias mgi="$EDITOR .gitignore"

alias mgm="$EDITOR .gitmodules"

alias egi="$EDITOR .gitignore"

alias ecmd="$EDITOR $DOCS_HOME/commands.txt"

alias cmd="$EDITOR $DOCS_HOME/commands.txt"

alias e="echo"

alias v=$VISUAL

alias sprog="du -dh $PROG_HOME"

alias spr="sprog"

alias sd="du -dh"

alias erk="edit rakefile"

alias rkct="rake count_all"

alias mkd="mkdir"

alias plane="copy_print NQFLIZ"

alias gclm="git clone -b master"

alias gclb="git clone -b "

alias cdrc="cd '$RECEIPTS_HOME'"

alias cdrp="cdrc"

alias c="cat"

alias pb="pbcopy"

alias splq="$EDITOR ${SPLUNK_HOME}/splunk_searches.txt"

# Shell functions/function aliases
alias b="browser"

alias killa="killp"

alias brew="nbrew"

alias bkmk="bookmark"

alias wbkmk="work_bookmark"

alias rbdoc="rubydoc"

alias svc="save_code"

alias lbf="libfind_s"

alias rfind="libfind_s $RUBY_HOME/practice"

alias ofind="libfind_s $OCAML_HOME"

alias pfind="libfind_s $PYTHON_HOME"

alias lfind="libfind_s $LOCAL_HOME"

alias dfind="libfind_s $DOTFILES_HOME"

alias hfind="libfind_s $HTMLCSS_HOME/practice"

alias jfind="libfind_s $JS_HOME/practice"

alias npmfind="libfind_s $NPMLIB_HOME"

alias jvfind="libfind_s $JV_HOME"

alias cfind="libfind_s $C_HOME"

alias sfind="libfind_s $SH_HOME"

alias zfind="libfind_s $ZSH_HOME/practice"

alias prfind="libfind_s $PROG_HOME"

alias afind="libfind_s $AWK_HOME"

alias zshfind="file_grep ~/.zshrc"

alias sshfind="file_grep ~/.ssh/config"

# Records & docs
alias erec="$EDITOR $IMPORTANT_HOME/records/record.txt"

alias mrec="$EDITOR $RECORDS_PATH"

alias lahome="get_record la_home"

alias lawork="get_record la_work"

alias cardcredit="get_record rbc-credit"

alias cardhsbc="get_record hsbc-debit"

alias cardrbc="get_record rbc-debit"

alias doc="cat $IMPORTANT_HOME/records/doc.txt"

alias mspnum="get_record msp_num"

alias mspaccount="get_record msp_account"

alias delta="get_record deltares"

alias docsec1="get_record docsec1"

alias docsec2="get_record docsec2"

alias docsec3="get_record docsecnott1"

alias docsec4="get_record docsecnott2"

alias docsec5="get_record docsecbald1"

alias rssaws="get_record rss-aws"

alias ad="address"

alias phonelong="get_record phone_long"

alias phone="get_record phone_short"

alias ph="phone"

alias library="get_record $IMPORTANT_HOME/records/records.txt library"

alias lib="library"

alias postcode="get_record home_postcode"

alias pc="postcode"

alias address="get_record home_address"

alias workaddress="get_record work_address"

alias workpostcode="get_record work_postcode"

alias residency="$ADOBE_PATH $CANADA_HOME/residency_form.pdf"

alias songs="cd $SONGS_HOME"

alias cdsongs="cd $SONGS_HOME"

alias sabihin="song sabihin_mo_na"

alias sb="sabihin"

alias skytrain="open $COMMON_DOCS_HOME/useful/vancouver_skytrain_map.pdf"

alias sky="skytrain"

alias tube="open $COMMON_DOCS_HOME/useful/tube_map.pdf"

alias pc="postcode"

alias ad="address"

alias ph="phone"

alias mobileideas="$EDITOR $MERCURY_HOME/creative/mobile/ideas.txt"

alias mi="mobileideas"

# Screenshots

alias screenshots="cd $SCREENSHOTS_HOME"

alias lasts="cd $SCREENSHOTS_HOME && lastf -s $SCREENSHOT_NAME"

alias dels="cd $SCREENSHOTS_HOME && rm Screen*"

alias test="hello"
