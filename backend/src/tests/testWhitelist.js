const { isWhitelisted } = require('../services/whitelistService');

(async () => {
    const result = await isWhitelisted('64283446653137');
    console.log('RESULT:', result);
})();
