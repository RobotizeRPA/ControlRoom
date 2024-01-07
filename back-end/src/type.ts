export interface TaskModel {
    name: string;
    status: string;
    runTimes: string;
    lastRun: string;
    runHours: string;
    runDays: string[];
    path: string;
    nextRun: string;
    specificHour: string;
}

export interface TaskModelUpdate {
    _id: string;
    name: string;
    status: string;
    runTimes: string;
    lastRun: string;
    runHours: string;
    runDays: string[];
    path: string;
    nextRun: string;
    specificHour: string;
}