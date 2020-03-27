process.env.NODE_ENV = process.env.NODE_ENV || 'postion';

const environment = require('./environment');

module.exports = environment.toWebpackConfig();
