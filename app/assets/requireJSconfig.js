require.config({
  paths: {
    jquery: 'inc/js/jQuery/1.9.1/jquery',
    jqueryui: '../inc/js/jQuery-ui/1.10.2/jquery-ui.custom',
    underscore: '../inc/js/underscore/1.4.2/underscore',
    backbone: '../inc/js/backbone/0.9.10/backbone-min',
    text: '../inc/js/require-text/2.0.5/text',
    templates: '../templates',
    bootstrap: '../inc/js/bootstrap/2.3.1/bootstrap',
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
    galleriffic: {
        deps: ['jquery']
    }
  },
  deps: ["main"]
});
