import { useState, useEffect } from 'react';
import { ethers } from 'ethers';
import './App.css';

function App() {
  const requestAccount = async () => {
    if (window.ethereum) {
      console.log('detected');

      try {
        const accounts = await window.ethereum.request({
          method: 'eth_requestAccounts',
        });
        console.log(accounts);
      } catch (error) {
        console.log(error);
      }
    } else {
      console.log('Metamask is not installed');
    }
  };
  const connectWallet = async () => {
    if (typeof window.ethereum !== undefined) {
      await requestAccount();

      const provider = new ethers.providers.Web3Provier(window.ethereum);
      console.log(provider);
    }
  };

  return (
    <div className="App">
      <h1>Hola Mundo</h1>

      <button onClick={connectWallet}>Connect Wallet</button>
    </div>
  );
}

export default App;
