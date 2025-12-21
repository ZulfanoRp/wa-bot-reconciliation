const { Client, LocalAuth } = require('whatsapp-web.js');
const qrcode = require('qrcode-terminal');
const db = require('./config/db');

const { normalizePhoneNumber } = require('./utils/phone');
const { isWhitelisted, getWhitelistByNumber } = require('./services/whitelistService');
const { randomDelay } = require('./utils/delay');
const { saveLog } = require('./services/logService');

const {
    parseCommand,
    validateCekCommand,
    validateReconCommand
} = require('./handlers/commandHandler');

// ===============================
// INIT CLIENT
// ===============================
const client = new Client({
    authStrategy: new LocalAuth()
});

// ===============================
// HELPER: reply dengan typing + delay
// ===============================
async function replyWithDelayAndTyping(message, text) {
    const chat = await message.getChat();
    await chat.sendStateTyping();
    await randomDelay(2000, 5000);
    await message.reply(text);
    await chat.clearState();
}

// ===============================
// QR
// ===============================
client.on('qr', (qr) => {
    console.log('Scan QR untuk login WhatsApp');
    qrcode.generate(qr, { small: true });
});

// ===============================
// READY
// ===============================
client.on('ready', async () => {
    console.log('WhatsApp Bot siap digunakan');
    const [rows] = await db.query('SELECT COUNT(*) AS total FROM whitelist');
    console.log('TOTAL WHITELIST ROW:', rows[0].total);
});

// ===============================
// MESSAGE HANDLER
// ===============================
client.on('message', async (message) => {

    // ===== DEBUG LID (WAJIB, JANGAN DIHAPUS) =====
    console.log('RAW FROM:', message.from);
    console.log('AUTHOR:', message.author);

    const phone = normalizePhoneNumber(message);
    console.log('NORMALIZED:', phone);

    try {
        const body = message.body?.trim();
        if (!body || !body.startsWith('!')) return;

        const parsed = parseCommand(message);
        if (!parsed) return;

        let { command, args } = parsed;
        console.log('PARSED COMMAND VALUE:', command);

        command = command.replace('!', '');

        console.log('PARSED COMMAND VALUE (after):', command);

        // ===============================
        // WHITELIST CHECK (LOGIC LAMA)
        // ===============================
        const allowed = await isWhitelisted(phone);
        if (!allowed) {
            // non-whitelist DIAM TOTAL
            return;
        }

        // ambil whitelist_id TANPA ubah perilaku
        const whitelist = await getWhitelistByNumber(phone);

        // ===============================
        // !askbot
        // ===============================
        if (command === 'askbot') {
            const response =
`Saya dapat membantu:

1️⃣ !cek
Digunakan untuk mengecek data traffic berdasarkan CID dan periode tanggal.

2️⃣ !recon
Digunakan untuk melakukan rekonsiliasi data tsel dengan data partner (Excel).

Silakan ketik command yang ingin digunakan.`;

            await replyWithDelayAndTyping(message, response);

            if (whitelist) {
                await saveLog(whitelist.whitelist_id, '!askbot', response);
            }
            return;
        }

        // ===============================
        // !cek
        // ===============================
        if (command === 'cek') {
            const result = validateCekCommand(args);

            if (result.guided) {
                const response =
`Mode cek data aktif ✅

Gunakan format:
!cek <CID> <tanggal_awal> <tanggal_akhir>

Contoh:
!cek cid_video_82055 2025-08-01 2025-08-31`;

                await replyWithDelayAndTyping(message, response);

                if (whitelist) {
                    await saveLog(whitelist.whitelist_id, '!cek', response);
                }
                return;
            }

            if (!result.valid) {
                await replyWithDelayAndTyping(message, result.message);

                if (whitelist) {
                    await saveLog(whitelist.whitelist_id, '!cek', result.message);
                }
                return;
            }

            const response =
`Request diterima ✅
CID: ${result.cid}
Periode: ${result.startDate} s/d ${result.endDate}

Sedang memproses data...`;

            await replyWithDelayAndTyping(message, response);

            if (whitelist) {
                await saveLog(whitelist.whitelist_id, '!cek', response);
            }
            return;
        }

        // ===============================
        // !recon
        // ===============================
        if (command === 'recon') {
            const result = validateReconCommand(args);

            if (result.guided) {
                const response =
`Mode rekonsiliasi aktif ✅

Gunakan format:
!recon <tanggal_awal> <tanggal_akhir>

Contoh:
!recon 2025-08-01 2025-08-31`;

                await replyWithDelayAndTyping(message, response);

                if (whitelist) {
                    await saveLog(whitelist.whitelist_id, '!recon', response);
                }
                return;
            }

            if (!result.valid) {
                await replyWithDelayAndTyping(message, result.message);

                if (whitelist) {
                    await saveLog(whitelist.whitelist_id, '!recon', result.message);
                }
                return;
            }

            const response =
`Periode diterima ✅
Periode: ${result.startDate} s/d ${result.endDate}

Silakan kirim file Excel data partner (.xlsx)`;

            await replyWithDelayAndTyping(message, response);

            if (whitelist) {
                await saveLog(whitelist.whitelist_id, '!recon', response);
            }
            return;
        }

        // ===============================
        // COMMAND TIDAK DIKENALI
        // ===============================
        const response = 'Command tidak dikenali. Gunakan !askbot';

        await replyWithDelayAndTyping(message, response);

        if (whitelist) {
            await saveLog(whitelist.whitelist_id, command, response);
        }

    } catch (err) {
        console.error('Error handling message:', err);
    }
});

// ===============================
// START BOT
// ===============================
client.initialize();
