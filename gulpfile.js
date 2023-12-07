var gulp =            require('gulp'),
    browserSync =     require('browser-sync').create(),
    sass =            require('gulp-sass'),
    uglify =          require('gulp-uglify'),
    autoprefixer =    require('gulp-autoprefixer'),
    cleanCSS =        require('gulp-clean-css'),
    imagemin =        require('gulp-imagemin'),
    nunjucksRender =  require('gulp-nunjucks-render'),
    concat =          require('gulp-concat'),
    htmlmin =         require('gulp-htmlmin')


// Start static server + watching scss/html files
gulp.task('serve', ['sass', 'nunjucks-html-watch'], function() {
    browserSync.init({
        server: {
            baseDir: './build',
            serveStaticOptions: {
                extensions: ['html']
            }
        },

    });
    
    gulp.watch('scss/*.scss', ['sass']);
    gulp.watch('./**/*.html', ['nunjucks-html-watch'])
});

// CSS auto prefixer + move to static build and Craft
gulp.task('sass', function() {
    return gulp.src(['node_modules/bootstrap/scss/bootstrap.scss', 'scss/*.scss', 'scss/fa/*.scss'])
        .pipe(sass())
        .pipe(autoprefixer({
            browsers: ['last 2 versions'],
            cascade: false
        }))
        .pipe(cleanCSS())
        .pipe(gulp.dest('./build/css'))
        .pipe(gulp.dest('./craft/web/css'))
        .pipe(browserSync.stream());
});

// JS compression + move to static build and Craft
gulp.task('compressJs', function () {
    return gulp.src('js/*.js')
        .pipe(uglify())
        .pipe(gulp.dest('./build/js'))
        .pipe(gulp.dest('./craft/web/js'))
});

// Move fonts to static build and Craft
gulp.task('fonts', function() {
    return gulp.src('fonts/**')
            .pipe(gulp.dest('./build/fonts'))
            .pipe(gulp.dest('./craft/web/fonts'));
});

// Image compression + move to static build and Craft
gulp.task('compressImage', function () {
    return gulp.src('img/**')
        .pipe(imagemin({
            progressive: true,
            optimizationLevel: 3
        }))
        .pipe(gulp.dest('./build/img'))
        .pipe(gulp.dest('./craft/web/img'))
});

// Template rendering + move to static build and Craft
gulp.task('nunjucks', function() {
  return gulp.src('templates/**/*.+(html|nunjucks)')
    .pipe(nunjucksRender({
      path: ['templates']
    }))
    .pipe(htmlmin(
      {
        collapseWhitespace: true,
        removeComments: true
      }))
    .pipe(gulp.dest('./build'))
    .pipe(gulp.dest('./craft/templates'))
});

// Create a task that ensures the `nunjucks` task is complete before reloading browsers
gulp.task('nunjucks-html-watch', ['nunjucks'], function () {
  browserSync.reload();
});

// Compile project
gulp.task('build-project',
  ['sass', 'compressImage', 'compressJs', 'nunjucks', 'fonts']);

// Compile and start project
gulp.task('default', ['build-project', 'serve']);