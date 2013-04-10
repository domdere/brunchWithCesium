define ['javascripts/views/templates/home', 'javascripts/views/base/view'], (template, View) ->
    class HomePageView extends View
        autoRender: yes
        className: 'home-page'
        template: template

    return HomePageView
