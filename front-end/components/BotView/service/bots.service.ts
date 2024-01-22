import axios from "axios"

export const deleteBot = async (name: string) => {
    try {
        const apiData = await axios.delete(`http://localhost:3001/tasks/${name}`)
        return apiData.data
    } catch (error) {
        console.log(error)
    }
}