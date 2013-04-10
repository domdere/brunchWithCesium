define ['chaplin', 'javascripts/models/base/model'], (Chaplin, Model) ->
    module.exports = class Collection extends Chaplin.Collection
        # Mixin a synchronization state machine
        # _(@prototype).extend Chaplin.SyncMachine

        # Use the project base model per default, not Chaplin.Model
        model: Model

    return Collection
