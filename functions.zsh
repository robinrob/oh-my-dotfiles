# Functions
###############################################################################

# NEVER use aliases in this file! This file is loaded first before aliases.

source $DOTFILES_HOME/colors.zsh

function upper {
	TEXT="$@"
	echo $TEXT:u
}

function lower {
	TEXT="$@"
	echo $TEXT:l
}

function join {
	local IFS="$1"; shift; echo "$*";
}

function join_args {
	IFS=""
	echo "$*"
}

function cat_print {
	cat $1 && cat $1 | pbcopy
}

function copy_print {
	echo $1 && echo $1 | pbcopy
}

function get_record {
	cmd="grep $1 $RECORDS_PATH"
	val=$(eval "$cmd")
	val2=`echo ""$val"" | awk -F: '{print $2}'`
	copy_print ""$val2""
}

function email {
	ADDRESS=$1
	SUBJECT=$2
	BODY=$3
	
	echo "$BODY" | mail -s "$SUBJECT" "$ADDRESS"
}

function reminder {
	ADDRESS=$1
	MESSAGE=$2
	email $ADDRESS "REMINDER: $MESSAGE"
}

function note {
	cd $TEMP_HOME && $EDITOR "$1.txt"
}

function song {
	cd $MERCURY_HOME/docs/creative/songs && $EDITOR "$1.txt"
}

function write {
	cd $DOCS_HOME/creative/writing && $EDITOR "$1.txt"
}

function prepend {
	FILE=$1
	TEXT=$2
	
	CONTENTS=`cat $FILE`
	rm $FILE
	echo $TEXT > $FILE
	echo $CONTENTS >> $FILE
}

function new {
	while getopts :i:e:f:o: name
	do
		case $name in
			i) INTERPRETER="$OPTARG" ;;
			e) EXTENSION="$OPTARG" ;;
			f) FILENAME="$OPTARG" ;;
			o) NO_OPEN="$OPTARG" ;;
			*) usage ;;                # display usage and exit
		esac
	done
	
	FILE="$FILENAME.$EXTENSION"
	FILE_DISPLAY=$(yellow $FILE)
	COLOR="green"
	CREATE_SHEBANG_MSG="$COLOR 'Creating, +x-ing and shebanging new file: $FILE_DISPLAY'"
	SHEBANG_MSG="$COLOR 'Shebanging and +x''ing existing file: $FILE_DISPLAY'"
	CREATE_MSG="$COLOR 'Creating new file: $FILE_DISPLAY'"
	OPEN_MSG="$COLOR 'Opening existing file: $FILE_DISPLAY'"
	
	if ! [ -f $FILE ]
	then
		if [ -n "$INTERPRETER" ]
		then	
			eval $CREATE_SHEBANG_MSG
			echo "#!/usr/bin/env $INTERPRETER" > $FILE
			chmod +x $FILE
		else
			eval $CREATE_MSG
			touch $FILE
		fi
	else
		if [ -n "$INTERPRETER" ]
		then
			eval $SHEBANG_MSG
			prepend $FILE "#!/usr/bin/env $INTERPRETER\n"
			chmod +x $FILE
		else
			eval $OPEN_MSG
		fi
	fi
	
	# Reset variables for subsequent executions!
	INTERPRETER=""
	FILENAME=""
	EXTENSION=""
	
	if ! [[ "$NO_OPEN" == "noopen" ]]
	then
		$VISUAL $FILE
	fi
}

# Shortcut for `new` function
function new_s {
	INTERPRETER=$1
	EXTENSION=$2
	FILENAME=$3
	NOOPEN=$3
	
	new -i $INTERPRETER -e $EXTENSION -f $FILENAME
}

function hnew {
	PROJECT=$1
	cat $HTML_TEMPLATES_HOME/template.html | sed 's/Title/'$PROJECT'/' > $PROJECT.html
}

function hcnew {
	PROJECT=$1
	cat $HTML_TEMPLATES_HOME/practice_css.html | sed 's/Title/'$PROJECT'/' > $PROJECT.html
}

function hlnew {
	PROJECT=$1
	mkdir $PROJECT
	cat $HTML_TEMPLATES_HOME/template.html | sed 's/Title/'$PROJECT'/' > $PROJECT/$PROJECT.html
	touch $PROJECT/styles.less
	cd $PROJECT
}

function hjnew {
	PROJECT=$1
	cat $HTML_TEMPLATES_HOME/practice_js.html | sed 's/Title/'$PROJECT'/' > $PROJECT.html
}

