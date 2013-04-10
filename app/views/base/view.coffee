define ['chaplin', 'handlebars', 'lib/view-helper'], (Chaplin) ->

    class View extends Chaplin.View
        # Precompiled templates function initializer.
        getTemplateFunction: ->
            Handlebars.compile @template

    return View
