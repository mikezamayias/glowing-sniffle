#!/usr/bin/env python3
# -*- coding: utf-8 -*-

#   Import modules
from pprint import pprint
from open_data import *

# Note that 'import open_data' won't import objects from
# open_data.py as I'd thought. I need to use
# 'from open_data import *' to get the desired result.



#   Read codes of faculties
codes_of_faculties = []
for row in range(4, 516+1):
    cell_object = data.cell(row=row, column=1)
    cell = cell_object.value
    # print(cell)
    codes_of_faculties.append(cell)
# print(codes_of_faculties)


#   Read names of faculties
names_of_faculties = []
for row in range(4, 516+1):
    # Make the cell object
    cell_object = data.cell(row=row, column=2)
    cell = cell_object.value
    # print(cell)
    names_of_faculties.append(cell)


#   Read names of institutions
names_of_institutions = []
for row in range(4, 516+1):
    cell_object = data.cell(row=row, column=3)
    cell = cell_object.value
    # print(cell)
    names_of_institutions.append(cell)
# print(names_of_institutions)


#   Read score of first successful student
scores_of_first_successful_students = []
for row in range(4, 516+1):
    cell_object = data.cell(row=row, column=8)
    cell = cell_object.value
    # print(cell)
    scores_of_first_successful_students.append(cell)
# print(scores_of_first_successful_students)


#   Read score of least successful student
scores_of_least_successful_students = []
for row in range(4, 516+1):
    cell_object = data.cell(row=row, column=10)
    cell = cell_object.value
    # print(cell)
    scores_of_least_successful_students.append(cell)
# print(scores_of_least_successful_students)