function hbnew {
	PROJECT=$1
	cat $HTML_TEMPLATES_HOME/practice_bootstrap.html | sed 's/Title/'$PROJECT'/' > $PROJECT.html
}

function jsnew {
	new -i node -e js -o noopen -f $1
	echo "\nrequire(process.env.JS_LIB_HOME + '/log')" >> $1.js
}

function rnew {
	NAME=$1
	cp $RUBY_HOME/templates/practice.rb $NAME.rb
	brightwhite "`cat $NAME.rb`"
}

function plnew {
	FILENAME="$1.pl"
	cp $PERL_HOME/templates/practice.pl $FILENAME
	white "`cat $FILENAME`"
}

function hcexample {
	PROJECT=$1
	mkdir $PROJECT
	cd $PROJECT
	hnew $PROJECT
	cssnew "style"
	$EDITOR$EDITOR *
}

function cd_pull {
	output=`cd $1 && git branch | head -1 > /dev/null`
	comps=("${(s/* /)output}") # notice the quotes
	branch=$comps[2]

	cd $1 && git pull origin $branch
}

function cd_save {
	cd_action $1 rake_do save
}

function cd_commit {
	cd_action $1 rake_do commit
}

function cd_count_all {
	cd_action $1 rake_do count_all
}

function cd_status {
	cd_action $1 rake_do status
}

function cd_diff {
	cd_action $1 git diff
}

function cd_action {
	REPO=$1
	cd $REPO
	echo "$(green "In repo: ")$(yellow $REPO)"
	shift
	$@
	cd - > /dev/null
}

function opens {
	cd $SCREENSHOTS_HOME && despace && open `lasts`
}

function rns {
	cd $SCREENSHOTS_HOME && despace
	
	cmd="cp `lasts` $1"
	green $cmd
	eval $cmd
}

function gr {
	grep -ri $1 *
}

function t3389 {
	telnet $1 3389
}

function t22 {
	telnet $1 22
}

function wopen {
	$EDITOR `which $1`
}

function jlint {
	cat $1 | jsonlint
}

function docs {
	HOSTNAME=$1
	return $FILES_NAME/$HOSTNAME/docs
}

function gcr {
	`git clone -b master git@bitbucket.org:robinrob/$1.git`
}

function mvd {
	mv ~/Downloads/$1 $2
}

function color_words {
	TEXT=$1
	PATTERN=$2
	COLOR=$3
	echo $TEXT | gsed "s/$PATTERN/$($COLOR $PATTERN)/gI"
}

function libfind {
	COLOR='maganda'
	while getopts :c:d:p: name
	do
		case $name in
			c) CAT="$OPTARG" ;;
			d) DIR="$OPTARG" ;;
			p) PATTERN="$OPTARG" ;;
			*) usage ;;                # display usage and exit
		esac
	done
	
	result_grep="`ggrep --binary-file=without-match --line-number -i --no-messages --recursive --word-regexp $PATTERN $DIR`"
	# grep -ri $PATTERN $DIR
	# result_grep="`grep -ri $PATTERN $DIR`"
	results=("${(f)result_grep}")

	if [ -n "$results" ]
	then
		for result in $results
		do
			color_words $result $PATTERN $COLOR
		done
	fi
	
	result_find=`find $DIR -path ./lib -prune -o -type f -name "*$PATTERN*"`
	results=("${(f)result_find}")

	for result in $results
	do

		if [[ "$CAT" == "" ]]
		then
			color_words $result $PATTERN $COLOR
		else
			# If CAT not null
			eval "$COLOR $result"
			color_words "`cat $result`" $PATTERN $COLOR
		fi
	done
}

# cat
function libfind_c {
	libfind -c yes -d $1 -p $2
}

# libfind-shortcut
function libfind_s {
	DIR=$1
	PATTERN=$2
	CAT=$3
	
	if [[ "$CAT" == "no" ]]
	then
			libfind -d $1 -p $2 -c ""
	else
			libfind -d $1 -p $2 -c yes
	fi
}

function exec_exists {
	EXEC=$1
	
	if [[ "`which $EXEC`" == "$EXEC not found" ]]
	then
		echo "no"
	else
		echo "yes"
	fi
}

function alias_exists {
	NAME=$1
	ALIAS_FILE=$2
	result=`grep "alias $NAME" $ALIAS_FILE`
	
	if [[ "$result" == "" ]]
	then
		echo "no"	
	else
		echo "yes"
	fi
}

