# Brunch Skeleton

Brunch skeleton based off the default "Brunch With Chaplin" skeleton.

Uses RequireJS/AMD instead of CommonJS and has some Libraries that I like to use added in.

## Additional Libraries
* jQuery-ui
* jQuery-jsTree
* jQuery-hotkeys
* jQuery-cookies
* Twitter Bootstrap

## Usage
* Create new project via executing `brunch new <project name> --skeleton git://github.com/domdere/brunchSkeleton.git`.
* Build the project with `brunch b` or `brunch w`.
* Open the `public/` dir to see the result.
* run the Python script to generate the `config.coffee` file for Brunch with `./buildBrunchConfig.py` (This is the (perhaps wrong) way I have made brunch split out my source files while still compiling them from CoffeeScript into JS)
* Write your code
* Run `./buildBrunchConfig.py` anytime you add any source files to the `app/` directory.
