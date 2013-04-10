require ['application'], (Application) ->
    # Initialize the application on DOM ready event.
    $ ->
        app = new Application()
        app.initialize()
    