function create_alias {
	NAME=$1
	VALUE=$2
	ALIAS_FILE=$3
	SUCCESS_MSG=$4
	
	if [[ "$(alias_exists $NAME $ALIAS_FILE)" == "no" ]]
	then
		echo "\nalias $NAME=\"$VALUE\"" >> $ALIAS_FILE
		echo "$SUCCESS_MSG"
	else
		red "Alias already exists!"
	fi
}

function al {
	create_alias $1 $2 $DOTFILES_HOME/aliases.zsh
}

function bookmark {
	create_bookmark $DOTFILES_HOME/bookmarks.zsh $@
}

function work_bookmark {
	create_bookmark $DOTFILES_HOME/work_bookmarks.zsh $@ chrome
}

function create_bookmark {
	BOOKMARKS_PATH=$1
	NAME=$2
	URL=$3
	BROWSER=$4
	
	if [ -z "$BROWSER" ]
	then
		BROWSER="open"
	fi
	
	ALIAS="${BROWSER} '${URL}'"
  SUCCESS_MSG="$(yellow)$NAME $(green)bookmarked as $(yellow)$URL $(green)with browser $(yellow)$BROWSER"
	
	create_alias $NAME $ALIAS $BOOKMARKS_PATH $SUCCESS_MSG
	
	source $BOOKMARKS_PATH
}

function fr {
	PATTERN=$1
	find . -name "*$PATTERN*" 2> /dev/null
}

function file_grep {
	grep -A 3 $2 $1
}

function rake_do {
	TASK=$1
	
	if [ -f Rakefile ]
	then
		echo "$(green "Using Rakefile: ")$(yellow $(/usr/local/bin/gls $PWD/Rakefile))"
		if [ -n "$2" ]
		then
			rake $TASK"[$2]"
		else
			rake $TASK	
		fi
	else
		red "No Rakefile!"
		# rake -f $RAKEFILE_HOME/Rakefile save
	fi
}

function rsd {
	rake_do "sub_deinit[$1]"
}

function rks {
	rake_do save $@
}

function rkc {
	rake_do commit $@
}

function rka {
	rake_do add $@
	git status
}

function null {
  if [ -z "$1" ]
  then
    green yes
  else
    red no
  fi
}

function killp {
  PROCESS=$1
	if [ -z "$PROCESS" ]
  then
		red "Must give name of process!"
		
	else
    echo "$(green)Killing all $(yellow)${PROCESS}$(green) processes ...$(default)"
		
		ps aux | grep $PROCESS | awk '{print $2}' | xargs kill 2> /dev/null
	fi
}

function rakeup {
	git submodule add --force git@bitbucket.org:robinrob/rakefile.git rake
	ln -s rake/Rakefile ./
}

function rakedown {
	rake -r $RAKEFILE_HOME/Rakefile sub_deinit[rake]
	rm Rakefile
}

function fabup {
	gsa git@bitbucket.org:robinrob/fabfile.git fabfile
	ln -s fabfile/fabfile.py ./
}

function fabdown {
	fab sub_deinit:fabfile
	rm fabfile.py
}

function lsd {
	ls `dirname $1`
}

function silent_cp {
	yes | cp $1 $2 1> /dev/null 2> /dev/null
}

function silent {
	`$@ 2> /dev/null`
}

function save_crontab {
	CRON_NAME="$HOSTNAME.cron"
	SAVE_PATH="$DOTFILES_HOME/$CRON_NAME"
	TMP_PATH="${SAVE_PATH}.tmp"
	
	rm -f $SAVE_PATH
	green "Saving crontab to $SAVE_PATH ..."
	crontab -l > $TMP_PATH
	silent_cp $TMP_PATH $SAVE_PATH
	rm $TMP_PATH
}

function save_jetbrains {
	echo "$(green "Copying Jetbrains config from: ")$(yellow "$INTELLIJ_CONFIG ...")"
	silent_cp $INTELLIJ_CONFIG $DOTFILES_HOME/
}

function cd_dir {
	cd "$(join / $@)"
}

function cddir {
	cd `dirname $1`
}

function browser {
	open -a $BROWSER $@
}

function safari {
	open -a Safari $@
}

function firefox {
	open -a Firefox $@
}

function chrome {
	open -a Google\ Chrome $@
}

