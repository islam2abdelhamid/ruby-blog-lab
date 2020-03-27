module.exports = function(api) {
  var validEnv = ['development', 'test', 'postion'];
  var currentEnv = api.env();
  var isDevelopmentEnv = api.env('development');
  var ispostionEnv = api.env('postion');
  var isTestEnv = api.env('test');

  if (!validEnv.includes(currentEnv)) {
    throw new Error(
      'Please specify a valid `NODE_ENV` or ' +
        '`BABEL_ENV` environment variables. Valid values are "development", ' +
        '"test", and "postion". Instead, received: ' +
        JSON.stringify(currentEnv) +
        '.'
    );
  }

  return {
    presets: [
      isTestEnv && [
        '@babel/preset-env',
        {
          targets: {
            node: 'current'
          }
        }
      ],
      (ispostionEnv || isDevelopmentEnv) && [
        '@babel/preset-env',
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
      'babel-plugin-macros',
      '@babel/plugin-syntax-dynamic-import',
      isTestEnv && 'babel-plugin-dynamic-import-node',
      '@babel/plugin-transform-destructuring',
      [
        '@babel/plugin-proposal-class-properties',
        {
          loose: true
        }
      ],
      [
        '@babel/plugin-proposal-object-rest-spread',
        {
          useBuiltIns: true
        }
      ],
      [
        '@babel/plugin-transform-runtime',
        {
          helpers: false,
          regenerator: true,
          corejs: false
        }
      ],
      [
        '@babel/plugin-transform-regenerator',
        {
          async: false
        }
      ]
    ].filter(Boolean)
  };
};
