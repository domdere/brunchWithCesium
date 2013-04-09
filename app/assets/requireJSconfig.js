require.config({
  paths: {
    jquery: 'javascripts/jQuery',
    jqueryui: 'javascripts/jQuery-ui',
    underscore: 'javascripts/underscore',
    backbone: 'javascripts/backbone',
    backbone: 'javascripts/chaplin',
    text: 'javascripts/require-text',
    bootstrap: 'javascripts/bootstrap',
    templates: '../templates',
  },
  shim: {
    underscore: {
      exports: '_'
    },
    backbone: {
      deps: ['underscore', 'jquery'],
      exports: 'Backbone'
    },
    bootstrap: {
      deps: ['jquery']
    },
    jqueryui: {
      deps: ['jquery']
    }
  },
  deps: ["javascripts/app"]
});
