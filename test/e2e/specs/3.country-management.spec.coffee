countryManagementPage = require '../pages/country-management.po.coffee'

describe 'Country Managent - Show only Enabled Countries', ->

  Given ->
    countryManagementPage.go()

  Then ->
    expect(countryManagementPage.countriesDisabled.count()).toBe 0


describe 'Country Managent - Show All: Enabled & Disabled Countries', ->
  Given ->
    countryManagementPage.go()

  When ->
    countryManagementPage.showAll()
    browser.sleep(2000);

  Then ->
    expect(countryManagementPage.countriesDisabled.count()).toBe 1

  And ->
    expect(countryManagementPage.countriesEnabled.count()).toBe 1