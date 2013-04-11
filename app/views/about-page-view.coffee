define ['views/base/view', 'text!views/templates/about.hbs'], (View, template) ->
    class AboutPageView extends View
        autoRender: yes
        container: '.page-container'
        template: template

    return AboutPageView
