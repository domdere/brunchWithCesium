define ['cesium', 'mediator'], (Cesium, mediator) ->

    class CesiumScene
        constructor: () ->
            mediator.subscribe 'cesiumStart', @initialise
            mediator.subscribe 'cesiumStop', @stop

        initialise: (cesiumContainer) ->
            console.log('CesiumScene#initialise')

            

            return
            

    return CesiumScene
