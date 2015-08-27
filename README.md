# sprout-jetbrains-editors cookbook

[![Build Status](https://travis-ci.org/pivotal-sprout/sprout-jetbrains-editors.png?branch=master)](https://travis-ci.org/pivotal-sprout/sprout-jetbrains-editors)

Recipes for installing Jetbrains editors on OSX, along with Pivotal's IDE preferences for each editor

### Recipes

* `sprout-jetbrains-editors::rubymine` installs Rubymine plus preferences
* `sprout-jetbrains-editors::intellij` installs Intellij IDEA plus preferences
* `sprout-jetbrains-editors::intellij_ce` installs Intellij IDEA Community Edition plus preferences

*NOTE:*
To allow the JetBrains IDEs to run with a more recent version of Java, these
recipes will modify the installed IDE's JVMVersion setting from 1.6* to 1.6+
If you don't want this modification you can set the:
`sprout.jetbrains-editors.application.allow_latest_java` attribute to `false`

### Attributes

*NOTE:* All preferences are namespaced under `sprout => jetbrains-editors` they include:

* `preferences.repository` &mdash; The preferences repo to clone; default `'https://github.com/pivotal/pivotal_ide_prefs.git'`.
* `preferences.clone_dir` &mdash; The dir to clone the preferences into; default `'~/workspace/pivotal_ide_prefs'`.
* `preferences.revision` &mdash; The Refspec to clone; default `'master'`.
* `application.install_location` &mdash; The location the IDE was installed in; default is `'/Applications`;
* `application.jvm_version` &mdash; The value to set the JVMVersion for the IDE to; default `'1.6+'`.
* `application.allow_latest_java` &mdash; The flag to enable/disable modification of the JVMVersion; default `true`.

For more on Pivotal's IDE preferences, see
https://github.com/pivotal/pivotal_ide_prefs

