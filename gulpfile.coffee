require('coffee-script/register')

gulp = require('gulp')
del = require('del')
coffee = require('gulp-coffee')
bump = require('gulp-bump')

argv = require('yargs')
  .alias('b', 'bump')
  .default('bump', 'patch')
  .describe('bump', 'bump [major|minor|patch|prerelease] version')
  .argv

paths =
  source:
    manifest: ['package.json']
    coffee: ['lib_src/*.coffee']
  dest:
    root: '.'
    lib: 'lib'

gulp.task 'clean', ->
  del.sync(paths.dest.lib)

gulp.task 'coffee', ->
  gulp.src paths.source.coffee
    .pipe coffee()
    .pipe gulp.dest paths.dest.lib

gulp.task 'build', ['clean', 'coffee']

gulp.task 'default', ['build']

gulp.task 'bump', ['build'], ->
  gulp.src paths.source.manifest
    .pipe bump { type: argv.bump }
    .pipe gulp.dest(paths.dest.root)

gulp.task 'watch', ['build'], ->
  gulp.watch paths.source.coffee, ['coffee']
