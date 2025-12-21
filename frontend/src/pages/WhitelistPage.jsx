import { useEffect, useState } from 'react';
import {
    getWhitelist,
    updateWhitelistStatus,
    deleteWhitelist
} from '../services/whitelistApi';

import AddWhitelistForm from '../components/AddWhitelistForm';
import WhitelistTable from '../components/WhitelistTable';

export default function WhitelistPage() {
    const [data, setData] = useState([]);
    const [search, setSearch] = useState('');

    useEffect(() => {
        const fetchData = async () => {
            const res = await getWhitelist();
            setData(res.data);
        };
        fetchData();
    }, []);

    const reload = async () => {
        const res = await getWhitelist();
        setData(res.data);
    };

    const filteredData = data.filter((row) => {
    const name = row.name ? row.name.toLowerCase() : '';
    const lid = row.no_whatsapp ? row.no_whatsapp : '';

    return (
        name.includes(search.toLowerCase()) ||
        lid.includes(search)
    );
});

    return (
        <div className="container">
            <h2 style={{ color: '#2e7d32' }}>
                WhatsApp Whitelist Dashboard
            </h2>
            <p>Manage users allowed to access the WhatsApp bot.</p>

            <div className="card">
                <AddWhitelistForm onSuccess={reload} />
            </div>

            <div className="card">
                <input
                    type="text"
                    placeholder="Search by name or LID..."
                    value={search}
                    onChange={(e) => setSearch(e.target.value)}
                    style={{ marginBottom: 10 }}
                />

                <WhitelistTable
                    data={filteredData}
                    onToggle={async (id, status) => {
                        await updateWhitelistStatus(id, status);
                        reload();
                    }}
                    onDelete={async (id) => {
                        await deleteWhitelist(id);
                        reload();
                    }}
                />
            </div>
        </div>
    );
}
