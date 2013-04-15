define ['controllers/base/controller', 'views/geoview'], (Controller, GeoView) ->

    class DataViewController extends Controller
        geo: () ->
            console.debug 'dataview#geo'
            @view = new GeoView()

    return DataViewController
