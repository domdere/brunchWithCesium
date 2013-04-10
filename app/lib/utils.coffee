define ['chaplin'], (Chaplin) ->
    # Application-specific utilities
    # ------------------------------

    # Delegate to Chaplin’s utils module
    utils = Chaplin.utils.beget Chaplin.utils

    # _(utils).extend
    #  someMethod: ->

    return utils
