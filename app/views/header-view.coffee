define ['jquery', 'bootstrap', 'views/base/view', 'text!views/templates/header.hbs'], ($, Bootstrap, View, template) ->
    class HeaderView extends View
        autoRender: yes
        container: '.header-container'
        template: template

        render: () ->
            super
            #($ '.dropdown-toggle').dropdown()
            return

    return HeaderView
