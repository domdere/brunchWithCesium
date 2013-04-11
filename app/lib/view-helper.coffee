define ['jquery', 'mediator', 'handlebars'], ($, mediator) ->
    # Application-specific view helpers
    # http://handlebarsjs.com/#helpers
    # --------------------------------

    # Map helpers
    # -----------

    # Make 'with' behave a little more mustachey.
    Handlebars.registerHelper 'with', (context, options) ->
        if not context or Handlebars.Utils.isEmpty context
            options.inverse(this)
        else
            options.fn(context)

    # Inverse for 'with'.
    Handlebars.registerHelper 'without', (context, options) ->
        inverse = options.inverse
        options.inverse = options.fn
        options.fn = inverse
        Handlebars.helpers.with.call(this, context, options)

    # Get Chaplin-declared named routes. {{#url "like" "105"}}{{/url}}
    Handlebars.registerHelper 'url', (routeName, params..., options) ->
        url = null
        # Backbone events are synchronous, so this is possible.
        mediator.publish '!router:reverse', routeName, params, (result) ->
            url = if result then "/#{result}" else routeName
        url

    # ------------------
    # Nav Button Helpers
    # ------------------

    # Got this from stackoverflow:
    # http://stackoverflow.com/questions/11533542/twitter-bootstrap-add-active-class-to-li
    # i couldnt get the 'data-toggle' solution to work at all :(
    stripTrailingSlash = (str) ->
        if str.substr -1 == '/'
            return str.substr 0, str.length -1

        return str

    bugle = 1

    onNavClick = () ->
        url = window.location.pathname
        activePage = stripTrailingSlash url

        $ '.nav li a'.each () ->
            thisDom = $ this
            thisDom.removeClass 'active'

            currentPage = stripTrailingSlash $ thisDom.attr 'href'
                
            if activePage == currentPage
                thisDom.parent.addClass 'active'

    return {onNavClick : onNavClick, bugle: bugle}
