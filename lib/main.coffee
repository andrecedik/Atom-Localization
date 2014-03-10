module.exports =
  loadLocalization: () ->
    languages = require('../languages.json')
    selection = atom.config.get('localization. - currentLanguage')
    if selection == "default"
      return
    for l in languages
      if l['language'] == selection
        selection = l['path']
    dict = require(selection)
    walker = (currentMenu, transMenu)->
      for i in currentMenu
        if transMenu[i.label] != undefined
          if transMenu[i.label]['submenu'] != undefined and i['submenu'] != undefined
            walker(i.submenu, transMenu[i.label]['submenu'])
          i.label = transMenu[i.label]['value']
    walker(atom.menu.template, dict.menu)
    atom.menu.update()

  selectedLanguage: (value) ->
    languages = []
    for x in require('../languages.json')
      languages.push x
    languages.push {"language":"default", "path":"default"}
    for language in languages
      if atom.config.get("localization." + language['language']) == true
        atom.config.set('localization. - currentLanguage', language['language'])
        atom.config.set("localization." + language['language'], false)
        atom.reload()


  activate: (state) ->

    languages = require('../languages.json')
    if not atom.config.get("localization.default")
      atom.config.set("localization.default", false)
    for language in languages
      if not atom.config.get("localization." + language['language'])
        atom.config.set("localization." + language['language'], false)

    setTimeout( ( (father)->
        if not atom.config.get('localization. - currentLanguage')
          atom.config.set('localization. - currentLanguage', 'default')
        father.loadLocalization()
        father.addObserver()
      )
    ,1000,this)


  addObserver: () ->
    languages = require('../languages.json')
    atom.config.observe "localization.default", @selectedLanguage
    for language in languages
      atom.config.observe "localization." + language['language'], @selectedLanguage
