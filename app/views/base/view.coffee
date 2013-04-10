define ['chaplin', 'javascripts/lib/view-helper'], (Chaplin) ->

    class View extends Chaplin.View
        # Precompiled templates function initializer.
        getTemplateFunction: ->
            @template

    return View
