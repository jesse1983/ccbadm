module.exports = {
  home: {
    path: '/',
    title: 'Dashboard',
  },
  login: {
    path: '/login',
    title: 'Login',
    public: true,
  },
  logout: {
    path: '/logout',
    title: 'Logout',
  },
  properties: {
    path: '/properties',
    title: 'Imóveis',
    service: 'property',
    method: 'getAll',
  },
  users: {
    path: '/users',
    title: 'Usuários',
  },
};

