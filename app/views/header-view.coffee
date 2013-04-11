define ['views/base/view', 'text!views/templates/header.hbs'], (View, template) ->
    class HeaderView extends View
        autoRender: yes
        container: '.header-container'
        template: template

    return HeaderView
