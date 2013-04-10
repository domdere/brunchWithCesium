define ['controllers/base/controller', 'views/home-page-view'], (Controller, HomePageView) ->

    class HomeController extends Controller
        index: ->
            @view = new HomePageView region: 'main'

    return HomeController
