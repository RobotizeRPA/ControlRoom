import { TaskModel } from "@/types"
import BotCard from "./BotCard"
import Link from "next/link"

interface Props {
    data: TaskModel[]
}

export default function BotsMain({data}: Props){

    return(
        <>
            <div className="flex justify-between items-center">
            <h2 className="font-bold text-xl py-4">Automatization</h2>
            <Link href='/create' className="bg-robotize text-white px-4 py-2 rounded-lg">Program bot</Link>
            </div>
            <p className="pt-10 border-b-2">All bots</p>
            <div className="flex flex-col gap-2">
            <div className="grid grid-cols-6 py-4 text-center">
                <h5 className="font-bold">Name</h5>
                <h5 className="font-bold">Status</h5>
                <h5 className="font-bold">Last Run Status</h5>
                <h5 className="font-bold">Last Run Time</h5>
                <h5 className="font-bold">Next Run Time</h5>
                <h5 className="font-bold">Settings</h5>
            </div>
                {
                    data.map(e => {
                        return <BotCard key={e._id} _id={e._id} name={e.name} status={e.status} lastRunStatus={e.lastRunStatus} nextRun={e.nextRun} lastRun={e.lastRun}/>
                    })
                }
            </div>
        </>)
}