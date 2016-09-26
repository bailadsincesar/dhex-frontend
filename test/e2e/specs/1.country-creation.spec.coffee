countryManagementPage = require '../pages/country-management.po.coffee'
countryCreationPage = require '../pages/country-creation.po.coffee'

describe 'Country Creation Page', ->

  Given ->
    countryManagementPage.go()

  When ->
    countryManagementPage.countryCreationLink.click()

  Then ->
    expect(countryCreationPage.labelForInput.getText()).toBe 'Insert here the name of the country.'

  describe 'create country', ->
    When ->
      countryCreationPage.save('Surinam')

    Then ->
      expect(countryCreationPage.openAlertDialog()).toBe(true)


describe 'Country Creation - Without Name', ->

  Given ->
    countryCreationPage.go()

  When ->
    countryCreationPage.save('')

  Then ->
    expect(countryCreationPage.errorMessage.getText()).toBe('The name is missing')
    

describe 'Country Creation - Existing Country', ->

  Given ->
    countryCreationPage.go()  
 
  When ->
    countryCreationPage.save('Surinam')

  Then ->
    browser.sleep(1000);
    expect(countryCreationPage.errorMessage.getText()).toBe('The country name already exists')


describe 'Country Creation Enabled', ->

  Given ->
    countryCreationPage.go()

  When ->
    countryCreationPage.save('Chile')

  Then ->
    expect(countryCreationPage.openAlertDialog()).toBe(true)


