module.exports = function(api) {
  var validEnv = ['development', 'test', 'production']
  var currentEnv = api.env()
  var isDevelopmentEnv = api.env('development')
  var isProductionEnv = api.env('production')
  var isTestEnv = api.env('test')

  if (!validEnv.includes(currentEnv)) {
    throw new Error(
      'Please specify a valid NODE_ENV or ' +
        'BABEL_ENV environment variables. Valid values are "development", ' +
        '"test", and "production". Instead, received: ' +
        JSON.stringify(currentEnv) +
        '.'
    )
  }

  return {
    presets: [
      isTestEnv && [
        require.resolve('@babel/preset-env'),
        {
          targets: {
            node: 'current'
          }
        }
      ],
      (isProductionEnv || isDevelopmentEnv) && [
        require.resolve('@babel/preset-env'),
        {
          forceAllTransforms: true,
          useBuiltIns: 'entry',
          corejs: 3,
          modules: false,
          exclude: ['transform-typeof-symbol']
        }
      ]
    ].filter(Boolean),
    plugins: [
      require.resolve('babel-plugin-macros'),
      require.resolve('@babel/plugin-syntax-dynamic-import'),
      isTestEnv ? require.resolve('babel-plugin-dynamic-import-node') : null,
      require.resolve('@babel/plugin-transform-destructuring'),
      [require.resolve('@babel/plugin-proposal-class-properties'), { loose: true }],
      [require.resolve('@babel/plugin-proposal-object-rest-spread'), { useBuiltIns: true }],
      [require.resolve('@babel/plugin-proposal-private-methods'), { loose: true }],
      [require.resolve('@babel/plugin-proposal-private-property-in-object'), { loose: true }],
      [require.resolve('@babel/plugin-transform-runtime'), { helpers: false }],
      [require.resolve('@babel/plugin-transform-regenerator'), { async: false }]
    ].filter(Boolean)
  }
}
