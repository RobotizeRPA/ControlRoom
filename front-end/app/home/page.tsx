import HomePage from "@/components/Home/Home"
import { getBots } from "./service/home.service"

export default async function Home(){
    const data = await getBots()

    return(<HomePage data={data}/>)
}