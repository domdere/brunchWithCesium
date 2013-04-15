define [], () ->
    return (match) ->
        match '', 'home#index', name: 'home'
        match 'about', 'about#show', name: 'about'
        match 'geoview', 'dataview#geo', name: 'dataview'
