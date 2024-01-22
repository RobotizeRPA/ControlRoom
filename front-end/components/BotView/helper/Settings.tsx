'use client'
import Link from "next/link";
import { useState, Dispatch } from "react";
import { MdDeleteForever, MdUpdate } from "react-icons/md";
import Delete from "./Delete";

interface Props {
    setSettings: Dispatch<boolean>
    name: string
}

export default function BotSettings({name, setSettings}: Props){
    const [deleteBot,setDeleteBot] = useState(false)


    const handleDelete = () => {
        setDeleteBot(true);
    }

    return(
        <>
        <div className="absolute right-36 top-2 bg-white p-4 flex justify-center items-center border-2 rounded-md z-10 gap-4">
            <Link href={`/update/${name}`}><MdUpdate /></Link>
            <button className="text-red-600 text-xl"><MdDeleteForever onClick={handleDelete}/></button>
        </div>
            {
                deleteBot && <Delete setDeleteBot={setDeleteBot} name={name} setSettings={setSettings}/>
            }
        </>)
}