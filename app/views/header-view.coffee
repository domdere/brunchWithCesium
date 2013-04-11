define ['views/base/view', 'text!views/templates/header.hbs'], (View, template) ->
    class HeaderView extends View
        autoRender: yes
        className: '.header-container'
        region: 'header'
        id: 'header'
        template: template

    return HeaderView
