import React from 'react';
// import logo from './logo.svg';
import './App.css';
import Favobutton from './components/favobutton/main'
import Dropbutton from './components/dropbutton/main'
import Registeruser from './components/registeruser/main'
import Userlabel from './components/userlabel/main'

const api_url = "http://lsgh7xzkuz2dqul69u7lcr6hcgdtij9b.lambda-url.us-east-1.localhost.localstack.cloud:4566/"
const page_name = "hoge"
function App() {
	return (
		<div className="App">
			<header className="App-header">
				<div>Welcome <Userlabel /></div>
				<Registeruser />
				<Favobutton api_url={api_url} page_name={page_name} />
				<Dropbutton api_url={api_url} />
			</header>
		</div>
	);
}

export default App;
