module.exports = {
  root: true,
  extends: ['react-app'],
  plugins: ['promise'],
  rules: {
    'promise/prefer-await-to-then': 'off',
  },
};
