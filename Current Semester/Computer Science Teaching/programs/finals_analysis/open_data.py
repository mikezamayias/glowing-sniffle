#!/usr/bin/env python3
# -*- coding: utf-8 -*-

#   Import modules
import openpyxl


#   Open file
data_file = openpyxl.load_workbook('data.xlsx', data_only=True)

#   Print sheet names
sheet = data_file.sheetnames
# print(sheet)

#   Select sheet
data = data_file['ΒΑΣΕΙΣ']
