define ['views/base/view', 'text!views/templates/about.hbs'], (View, template) ->
    class AboutPageView extends View
        autoRender: yes
        className: 'home-page'
        template: template

    return AboutPageView
