#Atom Localizations
===
Atom Localization is a package for Atom Editor.



###Support Languages
- Chinese Simplified
- Chinese Traditional
- Danish


###Install
- Please install through Atom->Preferences->Packages: localization


###Localization in your language
Any translation in languages not listed above are welcome, as well as better translation for those in list.

###How to localize
- Download [the json file](https://raw.github.com/pandarison/Atom-Localization/master/i18n/default.json) and replace "Your Translation" fileds.
- You can also add translations for other menu. Just follow the format.
- Put the file into /i18n under root directory of the package.
- Add your language name to languages.json under the root directory of the package. 
>{"language":"language name", "path":"../i18n/Your Translation.json"}
- Make a pull request to the repo, or send the file to <Pandarison@gmail.com>









###Release Notes
##### Version 0.9.0
* Add Danish Support. (By [Per](https://github.com/thedataking))

##### Version 0.8.0
* Remove old configuration when upgrade to new version

#####Version 0.3.0
* Fixed some bugs

#####Version 0.1.0
* Add Simplified Chinese support
* Add Traditional Chinese Support
