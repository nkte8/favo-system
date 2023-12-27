import React from 'react';
// import logo from './logo.svg';
import './App.css';
import Favobutton from './components/favobutton/main'
import Favolabel from './components/favolabel/main'
import Registeruser from './components/registeruser/main'
import Userlabel from './components/userlabel/main'

const api_url = "http://lsgh7xzkuz2dqul69u7lcr6hcgdtij9b.lambda-url.us-east-1.localhost.localstack.cloud:4566/"
const page_name = "hoge"
const localstrage_label = "user_name"
function App() {
	return (
		<div className="App">
			<header className="App-header">
				<div>Welcome <Userlabel localstorage_id_key={localstrage_label}/></div>
				<Registeruser localstorage_id_key={localstrage_label}/>
				<Favobutton api_url={api_url} page_name={page_name} localstorage_id_key={localstrage_label} />
				<Favolabel api_url={api_url} localstorage_id_key={localstrage_label} />
			</header>
		</div>
	);
}

export default App;
