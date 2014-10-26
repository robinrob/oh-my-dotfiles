# Environment variables
#############################

# sudo hostname <name> to change
export HOSTNAME=`hostname`

export MERCURY_HOSTNAME='mercury'

export VENUS_HOSTNAME='venus'

export EDITOR=mvim

export VISUAL=vim

# export PROG_HOME=$HOME/Programming/robin

export PROG_HOME=$HOME/Programming/robin

export SH_HOME=$PROG_HOME/sh

export PYTHON_HOME=$PROG_HOME/python

export PY_HOME=$PYTHON_HOME

export PYAPP_HOME=$PY_HOME/projects/pyapp

export FABFILE_HOME=$PY_HOME/projects/fabfile

export NPMLIB_HOME=/usr/local/lib/node_modules

export FABFILE_BASIC_HOME=$PY_HOME/projects/fabfile-basic

export ZSH_HOME=$PROG_HOME/zsh

export SH_HOME=$PROG_HOME/sh

export DOTFILES_HOME=$ZSH_HOME/projects/dotfiles

export BACKUPS_HOME=$RUBY_HOME/projects/aws-backup-manager

export SPLUNK_HOME=$PROG_HOME/splunk

export ZSHRC=$DOTFILES_HOME/zshrc

export C_HOME=$PROG_HOME/c

export C_PLUS_PLUS_HOME=$PROG_HOME/c

export JV_HOME=$PROG_HOME/java

export JAVASCRIPT_HOME=$PROG_HOME/javascript

export JS_HOME=$JAVASCRIPT_HOME

export JS_LIB_HOME=$JAVASCRIPT_HOME/lib

export HTMLCSS_HOME=$PROG_HOME/html-css

export HTMLLESS_HOME=$PROG_HOME/html-less

export HTML_TEMPLATES_HOME=$HTMLCSS_HOME/templates

export RUBY_HOME=$PROG_HOME/ruby

export MARKDOWN_HOME=$PROG_HOME/markdown

export OCAML_HOME=$PROG_HOME/ocaml

export COFFEESCRIPT_HOME=$PROG_HOME/coffeescript

export RUBY_TEMPLATES_HOME=$RUBY_HOME/templates

export SCALA_HOME=$PROG_HOME/scala

export AWK_HOME=$PROG_HOME/awk

export RUBYAPP_HOME=$RUBY_HOME/projects/ruby-app

export RAKEFILE_HOME=$RUBY_HOME/projects/rakefile

export GLOBAL_RAKEFILE_HOME=$RUBY_HOME/projects/global-rakefile

export QUIZ_HOME=$RUBY_HOME/projects/quiz

export MRROBINSMITHCOM_HOME=$RUBY_HOME/projects/mrrobinsmith.com

export MOBILEAPP_HOME=$JS_HOME/projects/mobile-app-cordova

export REPOS=$RUBY_HOME" "$SH_HOME" "$DOTFILES_HOME" "$PYTHON_HOME

export RUBY_LIB=/System/Library/Frameworks/Ruby.framework/Versions/Current/usr/lib/ruby/2.0.0

export PERL_HOME=$PROG_HOME/perl

export EC2_HOME=/usr/local/lib/ec2-api-tools-1.6.11.0

export GAM_PATH=/usr/local/Library/gam

export WORK_HOME=~/Programming/work

export WORK_RUBY_HOME=~/Programming/work/ruby

export WORK_PYTHON_HOME=~/Programming/work/python

export NOCCHEF=$WORK_HOME/ruby/cloudreach-chef/cloudreach-noc-chef

export MSCHEF=$WORK_HOME/ruby/cloudreach-chef/cloudreach-ms-chef

export LOCAL_HOME=$RUBY_HOME/projects/local

export TODO_HOME=$LOCAL_HOME/lib/todo.csv

export INTELLIJ_CONFIG=~/Library/Preferences/IntelliJIdea13/keymaps/Robin.xml

export FILES_HOME=~/Dropbox

export PICTURES_HOME=~/Google\ Drive/pictures/pictures

export PHOTOS_HOME=~/Google\ Drive/pictures/photos

