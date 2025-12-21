import axios from 'axios';

const API_URL = 'http://localhost:3001/api/whitelist';

export const getWhitelist = () => axios.get(API_URL);

export const addWhitelist = (data) =>
    axios.post(API_URL, data);

export const updateWhitelistStatus = (id, status) =>
    axios.put(`${API_URL}/${id}`, { status });

export const deleteWhitelist = (id) =>
    axios.delete(`${API_URL}/${id}`);
