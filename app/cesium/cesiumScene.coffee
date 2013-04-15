define ['jquery', 'agicesium', 'mediator'], ($, Cesium, mediator) ->

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

            cameraOrientation = @getDefaultCameraOrientation()

            @scene.getCamera().controller.lookAt cameraOrientation.e, cameraOrientation.e.add(cameraOrientation.v), cameraOrientation.u

            @transitioner = new Cesium.SceneTransitioner @scene, @ellipsoid

            @tick()

            window.addEventListener('resize', @onResize, false)

            return

        stop: () =>
            return

        tick: () =>
            @scene.initializeFrame()
            @scene.render(new Cesium.JulianDate())
            Cesium.requestAnimationFrame(@tick)

            return

        getDefaultCameraOrientation: () ->
            e = new Cesium.Cartesian3 -5992851.119607907, 5673763.566986167, -4934288.41246672
            v = new Cesium.Cartesian3 0.5694784363814059, -0.5484879719002332, 0.6122542406364869
            u = new Cesium.Cartesian3 -0.4834355192950482, 0.3789231470579431, 0.7891180819800918

            return {e: e, v: v, u: u}

        onResize: () =>
            console.log 'CesiumScene#onResize'
            width = @canvas.clientWidth
            height = @canvas.clientHeight
            
            if @canvas.width == width and @canvas.height == height
                return

            @canvas.width = width
            @canvas.height = height
            @scene.getCamera().frustum.aspectRatio = width / height

            return
            

    return CesiumScene
