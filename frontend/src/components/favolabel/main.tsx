import React, { useState, useEffect } from 'react';

import { favo_api, get_auth_local } from '@/utils/favoapi'

interface Props {
    api_url: string,
}

export default function Favolabel({ api_url }: Props) {
    const auth = get_auth_local()

    const [count, setCount] = useState<number | null>(null);
    useEffect(() => {
        setCountFromApi()
    }, [])

    const setCountFromApi = async () => {
        try { 
            let c = await favo_api(api_url, null, auth.id, auth.secret, "read")
            if (c.favcount !== null) {
                setCount(c.favcount)
            }    
        } catch (e) {
            setCount(null)
        }
    }

    return (
        <span>
            {count}
        </span>
    );
};
