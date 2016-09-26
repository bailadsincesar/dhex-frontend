export class CountryManagement {
  heading = 'Country Management';

  configureRouter(config, router) {
    config.map([
      { route: ['', 'list'], name: 'list', moduleId: './country-list', nav: true, title: 'Country List' },
      { route: 'create', name: 'create', moduleId: './country-create', nav: true, title: 'Country Creation' },
      { route: ':id', href: '',  name: 'update', moduleId: './country-update', nav: false, title: 'Country Update' }
    ]);

    this.router = router;
  }
}
