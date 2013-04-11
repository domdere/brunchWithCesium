define ['text!views/templates/home.hbs', 'views/base/view'], (template, View) ->
    class HomePageView extends View
        autoRender: yes
        container: '.page-container'
        template: template

    return HomePageView
