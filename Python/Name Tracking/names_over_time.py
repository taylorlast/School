#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Dec  1 22:15:22 2020

@author: taylorlast
"""

# Homework 7

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from matplotlib import animation

# Question 2

def read_ssn(begin_year,end_year):
    all_years = pd.DataFrame()
    years = range(begin_year,end_year+1)
    
    for y in years:
        f = '/Users/taylorlast/Documents/GitHub/School/Python/names/yob{}.txt'.format(y)
        df = pd.read_csv(f,names=["names","gender","count"])
        df.insert(0,"year",y)
        all_years = pd.concat([all_years,df],axis=0)
        
        male=all_years[all_years.gender=="M"]
        female=all_years[all_years.gender=="F"]
        
        female_grouped=female.groupby('year')
        male_grouped=male.groupby('year')
        
        female_count=female_grouped['count'].sum()
        male_count=male_grouped['count'].sum()
        
    return {'All years' : all_years, 'Female Count' : female_count, 'Male Count': male_count}

#Test Case
read_ssn(1900,1905)


def plot_names(*args, sex, begin_year = 1880, end_year = 2018):
    
    df = read_ssn(begin_year, end_year)['All years']
    if sex == 'M':
        df_total_gender = read_ssn(begin_year, end_year)['Male Count']
    elif sex == 'F':
        df_total_gender = read_ssn(begin_year, end_year)['Female Count']
    else:
        pass
    
    df = df[df.gender == sex]
    df_names = df[df['names'].isin(args)]
    df_final = pd.merge(df_names,df_total_gender,on = 'year',how='inner')
    df_final['percent'] = (df_final['count_x'] / df_final['count_y'])*100
    years = range(begin_year,end_year+1)

    df_final = df_final.set_index('year')
    df_final = df_final[['names','percent']]
    # print(df_final)
    fig, ax = plt.subplots(figsize = (10,8))
    xpos = np.arange(len(years))
    
    for arg in args:
        temp = df_final[df_final['names'] == arg]['percent']
        ax.bar(x=years,height=temp, width = .5, label = arg,alpha=.5)
        ax.legend()
        ax.set_title('Popularity of names by gender')
        ax.set_xlabel('year')
        ax.set_ylabel('percent of newborns with name')
        

# Test cases
        
plot_names("Mary","Susan","Natalie","Evelyn","Emma",sex="F",begin_year=1900,end_year=2018)
