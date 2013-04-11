define ['controllers/base/controller', 'views/home-page-view'], (Controller, HomePageView) ->

    class HomeController extends Controller
        historyURL: 'home'
        index: () ->
            console.debug 'show#home'
            @view = new HomePageView

    return HomeController
