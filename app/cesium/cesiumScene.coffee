define ['jquery', 'cesium', 'mediator'], ($, Cesium, mediator) ->

    class CesiumScene
        constructor: () ->

            mediator.subscribe 'cesiumStart', @initialise
            mediator.subscribe 'cesiumStop', @stop

            return

        # need the fat arraow (=>) here so that
        # when we bind it to the event in the above constructor it is properly bound to
        # 'this'
        initialise: (cesiumContainer) =>
            console.log('CesiumScene#initialise') 

            @canvas = ($ (cesiumContainer.find '#glCanvas'))[0]
            @ellipsoid = Cesium.Ellipsoid.WGS84
            @scene = new Cesium.Scene @canvas
            @primitives = @scene.getPrimitives()

            # bing maps:
            provider = new Cesium.BingMapsImageryProvider(
                url: 'http://dev.virtualearth.net',
                mapStyle: Cesium.BingMapsStyle.AERIAL,
                # Some versions of Safari support WebGL, but don't correctly implement
                # cross-origin image loading, so we need to load Bing imagery using a proxy.
                proxy: if Cesium.FeatureDetection.supportsCrossOriginImagery() then undefined else new Cesium.DeafultProxy('/proxy/'))

            @centralBody = new Cesium.CentralBody @ellipsoid

            @centralBody.getImageryLayers().addImageryProvider provider

            @centralBody.nightImageSource = '../../images/land_ocean_ice_lights_2048.jpg'
            @centralBody.specularMapSource = '../../images/earthspec1k.png'

            if @scene.getContext().getMaximumTextureSize() > 2048
                @centralBody.bumpMapSource = '../../images/earthbump1k.jpg'

            @scene.skyAtmosphere = new Cesium.SkyAtmosphere()

            @centralBody.depthAgainstTerrain = true

            @primitives.setCentralBody @centralBody

            @scene.getCamera().frustum.near = 1.0

            @tick()

            return

        stop: () =>
            return

        tick: () =>
            @scene.initializeFrame()
            @scene.render(new Cesium.JulianDate())
            Cesium.requestAnimationFrame(@tick)

            return
            

    return CesiumScene
