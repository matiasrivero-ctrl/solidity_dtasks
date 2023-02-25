import { ethers } from 'ethers';

function App() {
  // Connecting to metamask
  const connectWallet = async () => {
    const provider = new ethers.providers.Web3Provider(window.ethereum);
    const accounts = await provider.send('eth_requestAccounts', []);
    console.log(accounts);
  };

  return (
    <>
      <h1>Hola Mundo</h1>
      <button onClick={connectWallet}>Connect to Metamask 🦊</button>
    </>
  );
}

export default App;
