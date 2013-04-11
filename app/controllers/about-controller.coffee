define ['controllers/base/controller', 'views/about-page-view'], (Controller, AboutPageView) ->
    
    class AboutController extends Controller
        show: () ->
            @view = new AboutPageView()

    return AboutController
