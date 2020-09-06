from os import system
scripts = [
    "rm task1.txt && octave task1.m >> task1.txt",
    "rm task2.txt && octave task2.m >> task2.txt",
    "rm task3.txt && octave task3.m >> task3.txt",
    "rm task4.txt && octave task4.m >> task4.txt",
    "rm out_task3.txt && octave out_task3.m >> out_task3.txt"
]
for script in scripts:
    print(script)
    system(script)