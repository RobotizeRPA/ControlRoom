import { Body, Controller, Delete, Get, Param, Patch, Post } from '@nestjs/common';
import { TasksService } from './tasks.service';
import { TaskModel, TaskModelUpdate } from 'src/type';

@Controller('tasks')
export class TasksController {
    constructor(private tasksService: TasksService){}

    @Post()
    createTask(@Body() dataTask: TaskModel){
        return this.tasksService.createTask(dataTask);
    }

    @Patch('/:name')
    updateTask(@Param('name') id: string, @Body() dataTask: TaskModelUpdate){
        return this.tasksService.updateStatus(id, dataTask)
    }

    @Get()
    allTasks(){
        return this.tasksService.allTasks()
    }

    @Get('/:name')
    taskById(@Param('name') id: string){
        return this.tasksService.taskById(id)
    }

    @Delete('/:name')
    deleteTask(@Param('name') name: string){
        return this.tasksService.deleteTask(name)
    }
}
