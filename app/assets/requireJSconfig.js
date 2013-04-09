require.config({
  paths: {
    jquery: 'javascripts/vendor/jQuery',
    jqueryui: 'javascripts/vendor/jQuery-ui',
    jquerycookies: 'javascripts/vendor/jQuery-Cookies',
    jqueryhotkeys: 'javascripts/vendor/jQuery-hotkeys',
    jqueryjstree: 'javascripts/vendor/jQuery-jsTree',
    underscore: 'javascripts/vendor/underscore',
    backbone: 'javascripts/vendor/backbone',
    backbone: 'javascripts/vendor/chaplin',
    text: 'javascripts/vendor/require-text',
    bootstrap: 'javascripts/vendor/bootstrap',
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
    },
    jquerycookies: {
        deps: ['jquery']
    },
    jqueryhotkeys: {
        deps: ['jquery']
    },
    jqueryjstree: {
        deps: ['jquery', 'jqueryhotkeys', 'jquerycookies']}
  },
  deps: ["main"]
});
