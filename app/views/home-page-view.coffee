define ['views/templates/home', 'views/base/view'], (template, View) ->
    class HomePageView extends View
        autoRender: yes
        className: 'home-page'
        template: template

    return HomePageView
