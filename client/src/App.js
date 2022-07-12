import { useEffect, useState } from 'react'
import Faucet from './ABI/faucet.json'
import './App.css'

import getWeb3 from './getWeb3'

function App() {
    const [accounts, setAccounts] = useState(null)
    const [contract, setContract] = useState(null)
    const [pending, setPending] = useState(false)

    useEffect(() => {
        const initWeb3 = async () => {
            try {
                const web3 = await getWeb3()
                const accounts = await web3.eth.getAccounts()

                const instance = new web3.eth.Contract(
                    Faucet.abi,
                    Faucet.address
                )

                setAccounts(accounts)
                setContract(instance)

            } catch (error) {
                alert(`Failed to load web3, accounts, or contract. Check console for details.`)
                console.error(error)
            }
        }
        initWeb3()
    }, [])

    const sendToken = async () => {
        if (pending) return
        setPending(true)
        try {
            const res = await contract.methods.send().send({ from: accounts[0], gas: '3000000' })
            console.log(res)
            if (res.status) {
                alert('Success')
            }
        } catch (error) {
            alert('Something went wrong')
            console.error(error)
        }
        setPending(false)
    }

    return (
        <div className="container">
            <div className='button' onClick={sendToken}>
                {pending ? 'Pending ...' : 'Give me some FX !'}
            </div>
        </div>
    )
}

export default App
