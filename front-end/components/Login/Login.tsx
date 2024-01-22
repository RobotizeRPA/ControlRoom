'use client'
import { useState } from "react"
import { useRouter } from "next/navigation"
import {useSession, signIn} from 'next-auth/react'

export default function Login(){
    const router = useRouter()
    const [error,setError] = useState(false)
    const [login, setLogin] = useState({
        email: "",
        password: ""
    })

    const {data: session, status} = useSession()

    const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        setLogin({
            ...login,
            [e.target.name]: e.target.value
        })
    }

    const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
        e.preventDefault()
        try{
          const data =  await signIn('credentials', {email: login.email, password: login.password, redirect: false}) 
          if(data?.error){
            setError(true)
          }
          else if(data?.ok) {
            router.push('/')
          }
        }catch {
          console.log(error)
        }  
      }
    
      if(status === 'authenticated'){
        router.push('/')
      }

      return(
        <>
            <form className="p-10 rounded-lg border-2 border-robotize relative bg-white" onSubmit={handleSubmit}>
              <p className="font-bold text-[#666666] text-xl">Iniciar sesion</p>
                <div className="flex flex-col justify-center items-center py-4 gap-4">
                    <label className="text-robotize font-bold w-full text-sm">Email:</label>
                    <input type="email" name='email' placeholder='ejemplo@hotmail.com' value={login.email} onChange={handleChange} className="border-2 border-robotize py-2 px-4 text-center rounded-lg"/>
                </div>
                <div className="flex flex-col justify-center items-center py-4 gap-4">
                    <label className="text-robotize font-bold w-full text-sm">Password:</label>
                    <input type="password" name='password' placeholder='******' value={login.password} onChange={handleChange} className="border-2 border-robotize py-2 px-4 text-center rounded-lg"/>
                </div>
                <div className="py-4">
                    <button type="submit" disabled={login.email === '' || login.password === '' ? true : false} className={login.email === '' || login.password === '' ? "px-4 py-2 bg-robotizeTrans rounded-lg text-white w-full" : "px-4 py-2 bg-robotize rounded-lg text-white w-full"}>Iniciar Sesion</button>
                </div>
                {
                    error && <div className='font-bold text-red-600 text-center'>Usuario inexistente</div>
                }
            </form>
        </>
      )


}