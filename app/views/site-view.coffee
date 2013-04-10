define ['views/base/view', 'text!views/templates/site.hbs'], (View, template) ->
    # Site view is a top-level view which is bound to body.
    class SiteView extends View
        container: 'body'
        id: 'site-container'
        regions:
            '#header-container': 'header'
            '#page-container': 'main'
        template: template

    return SiteView
