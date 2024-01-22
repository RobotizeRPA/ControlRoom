export interface TaskModel {
    _id: string,
    name: string;
    status: string;
    runTimes: string;
    lastRun: string;
    runHours: string;
    runDays: string[];
    path: string;
    nextRun: string;
    specificHour: string;
    lastRunStatus: string
}

export interface TaskModelCreate {
    name: string;
    status: string;
    runTimes: string;
    lastRun: string;
    runHours: string;
    runDays: string[];
    path: string;
    nextRun: string;
    lastRunStatus: string
}