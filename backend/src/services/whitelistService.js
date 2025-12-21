const db = require('../config/db');

async function isWhitelisted(phoneNumber) {
    console.log('CHECK DB FOR:', phoneNumber);
    
    const [rows] = await db.query(
        `SELECT whitelist_id
         FROM whitelist
         WHERE no_whatsapp = ?
           AND status = 'active'
         LIMIT 1`,
        [phoneNumber]
    );

    return rows.length > 0;
}

async function getWhitelistByNumber(noWhatsapp) {
    const [rows] = await db.query(
        `SELECT whitelist_id, no_whatsapp 
         FROM whitelist 
         WHERE no_whatsapp = ? AND status = 'active'`,
        [noWhatsapp]
    );

    return rows.length ? rows[0] : null;
}


module.exports = { isWhitelisted, getWhitelistByNumber };
