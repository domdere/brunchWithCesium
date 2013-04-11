define ['controllers/base/controller', 'views/header-view'], (Controller, HeaderView) ->
    class HeaderController extends Controller
        initialize: (options) ->
            super
            @view = new HeaderView()
            
            return

    return HeaderController
