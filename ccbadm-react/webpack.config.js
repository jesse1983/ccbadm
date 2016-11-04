const ExtractTextPlugin = require('extract-text-webpack-plugin');

const excludes = /(node_modules|bower_components)/;
const pack = {
  entry: {
    client: './client.jsx',
  },
  output: {
    path: './public',
    filename: 'bundle.js',
    chunkFilename: 'bundle.js',
  },
  module: {
    loaders: [
      {
        test: /\.(ttf|eot|svg)(\?v=[0-9]\.[0-9]\.[0-9])?$/,
        loader: 'file-loader',
      },
      {
        test: /\.(woff|png)(2)?(\?v=[0-9]\.[0-9]\.[0-9])?$/,
        loader: 'url-loader?limit=100000',
      },
      {
        test: /\.(sass|scss)$/,
        loader: ExtractTextPlugin.extract('style-loader', 'css-loader!sass-loader', 'postcss-loader'),
      },

      {
        test: /\.css$/,
        loader: ExtractTextPlugin.extract('style-loader', 'css-loader', 'postcss-loader'),
      },
      {
        test: /\.json$/,
        exclude: excludes,
        loader: 'json',
      },
      {
        test: /\.jsx?$/,
        exclude: excludes,
        loader: 'babel-loader',
        query: {
          presets: ['es2015', 'react'],
        },
      },
    ],
  },
  resolve: {
    modulesDirectories: ['./node_modules'],
    extensions: ['', '.js', '.jsx', '.json', 'css'],
  },
  resolveLoader: {
    modulesDirectories: ['./node_modules'],
  },
  watchOptions: {
    aggregateTimeout: 300,
    poll: 1000,
  },
  plugins: [
    new ExtractTextPlugin('bundle.css'),
  ],

};
module.exports = pack;
