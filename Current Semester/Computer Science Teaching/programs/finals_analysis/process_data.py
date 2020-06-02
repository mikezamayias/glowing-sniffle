#!/usr/bin/env python3
# -*- coding: utf-8 -*-

#   Import read_data.py
from read_data import *


#   Process data
def print_list(given_list):
    for item in range(len(given_list)):
        print(given_list[item])


def make_superlist(sublist1, sublist2, sublist3, sublist4, sublist5):
    if len(sublist1) == len(sublist2) and \
            len(sublist2) == len(sublist3) and \
            len(sublist3) == len(sublist4) and \
            len(sublist4) == len(sublist5):
        superlist = [sublist1, sublist2, sublist3, sublist4, sublist5]
        final_superlist = []
        for item in range(len(sublist1)):
            final_superlist.append([
                superlist[0][item],
                superlist[1][item],
                superlist[2][item],
                superlist[3][item],
                superlist[4][item]])
        return final_superlist
    else:
        print("error")


faculties = make_superlist(codes_of_faculties, names_of_faculties,
                           names_of_institutions, scores_of_first_successful_students,
                           scores_of_least_successful_students)

print(len(faculties))
print_list(faculties)
