'use client'
import Navbar from "@/components/Navbar/Navbar"
import { useState } from "react"
import HomeMain from "./helper/Main"
import { TaskModel } from "@/types"

interface Props {
    data: TaskModel[]
}


export default function HomePage({data}: Props){
    const [large,setLarge] = useState(true)
    return(
        <main className={large ? "grid grid-cols-navbar h-screen w-full" : "grid grid-cols-navbarEff h-screen"}>
                <Navbar large={large} setLarge={setLarge}/>
            <section className="p-10">
                <HomeMain data={data}/>
            </section>
        </main>)
}