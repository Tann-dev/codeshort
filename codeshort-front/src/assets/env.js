(function (window) {
    window['env'] = window['env'] || {};
  
    // Environment variables
    window['env']['production'] = false;
    window['env']['apiKey'] = 'http://localhost:8080/api';
    window['env']['serverKey'] = 'http://localhost:8080';
  })(this);