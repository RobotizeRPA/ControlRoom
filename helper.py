from datetime import datetime, timedelta

# def rename_days(days):
#     all_days = ''
#     for day in days:
#         if day == 'Monday':
#             all_days += 'MON,'
#         elif day == 'Tuedasy':
#             all_days += 'TUE,'
#         elif day == 'Wensday':
#             all_days += 'WEN,'
#         elif day == 'Thuersday':
#             all_days += 'THU,'        
#         elif day == 'Friday':
#             all_days += 'FRI,'
#         elif day == 'Saturday':
#             all_days += 'SAT,'
#         elif day == 'Saturday':
#             all_days += 'SAT,'
#     all_days = all_days.rstrip(", ")         
#     return all_days  

def last_run():
    date = datetime.now()       
    date = date.strftime('%y/%m/%d %H:%M')            
    return date      


def next_run(hour):
    current_date = datetime.now()
    new_date = current_date + timedelta(hours=hour)
    formatted_date = new_date.strftime('%H:%M')
    return formatted_date     

def day():
    day = datetime.today().weekday()
    all_days = ['Monday', 'Tuesday', 'Wensday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
    return all_days[day]
    
day()    