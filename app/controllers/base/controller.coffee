define ['chaplin', 'views/site-view', 'views/header-view'], (Chaplin, SiteView, HeaderView) ->

    class Controller extends Chaplin.Controller
        beforeAction:
            '.*': ->
                @compose 'site', SiteView
                @compose 'header', HeaderView

    return Controller
