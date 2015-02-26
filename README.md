# Quick-Drush
Provides drush aliases, and customized functions

## Installation

### No .bashrc file yet
If you don't yet have the .bashrc file in you windows user folder _(eg. C:\Users\Your Username)_, create it, and copy the contents of .bashrc from this repo in there.

### Already have a .bashrc file
If you alreadye have a (customized) .bashrc file, copy the contents of .bashrc and paste it at the end of your current .bashrc file.

__If you already have your console open, be sure to restart it.__

## Aliases and Functions

| Command        | Drush Equivalent                 | What it does                                                                     |
| -------------- | -------------------------------- | -------------------------------------------------------------------------------- |
| `dr`           | drush _[drush command]_          | Basic drush call                                                                 |
| `dr mk`        | drush make _[makefile.make]_ -y  | Executes the make command (also asks to clear the contrib modules)               |
| `dr en`        | drush en _[module]_ -y           | Enables a module eg. en diff                                                     |
| `dr dis`       | drush dis _[module]_ -y          | Disables a module eg. dis diff                                                   |
| `dr lft`       | drush features                   | Provides a list of features, and shows their status                              |
| `dr_rstdef`    |                                  | resets your settings.php file (Run from drupal site root)                        |
| `dr_cmk`       | drush make _[makefile.make]_ -y  | Executes the make command (also clears the contrib modules withouth prompt)      |
| `dr_reinstall` |                                  | Reinstalls your site (requires mysql command to work)(Run from drupal site root) |
| `dr_endev`     |                                  | Enables common development modules (diff, field_ui, coffee, devel)               |
| `dr_disdev`    |                                  | Opposite of "endev"                                                              |
| `lsa`          | la -a -l                         | List all files in current dir                                                    |
| `dr cc`        | drush cc all                     | Clears all cache                                                                 |



## Compatibility

### OS
Tested succesfully on Windows 7 and Ubuntu 14.04.2 LTS

### Consoles
Tested succesfully in Gitbash and Console2
Does not work in the default windows cmd
