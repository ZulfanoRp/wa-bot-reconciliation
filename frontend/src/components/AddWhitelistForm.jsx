import { useState } from 'react';
import { addWhitelist } from '../services/whitelistApi';

export default function AddWhitelistForm({ onSuccess }) {
    const [name, setName] = useState('');
    const [lid, setLid] = useState('');

    const handleSubmit = async (e) => {
        e.preventDefault();
        if (!name || !lid) return;

        await addWhitelist({ name, lid });
        setName('');
        setLid('');
        onSuccess();
    };

    return (
        <>
            <h3 className="card-title">Add Whitelist</h3>
            <form onSubmit={handleSubmit}>
                <input
                    type="text"
                    placeholder="Name"
                    value={name}
                    onChange={(e) => setName(e.target.value)}
                />
                <input
                    type="text"
                    placeholder="WhatsApp LID"
                    value={lid}
                    onChange={(e) => setLid(e.target.value)}
                />
                <button type="submit" className="primary">
                    Add
                </button>
            </form>
        </>
    );
}
