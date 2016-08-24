const gulp     = require('gulp');
const run      = require('run-sequence');
const plumber  = require('gulp-plumber');
const watch    = require('gulp-watch');
const del      = require('del');
const changed  = require('gulp-changed');
const coffee   = require('gulp-coffee');
const jade     = require('gulp-jade');
const sass     = require('gulp-sass');
const inject   = require('gulp-inject');
const rev      = require('gulp-rev');
const replace  = require('gulp-rev-replace');
const useref   = require('gulp-useref');
const filter   = require('gulp-filter');
const uglify   = require('gulp-uglify');
const csso     = require('gulp-csso');
const src      = './source';
const dist     = './dist';
const build    = './public';

gulp.task('default',()=> run('clean:dist',['coffee','jade','sass','copy:remain','copy:components'],'inject'));

gulp.task('build',()=> run('clean:build','rev','copy:build'));

gulp.task('watch',()=>{
	watch(`${src}/**/*.coffee`, ()=> run('coffee'));
	watch(`${src}/**/*.jade`, ()=> run('jade'));
	watch(`${src}/**/*.sass`, ()=> run('sass'));
	watch(`${dist}/index.jade`, ()=> run('inject'));
});

gulp.task('clean:dist',()=>{
	return del(dist);
});

gulp.task('coffee', ()=>{
	return gulp
		.src(`${src}/**/*.coffee`)
		.pipe(plumber())
		.pipe(changed(dist, {extension: '.js'}))
		.pipe(coffee({bare: true}))
		.pipe(gulp.dest(dist))
	;
});

gulp.task('jade', ()=>{
	return gulp
		.src(`${src}/**/*.jade`)
		.pipe(plumber())
		.pipe(changed(dist, {extension: '.html'}))
		.pipe(jade({pretty: true}))
		.pipe(gulp.dest(dist))
	;
});

gulp.task('sass', ()=>{
	return gulp
		.src(`${src}/**/*.sass`)
		.pipe(plumber())
		.pipe(changed(dist))
		.pipe(sass())
		.pipe(gulp.dest(dist))
	;
});

gulp.task('copy:remain', ()=>{
	return gulp
		.src(`${src}/**/*.{js,html,css,eot,svg,ttf,woff,woff2,png,jpg,gif}`)
		.pipe(plumber())
		.pipe(gulp.dest(dist))
	;
});
gulp.task('copy:components', ()=>{
	return gulp
		.src("components/**/*.{js,css}")
		.pipe(plumber())
		.pipe(gulp.dest(`${dist}/components`))
	;
});

gulp.task('inject',()=>{
	return gulp
		.src(`${dist}/index.html`)
		.pipe(plumber())
		.pipe(inject(gulp.src([
			`${dist}/**/*.js`,
			`${dist}/assets/**/*.css`,
			`!${dist}/components/**/*.*`
		],{read: false}),{relative: true}))
		.pipe(gulp.dest(dist))
	;
});

gulp.task('clean:build',()=>{
	return del(build);
});

gulp.task('rev',()=>{
	var jsFilter = filter(`**/*.js`, { restore: true });
	var cssFilter = filter(`**/*.css`, { restore: true });
	var noindexFilter = filter([`**/*`,`!**/index.html`], { restore: true });
	return gulp
		.src(`${dist}/index.html`)
		.pipe(plumber())
		.pipe(useref())
		.pipe(jsFilter)
		.pipe(uglify({mangle: false, preserveComments: false, beautify: true}))
		.pipe(jsFilter.restore)
		.pipe(cssFilter)
		.pipe(csso({comments: false}))
		.pipe(cssFilter.restore)
		.pipe(noindexFilter)
		.pipe(rev())
		.pipe(noindexFilter.restore)
		.pipe(replace())
		.pipe(gulp.dest(build))
	;
});

gulp.task('copy:build', ()=>{
	return gulp
		.src([
			`${dist}/**/*.{eot,svg,ttf,woff,woff2,png,jpg,gif}`,
			`${dist}/**/*.html`,
			`!${dist}/index.html`,
		])
		.pipe(plumber())
		.pipe(gulp.dest(build))
	;
});
