#!/usr/bin/python
import sys
sys.path.append('python_modules/')

import itertools
import logging
import os
import os.path

from contextlib import closing
from optparse import OptionParser, OptionGroup

import logUtils

def versionString():
    return '%prog 1.0'


def usageString():
    return '%prog [options]\n\
    Builds the config file for brunch projects.  Goes through the apps/javascript directory and, ignoring the assets/ dir, will go through and put each src file in its own js file and hopefully replicate the directory structure'

def setopts():
    parser = OptionParser(usage=usageString(), version=versionString())

    parser.add_option_group(logUtils.makeLogOpts(parser))

    return parser

class ConfigFileBuilder:
    def __init__(self):
        self.__mappings = []

        self.__directoryExclusions = ['assets', 'templates', 'styles']

        self.__logger = logging.getLogger(__name__)

        self.__configChunk1 = "exports.config =\n\
  files:\n\
    javascripts:\n\
      joinTo:\n"

        self.__configChunk2 = "      order:\n\
        # Files in `vendor` directories are compiled before other files\n\
        # even if they aren't specified in order.before.\n\
        before: [\n\
          'vendor/scripts/console-polyfill.js',\n\
          'vendor/scripts/jquery-1.9.1.js',\n\
          'vendor/scripts/underscore-1.4.4.js',\n\
          'vendor/scripts/backbone-0.9.10.js'\n\
        ]\n\
        after: [\n\
          'test/vendor/scripts/test-helper.js'\n\
        ]\n\
\n\
    stylesheets:\n\
      joinTo:\n\
        'stylesheets/app.css': /^(app|vendor)/\n\
        'test/stylesheets/test.css': /^test/\n\
      order:\n\
        after: ['vendor/styles/helpers.css']\n\
\n\
    templates:\n\
      joinTo: 'javascripts/app.js'\n\
\n\
  modules:\n\
    wrapper: (path, data) ->\n\
        cleanPath = path.replace(new RegExp('\\\\\\\\', 'g'), '/').replace(/^app\\//, '')\n\
        \"\"\"\n\
define('#{cleanPath}', function(require, exports, module) {\n\
  #{data.replace /(\\\\)?\\n(?!\\n)/g, ($0, $1) ->\n\
    if $1 then $0 else '\\n  '}\n\
});\n\
\"\"\"\n\
    definition: 'amd'\n\
    addSourceURLs: true\n"

        return

    def __getMappings(self, inputPath):
        self.__logger.info('Looking through directory: %s', inputPath)

        for element in os.listdir(inputPath):
            path = inputPath + element
            if os.path.isdir(path):
                self.__logger.debug('%s is a directory', path)
                if element not in self.__directoryExclusions:
                    self.__getMappings(path + '/')
                else:
                    self.__logger.debug('Skipping %s', path + '/')
            else:
                self.__logger.debug('%s is a file', path) 
                self.__addFileMapping(path)
                
    
        return

    def __addFileMapping(self, filePath):
        # trim the path name down to get rid of the "app/" bit:
        root, ext = os.path.splitext(filePath)
        newPath = root[4:] + ".js"

        self.__logger.debug('mapping %s -> %s', filePath, newPath)

        self.__mappings.append((newPath, filePath)) 

        return

    def __writeMappings(self, configFile):
        self.__logger.info('Writing the mappings...')
        
        for outPath, inPath in self.__mappings:
            configFile.write('        \'%s\' : /^%s$/\n' % (outPath, inPath.replace('/', r'[\\/]')))

        return

    def run(self):
        self.__getMappings('app/')

        self.__logger.info('final mappings: %s', self.__mappings)

        self.__logger.info('Opening config.coffee...')
        with open('config.coffee', 'w') as config:
            self.__logger.info('Writing to config.coffee...')
            config.write(self.__configChunk1)

            self.__writeMappings(config)

            with open('vendorMappings.cfg', 'r') as vendors:
                config.write(vendors.read())

            config.write(self.__configChunk2)
        return
        

def main(options, args):

    # Go through the directory tree and build the mappings first.

    builder = ConfigFileBuilder()

    builder.run()    

    return

if __name__ == '__main__':

    parser = setopts()

    (options, args) = parser.parse_args()
    
    if len(args) != 0:
        parser.error('expected 0 arguments got %d instead' % (len(args)))

    if not logUtils.isLogLevelValid(options.loglevel):
        parser.error('invalid value for --loglevel: %s' % (options.loglevel))

    with closing(logUtils.initialiseLogging(logUtils.getLoggingConfig(options))):
        main(options, args)