export HOSTFILES_HOME=$FILES_HOME/$HOSTNAME

export COMMON_HOME=$FILES_HOME/common

export COMMON_DOCS_HOME=$COMMON_HOME/docs

export MERCURY_HOME=$FILES_HOME/$MERCURY_HOSTNAME

export SONGS_HOME=$MERCURY_HOME/docs/creative/songs

export VENUS_HOME=$FILES_HOME/$VENUS_HOSTNAME

export TEMP_HOME=$HOSTFILES_HOME/temp

export DOCS_HOME=$HOSTFILES_HOME/docs

export LISTS_HOME=$MERCURY_HOME/docs/lists

export RDOCS_HOME=$RFILES_HOME/docs

export DOWNLOADS_HOME='~/Downloads'

export IMPORTANT_HOME=$DOCS_HOME/IMPORTANT

export KNOWLEDGE_HOME=$DOCS_HOME/knowledge

export BACKGROUNDS_HOME=$HOSTFILES_HOME/backgrounds

export SCREENSAVERS_HOME=$HOSTFILES_HOME/screensavers

export SCREENSHOTS_HOME=$HOSTFILES_HOME/screenshots

export SCREENSHOT_NAME=$HOSTNAME

export PHONEGAP_HOME=/usr/local/Library/phonegap-2.9.0

export ANDROID_HOME=/usr/local/Cellar/android-sdk

export USEFUL_HOME=$DOCS_HOME/useful

export AWS_CONFIG="~/.aws/config"

export KITCHENPLAN_HOME=/opt/kitchenplan

export RECORDS_PATH=$MERCURY_HOME/docs/IMPORTANT/records/records.txt

export RECEIPTS_HOME=~/Google\ Drive/expenses/

# This must NOT be wrapped in quotes or the whitespace-escaping in the path does not work!!
export CAMERA_HOME=$FILES_HOME/Camera\ Uploads

export TRASH_HOME=~/.Trash

export CANADA_HOME=$MERCURY_HOME/docs/IMPORTANT/canada

if [[ "$HOSTNAME" == "$MERCURY_HOSTNAME" ]]
then
	export BROWSER="Safari"
else
	export BROWSER="Google Chrome"
fi

export ADOBE_PATH=/Applications/Adobe\ Reader.app/Contents/MacOS/AdobeReader

export NDK_ROOT=/usr/local/Cellar/android-ndk/r9d/

export ANDROID_SDK_ROOT=/usr/local/Cellar/android-sdk/22.6.2/

export ANT_ROOT=/usr/local/Cellar/ant/1.9.4/bin/

export GREP_COLOR="0;32"

# Syntax highlighing in `less`
# Requires `brew install source-highlight`
##############################
export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"

export LESS=" -R "

export LESSC_PATH="/usr/local/lib/node_modules/less/bin/lessc"

export COCOS_HOME="/usr/local/Library/cocos2d-js"

export COCOS_CONSOLE_ROOT="$COCOS_HOME/tools/cocos2d-console/bin"

export ANT_ROOT=/usr/local/bin

export NDK_ROOT=/usr/local/Cellar/android-ndk/r9d/

export GREP_COLORS='ms=01;35:mc=01;31:sl=:cx=:fn=0:ln=32:bn=32:se=36'

export LS_COLORS='di=1;34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'

if [[ $HOSTNAME == "venus" ]]
then
  export PGDATA=/Users/robinsmith/Library/Application\ Support/Postgres/var-9.3
elif [[ $HOSTNAME == "mercury" ]]
then
  export PGDATA=/Users/msl/Library/Containers/com.heroku.postgres/Data/Library/Application\ Support/Postgres/var
fi

export PG_CONF=$PGDATA/postgresql.conf

fpath=("$DOTFILES_HOME/functions" $fpath)

# Path
######
PATH=$PATH:$EC2_HOME/bin
PATH=$PATH:$HOME/.rvm/bin
PATH=$PATH:$LOCAL_HOME/bin
PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin/
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:$COCOS_CONSOLE_ROOT
PATH=$PATH:$ANT_ROOT
PATH=$PATH:$NDK_ROOT
export PATH
