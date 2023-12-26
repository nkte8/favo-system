import React, { useRef, useState } from 'react';

import './main.css';

const key_name_user_name = "user_name"

// interface Props {
// }
export default function Favobutton() {
    
    // 初期値の設定
    var load_user_name = ""
    if (typeof localStorage !== "undefined"){
        const value = localStorage.getItem(key_name_user_name);
        if (value !== null) {
            load_user_name = value
        }
    }

    const [active_text, setText] = useState(load_user_name);

    const onClickAddText = () => {
        if (active_text.length < 3 || active_text.length > 10) {
            window.alert("名前は3文字以上、10文字以下で指定してください。");
        } else {
            localStorage.setItem(key_name_user_name, active_text);
            window.alert("Welcome " + active_text + "!");
        }
    }

    const handleKeyDown = (e: React.KeyboardEvent<HTMLInputElement>) => {
        if (e.nativeEvent.isComposing || e.key !== 'Enter') return
        onClickAddText()
    }

    return (
        <div className="register_user">
            <label>ユーザ登録/ログイン（表示名）</label>
            <div className="register_box">
                <input
                    className='textbox'
                    value={active_text}
                    onChange={(event) => setText(event.target.value)}
                    onKeyDown={handleKeyDown}
                />
                <button className='submit' onClick={onClickAddText}>Submit</button>
            </div>
        </div>
    );
};