function bb {
	result=`ls -d .git 2> /dev/null`
	if [ "$result" ]
	then
		# url=`git config --get remote.origin.url | awk '{split($1,a,"/"); print a[2]}'`
		url=`git config --get remote.origin.url | awk '{split($1,a,"@"); print a[2]}' | awk '{split($1,a,":"); print a[2]}'`
		url="https://bitbucket.org/${url}"
		green "Repo found: $url"
	else
		url="https://bitbucket.org/robinrob"
	fi
	
	green "Opening $url ..."
	open -a $BROWSER $url
}

function bb_url {
	GIT_URL=`git config --get remote.origin.url`
	echo "https://bitbucket.org/`echo $GIT_URL | awk '{split($1,a,"@"); print a[2]}' | awk '{split($1,a,":"); print a[2]}'`"
}

function bb_commit_url {
	COMMIT=$1
	echo "`bb_url`/commits/$COMMIT"
}

function bbcm {
	open `bb_commit_url $1`
}

function bbcmr {
	open "`bb_commit_url $1`/raw"
}

function cleanhome {
	for file in `gfind . -maxdepth 1 \( ! -regex '.*/\..*' \) -type f`
	do
		green "Moving $file to $TRASH_HOME"
		mv $file ~/.Trash
	done
}

function dir_exists {
	ls -d $1 2> /dev/null 1> /dev/null && echo "yes"
}

function is_git {
	dir_exists '.git'
}

function is_chef {
	dir_exists '.chef'
}

function show_git {
	if [ "$(is_git)" ]
	then
		green "Is Git"
	else
		red "Not Git"
	fi
}

function gro {
	if [ "$(is_git)" ]
	then
		green `git_origin`
	else
		red "Not Git"
	fi 
}

function git_origin {
	if [ "$(is_git)" ]
	then
		echo `git config --get remote.origin.url`
	fi
}

function delexcept {
	while getopts :r:f: name
	do
		case $name in
			r) REGEX="$OPTARG" ;;
	    f) FOR_REAL="$OPTARG" ;;
	    *) usage ;;
		esac
	done

	if [ -n "$FOR_REAL" ]
	then
		red "Executing for real!"
		despace -t d && find . -depth 1 \( ! -regex ".*$REGEX.*" \) | xargs rm -r
	else
		green "Running in test mode."
		despace -t d && find . -depth 1 \( ! -regex ".*$REGEX.*" \) | xargs
	fi
	
	FOR_REAL=''
	REGEX=''
}

function count_non_empty {
	grep . $1 | wc -l
}

function lsp {
	ls $1 | pb
}

function lsa {
	ls $PWD/$1
}

function lsad {
	ls -d $PWD/$1
}

function urlencode {
	setopt localoptions extendedglob
	input=( ${(s::)@} )
	print ${(j::)input/(#b)([^A-Za-z0-9_.!~*\'\(\)-])/%$(([##16]#match))}
}

function points {
	browser "https://sites.google.com/a/cloudreach.co.uk/points-lists/system/app/pages/search?scope=search-site&q=`urlencode $@`"
}

function rubygems {
	browser "https://rubygems.org/search?utf8=%E2%9C%93&query=`urlencode $@`"
}

function sfs {
	open -a Safari "http://my.safaribooksonline.com/search?q=`urlencode $@`"
}

function wiki {
	browser "http://en.wikipedia.org/wiki/Special:Search?search=`urlencode $@`&go=Go"
}

function imdb {
	browser "http://www.imdb.com/find?ref_=nv_sr_fn&q=`urlencode $@`&s=all"
}

function google {
	browser "https://www.google.ca/#q=`urlencode $@`&safe=active"
}

function rubydoc {
	browser "http://ruby-doc.com/search.html?&q=`urlencode $@`"
}

function amz {
	browser "http://www.amazon.com/s/ref=nb_sb_noss_2?url=search-alias%3Daps&field-keywords=`urlencode $@`"
}

function ytube {
	browser "https://www.youtube.com/results?search_query=`urlencode $@`"
}

function stack {
	browser "http://stackoverflow.com/search?q=`urlencode $@`"
}

function ask {

	browser "http://stackoverflow.com/questions/ask?title=`urlencode $@`"
}

function salesf {
	browser "https://cloudreach.my.salesforce.com/_ui/search/ui/UnifiedSearchResults?searchType=2&sen=01t&sen=a0D&sen=098&sen=800&sen=005&sen=00P&sen=006&sen=501&sen=001&sen=00T&sen=00U&sen=810&sen=500&sen=003&sen=00O&sen=00a&sen=a08&sen=550&str=`urlencode $@`"
}

function cases {
	ID=$1
	open -a $BROWSER "https://cloudreach.my.salesforce.com/500?fcf=$ID"
}

function translate {
	while getopts :f:t: name
	do
		case $name in
			f) FROM="$OPTARG" ;;
			t) TO="$OPTARG" ;;
			*) usage ;;                # display usage and exit
		esac
	done

	if [[ "$FROM" == "" ]]
	then
		FROM="tl"
	else
		shift; shift;
	fi

	if [[ "$TO" == "" ]]
	then
		TO="en"
	else
		shift; shift;
	fi

	args="$@"
	url="https://translate.google.com/#$FROM/$TO/$(urlencode ""$args"")"
	browser $url
}

