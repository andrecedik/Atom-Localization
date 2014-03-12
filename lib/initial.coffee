require('atom')
module.exports =
    initial: () ->
        atom.config.settings.localization = {}
        atom.config.save()