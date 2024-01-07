import {Prop, Schema, SchemaFactory} from '@nestjs/mongoose'
import { HydratedDocument } from 'mongoose'

export type TasksDocument = HydratedDocument<Tasks>

@Schema()
export class Tasks {
    @Prop({required: true, unique: true})
    name: string;

    @Prop()
    status: string;

    @Prop()
    runTimes: string

    @Prop()
    lastRun: string;

    @Prop()
    runHours: string

    @Prop()
    runDays: string[]
    
    @Prop()
    path: string

    @Prop()
    nextRun: string

    @Prop()
    specificHour: string
}

export const TasksSchema = SchemaFactory.createForClass(Tasks)