function trn {
	echo "$@" | trans
}

function trnf {
	echo "$@" | trans :tl
}

function lc {
	LESS_FILE=$1
	cmd="$LESSC_PATH $LESS_FILE > styles.css"
	green $cmd
	$LESSC_PATH $LESS_FILE > styles.css
}

function web {
	open `wrap_single $1`
}

function wrap_single {
	echo "'$@'"
}

function dev {
	BROWSER=$1
	
	if [[ "$BROWSER" == "" ]]
	then
		BROWSER=$DEFAULT_BROWSER
	fi
	
	open -a $BROWSER http://localhost:3000
}

function unixtime {
	SECS=$1
	ruby -e "require 'Date'; puts DateTime.strptime('$SECS', '%s')"
}

function timeunix {
	ruby -e "require 'Time'; puts Time.now().to_i"
}

function replace_all {
	SEARCH=$1
	REPLACEMENT=$2
	FILE_PATTERN="$3"
	
	result=`find . -depth 1 -name $FILE_PATTERN`
	files=("${(f)result}")
	
	for file in $files
	do
		new_contents=`cat $file | sed "s/$SEARCH/$REPLACEMENT/g"`
		rm $file
		echo $new_contents > $file
	done
}

function sshfind {
	HOST=$1
	grep -A 3 $HOST ~/.ssh/config
}

#function killp {
#	NAME=$1
#
#	processes=`ps aux | grep $NAME | awk '{print $2}' | xargs`
#	processes=("${(s: :)processes}")
#	
#	green "Killing all `yellow $NAME` `green 'processes ...'`"
#	for process in $processes
#	do
#		`kill $process 2> /dev/null`
#	done
#}

function updatesubs {
	git submodule foreach --recursive "`git commit -am 'Updates.' && git push` || exit 0"
}

function save_code {
	# rake each_sub["rake save"]
	rake each_sub["git checkout master; git commit -am 'Auto-update.'; git pull origin master; git push origin master"]
}

function git_branch {
	output=`git branch`
	echo $output[3,-1]
}

function clean_home {
	find ~/ -depth 1 \( ! -regex '.*/\..*' \) -type f -name * | xargs rm
}

