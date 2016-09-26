Page = require('astrolabe').Page

module.exports = Page.create
  url: get: -> browser.baseUrl + '#/countries/1'

  countryNameEnabled: get: -> element(By.css('#countryEnabled'))
  countryUpdateName: get: -> element(By.css('#countryName'))
  saveButton: get: -> element(By.css('.btn.btn-default'))

  updateEnabled: value: () ->
    @countryNameEnabled.click()    
    @saveButton.click()

  openAlertDialog: value: () ->
    browser.wait () ->
      browser.wait(ExpectedConditions.alertIsPresent(), 5000).then(
        browser.switchTo().alert().then(
          # use alert.accept instead of alert.dismiss which results in a browser crash
          accept = (alert) ->
            alert.accept()
            return true
          , () ->
            return false
        )
      )

 
 