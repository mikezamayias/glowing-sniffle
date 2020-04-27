import os

items = os.listdir()
directories = [item for item in items if os.path.isdir(item)]

for directory in directories:
	os.rename(directory, directory.replace("Lab", "Assignment"))
