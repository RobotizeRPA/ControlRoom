import ViewPage from "@/components/BotView/ViewPage";
import { getBots } from "./service/view.service";

export default async function View(){
    const data = await getBots()

    return(<ViewPage data={data}/>)
}