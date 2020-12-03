#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Nov 29 21:05:23 2020

@author: taylorlast
"""


# Homework 7


import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from matplotlib import animation
from IPython.display import HTML


# Question 1

NRAdata = pd.read_csv('/Users/taylorlast/Documents/GitHub/School/Python/Advanced Statistical Programming/nra-grades.csv')

house = NRAdata[(NRAdata.iloc[:,1]=="US House")&(NRAdata.iloc[:,4]=="General")]
all_counts_hs = house.grade.value_counts()
grades=['A+','A','AQ','A-','B+','B','B-','C+','C','C-','D+','D','D-','F','?']
all_counts_hs = all_counts_hs[grades]

house_R = house[house.iloc[:,6]=='R']
house_D = house[house.iloc[:,6]=='D']

xpos = np.arange(len(all_counts_hs))

fig, ax = plt.subplots(figsize =(10,8))

def draw_barchart(year): 
    ax.clear()
    
    df_R = house_R[house_R.year == year]
    df_D = house_D[house_D.year == year]
    
    counts_R = df_R.grade.value_counts()
    counts_D = df_D.grade.value_counts()
    
    grades=['A+','A','AQ','A-','B+','B','B-','C+','C','C-','D+','D','D-','F','?']
    
    counts_R=counts_R.reindex(grades,fill_value=0)
    counts_D=counts_D.reindex(grades,fill_value=0)
    
    ax.bar(x = xpos + .15, height = counts_R, label = "Republican", width = .3, color = 'Red')
    ax.bar(x = xpos - .15, height = counts_D, label = "Democrat", width = .3, color = 'Blue')
    ax.set_xlabel('grade')
    ax.set_title('NRA Grades for House Races ' + str(year))
    ax.set_xticks(xpos)
    ax.set_xticklabels(grades)
    ax.legend()

animator = animation.FuncAnimation(fig,draw_barchart,frames = range(2010,2018,2),interval = 1000, repeat = False)
anim = animator.to_html5_video()
HTML(anim)

# Question 2

def read_ssn(begin_year,end_year):
    all_years = pd.DataFrame()
    years = range(begin_year,end_year+1)
    
    for y in years:
        f = '/Users/taylorlast/Documents/GitHub/School/Python/Advanced Statistical Programming/names/yob{}.txt'.format(y)
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

plot_names('Taylor','Jackson','Thomas',sex='M',begin_year=1900,end_year=2018)
    
        
    
        
    
