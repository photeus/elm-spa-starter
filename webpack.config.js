const path = require('path');
const webpack = require('webpack');
const merge = require('webpack-merge');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const autoprefixer = require('autoprefixer');
const MiniCssExtractPlugin = require("mini-css-extract-plugin");

const prod = 'production';
const dev = 'development';

// determine build env
const TARGET_ENV = process.env.npm_lifecycle_event === 'build' ? prod : dev;
const isDev = TARGET_ENV == dev;
const isProd = TARGET_ENV == prod;

// entry and output path/filename constiables
const entryPath = path.join(__dirname, 'src/static/index.js');
const outputPath = path.join(__dirname, 'dist');
const outputFilename = isProd ? '[name]-[hash].js' : '[name].js'

console.log('WEBPACK GO! Building for ' + TARGET_ENV);

// common webpack config (valid for dev and prod)
const commonConfig = {
  output: {
    path: outputPath,
    filename: `static/js/${outputFilename}`,
  },
  resolve: {
    extensions: ['.js', '.elm'],
    modules: ['node_modules']
  },
  module: {
    noParse: /\.elm$/,
    rules: [{
      test: /\.(eot|ttf|woff|woff2|svg)$/,
      use: 'file-loader?publicPath=../../&name=static/css/[hash].[ext]'
    }]
  },
  plugins: [
    new webpack.LoaderOptionsPlugin({
      options: {
        postcss: [autoprefixer()]
      }
    }),
    new HtmlWebpackPlugin({
      template: 'src/static/index.html',
      inject: 'body',
      filename: 'index.html'
    })
  ]
}

// additional webpack settings for local env (when invoked by 'npm start')
if (isDev === true) {
  module.exports = merge(commonConfig, {
    mode: 'development',
    entry: [
      'webpack-dev-server/client?http://localhost:8080',
      entryPath
    ],
    devServer: {
      // serve index.html in place of 404 responses
      historyApiFallback: true,
      contentBase: './src',
      hot: true
    },
    module: {
      rules: [{
        test: /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
        use: [{
          loader: 'elm-webpack-loader',
          options: {
            verbose: true,
            debug: true
          }
        }]
      }, {
        test: /\.(css|scss)$/,
        use: ['style-loader', 'css-loader']
      }]
    }
  });
}

// additional webpack settings for prod env (when invoked via 'npm run build')
if (isProd === true) {
  module.exports = merge(commonConfig, {
    mode: 'production',
    entry: entryPath,
    module: {
      rules: [{
        test: /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
        use: 'elm-webpack-loader'
      }, {
        test: /\.css$/,
        use: [{
            loader: MiniCssExtractPlugin.loader,
            options: {
              // you can specify a publicPath here
              // by default it use publicPath in webpackOptions.output
              publicPath: '../'
            }
          },
          "css-loader"
        ]
      }]
    },
    plugins: [
      new MiniCssExtractPlugin({
        filename: "static/css/[name]-[hash].css",
        chunkFilename: "[name]-[hash].css"
      })
    ],
    optimization: {
      minimize: true
    }
  });
}