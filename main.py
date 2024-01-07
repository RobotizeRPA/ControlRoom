import os
import requests
from helper import day,last_run,next_run

def run_task_ones():
    response = requests.get(f'http://localhost:3001/tasks/').json()
    for names in response:
        if names['runTimes'] == 1 and names['status'] == 'enabled':
            task_name = names['name']

            os.system(f'python {names["path"]}')
            
            date = last_run()
            requests.patch(f'http://localhost:3001/tasks/{task_name}', json={'lastRun': date, 'runTimes': 2})
            
def run_task_always():
    response = requests.get(f'http://localhost:3001/tasks/').json()
    # Variable to get the actual date
    last_full = last_run()
    last = last_full.split(' ')
    last = last[1]
    weekday = day()
    # Loop through the LIST of BOTS
    for names in response:
        # This IF is to verify that all the conditions are TRUE to run the bot
        if names['runTimes'] == 0 and names['status'] == 'enabled' and names['nextRun'] == str(last) and weekday in names['runDays']:
            # This IF is only for those who run in a specific hour
            if names['specificHour'] != '0' and names['lastRun'] != last_full:
                next = names['specificHour']
            else:
                next = next_run(hour)     
            task_name = names['name']
            hour = names['runHours']
            # Run the bot with the PATH
            os.system(f'python {names["path"]}')
            # Modify the time of runs in the DB
            requests.patch(f'http://localhost:3001/tasks/{task_name}', json={'lastRun': last_full, 'nextRun': next})
            
run_task_ones()            
run_task_always()            