define ['javascripts/controllers/base/controller', 'javascripts/views/home-page-view'], (Controller, HomePageView) ->

    class HomeController extends Controller
        index: ->
            @view = new HomePageView region: 'main'

    return HomeController
