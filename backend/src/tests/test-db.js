const db = require('../config/db');

async function testConnection() {
    try {
        // const [rows] = await db.query('SELECT 1 AS test');
        // console.log('Koneksi database berhasil ✅', rows);
        // process.exit(0);

        const [rows] = await db.query('SELECT COUNT(*) AS total FROM traffic_data');
        console.log(rows);

    } catch (error) {
        console.error('Koneksi database gagal ❌', error.message);
        process.exit(1);
    }
}

testConnection();
