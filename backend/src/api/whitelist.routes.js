const express = require('express');
const router = express.Router();

const db = require('../config/db');

// ===============================
// GET all whitelist
// ===============================
router.get('/', async (req, res) => {
    try {
        const [rows] = await db.query(
            'SELECT whitelist_id, name, no_whatsapp, status, created_at FROM whitelist'
        );
        res.json(rows);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// ===============================
// POST add new whitelist (LID)
// ===============================
router.post('/', async (req, res) => {
    try {
        const { name, lid } = req.body;

        if (!name || !lid) {
            return res.status(400).json({ message: 'Name and LID required' });
        }

        await db.query(
            `INSERT INTO whitelist (name, no_whatsapp, status)
             VALUES (?, ?, 'inactive')`,
            [name, lid]
        );

        res.json({ message: 'Whitelist added' });
    } catch (err) {
        console.error(err);
        res.status(500).json({ message: 'Internal Server Error' });
    }
});


// ===============================
// PUT update status
// ===============================
router.put('/:id', async (req, res) => {
    const { status } = req.body;

    if (!['active', 'inactive'].includes(status)) {
        return res.status(400).json({ message: 'Invalid status' });
    }

    try {
        await db.query(
            'UPDATE whitelist SET status = ? WHERE whitelist_id = ?',
            [status, req.params.id]
        );

        res.json({ message: 'Status updated' });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// ===============================
// Delete whitelist
// ===============================
router.delete('/:id', async (req, res) => {
    try {
        const { id } = req.params;

        await db.query(
            'DELETE FROM whitelist WHERE whitelist_id = ?',
            [id]
        );

        res.json({ message: 'Whitelist deleted' });
    } catch (err) {
        console.error(err);
        res.status(500).json({ message: 'Delete failed' });
    }
});


module.exports = router;
