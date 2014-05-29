var path = require('path');

/*global module:false*/
module.exports = function(grunt) {

  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks);

  grunt.initConfig({
    copy: {
            main: {
                files: [
                    {
                        expand: true,
                        src: ['.bashrc', '.bash_profile', 'inc/*'],
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
