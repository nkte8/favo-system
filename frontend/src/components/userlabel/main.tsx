import React from 'react';

// import './main.css';

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

    return (
        <span>
            {load_user_name}
        </span>
    );
};
