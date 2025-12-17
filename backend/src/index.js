const { Client, LocalAuth } = require('whatsapp-web.js');
const qrcode = require('qrcode-terminal');

// Inisialisasi client WhatsApp
const client = new Client({
    authStrategy: new LocalAuth()
});

// Generate QR Code
client.on('qr', (qr) => {
    console.log('Scan QR berikut untuk login WhatsApp');
    qrcode.generate(qr, { small: true });
});

// Bot siap
client.on('ready', () => {
    console.log('WhatsApp Bot siap digunakan');
});

// Terima pesan & balas ping–pong
client.on('message', message => {
    if (message.body.toLowerCase() === 'ping') {
        message.reply('pong');
    }
});

// Jalankan client
client.initialize();
