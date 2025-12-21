function delay(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

function randomDelay(minMs = 1500, maxMs = 3000) {
    const ms = Math.floor(Math.random() * (maxMs - minMs + 1)) + minMs;
    return delay(ms);
}

module.exports = { delay, randomDelay };
