define ['javascripts/views/base/view', 'javascripts/views/templates/header'], (View, template) ->
    class HeaderView extends View
        autoRender: yes
        className: 'header'
        region: 'header'
        id: 'header'
        template: template

    return HeaderView
