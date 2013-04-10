define ['views/base/view', 'views/templates/header'], (View, template) ->
    class HeaderView extends View
        autoRender: yes
        className: 'header'
        region: 'header'
        id: 'header'
        template: template

    return HeaderView
