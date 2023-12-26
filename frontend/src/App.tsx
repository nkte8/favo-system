import React from 'react';
// import logo from './logo.svg';
import './App.css';
import Favobutton from './components/favobutton/main'
import Dropbutton from './components/dropbutton/main'

const api_url = "http://lsgh7xzkuz2dqul69u7lcr6hcgdtij9b.lambda-url.us-east-1.localhost.localstack.cloud:4566/"
const page_name = "hoge"
const user_name = "huga"
function App() {
  return (
    <div className="App">
      <header className="App-header">
        <Favobutton api_url={api_url} page_name={page_name} user_name={user_name} />
        <Dropbutton api_url={api_url} user_name={user_name} />
      </header>
    </div>
  );
}

export default App;
