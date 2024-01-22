import { TaskModelCreate } from "@/types"
import axios from "axios"

export const newBot = async (data: TaskModelCreate) => {
    try {
        const apiData = await axios.post('http://localhost:3001/tasks', data)
        console.log(apiData.data)
        return apiData.data
    } catch (error) {
        console.log(error)
    }
}