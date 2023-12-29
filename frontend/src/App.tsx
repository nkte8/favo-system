import React from 'react';
// import logo from './logo.svg';
import './App.css';

import Userlabel from './components/userlabel/main'
import UserForm from './components/userform/main'
import Favobutton from './components/favobutton/main'
import Favolabel from './components/favolabel/main'

const api_url = "http://o23gmw2qx8e5vxz23wgk7m9u79173h18.lambda-url.ap-northeast-1.localhost.localstack.cloud:4566/"
const page_name = "hoge"

function App() {
	return (
		<div className="App">
			<header className="App-header">
				<div>Welcome&nbsp;
					<Userlabel api_url={api_url} /></div>
				<UserForm api_url={api_url} arg='auth' login_path='/' />
				<UserForm api_url={api_url} arg='register' login_path='/' />
				<Favobutton
					api_url={api_url} page_name={page_name} />
				<Favolabel
					api_url={api_url} />
			</header>
		</div>
	);
}

export default App;
