define ['text!views/templates/geoview.hbs', 'views/base/view', 'mediator'], (template, View, mediator) ->
    class GeoView extends View
        autoRender: yes
        container: '.page-container'
        template: template

        render: () ->
            super
            # tell the CesiumScene to setup and start rendering on this container
            mediator.publish 'cesiumStart', this.$el.find '#cesiumContainer'
            return

    return GeoView
