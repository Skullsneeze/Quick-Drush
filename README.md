# Quick-Drush
Provides drush aliases, and customized functions

## Installation

### Windows

#### No .bashrc file yet
If you don't yet have the .bashrc file in your windows user folder _(eg. C:\Users\Your Username)_, create it, and copy the contents of windows/.bashrc from this repo in there.

### Already have a .bashrc file
If you already have a (customized) windows/.bashrc file, copy the contents of .bashrc and paste it at the end of your current .bashrc file.

### Mac

#### No .bash_profile file yet
If you don't yet have the .bash\_profile file in your root folder, create it (`sudo nano ~/.bash_profile`), and copy the contents of mac/.bash\_profile from this repo in there.

### Already have a .bash\_profile file
If you already have a (customized) .bash\_profile file, copy the contents of mac/.bash\_profile and paste it at the end of your current .bash\_profile file.

__If you already have your console open, be sure to restart it.__

## Aliases and Functions

| Alias           | Drush Equivalent        | What it does                                                       |
| --------------- | ----------------------- | ------------------------------------------------------------------ |
| `dr`            | drush _[drush command]_ | Basic drush call                                                   |
| `en`         	  | drush en _[module]_ -y  | Enables a module eg. en diff                                       |
| `dis`        	  | drush dis _[module]_ -y | Disables a module eg. dis diff                                     |
| `lft`        	  | drush features          | Provides a list of features, and shows their status                |
| `rstdef`     	  |                         | resets your settings.php file (Run from drupal site root)          |
| `endev`      	  |                         | Enables common development modules (diff, field_ui, coffee, devel) |
| `disdev`     	  |                         | Opposite of "endev"                                                |
| `cca`        	  | drush cc all            | Clears all cache                                                   |
| `praise_drupal` |                         | _Just for fun_ (prints the drupal logo to your console)            |


| Function        | Drush Equivalent                                                     | What it does                                                                     |
| --------------- | -------------------------------------------------------------------- | -------------------------------------------------------------------------------- |
| `dr_cmk`        | drush make _[makefile.make]_ -y                                      | Executes the make command (also clears the contrib modules withouth prompt)      |
| `dr_reinstall`  |                                                                      | Reinstalls your site (requires mysql command to work)(Run from drupal site root) |
| `dr_mk`         | drush make _[makefile.make]_ -y                                      | Executes the make command (also asks to clear the contrib modules)               |
| `dr_mkp`        | drush make --projects="_[project]_" --no-core "_[makefile.make]_" -y | Makes a specific project (module) from a build file                              |

## Compatibility

### OS
Tested succesfully on Windows 7/8, Ubuntu 14.04.2 LTS and Mac 10.9/10.10 OSX

_Note that some commands might have different results on different platforms_

### Consoles
Tested succesfully in Gitbash, Console2, Terminal and iTerm2
Does not work in the default windows cmd
