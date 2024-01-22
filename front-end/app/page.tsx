'use client'

import Login from "@/components/Login/Login";
import { useSession } from "next-auth/react";
import Image from "next/image";
import { useRouter } from "next/navigation";
import Logo from '../assets/imagenPerfilLimpio.png'

export default function LoginApp(){
    const {data: session, status} = useSession()
    const router = useRouter()

    if(status === 'loading'){
        return
    }
    else if(status === 'authenticated'){
        router.push('/home')
    }else{

        return(
            <>
            <main className='py-20 flex flex-col justify-center items-center'>
                <Image src={Logo} alt='Logo' width={250} height={100}/>
                <Login/>
            </main>
        </>)
        }
}