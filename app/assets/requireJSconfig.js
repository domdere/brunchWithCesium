require.config({
  paths: {
    jquery: 'javascripts/jQuery',
    jqueryui: 'javascripts/jQuery-ui',
    jquerycookies: 'javascripts/jQuery-Cookies',
    jqueryhotkeys: 'javascripts/jQuery-hotkeys',
    jqueryjstree: 'javascripts/jQuery-jsTree',
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
  deps: ["javascripts/app"]
});
