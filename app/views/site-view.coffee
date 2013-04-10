define ['javascripts/views/base/view', 'javascripts/views/templates/site'], (View, template) ->
    # Site view is a top-level view which is bound to body.
    class SiteView extends View
        container: 'body'
        id: 'site-container'
        regions:
            '#header-container': 'header'
            '#page-container': 'main'
        template: template

    return SiteView
