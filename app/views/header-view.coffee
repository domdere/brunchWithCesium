define ['jquery', 'bootstrap', 'views/base/view', 'text!views/templates/header.hbs'], ($, Bootstrap, View, template) ->
    class HeaderView extends View
        autoRender: yes
        container: '.header-container'
        template: template

        render: () ->
            super
            # need to run it this way because this.$el has not been added to the DOM yet.
            # otherwise if it were i could run "($ '.dropdown-toggle').dropdown()"
            ((this.$el).find '.dropdown-toggle').dropdown()
            return

    return HeaderView
