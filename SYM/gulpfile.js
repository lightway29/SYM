var gulp = require('gulp'),
  jshint = require('gulp-jshint'),
  jscs = require('gulp-jscs'),
  nodemon = require('gulp-nodemon'),
  babelify = require('babelify'),
  browserify = require('browserify'),
  connect = require('gulp-connect'),
  source = require('vinyl-source-stream'),
  globby = require('globby');
var jsFiles = ['*.js', 'src/**/*.js'];

gulp.task('style', function() {
  return gulp.src(jsFiles)
    .pipe(jshint())
    .pipe(jshint.reporter('jshint-stylish', {
        verbose: true
    }))
    .pipe(jscs());
});

gulp.task('inject', function() {
  var wiredep = require('wiredep').stream;
  var inject = require('gulp-inject');

  var injectSrc = gulp.src(['./public/css/*.css',
    './public/js/*.js'
  ], {
    read: false
  });

  var injectOptions = {
    ignorePath: '/public'
  };

  var options = {
    bowerJson: require('./bower.json'),
    directory: './public/lib',
    ignorePath: '../../public'
  };

  return gulp.src('./src/views/*.html')
    .pipe(wiredep(options))
    .pipe(inject(injectSrc, injectOptions))
    .pipe(gulp.dest('./src/views'));
});

//Convert ES6 ode in all js files in src/js folder and copy to
//build folder as bundle.js
gulp.task('build', function(){
  globby(['./src/**/*.es6.js']).then(function(entries) {
    return browserify({
        entries: entries
    })
    .transform(babelify.configure({
        presets : ['es2015']
    }))
    .bundle()
    .pipe(source('bundle.js'))
    .pipe(gulp.dest('./public/js'))
    ;
  }).catch(function(err) {
    // ensure any errors from globby are handled
  });
});

gulp.task('serve', ['style', 'inject', 'build'], function() {
  var options = {
    script: 'app.js',
    delayTime: 1,
    env: {
        'PORT': 3000
    },
    watch: jsFiles
  };
  return nodemon(options)
    .on('restart', function(ev) {
    console.log('Restarting super server...');
    });
});
