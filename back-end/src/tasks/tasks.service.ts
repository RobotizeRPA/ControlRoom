import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Tasks } from './tasks.schema';
import { Model } from 'mongoose';
import { TaskModel, TaskModelUpdate } from 'src/type';

@Injectable()
export class TasksService {
    constructor(@InjectModel(Tasks.name) private tasksModel: Model<Tasks>){}

    async createTask(task: TaskModel){
        const newTask = await this.tasksModel.create({
            name: task.name,
            status: task.status,
            runTimes: task.runTimes,
            runHours: task.runHours,
            runDays: task.runDays,
            path: task.path,
            lastRun: 'unknown',
            nextRun: task.nextRun,
            specificHour: task.specificHour,
            lastRunStatus: 'unknown'
        })
        return {"task":newTask, "status": "ok"}
    }

    async updateStatus(name,newStatus: TaskModelUpdate){
        const findTask = await this.tasksModel.findOne({
            name: name
        })

        if(findTask){
            newStatus.status ? findTask.status = newStatus.status : findTask.status = findTask.status
            newStatus.lastRun ? findTask.lastRun = newStatus.lastRun : findTask.lastRun = findTask.lastRun
            newStatus.runHours ? findTask.runHours = newStatus.runHours : findTask.runHours = findTask.runHours
            newStatus.runTimes ? findTask.runTimes = newStatus.runTimes : findTask.runTimes = findTask.runTimes
            newStatus.runDays ? findTask.runDays = newStatus.runDays : findTask.runDays = findTask.runDays
            newStatus.path ? findTask.path = newStatus.path : findTask.path = findTask.path
            newStatus.nextRun ? findTask.nextRun = newStatus.nextRun : findTask.nextRun = findTask.nextRun
            newStatus.specificHour ? findTask.specificHour = newStatus.specificHour : findTask.specificHour = findTask.specificHour
            newStatus.lastRunStatus ? findTask.lastRunStatus = newStatus.lastRunStatus : findTask.lastRunStatus = findTask.lastRunStatus
            
            findTask.save()
            return 'Task updated'
        }
    }

    async allTasks(){
        return this.tasksModel.find()
    }

    async taskById(name: string){
        const findTask = await this.tasksModel.findOne({
            name: name
        })

        return findTask
    }

    async deleteTask(name: string){
        const findTask = await this.tasksModel.deleteOne({
            name: name
        })

        if(findTask.deletedCount === 1){
            return 'Bot deleted succesfully'
        }else{
            return 'Error when trying to delete bot'
        }

    }

}
