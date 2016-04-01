describe('my awesome website', function() {
    it('should do some chai assertions', function() {
        browser.url('http://webdriver.io');
        browser.getTitle().should.contain('WebdriverIO');
    });
});
