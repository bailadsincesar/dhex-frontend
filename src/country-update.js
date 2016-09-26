import {inject, Lazy} from 'aurelia-framework';
import {HttpClient, json} from 'aurelia-fetch-client';

// polyfill fetch client conditionally
const fetch = !self.fetch ? System.import('isomorphic-fetch') : Promise.resolve(self.fetch);

@inject(Lazy.of(HttpClient))
export class CountryUpdate {
  heading = 'Country Update';
  countryError = '';
  countryId = 0;
  countryName = '';
  countryNameInitial = '';
  countryEnabled = false;
  countryEnabledInitial = false;

  constructor(getHttpClient) {
    this.getHttpClient = getHttpClient;
  }

  async activate(params) {
    // ensure fetch is polyfilled before we create the http client
    await fetch;
    const http = this.http = this.getHttpClient();

    http.configure(config => {
      config
        .withDefaults({
          credentials: 'same-origin',
          headers: {
            mode: 'cors',
            'Accept': 'application/json',
            'X-Requested-With': 'Fetch'
          }
        })
        .withBaseUrl('http://localhost:8080/');
    });

    http.fetch('countries/id/' + params.id)
      .then(response => response.json())
      .then(data => {
        let country = data;
        this.countryId = country.id;
        this.countryName = country.name;
        this.countryEnabled = country.enabled;
        this.countryEnabledInitial = country.enabled;
      });
  }

  submit() {
    this.countryError = '';

    if (this.countryEnabledInitial == this.countryEnabled) {
      this.countryError = 'There are no changes';
      return false;
    }

    const http = this.http = this.getHttpClient();

    http.configure(config => {
      config
        .withDefaults({
          credentials: 'same-origin',
          headers: {
            mode: 'cors',
            'Accept': 'application/json',
            'X-Requested-With': 'Fetch'
          }
        })
        .withBaseUrl('http://localhost:8080/');
    });

    http.fetch('countries/', {
      method: 'put',
      body: json({ id: this.countryId, name: this.countryName, enabled: this.countryEnabled })
    })
      .then(response => {
        if (response.ok)
          alert('The country was successfully updated');
        else
          this.countryError = 'There was an error updating the country';
      });
  }
}
