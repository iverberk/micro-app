describe('the micro-app application', function() {
    it('should generate an introduction', function() {
        client
            .url('http://webdriver.io')
            .getSource().then(function(source) {
                console.log(source); // outputs: "<!DOCTYPE html>\n<title>Webdriver.io</title>..."
            });
        //browser.url('/');
        //browser.getText('h1*=Hello').then(function(text) {
           //text.should.match(/Hello, my name is .+ and I'm \d+ years old and I live in the .+ environment!/);
        //});
});
