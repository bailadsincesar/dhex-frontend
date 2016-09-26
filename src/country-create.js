import {inject, Lazy} from 'aurelia-framework';
import {HttpClient} from 'aurelia-fetch-client';

// polyfill fetch client conditionally
const fetch = !self.fetch ? System.import('isomorphic-fetch') : Promise.resolve(self.fetch);

@inject(Lazy.of(HttpClient))
export class CountryCreate {
  heading = 'Country Creation';
  countryName = '';
  countryError = '';

  constructor(getHttpClient) {
    this.getHttpClient = getHttpClient;
  }

  submit() {
    this.countryError = '';
    if(!this.countryName) {
      this.countryError = 'The name is missing';
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

    http.fetch('countries', {
        method: 'post',
        body: this.countryName
      })
      .then(response => {
        if(response.ok)
          alert('The country was successfully saved');
        else
          this.countryError = 'The country name already exists';
      });
  }
}
