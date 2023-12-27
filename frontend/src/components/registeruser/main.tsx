import React, { useState } from 'react';

import './main.css';

interface Props {
    localstorage_id_key: string
}
export default function Favobutton({localstorage_id_key}:Props) {
    
    // 初期値の設定
    var load_user_name = ""
    if (typeof localStorage !== "undefined"){
        const value = localStorage.getItem(localstorage_id_key);
        if (value !== null) {
            load_user_name = value
        }
    }

    const [active_text, setText] = useState(load_user_name);

    const onClickAddText = () => {
        if (active_text.length < 3 || active_text.length > 20) {
            window.alert("名前は3文字以上、20文字以下で指定してください。");
        } else {
            localStorage.setItem(localstorage_id_key, active_text);
        }
    }

    return (
        <form className="register_user">
            <label>ユーザ登録/ログイン（表示名）</label>
            <div className="register_box">
                <input
                    className='textbox'
                    value={active_text}
                    onChange={(event) => setText(event.target.value)}
                />
                <button className='submit' onClick={onClickAddText}>Submit</button>
            </div>
        </form>
    );
};
