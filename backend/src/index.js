const { Client, LocalAuth } = require('whatsapp-web.js');
const qrcode = require('qrcode-terminal');
const db = require('./config/db');


const {
    parseCommand,
    validateCekCommand,
    validateReconCommand
} = require('./handlers/commandHandler');

// Init client
const client = new Client({
    authStrategy: new LocalAuth()
});

// QR Code
client.on('qr', (qr) => {
    console.log('Scan QR untuk login WhatsApp');
    qrcode.generate(qr, { small: true });
});

// Ready
client.on('ready', () => {
    console.log('WhatsApp Bot siap digunakan');
});

// Message handler
client.on('message', async (message) => {

    // 1. Deteksi group / personal
    const isGroup = message.from.endsWith('@g.us');

    // 2. Parse command
    const parsed = parseCommand(message);
    if (!parsed) return;

    const { command, args } = parsed;

    // 3. Whitelist (dummy, implementasi real di No.17)
    const isWhitelisted = true;
    if (!isWhitelisted) {
        return message.reply('Maaf, Anda tidak memiliki akses.');
    }

    // 4. !askbot
    if (command === '!askbot') {
        return message.reply(
`Saya dapat membantu:

1️⃣ !cek
Digunakan untuk mengecek data traffic berdasarkan CID dan periode tanggal.

2️⃣ !recon
Digunakan untuk melakukan rekonsiliasi data tsel dengan data partner (Excel).

Silakan ketik command yang ingin digunakan.`
        );
    }

    // 5. !cek
    if (command === '!cek') {
        const result = validateCekCommand(args);

        if (result.guided) {
            return message.reply(
`Mode cek data aktif ✅

Gunakan format:
!cek <CID> <tanggal_awal> <tanggal_akhir>

Contoh:
!cek cid_video_82055 2025-08-01 2025-08-31`
            );
        }

        if (!result.valid) {
            return message.reply(result.message);
        }

        // status awal
        return message.reply(
`Request diterima ✅
CID: ${result.cid}
Periode: ${result.startDate} s/d ${result.endDate}

Sedang memproses data...`
        );
    }

    // 6. !recon
    if (command === '!recon') {
        const result = validateReconCommand(args);

        if (result.guided) {
            return message.reply(
`Mode rekonsiliasi aktif ✅

Gunakan format:
!recon <tanggal_awal> <tanggal_akhir>

Contoh:
!recon 2025-08-01 2025-08-31`
            );
        }

        if (!result.valid) {
            return message.reply(result.message);
        }

        return message.reply(
`Periode diterima ✅
Periode: ${result.startDate} s/d ${result.endDate}

Silakan kirim file Excel data partner (.xlsx)`
        );
    }

    // 7. Command tidak dikenali
    return message.reply('Command tidak dikenali. Gunakan !askbot');
});

// Start bot
client.initialize();
