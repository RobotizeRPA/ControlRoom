import { TaskModel } from "@/types"


interface Props {
    data: TaskModel[]
}


export default function HomeMain({data}: Props){

    const active = data.filter(e => e.status === 'enabled')
    const inactive = data.filter(e => e.status === 'disable')
    const complete = data.filter(e => e.lastRunStatus === 'completed')
    const failed = data.filter(e => e.lastRunStatus === 'failed')
    

    return(
        <>
            <h2 className="font-bold text-xl py-4">Home</h2>
            <div className="flex items-center gap-4">
                <button className="border-robotize border-2 px-4 rounded-md bg-robotizeTrans">My Dasboard</button>
                <button className="border-robotize border-2 px-4 rounded-md bg-white">View</button>
                <button className="border-robotize border-2 px-4 rounded-md bg-white">Development</button>
            </div>
            <article className="p-5 bg-white my-4 rounded-lg">
                <p className="text-xs py-2">Development</p>
                <p className="text-sm font-semibold">My Automation | 0</p>
                <p className="text-xs py-2">Last 7 days</p>
            </article>
            <article className="grid grid-cols-2 gap-6">
                    <div className="bg-white my-4 rounded-lg p-5 grid grid-cols-4">
                        <div className="col-span-4">
                            <p className="text-xs">Operations</p>
                            <p className="text-sm font-semibold">Automation Status</p>
                        </div>
                        
                        <div>
                            <p className="text-3xl font-semibold">{active.length}</p>
                            <p className="text-sm py-2">Active</p>
                        </div>
                        
                        <div>
                            <p className="text-3xl font-semibold">{inactive.length}</p>
                            <p className="text-sm py-2">Inactive</p>
                        </div>
                        
                        <div>
                            <p className="text-3xl font-semibold">{complete.length}</p>
                            <p className="text-sm py-2 font-semibold text-green-600">Complete</p>
                        </div>
                        
                        <div>
                            <p className="text-3xl font-semibold">{failed.length}</p>
                            <p className="text-sm py-2 text-red-600 font-semibold">Failed</p>
                        </div>
                    </div>
                    <div className="bg-white my-4 rounded-lg p-5 grid grid-cols-4">
                        <div className="col-span-4">
                            <p className="text-xs">Operations</p>
                            <p className="text-sm font-semibold">Device Status</p>
                        </div>
                        
                        <div>
                            <p className="text-3xl font-semibold">{complete.length}</p>
                            <p className="text-sm py-2">Online</p>
                        </div>
                        
                        <div>
                            <p className="text-3xl font-semibold">{failed.length}</p>
                            <p className="text-sm py-2">Ofline</p>
                        </div>
                    </div>
            </article>
        </>)
}