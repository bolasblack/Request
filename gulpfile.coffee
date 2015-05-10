gulp = require 'gulp'
gulp_shell = require 'gulp-shell'
gulp_sourceStream = require 'vinyl-source-stream'
browserify = require 'browserify'

gulp.task 'build', ->
  browserify 'src/index.coffee'
    .exclude('react-native')
    .transform('coffee-reactify')
    .bundle()
    .pipe gulp_sourceStream('index.ios.js')
    .pipe gulp.dest 'dist/'

gulp.task 'watch', ->
  gulp.watch 'src/**/*', ['build']

gulp.task 'default', ['build', 'watch']
