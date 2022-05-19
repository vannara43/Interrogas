import axios from 'axios';
import { API_HOST_PREFIX, onGlobalError, onGlobalSuccess } from './serviceHelpers';

const endpoint = `${API_HOST_PREFIX}/api/newsletters/subscriptions`;

const add = (payload) => {
    const config = {
        method: 'POST',
        url: endpoint,
        data: payload,
        crossdomain: true,
        withCredentials: true,
        headers: { 'Content-Type': 'application/json' },
    };
    return axios(config).then(onGlobalSuccess).catch(onGlobalError);
};

const getAll = (pageIndex, pageSize) => {
    const config = {
        method: 'GET',
        url: `${endpoint}/?pageIndex=${pageIndex}&pageSize=${pageSize}`,
        crossdomain: true,
        withCredentials: true,
        headers: { 'Content-Type': 'application/json' },
    };
    return axios(config).then(onGlobalSuccess).catch(onGlobalError);
};

const unsubscribe = (email) => {
    const config = {
        method: 'PUT',
        url: `${endpoint}/` + email,
        data: email,
        withCredentials: true,
        corssdomain: true,
        headers: { 'Content-Type': 'application/json' },
    };
    return axios(config);
};

export { add, getAll, unsubscribe };
