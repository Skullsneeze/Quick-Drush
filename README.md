# Quick-Drush
Provides drush aliases, and customized functions

## Installation
Drop the .bashrc file in you windows user folder _(eg. C:\Users\Your Username)_
If you alraedy have your console open, be sure to restart it.

## Aliases and Functions

| Command      | Drush Equivalent                                                     | What it does                                                                     |
| ------------ | -------------------------------------------------------------------- | -------------------------------------------------------------------------------- |
| `dr`         | drush _[drush command]_                                              | Basic drush call                                                                 |
| `mk`         | drush make _[makefile.make]_ -y                                      | Executes the make command (also asks to clear the contrib modules)               |
| `mkp`        | drush make --projects=["project to make"] --no-core ["makefile"] -y  | Executes the make command (but only builds the specified project (eg. media))    |
| `cmk`        | drush make _[makefile.make]_ -y                                      | Executes the make command (also clears the contrib modules withouth prompt)      |
| `en`         | drush en _[module]_ -y                                               | Enables a module eg. en diff                                                     |
| `dis`        | drush dis _[module]_ -y                                              | Disables a module eg. dis diff                                                   |
| `lft`        | drush features                                                       | Provides a list of features, and shows their status                              |
| `rstdef`     |                                                                      | resets your settings.php file (Run from drupal site root)                        |
| `lsa`        | la -a -l                                                             | List all files in current dir                                                    |
| `reinstall`  |                                                                      | Reinstalls your site (requires mysql command to work)(Run from drupal site root) |
| `endev`      |                                                                      | Enables common development modules (diff, field_ui, coffee, devel)               |
| `disdev`     |                                                                      | Opposite of "endev"                                                              |
| `cc`         | drush cc all                                                         | Clears all cache                                                                 |