function this_dir {
	echo ${PWD##*/}
}

function del {
	files="$@"
	files=(${(s: :)files})
	
	for file in $files
	do
		gmv $file $TRASH_HOME	
	done
}

function cdnoc {
	cd_dir $NOCCHEF && rvm gemset use chef --create
}

function cdms {
	cd_dir $MSCHEF && rvm gemset use chef --create
}

function nbrew {
	brew $@ && shift && echo $@ >> $DOTFILES_HOME/homebrew.txt
}

function bashvulns {
	browser 'http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-6271'
	browser 'http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-7169'
	browser 'http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-6277'
	browser 'http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-7187'
	browser 'http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-6278'	
	browser 'http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-7188'
}

function repo_cmds {
  typeset -A abbreviations

  abbreviations[awk]=a
  abbreviations[coffeescript]=cs
  abbreviations[c]=c
  abbreviations[c-plus-plus]=cp
  abbreviations[htmlcss]=h
  abbreviations[javascript]=js
  abbreviations[markdown]=m
  abbreviations[ocaml]=o
  abbreviations[perl]=pl
  abbreviations[prog]=pr
  abbreviations[python]=p
  abbreviations[ruby]=r
  abbreviations[scala]=sc
  abbreviations[sh]=s
  abbreviations[zsh]=z
  
	
  for repo in ${(k)abbreviations}
	do
		alias_repo_action $repo $abbreviations[$repo] sv cd_save
		alias_repo_action $repo $abbreviations[$repo] cm cd_commit
		alias_repo_action $repo $abbreviations[$repo] st cd_status
		alias_repo_action $repo $abbreviations[$repo] pl cd_pull
    alias_repo_nav $repo $abbreviations[$repo]
	done
}

function alias_repo_action {
	REPO=$1
  REPO_ABBR=$2
	ALIAS_SUFF=$3
	CMD=$4

	alias "$REPO_ABBR$ALIAS_SUFF"="$CMD $(upper $REPO)_HOME"
}

function alias_repo_nav {
  REPO=$1
  REPO_ABBR=$2

  alias "cd${REPO_ABBR}"="cd_dir $(upper $REPO)_HOME"
}

# function languages2 {
# 	languages=(ruby ocaml htmlcss zsh sh javascript coffeescript)
# 	abbrs=(rb oc ht zs sh js cs)
#
# 	for language in $languages
# 	do
# 		alias_repo_action2 $language sv cd_save s
# 		alias_repo_action2 $language cm cd_commit c
# 		alias_repo_action2 $language st cd_status st
# 		alias_repo_action2 $language pl cd_pull p
# 	done
# }
#
# function alias_repo_action {
# 	lang=$1
# 	alias_prefix=$2
# 	cmd=$3
# 	cmd_abbr=$4
# 	alias "$lang[1]$alias_suff"="$cmd $(upper $lang)_HOME"
# }

function odl {
	cd ~/Downloads
	despace
	last_download=`ls -ltr  ~/Downloads | awk '{print $9}' | tail -1`
	echo $last_download | pbcopy
	green "Opening latest file: $(yellow)$last_download$(default)"
	open $last_download
}

function dir {	
	if [[ $PWD == $HOME ]]
	then
		dir="~"
	else
		dir=`basename $PWD`
	fi
	echo $dir
}

function chpwd {
	git_checkout_master_if_on_detached_head
}

function git_checkout_master_if_on_detached_head {
	detached=`git branch 2> /dev/null | grep detached`
	
	if [[ -n "$detached" ]]
	then
		red "On detached HEAD! $(green)Switching to branch $(yellow)master"
		git checkout master
	fi		
}

function rvm_gem_list {
	GEMSET=$1
	rvm @$GEMSET do gem list
}


function gems {
	rubygemset=".ruby-gemset"
	if [[ -f $rubygemset ]]
	then
		gemset=`cat $rubygemset`
		rvm_gem_list $gemset
	else
		red "No $rubygemset found."
	fi
}



# function rvm_use_gemset_if_dir_exists {
# 	GEMSET=$1
# 	DIR=$2
#
# 	if [[ -n $(dir_exists $DIR) ]]
# 	then
# 		rvm gemset use $GEMSET
# 	fi
# }
#
# function rvm_use_gemset_chef_if_chef {
# 	rvm_use_gemset_if_dir_exists chef .chef
# }
#
# function rvm_use_gemset_if_cwd {
# 	GEMSET=$1
# 	DIR=$2
#
# 	if [[ `basename $PWD` == $DIR ]]
# 	then
# 		rvm gemset use $GEMSET
# 	fi
# }

function gemset {
	RUBY_GEMSET=$1
	RUBY_VERSION=$2
	
	silent rm .ruby-gemset
	silent rm .ruby-version
	echo $RUBY_GEMSET > .ruby-gemset
	echo $RUBY_VERSION > .ruby-version
}


function knife_upload_databag {
	DATABAG=$1
	knife upload data bag $DATABAG
}


function website () {
  cd $MRROBINSMITHCOM_HOME
  green 'Starting server ...'
  rake server &
  killp postgres
  green 'Starting postgres ...'
  postgres &
  green 'Opening http://localhost:3000'
  safari http://localhost:3000
}

function preview {
  FILENAME=$1
  $RUBY_HOME/practice/render.rb $FILENAME && open -a $BROWSER html/$FILENAME.html
}


function cpscr {
  SCREENSHOT=$1
  DESTINATION=$2
  cp $SCREENSHOTS_HOME/$SCREENSHOT $DESTINATION
}

function kul {
  knife upload $@
}

function kdl {
  knife download $@
}

function read {
  TO_READ=$1

  echo "$TO_READ" >> $LISTS_HOME/to_read.txt
}

function read1 {
  safari "`head -1 $LISTS_HOME/to_read.txt`"
}

function srb {
  red "Rebooting!"
  sudo reboot
}

function ssd {
  red "Shutting DOWN!"
  sudo shutdown -h now
}

# Function definition is contained within $DOTFILES_HOME/functions/hello
autoload hello

autoload hello2
