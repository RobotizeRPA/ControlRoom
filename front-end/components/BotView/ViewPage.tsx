'use client'

import { TaskModel } from "@/types"
import { useState } from "react"
import Navbar from "../Navbar/Navbar"
import BotsMain from "./helper/Main"

interface Props {
    data: TaskModel[]
}

export default function ViewPage({data}: Props){
    const [large,setLarge] = useState(true)
    return(
        <main className={large ? "grid grid-cols-navbar h-screen w-full " : "grid grid-cols-navbarEff h-screen"}>
                <Navbar large={large} setLarge={setLarge}/>
            <section className="p-10 w-full">
                <BotsMain data={data}/>
            </section>
        </main>)
}