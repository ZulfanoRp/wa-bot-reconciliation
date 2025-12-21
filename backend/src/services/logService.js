const db = require('../config/db');

async function saveLog(whitelistId, command, responseResult) {
    try {
        await db.query(
            `INSERT INTO log_activity 
             (whitelist_id, command, response_result, timestamp)
             VALUES (?, ?, ?, NOW())`,
            [whitelistId, command, responseResult]
        );
    } catch (err) {
        console.error('Logging error:', err.message);
        // JANGAN throw error (bot harus tetap jalan)
    }
}

module.exports = {
    saveLog
};
