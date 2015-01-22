# Quick-Drush
Provides drush aliases, and customized functions

## Instalation
Drop the .bashrc file in you windows user folder _(eg. C:\Users\[Your Username])_

## Aliases and Functions

| Command      | Syntax                           | What it does                                                                      |
| ------------ | -------------------------------- | --------------------------------------------------------------------------------- |
| `dr`         | drush _[drush command]_          | Basic drush call                                                                  |
| `mk`         | drush make _[makefile.make]_ -y  | Executes the make command (also asks to clear the contrib modules)                |
| `en`         | drush en _[module]_ -y           | Enables a module eg. en diff                                                      |
| `dis`        | drush dis _[module]_ -y          | Disables a module eg. dis diff                                                    |
| `lft`        | drush features                   | Provides a list of features, and shows their status                               |
| `rstdef`     |                                  | resets your settings.php file (Run from drupal site root)                         |
| `lsa`        | la -a -l                         | List all files in current dir                                                     |
| `reinstall`  |                                  | Reinstalls your site (requires mysql command to work)(Run from drupal site root)  |
| `endev`      |                                  | Enables common development modules (diff, field_ui, coffee, devel)                |
| `disdev`     |                                  | Opposite of "endev"                                                               |
| `cc`         | drush cc all                     | Clears all cache                                                                  |

