define ['controllers/base/controller', 'models/item-collection', 'views/sidebar-view'], (Controller, ItemCollection, SidebarView) ->
    class SidebarController extends Controller
        initialize: (options) ->
            super
            @collection = new ItemCollection()
            @view = new SidebarView({@collection})
            @collection.fetch
                error: (collection, xhr, options) ->
                    console.error xhr
            
            return

    return SidebarController
