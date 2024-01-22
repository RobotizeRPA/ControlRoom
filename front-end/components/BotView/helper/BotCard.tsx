'use client'
import Link from "next/link"
import { Dispatch, useState } from "react";
import { IoMdMore } from "react-icons/io";
import BotSettings from "./Settings";

interface Props {
    name: string,
    _id: string
    status: string
    lastRunStatus: string
    nextRun: string
    lastRun: string
}


export default function BotCard({name,_id,status,lastRunStatus,nextRun, lastRun}: Props){
    const [settings,setSettings] = useState(false)

    return(
            <div className='grid grid-cols-6 border-2 rounded-lg py-4 text-center relative bg-white'>
            <h5>{name}</h5>
            <p>{status}</p>
            <p>{lastRunStatus}</p>
            <p>{lastRun}</p>
            <p>{nextRun}</p>
            <p className="flex justify-center"><IoMdMore className="cursor-pointer" onClick={() => setSettings(!settings)}/></p>
            {
                settings && <BotSettings name={name} setSettings={setSettings}/>
            }
        </div>
        )
}