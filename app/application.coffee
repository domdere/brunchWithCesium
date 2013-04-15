define ['chaplin', 'mediator', 'routes', 'controllers/header-controller', 'controllers/sidebar-controller', 'cesiumScene/cesiumScene'], (Chaplin, mediator, routes, HeaderController, SidebarController, CesiumScene) ->

    # The application object.
    class Application extends Chaplin.Application
        # Set your application name here so the document title is set to
        # Controller title Site title (see Chaplin.Layout#adjustTitle)
        title: 'Brunch example application'

        initialize: ->
            super

            # Initialize core components.
            # ---------------------------

            # Dispatcher listens for routing events and initialises controllers.
            @initDispatcher controllerSuffix: '-controller'

            # Layout listens for click events & delegates internal links to router.
            @initLayout()

            # Composer grants the ability for views and stuff to be persisted.
            @initComposer()

            # Mediator is a global message broker which implements pub / sub pattern.
            @initMediator()

            # Register all routes and start routing.
            # You might pass Router/History options as the second parameter.
            # Chaplin enables pushState per default and Backbone uses / as
            # the root per default. You might change that in the options
            # if necessary:
            # @initRouter routes, pushState: false, root: '/subdir/'
            @initRouter routes, pushState: true

            @initCesiumScene()

            # Start routing...
            @startRouting()

            # There are some controllers that are just always on and arent connected to any routes.
            @initControllers()

            # Freeze the application instance to prevent further changes.
            Object.freeze? this

        # Create additional mediator properties.
        initMediator: () ->
            # Add additional application-specific properties and methods
            # e.g. mediator.prop = null

            # Seal the mediator.
            mediator.seal()
            return

        # There are some controllers that are just always on and arent connected to any routes.
        initControllers: () ->
            new HeaderController()
            new SidebarController()
            return

        initCesiumScene: () ->
            @cesiumScene = new CesiumScene()
            return

    return Application
