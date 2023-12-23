import React from 'react';
// import logo from './logo.svg';
import './App.css';
import Favobutton from './components/favobutton/main'

const api_url = "http://sr341tl8ofh2j6j13yeso7rvmacnk2nh.lambda-url.us-east-1.localhost.localstack.cloud:4566/"
const page_name = "hoge"
function App() {
  return (
    <div className="App">
      <header className="App-header">
        <Favobutton api_url={api_url} page_name={page_name} />
      </header>
    </div>
  );
}

export default App;
