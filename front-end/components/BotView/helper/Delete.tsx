'use client'

import { Dispatch } from "react"
import { deleteBot } from "../service/bots.service"

interface Props {
    setDeleteBot: Dispatch<boolean>
    setSettings: Dispatch<boolean>
    name: string
}

export default function Delete({setDeleteBot, setSettings, name}: Props){

    const handleDelete = async () => {
        try {
            const data = await deleteBot(name)
            if (data === 'Bot deleted succesfully'){
                setSettings(false)
            }else {
                alert('Error')
            }
        } catch (error) {
            
        }
    }

    return(
        <div className="bg-blue-400 p-4 rounded-md absolute left-[40%] z-10 border-2">
            <h4>Are you sure you want to delete the bot?</h4>
            <div className="flex justify-center items-center gap-2">
                <button className="bg-green-600 p-2 text-white" onClick={handleDelete}>Accept</button>
                <button className="bg-red-600 p-2 text-white" onClick={() => setDeleteBot(false)}>Cancel</button>
            </div>
        </div>)
}