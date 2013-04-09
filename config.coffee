exports.config =
  # See http://brunch.io/#documentation for documentation.
  files:
    javascripts:
      joinTo:
        'javascripts/app.js': /^app/
        'javascripts/vendor/require-text.js': /^vendor[\\/]scripts[\\/]require-text/
        'javascripts/vendor/console-polyfill.js': /^vendor[\\/]scripts[\\/]console-polyfill/
        'javascripts/vendor/jQuery.js': /^vendor[\\/]scripts[\\/]jquery/
        'javascripts/vendor/underscore.js': /^vendor[\\/]scripts[\\/]underscore/
        'javascripts/vendor/backbone.js': /^vendor[\\/]scripts[\\/]backbone/
        'javascripts/vendor/chaplin.js': /^vendor[\\/]scripts[\\/]chaplin/
        'javascripts/vendor/bootstrap.js': /^vendor[\\/]scripts[\\/]bootstrap/
        'test/javascripts/test.js': /^test[\\/](?!vendor)/
        'test/javascripts/test-vendor.js': /^test[\\/](?=vendor)/
      order:
        # Files in `vendor` directories are compiled before other files
        # even if they aren't specified in order.before.
        before: [
          'vendor/scripts/console-polyfill.js',
          'vendor/scripts/jquery-1.9.1.js',
          'vendor/scripts/underscore-1.4.4.js',
          'vendor/scripts/backbone-0.9.10.js'
        ]
        after: [
          'test/vendor/scripts/test-helper.js'
        ]

    stylesheets:
      joinTo:
        'stylesheets/app.css': /^(app|vendor)/
        'test/stylesheets/test.css': /^test/
      order:
        after: ['vendor/styles/helpers.css']

    templates:
      joinTo: 'javascripts/app.js'

  modules:
    wrapper: 'amd'
    definition: 'amd'
    addSourceURLs: true
