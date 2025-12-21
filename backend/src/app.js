const express = require('express');
const cors = require('cors');

const whitelistRoutes = require('./api/whitelist.routes');

const app = express();

// middleware
app.use(cors());
app.use(express.json());

// routes
app.use('/api/whitelist', whitelistRoutes);

// test endpoint
app.get('/', (req, res) => {
    res.json({ status: 'API whitelist running' });
});

const PORT = process.env.API_PORT || 3001;
app.listen(PORT, () => {
    console.log(`Whitelist API running on port ${PORT}`);
});
