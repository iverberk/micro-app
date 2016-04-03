describe('my awesome website', function() {
    it('should do some chai assertions', function() {
        browser.url('/');
        browser.getTitle().should.contain('WebdriverIO');
    });
});
