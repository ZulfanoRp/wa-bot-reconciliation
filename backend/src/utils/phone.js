function normalizePhoneNumber(message) {
    const from = message.author || message.from;

    return from
        .replace('@c.us', '')
        .replace('@g.us', '')
        .replace('@lid', '')
        .trim();
}

module.exports = { normalizePhoneNumber };
