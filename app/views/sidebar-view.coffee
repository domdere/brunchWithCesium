define ['views/base/view', 'text!views/templates/sidebar.hbs'], (View, template) ->
    
    class SibebarView extends View
        template: template
        container: '.sidebar-container'
        autoRender: yes

        initialize: () ->
            super
            @listenTo @collection, 'reset', ()->
                @render()
