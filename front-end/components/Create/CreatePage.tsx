'use client'
import { useState } from "react"
import Navbar from "../Navbar/Navbar"
import CreateMain from "./helper/Main"

export default function CreatePage(){
    const [large,setLarge] = useState(true)
    
    return(
        <main className={large ? "grid grid-cols-navbar h-screen w-full " : "grid grid-cols-navbarEff h-screen w-full"}>
            <Navbar large={large} setLarge={setLarge}/>
            <section className="p-10">
                <CreateMain/>
            </section>
        </main>)
}