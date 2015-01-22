reinstall() {
  echo -n 'Reinstall your site? (y/n): '
  read prompt
  if [ "$prompt" == "y" ] || [ "$prompt" == "Y" ]; then
    echo -n 'Website address to return to (without http://): '
    read location
    if [ "$location" == "" ]; then
      location='localhost'
    fi
    protocol='http://'
    domain=$location
    site=$protocol$domain
    drush sql-drop -y
    cd sites/default; rm settings.php -f; cp default.settings.php settings.php; cd ../..
    start $site
  elif [ "$prompt" == "n" ] || [ "$prompt" == "N" ]; then
    echo 'Aborting!'
    kill -INT $$
  else
    echo 'Invalid answer given. Please answer with "y" or "n"'
    reinstall
    kill -INT $$
  fi
};
mkp() {
    if [ -z "$1" ]; then
      echo 'No makefile defined. please use "mkp makefile.make"'
      kill -INT $$
    fi
    echo -n 'What project would you like to make?: '
    read project
    if [ -z "$project" ]; then
      echo 'Invalid input!'
      mkp
      kill -INT $$
    fi
    echo "making $project from $1"
    drush make --projects="$project" --no-core "$1" -y
};
mk() {
    if [ -z "$1" ]; then
      echo 'No makefile defined. please use "mk makefile.make"'
      kill -INT $$
    fi
    echo -n 'Would you also like to clear all contrib modules? (y/n): '
    read prompt
    if [ "$prompt" == "y" ] || [ "$prompt" == "Y" ]; then
      echo 'Clearing Contrib modules'
      cd sites/all/modules/contrib; rm -rf *; cd ../../../..
      drush make $1 -y
    elif [ "$prompt" == "n" ] || [ "$prompt" == "N" ]; then
      echo 'Making without clearing the contrib folder.'
      drush make $1 -y
    else
      echo 'Invalid answer given. Please answer with "y" or "n"'
      mk $1
      kill -INT $$
    fi
};
alias dr='drush'
alias en='drush en $1 -y'
alias dis='drush dis $1 -y'
alias mk='mk'
alias mkp='mkp $1'
alias cc='drush cc all'
alias lft='drush features'
alias encof='drush en coffee -y'
alias endif='drush en diff -y'
alias enfui='drush en field_ui -y'
alias endev='drush en coffee -y; drush en diff -y; drush en field_ui -y; drush en devel -y'
alias disdev='drush dis coffee -y; drush dis diff -y; drush dis field_ui -y; drush dis devel -y'
alias gtdef='cd sites/default'
alias rmcpset='rm settings.php; cp default.settings.php settings.php; echo DONE!; swag'
alias rtdef='cd ../..'
alias rstdef='cd sites/default; rm settings.php; cp default.settings.php settings.php; cd ../..'
alias reinstall='reinstall'
alias ls='ls -1'
alias lsa='ls -a -1'
alias swag='echo \.\#\#\#\#\#\#\.\.\#\#\.\.\.\.\.\.\#\#\.\.\.\.\#\#\#\.\.\.\.\.\#\#\#\#\#\#\.\.\.; echo \#\#\.\.\.\.\#\#\.\#\#\.\.\#\#\.\.\#\#\.\.\.\#\#\.\#\#\.\.\.\#\#\.\.\.\.\#\#\.\.; echo \#\#\.\.\.\.\.\.\.\#\#\.\.\#\#\.\.\#\#\.\.\#\#\.\.\.\#\#\.\.\#\#\.\.\.\.\.\.\.\.; echo \.\#\#\#\#\#\#\.\.\#\#\.\.\#\#\.\.\#\#\.\#\#\.\.\.\.\.\#\#\.\#\#\.\.\.\#\#\#\#\.; echo \.\.\.\.\.\.\#\#\.\#\#\.\.\#\#\.\.\#\#\.\#\#\#\#\#\#\#\#\#\.\#\#\.\.\.\.\#\#\.\.; echo \#\#\.\.\.\.\#\#\.\#\#\.\.\#\#\.\.\#\#\.\#\#\.\.\.\.\.\#\#\.\#\#\.\.\.\.\#\#\.\.; echo \.\#\#\#\#\#\#\.\.\.\#\#\#\.\.\#\#\#\.\.\#\#\.\.\.\.\.\#\#\.\.\#\#\#\#\#\#\.\.\.;'
alias bojan='echo \#\#\#\#\#\#\#\#\.\.\.\#\#\#\#\#\#\#\.\.\.\.\.\.\.\.\#\#\.\.\.\.\#\#\#\.\.\.\.\#\#\.\.\.\.\#\#; echo \#\#\.\.\.\.\.\#\#\.\#\#\.\.\.\.\.\#\#\.\.\.\.\.\.\.\#\#\.\.\.\#\#\.\#\#\.\.\.\#\#\#\.\.\.\#\#; echo \#\#\.\.\.\.\.\#\#\.\#\#\.\.\.\.\.\#\#\.\.\.\.\.\.\.\#\#\.\.\#\#\.\.\.\#\#\.\.\#\#\#\#\.\.\#\#; echo \#\#\#\#\#\#\#\#\.\.\#\#\.\.\.\.\.\#\#\.\.\.\.\.\.\.\#\#\.\#\#\.\.\.\.\.\#\#\.\#\#\.\#\#\.\#\#; echo \#\#\.\.\.\.\.\#\#\.\#\#\.\.\.\.\.\#\#\.\#\#\.\.\.\.\#\#\.\#\#\#\#\#\#\#\#\#\.\#\#\.\.\#\#\#\#; echo \#\#\.\.\.\.\.\#\#\.\#\#\.\.\.\.\.\#\#\.\#\#\.\.\.\.\#\#\.\#\#\.\.\.\.\.\#\#\.\#\#\.\.\.\#\#\#; echo \#\#\#\#\#\#\#\#\.\.\.\#\#\#\#\#\#\#\.\.\.\#\#\#\#\#\#\.\.\#\#\.\.\.\.\.\#\#\.\#\#\.\.\.\.\#\#;'
alias martijn='echo \#\#\.\.\.\.\.\#\#\.\.\.\.\#\#\#\.\.\.\.\#\#\#\#\#\#\#\#\.\.\#\#\#\#\#\#\#\#\.\#\#\#\#\.\.\.\.\.\.\.\#\#\.\#\#\.\.\.\.\#\#; echo \#\#\#\.\.\.\#\#\#\.\.\.\#\#\.\#\#\.\.\.\#\#\.\.\.\.\.\#\#\.\.\.\.\#\#\.\.\.\.\.\#\#\.\.\.\.\.\.\.\.\#\#\.\#\#\#\.\.\.\#\#; echo \#\#\#\#\.\#\#\#\#\.\.\#\#\.\.\.\#\#\.\.\#\#\.\.\.\.\.\#\#\.\.\.\.\#\#\.\.\.\.\.\#\#\.\.\.\.\.\.\.\.\#\#\.\#\#\#\#\.\.\#\#; echo \#\#\.\#\#\#\.\#\#\.\#\#\.\.\.\.\.\#\#\.\#\#\#\#\#\#\#\#\.\.\.\.\.\#\#\.\.\.\.\.\#\#\.\.\.\.\.\.\.\.\#\#\.\#\#\.\#\#\.\#\#; echo \#\#\.\.\.\.\.\#\#\.\#\#\#\#\#\#\#\#\#\.\#\#\.\.\.\#\#\.\.\.\.\.\.\#\#\.\.\.\.\.\#\#\.\.\#\#\.\.\.\.\#\#\.\#\#\.\.\#\#\#\#; echo \#\#\.\.\.\.\.\#\#\.\#\#\.\.\.\.\.\#\#\.\#\#\.\.\.\.\#\#\.\.\.\.\.\#\#\.\.\.\.\.\#\#\.\.\#\#\.\.\.\.\#\#\.\#\#\.\.\.\#\#\#; echo \#\#\.\.\.\.\.\#\#\.\#\#\.\.\.\.\.\#\#\.\#\#\.\.\.\.\.\#\#\.\.\.\.\#\#\.\.\.\.\#\#\#\#\.\.\#\#\#\#\#\#\.\.\#\#\.\.\.\.\#\#;'
alias coen='echo \.\#\#\#\#\#\#\.\.\.\#\#\#\#\#\#\#\.\.\#\#\#\#\#\#\#\#\.\#\#\.\.\.\.\#\#; echo \#\#\.\.\.\.\#\#\.\#\#\.\.\.\.\.\#\#\.\#\#\.\.\.\.\.\.\.\#\#\#\.\.\.\#\#; echo \#\#\.\.\.\.\.\.\.\#\#\.\.\.\.\.\#\#\.\#\#\.\.\.\.\.\.\.\#\#\#\#\.\.\#\#; echo \#\#\.\.\.\.\.\.\.\#\#\.\.\.\.\.\#\#\.\#\#\#\#\#\#\.\.\.\#\#\.\#\#\.\#\#; echo \#\#\.\.\.\.\.\.\.\#\#\.\.\.\.\.\#\#\.\#\#\.\.\.\.\.\.\.\#\#\.\.\#\#\#\#; echo \#\#\.\.\.\.\#\#\.\#\#\.\.\.\.\.\#\#\.\#\#\.\.\.\.\.\.\.\#\#\.\.\.\#\#\#; echo \.\#\#\#\#\#\#\.\.\.\#\#\#\#\#\#\#\.\.\#\#\#\#\#\#\#\#\.\#\#\.\.\.\.\#\#;'
alias mark='echo \#\#\.\.\.\.\.\#\#\.\.\.\.\#\#\#\.\.\.\.\#\#\#\#\#\#\#\#\.\.\#\#\.\.\.\.\#\#\.; echo \#\#\#\.\.\.\#\#\#\.\.\.\#\#\.\#\#\.\.\.\#\#\.\.\.\.\.\#\#\.\#\#\.\.\.\#\#\.\.; echo \#\#\#\#\.\#\#\#\#\.\.\#\#\.\.\.\#\#\.\.\#\#\.\.\.\.\.\#\#\.\#\#\.\.\#\#\.\.\.; echo \#\#\.\#\#\#\.\#\#\.\#\#\.\.\.\.\.\#\#\.\#\#\#\#\#\#\#\#\.\.\#\#\#\#\#\.\.\.\.; echo \#\#\.\.\.\.\.\#\#\.\#\#\#\#\#\#\#\#\#\.\#\#\.\.\.\#\#\.\.\.\#\#\.\.\#\#\.\.\.; echo \#\#\.\.\.\.\.\#\#\.\#\#\.\.\.\.\.\#\#\.\#\#\.\.\.\.\#\#\.\.\#\#\.\.\.\#\#\.\.; echo \#\#\.\.\.\.\.\#\#\.\#\#\.\.\.\.\.\#\#\.\#\#\.\.\.\.\.\#\#\.\#\#\.\.\.\.\#\#\.;'
alias patrick='echo \#\#\#\#\#\#\#\#\.\.\.\.\.\#\#\#\.\.\.\.\#\#\#\#\#\#\#\#\.\#\#\#\#\#\#\#\#\.\.\#\#\#\#\.\.\#\#\#\#\#\#\.\.\#\#\.\.\.\.\#\#; echo \#\#\.\.\.\.\.\#\#\.\.\.\#\#\.\#\#\.\.\.\.\.\.\#\#\.\.\.\.\#\#\.\.\.\.\.\#\#\.\.\#\#\.\.\#\#\.\.\.\.\#\#\.\#\#\.\.\.\#\#\.; echo \#\#\.\.\.\.\.\#\#\.\.\#\#\.\.\.\#\#\.\.\.\.\.\#\#\.\.\.\.\#\#\.\.\.\.\.\#\#\.\.\#\#\.\.\#\#\.\.\.\.\.\.\.\#\#\.\.\#\#\.\.; echo \#\#\#\#\#\#\#\#\.\.\#\#\.\.\.\.\.\#\#\.\.\.\.\#\#\.\.\.\.\#\#\#\#\#\#\#\#\.\.\.\#\#\.\.\#\#\.\.\.\.\.\.\.\#\#\#\#\#\.\.\.; echo \#\#\.\.\.\.\.\.\.\.\#\#\#\#\#\#\#\#\#\.\.\.\.\#\#\.\.\.\.\#\#\.\.\.\#\#\.\.\.\.\#\#\.\.\#\#\.\.\.\.\.\.\.\#\#\.\.\#\#\.\.; echo \#\#\.\.\.\.\.\.\.\.\#\#\.\.\.\.\.\#\#\.\.\.\.\#\#\.\.\.\.\#\#\.\.\.\.\#\#\.\.\.\#\#\.\.\#\#\.\.\.\.\#\#\.\#\#\.\.\.\#\#\.; echo \#\#\.\.\.\.\.\.\.\.\#\#\.\.\.\.\.\#\#\.\.\.\.\#\#\.\.\.\.\#\#\.\.\.\.\.\#\#\.\#\#\#\#\.\.\#\#\#\#\#\#\.\.\#\#\.\.\.\.\#\#;'
alias praise_drupal='echo \.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\@\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\@\@\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\@\@\@\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\+\@\@\@\+\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\@\@\@\@\@\+\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\@\+\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\@\@\@\@\@\@\@\@\+\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\@\@\@\@\@\@\@\@\@\@\@\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\@\@\@\@\@\@\@\@\@\@\@\@\@\+\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\+\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\+\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\+\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\+\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\+\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\+\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\+\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\+\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\+\.\.\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\.\.\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\.\.\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\.\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\.\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\.\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\.\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\+\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\+\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\+\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\+\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\+\+\.\.\+\+\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\+\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\+\.\.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\+\+\+\@\@\@\@\@\+\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\.\.\.\.\.\.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\+\.\.\.\.\.\@\@\@\@\@\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\+\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\+\.\.\.\.\.\.\.\.\@\@\@\@\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\+\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\.\.\.\.\.\.\.\.\.\.\+\@\@\+\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\+\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\@\@\@\@\@\@\@\+\.\.\.\.\.\.\.\.\.\.\.\.\@\@\+\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\@\@\@\@\@\@\@\@\@\@\.\.\.\.\.\.\.\.\.\.\.\.\.\.\@\@\+\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\@\@\@\@\@\@\@\@\@\@\@\@\@\@\+\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\@\+\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\@\@\+\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\@\@\@\@\@\@\@\@\@\@\@\@\@\@\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\+\@\@\+\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\@\@\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\@\@\@\@\@\@\@\@\@\@\@\@\@\@\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\@\@\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\@\@\@\@\@\@\@\@\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\@\@\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\@\@\@\@\@\@\@\+\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\+\+\+\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\+\@\+\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\@\@\@\@\@\@\@\@\@\@\@\@\+\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\+\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\@\@\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\@\@\@\@\@\@\@\@\@\@\@\@\@\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\@\@\@\@\.\.\.\.\.\.\.\.\.\.\.\.\.\.\@\@\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\@\@\@\@\@\@\@\@\@\@\@\@\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\@\@\@\@\@\@\@\@\@\@\@\@\.\.\.\.\.\.\.\.\.\.\.\.\+\@\+\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\@\@\@\@\@\@\@\@\@\@\@\@\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\@\@\@\@\@\@\@\@\@\.\.\.\.\.\.\.\.\.\.\.\@\@\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\@\@\@\@\@\@\@\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\.\.\.\.\.\.\.\.\.\+\@\@\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\.\@\@\@\@\@\@\@\@\@\@\@\@\+\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\.\.\.\.\.\.\.\.\@\@\+\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\@\@\@\@\@\@\@\+\.\.\.\.\.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\.\.\.\.\.\.\@\@\@\.\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\.\.\@\@\@\@\@\@\@\@\@\@\@\@\@\@\+\.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\@\@\@\@\@\@\+\.\.\.\.\.\.\@\@\@\@\@\@\@\@\+\.\.\+\@\@\@\.\.\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\+\.\.\.\.\.\.\.\.\.\@\@\@\@\@\@\@\@\@\@\@\@\@\+\.\.\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\+\.\.\+\@\@\@\@\@\.\.\+\@\@\@\@\@\@\@\@\@\@\@\@\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\+\.\.\@\@\@\@\@\@\@\@\.\.\@\@\@\@\@\@\@\@\@\@\@\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\+\.\@\@\@\@\@\@\@\@\@\+\+\@\@\@\@\@\@\@\@\@\@\+\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\+\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\+\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\+\@\@\@\@\@\@\+\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\+\.\.\+\@\@\@\@\@\@\@\@\@\@\@\@\@\@\+\.\.\@\@\@\@\@\+\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\+\.\.\.\.\.\+\@\@\@\@\@\@\@\+\+\.\.\.\.\+\@\@\@\@\+\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\+\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\+\.\.\.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\@\+\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\+\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\+\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\+\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.; echo \.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\+\@\@\@\@\@\@\@\@\@\@\@\@\@\@\@\+\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.\.;'
