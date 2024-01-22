'use client'

import Image from 'next/image'
import Logo from '../../assets/imagenPerfilLimpio.png'
import Link from 'next/link'
import { usePathname } from 'next/navigation'
import { FaHome } from "react-icons/fa";
import { LuCircleDashed } from "react-icons/lu";
import { FaRegPlusSquare } from "react-icons/fa";
import { IoSettingsOutline } from "react-icons/io5";
import { IoIosArrowBack, IoIosArrowForward} from "react-icons/io";
import {useSession, signOut} from 'next-auth/react'
import { CiLogout } from "react-icons/ci";

interface Props {
    large: any
    setLarge: any
}

export default function Navbar({large,setLarge}: Props){
    const path = usePathname()
    

    const {data: session, status} = useSession()

    return(
        <nav className='bg-robotize flex flex-col justify-between'>
            <div className={large ? 'w-full flex flex-col text-white gap-6' : 'flex flex-col justify-center items-center text-white gap-6'}>
                <Image src={Logo} alt='LOGO' width={200} height={100}/>
                {
                    large 
                    ? <><Link href="/" className={path === '/home' ? 'py-2 px-4 text-base flex items-center gap-4 bg-darkRobotize' : 'py-2 px-4 text-base flex items-center gap-4 hover:bg-darkRobotize'}><FaHome className='text-xl'/>Home</Link>
                    <Link href='/bots' className={path === '/bots' ? 'py-2 px-4 text-base flex items-center gap-4 bg-darkRobotize' : 'py-2 px-4 text-base flex items-center gap-4 hover:bg-darkRobotize'}><LuCircleDashed className='text-xl'/>View Bots</Link>
                    <Link href='/create' className={path === '/create' ? 'py-2 px-4 text-base flex items-center gap-4 bg-darkRobotize' : 'py-2 px-4 text-base flex items-center gap-4 hover:bg-darkRobotize'}><FaRegPlusSquare className='text-xl'/>Create Bots</Link>
                    <Link href='/settings' className={path === '/settings' ? 'py-2 px-4 text-base flex items-center gap-4 bg-darkRobotize' : 'py-2 px-4 text-base flex items-center gap-4 hover:bg-darkRobotize'}><IoSettingsOutline  className='text-xl'/>Settings</Link></>
                    : <><Link href='/' className={path === '/home' ? 'bg-darkRobotize w-full text-2xl flex justify-center items-center py-2' : 'text-2xl flex justify-center items-center'}><FaHome /></Link>
                    <Link href='/bots' className={path === '/bots' ? 'bg-darkRobotize w-full text-2xl flex justify-center items-center py-2' : 'text-2xl flex justify-center items-center'}><LuCircleDashed/></Link>
                    <Link href='/create' className={path === '/create' ? 'bg-darkRobotize w-full text-2xl flex justify-center items-center py-2' : 'text-2xl flex justify-center items-center'}><FaRegPlusSquare/></Link>
                    <Link href='/settings' className={path === '/settings' ? 'bg-darkRobotize w-full text-2xl flex justify-center items-center py-2' : 'text-2xl flex justify-center items-center'}><IoSettingsOutline/></Link>
                        </>
                }
            </div>
            <div className='text-white flex flex-col text-left gap-2'>
                <p className='px-4'>{session?.user?.name}</p>
                <div className={large ? 'border-white border-t-2 flex justify-between items-center p-4' : 'border-white border-t-2 flex flex-col gap-4 justify-between items-center p-4'}>
                    {
                        large 
                        ? <>
                            <button onClick={() => setLarge(false)}><IoIosArrowBack className='text-2xl'/></button>
                            <button onClick={() => signOut()} className='bg-red-800 px-2'>Log out</button></>
                        : <>
                            <button onClick={() => setLarge(true)}><IoIosArrowForward className='text-2xl'/></button>
                            <button onClick={() => signOut()}><CiLogout className='text-2xl'/></button>
                        </>
                    }
                </div>
            </div>
        </nav>)
}