export const environment = {
    production: (window as { [key: string]: any })['env']['production'] || false,
    apiKey: (window as { [key: string]: any })['env']['apiKey'] || 'http://localhost:8080',
    serverKey: (window as { [key: string]: any })['env']['serverKey'] || 'http://localhost:8080'
};
