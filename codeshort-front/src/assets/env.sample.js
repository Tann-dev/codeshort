(function (window) {
    window['env'] = window['env'] || {};
  
    // Environment variables
    window['env']['production'] = '${APP_ENV}' === 'production';
    window['env']['apiKey'] = '${API_ENDPOINT}';
    window['env']['serverKey'] = '${APP_ENDPOINT}';
  })(this);