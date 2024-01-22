import axios from 'axios'

export const getBots = async () => {
    try {
        const apiData = await axios.get('http://localhost:3001/tasks')
        return apiData.data
    } catch (error) {
        console.log(error)   
    }
}