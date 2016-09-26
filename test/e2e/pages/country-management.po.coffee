Page = require('astrolabe').Page

module.exports = Page.create
  url: get: -> browser.baseUrl + '#/countries'

  countryCreationLink: get: -> element(By.css('[href="#/countries/create"]'))
  #countryUpdateLink: get: -> element(By.css('.update-country'))
  countryUpdateLink: get: -> element.all(By.css('.update-country'))   
  countryListLink: get: -> element(By.css('[href="#/countries/"]'))
  countriesEnabled: get: -> element.all(By.css('.country-enabled'))
  countriesDisabled: get: -> element.all(By.css('.country-disabled'))
  showAllButton: get: -> element(By.css('#showAll'))

  showAll: value: () ->
    @showAllButton.click()