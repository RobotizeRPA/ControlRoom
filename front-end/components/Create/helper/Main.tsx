'use client'

import { useState } from "react"
import { newBot } from "../service/create.service"
import { useRouter } from "next/navigation"

export default function CreateMain(){
    const router = useRouter()
    
    const [bot,setBot] = useState({
        'name': "",
        'runHours': '0',
        'nextRun': '0',
        'path': '',
        'status': 'enabled',
        'runTimes': '0',
        'runDays': [''],
        'lastRun': 'unknown',
        'lastRunStatus': 'null'

    })
    const days = ['Monday', 'Tuesday', 'Wensday', 'Thursday', 'Friday', 'Saturday', 'Sunday']

    const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        setBot({
            ...bot,
            [e.target.name]: e.target.value
        })
    }


    const handleDays = (day:string) => {
        setBot(prevBot => {
            const index = prevBot.runDays.indexOf(day);
            let newRunDays;
    
            if (index === -1) {
                // Day is not in the array, add it.
                newRunDays = [...prevBot.runDays, day];
            } else {
                // Day is in the array, remove it.
                newRunDays = prevBot.runDays.filter(d => d !== day);
            }
    
            return {
                ...prevBot,
                runDays: newRunDays
            };
        });
    }

    const handleSubmit = async () => {
        try {
            const submit = await newBot(bot)
            if(submit.status === 'ok'){
                router.push('/bots')
            }else{
                alert('Error trying to create bot')
            }
        } catch (error) {
            console.log(error)
        }
    }


    return( 
        <>
            <div className="border-b-2 mb-4 flex justify-between items-center py-2">
                <h2 className="font-bold text-xl">Customize bot</h2>
                <button className={bot.name === '' || bot.path === '' || bot.runDays.length === 0 ? "bg-robotizeTrans text-white py-2 px-10 rounded-md" :"bg-robotize text-white py-2 px-10 rounded-md"} disabled={bot.name === '' || bot.path === '' || bot.runDays.length === 0 ? true : false} onClick={handleSubmit}>Create Bot</button>
            </div>
            <form className="flex justify-center items-center gap-10 py-4">
            <section className="flex flex-col justify-center items-center gap-10 py-20 border-2 border-robotize rounded-md w-full">
            <div className="flex flex-col gap-4 w-3/4">
                <label htmlFor="" className="font-semibold">Name:</label>
                <input type="text" name='name' value={bot.name} className="py-2 rounded-md px-2" onChange={handleChange}/>
            </div>
            <div className="flex flex-col gap-4 w-3/4">
                <label htmlFor="" className="font-semibold">Run every:</label>
                <input type="number" name='runHours' value={bot.runHours} className="py-2 rounded-md px-2" onChange={handleChange}/>
            </div>
            <div className="flex flex-col gap-4 w-3/4">
                <label htmlFor="" className="font-semibold">First Run:</label>
                <input type="time" step="3600" min="00:00" max="23:59" pattern="[0-9]{2}:[0-9]{2}" name='nextRun' value={bot.nextRun} className="py-2 rounded-md px-2" onChange={handleChange}/>
            </div>
            </section>
            <section className="flex flex-col justify-center items-center gap-10 py-20 border-2 border-robotize rounded-md w-full">
            <div className="flex flex-col gap-4 w-3/4">
                <label htmlFor="" className="font-semibold">Script path:</label>
                <input type="text" name='path' value={bot.path}  className="py-2 rounded-md px-2" onChange={handleChange}/>
            </div>
            <div className="flex justify-between items-center gap-4 w-3/4">
                
                <div className="flex flex-col gap-4 w-3/4">
                    <label className="font-semibold">Status:</label>
                    <select name="status" id="" className="py-2 rounded-md px-2">
                        <option value="enabled">enabled</option>
                        <option value="disabled">disable</option>
                    </select>
                </div>
                <div className="flex flex-col gap-4 w-3/4">
                    <label className="font-semibold">Run Times:</label>
                    <select name="runTimes" id="" className="py-2 rounded-md px-2">
                        <option value="0">0</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                    </select>
                </div>
            </div>
            <div className="flex flex-col gap-4 w-3/4">
                <label htmlFor="" className="font-semibold">Select the run days:</label>
                <div className="flex justify-center items-center gap-2">
                {
                    days.map(e => {
                        return <p className={bot.runDays.includes(e) ? "p-2 bg-robotizeTrans text-white rounded-md cursor-pointer" : "p-2 bg-robotize text-white rounded-md cursor-pointer"} onClick={() => handleDays(e)}>{e}</p>
                    })
                }
                </div>
            </div>
            </section>
        </form>
        </>)
}