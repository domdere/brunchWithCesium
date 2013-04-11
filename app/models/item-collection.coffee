define ['models/base/collection'], (Collection) ->

    class ItemCollection extends Collection
        url: 'data/sidebarItems.json'

    return ItemCollection
