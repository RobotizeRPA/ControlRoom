import subprocess
import requests
from helper import rename_days,last_run,next_run


# Funcion para crear la task en el "Task Scheduler" de Windows
def create_task():
    response = requests.get(f'http://localhost:3001/tasks/bot_prueba').json()
    if response['status'] == 'program':
        # Ruta al ejecutable de Python (ajusta según tu instalación)
        python_exe = "C:\\Windows\\py.exe"

        # Ruta al script de Python que quieres ejecutar
        script_path = response['path']

        # Nombre de la tarea en el Programador de Tareas
        task_name = response['name']

        # Hora a la que quieres que se ejecute la tarea (formato HH:MM, 24 horas)
        start_time = response['nextRun']
        
        # Dias de ejecucion
        sc = response['runParam']
        
        if sc == 'weekly':
            days = rename_days(response['runDays'])
            # Crear el comando para agregar la tarea al Programador de Tareas
            command = f"schtasks /create /tn {task_name} /tr \"{python_exe} '{script_path}'\" /sc weekly /d {days} /st {start_time}"
            subprocess.run(command, shell=True)
        elif sc == 'hourly':
            hours = response['runHours']
            command = f"schtasks /create /tn {task_name} /tr \"{python_exe} '{script_path}'\" /sc hourly /mo {hours} /st {start_time}"
            subprocess.run(command, shell=True)
            command = f'schtasks /create /tn "{task_name}_stop" /tr "cmd /c schtasks /end /tn {task_name}" /sc daily /st 12:51'
            subprocess.run(command, shell=True)
        else:
            command = f"schtasks /create /tn {task_name} /tr \"{python_exe} '{script_path}'\" /sc daily /st {start_time}"
            subprocess.run(command, shell=True)
                
        requests.patch(f'http://localhost:3001/tasks/{task_name}', json={'status': 'enabled'})

# Funcion para ejecutar la tarea una unica vez
def run_task():
    response = requests.get(f'http://localhost:3001/tasks/').json()
    for names in response:
        if names['runTimes'] == 1 and names['status'] == 'enabled':
            task_name = names['name']

            # Crear el comando para ejecutar la tarea
            command = f"schtasks /run /tn {task_name}"

            # Ejecutar el comando
            subprocess.run(command, shell=True)
            
            date = last_run()
            requests.patch(f'http://localhost:3001/tasks/{task_name}', json={'lastRun': date, 'runTimes': 2})

# Funcion para desactivar una task
def deactivate_task():
    response = requests.get(f'http://localhost:3001/tasks/').json()
    for names in response:
        if names['status'] == 'disable':
            task_name = names['name']
            
            command = f"schtasks /change /tn {task_name} /disable"
            
            # Ejecutar el comando
            subprocess.run(command, shell=True)
            requests.patch(f'http://localhost:3001/tasks/{task_name}', json={"status": "disabled"})

# Funcion para activar una task 
def active_task():
    response = requests.get(f'http://localhost:3001/tasks/').json()
    for names in response:
        if names['status'] == 'enable':
            task_name = names['name']
            
            command = f"schtasks /change /tn {task_name} /enable"
            
            # Ejecutar el comando
            subprocess.run(command, shell=True)
            requests.patch(f'http://localhost:3001/tasks/{task_name}', json={"status": "enabled"})            

            
# def run_task_timer():
#     response = requests.get(f'http://localhost:3001/tasks/').json()
#     for names in response:
#         last = last_run()
#         last = last.split(' ')
#         last = last[1]
#         if names['runTimes'] == 0 and names['status'] == 'enabled' and names['nextRun'] == str(last):
#             task_name = names['name']
#             hour = names['runHours']
#             # Crear el comando para ejecutar la tarea
#             command = f"schtasks /run /tn {task_name}"

#             # Ejecutar el comando
#             subprocess.run(command, shell=True)
#             next = next_run(hour)
            
#             requests.patch(f'http://localhost:3001/tasks/{task_name}', json={'lastRun': last, 'nextRun': next})


create_task()            
# run_task_timer()            