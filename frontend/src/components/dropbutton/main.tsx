import React, { useState, useEffect } from 'react';

import './main.css';

const key_name_user_name = "user_name"

interface Props {
    api_url: string;
}

export default function Dropbutton({ api_url }: Props) {

    // user情報をlocalstorageから取得
    var user_name: string | null = null
    if (typeof localStorage !== "undefined"){
        const value = localStorage.getItem(key_name_user_name);
        if (value !== null) {
            user_name = value
        }
    }

    const [count, setCount] = useState(0);
    const [active, setActive] = useState(false);
    const get_result = async () => fetch(api_url, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(
            {
                user: user_name,
                arg: "read",
            }
        )
    }
    ).then((response) => response.json()
    ).then((data) => { setCount(data.favcount) }
    ).catch(() => {
        console.log("error");
    })

    const post_result = async () => fetch(api_url, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(
            {
                user: user_name,
                arg: "pop",
            }
        )
    }
    ).then((response) => response.json()
    ).then((data) => { 
        setCount(data.favcount);
        if(data.info != null){
            console.log(data.info);
        }
    }
    ).catch(() => {
        console.log("error");
    })

    useEffect(() => {
        // 非同期処理の場合は、関数を定義しそれを呼び出すような形式で記述すること
        get_result()
    }, [])

    const handleClick = () => {
        // setCount(count + 1);
        setActive(true);
        post_result();
    };

    return (
        <button className={`likeButton ${active ? "clicked" : ""}`} onClick={handleClick}>
            <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 16 16">
                <path d="M5.5 9.511c.076.954.83 1.697 2.182 1.785V12h.6v-.709c1.4-.098 2.218-.846 2.218-1.932 0-.987-.626-1.496-1.745-1.76l-.473-.112V5.57c.6.068.982.396 1.074.85h1.052c-.076-.919-.864-1.638-2.126-1.716V4h-.6v.719c-1.195.117-2.01.836-2.01 1.853 0 .9.606 1.472 1.613 1.707l.397.098v2.034c-.615-.093-1.022-.43-1.114-.9H5.5zm2.177-2.166c-.59-.137-.91-.416-.91-.836 0-.47.345-.822.915-.925v1.76h-.005zm.692 1.193c.717.166 1.048.435 1.048.91 0 .542-.412.914-1.135.982V8.518l.087.02z" />
                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                <path d="M8 13.5a5.5 5.5 0 1 1 0-11 5.5 5.5 0 0 1 0 11zm0 .5A6 6 0 1 0 8 2a6 6 0 0 0 0 12z" />
            </svg>
            &nbsp;
            {count}
        </button>
    );
};