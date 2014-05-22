var path = require('path');

/*global module:false*/
module.exports = function(grunt) {

  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks);

  grunt.initConfig({
    copy: {
            main: {
                files: [
                    // copy all the dot files but not sudoers-linux
                    {
                        expand: true,
                        src: ['inc/*'],
                        dest: path.join(process.env.HOME, '.inc')
                    },
                    {
                        expand: true,
                        src: ['.bashrc', '.bash_profile'],
                        dest: process.env.HOME
                    }
                ]
            }
        },
    watch: {
      main: {
        files: ['inc/*', '.bashrc', '.bash_profile'],
        tasks: ['copy']
      }
    }
  });

  // Default task.
  grunt.registerTask('default', ['copy']);

};
