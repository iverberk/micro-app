describe('the micro-app application', function() {
    it('should generate an introduction', function() {
        browser.url('/');
        browser.getTitle().should.match(/Hello, my name is .+ and I'm \d+ years old and I live in the .+ environment!/);
    });
});
