module.exports =
  selectedLanguage: (value) ->
    if value == false
      return
    languages = require('../languages.json')
    selection = "#"
    for language in languages
      if atom.config.get("localization." + language['language']) == true
        selection = language['path']
        atom.config.set('localization. - currentLanguage', language['language'])
      atom.config.set("localization." + language['language'], false)
    atom.config.set("localization.default",false)


    if selection == "#"
      if atom.config.get('localization. - currentLanguage') != 'default'
        atom.reload()
      atom.config.set('localization. - currentLanguage', 'default')  
    else
      dict = require(selection)
      walker = (currentMenu, transMenu)->
        for i in currentMenu
          if transMenu[i.label] != undefined
            if transMenu[i.label]['submenu'] != undefined and i['submenu'] != undefined
              walker(i.submenu, transMenu[i.label]['submenu'])
            i.label = transMenu[i.label]['value']
      walker(atom.menu.template, dict.menu)
      atom.menu.update()
      atom.config.set('localization.default', false)
      atom.config.set("localization." + language['language'], false)






  activate: (state) ->
    setTimeout(((father)->
      if not atom.config.get('localization. - currentLanguage')
        atom.config.set('localization. - currentLanguage', 'default')
      father.addObserver()
      atom.config.set('localization.' + atom.config.get('localization. - currentLanguage'), true))
      ,1000,this)


  addObserver: (languages) ->
    languages = require('../languages.json')
    atom.config.set("localization.default", false)
    atom.config.observe "localization.default", @selectedLanguage
    for language in languages
      atom.config.set("localization." + language['language'], false)
      atom.config.observe "localization." + language['language'], @selectedLanguage
