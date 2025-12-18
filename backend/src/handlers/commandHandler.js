function parseCommand(message) {
    const text = message.body.trim();

    if (!text.startsWith('!')) {
        return null;
    }

    const parts = text.split(/\s+/);
    const command = parts[0].toLowerCase();
    const args = parts.slice(1);

    return { command, args };
}

function isValidDate(dateStr) {
    return /^\d{4}-\d{2}-\d{2}$/.test(dateStr);
}

/**
 * !cek
 * - tanpa argumen -> guided
 * - dengan argumen -> validasi
 */
function validateCekCommand(args) {
    if (args.length === 0) {
        return { guided: true };
    }

    if (args.length !== 3) {
        return {
            valid: false,
            message: 'Format salah.\nGunakan: !cek <CID> <tgl_awal> <tgl_akhir>'
        };
    }

    const [cid, startDate, endDate] = args;

    if (!isValidDate(startDate) || !isValidDate(endDate)) {
        return {
            valid: false,
            message: 'Format tanggal harus YYYY-MM-DD'
        };
    }

    return {
        valid: true,
        cid,
        startDate,
        endDate
    };
}

/**
 * !recon
 * - tanpa argumen -> guided
 * - dengan tanggal -> minta file
 */
function validateReconCommand(args) {
    if (args.length === 0) {
        return { guided: true };
    }

    if (args.length !== 2) {
        return {
            valid: false,
            message: 'Format salah.\nGunakan: !recon <tgl_awal> <tgl_akhir>'
        };
    }

    const [startDate, endDate] = args;

    if (!isValidDate(startDate) || !isValidDate(endDate)) {
        return {
            valid: false,
            message: 'Format tanggal harus YYYY-MM-DD'
        };
    }

    return {
        valid: true,
        startDate,
        endDate
    };
}

module.exports = {
    parseCommand,
    validateCekCommand,
    validateReconCommand
};
