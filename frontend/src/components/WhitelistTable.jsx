import { useState } from 'react';

export default function WhitelistTable({ data, onToggle, onDelete }) {
    const [confirmId, setConfirmId] = useState(null);

    return (
        <table>
            <thead>
                <tr>
                    <th>No</th>
                    <th>Name</th>
                    <th>WhatsApp LID</th>
                    <th>Active</th>
                    <th>Created At</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                {data.map((row, index) => (
                    <tr key={row.whitelist_id}>
                        <td>{index + 1}</td>
                        <td>{row.name || '-'}</td>
                        <td>{row.no_whatsapp}</td>

                        <td>
                            <label className="switch">
                                <input
                                    type="checkbox"
                                    checked={row.status === 'active'}
                                    onChange={() =>
                                        onToggle(
                                            row.whitelist_id,
                                            row.status === 'active'
                                                ? 'inactive'
                                                : 'active'
                                        )
                                    }
                                />
                                <span className="slider"></span>
                            </label>
                        </td>

                        <td>
                            {row.created_at
                                ? new Date(row.created_at).toLocaleDateString()
                                : '-'}
                        </td>

                        <td>
                            {confirmId === row.whitelist_id ? (
                                <>
                                    <button
                                        className="danger"
                                        onClick={() => onDelete(row.whitelist_id)}
                                    >
                                        Confirm
                                    </button>
                                    <button
                                        className="secondary"
                                        onClick={() => setConfirmId(null)}
                                        style={{ marginLeft: 6 }}
                                    >
                                        Cancel
                                    </button>
                                </>
                            ) : (
                                <button
                                    className="danger"
                                    onClick={() => setConfirmId(row.whitelist_id)}
                                >
                                    Delete
                                </button>
                            )}
                        </td>
                    </tr>
                ))}
            </tbody>
        </table>
    );
}
