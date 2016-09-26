countryManagementPage = require '../pages/country-management.po.coffee'
countryUpdatePage = require '../pages/country-update.po.coffee'

describe 'Country Update Page', ->

  Given ->
    countryManagementPage.go()

  When ->
    countryManagementPage.countryUpdateLink.first().click()

  Then ->
    expect(countryUpdatePage.countryUpdateName.getText()).toBe 'Surinam'


describe 'Country Update - Change Enabled', ->

  Given ->    
    countryUpdatePage.go()
 
  When ->
    countryUpdatePage.updateEnabled()

  Then ->
    expect(countryUpdatePage.openAlertDialog()).toBe(true)
