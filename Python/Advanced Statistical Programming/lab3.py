#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Sep 24 09:45:28 2020

@author: taylorlast
"""

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

#%%

college_data = pd.read_csv('/Users/taylorlast/Documents/GitHub/School/Python/Advanced Statistical Programming/MERGED2015_16_PP.csv',na_values = ['NULL','PrivacySuppressed'])
college_data.shape

#%%
# Public
plt.figure(figsize = (10,10))
colors = pd.Series(['blue','green','red'])

plt.subplot(321)
plt.scatter(college_data.COSTT4_A ,college_data.COSTT4_A - college_data.NPT41_PUB, c=colors[college_data.ICLEVEL - 1])
plt.title("public institutions 0-30,000")
plt.xlabel("Annual Cost of Attendance")
plt.ylabel("Financial aid amount")

plt.subplot(322)
plt.scatter(college_data.COSTT4_A ,college_data.COSTT4_A - college_data.NPT42_PUB, c=colors[college_data.ICLEVEL - 1])
plt.title("public institutions 30,001-48,000")
plt.xlabel("Annual Cost of Attendance")
plt.ylabel("Financial aid amount")

plt.subplot(323)
plt.scatter(college_data.COSTT4_A ,college_data.COSTT4_A - college_data.NPT43_PUB, c=colors[college_data.ICLEVEL - 1])
plt.title("public institutions 48,001-75,000")
plt.xlabel("Annual Cost of Attendance")
plt.ylabel("Financial aid amount")

plt.subplot(324)
plt.scatter(college_data.COSTT4_A ,college_data.COSTT4_A - college_data.NPT44_PUB, c=colors[college_data.ICLEVEL - 1])
plt.title("public institutions 75,001-110,000")
plt.xlabel("Annual Cost of Attendance")
plt.ylabel("Financial aid amount")

plt.subplot(325)
plt.scatter(college_data.COSTT4_A ,college_data.COSTT4_A - college_data.NPT45_PUB, c=colors[college_data.ICLEVEL - 1])
plt.title("public institutions 110,001+")
plt.xlabel("Annual Cost of Attendance")
plt.ylabel("Financial aid amount")

# It appears that the more the famlily income is, the more random the data is with Cost of attendance and financial aid.
# There is more variability and lower correlation.


#%%
# Private
plt.subplot(321)
plt.scatter(college_data.COSTT4_A, college_data.COSTT4_A - college_data.NPT41_PRIV, c=colors[college_data.ICLEVEL - 1])
plt.title("private institutions 0-30,000")
plt.xlabel("Annual Cost of Attendance")
plt.ylabel("Financial aid amount")

plt.subplot(322)
plt.scatter(college_data.COSTT4_A,college_data.COSTT4_A-college_data.NPT42_PRIV, c=colors[college_data.ICLEVEL-1])
plt.title("private institutions 30,001-48,000")
plt.xlabel("Annual Cost of Attendance")
plt.ylabel("Financial aid amount")

plt.subplot(323)
plt.scatter(college_data.COSTT4_A,college_data.COSTT4_A-college_data.NPT43_PRIV, c=colors[college_data.ICLEVEL-1])
plt.title("private institutions 48,001-75,000")
plt.xlabel("Annual Cost of Attendance")
plt.ylabel("Financial aid amount")

plt.subplot(324)
plt.scatter(college_data.COSTT4_A,college_data.COSTT4_A-college_data.NPT44_PRIV, c=colors[college_data.ICLEVEL-1])
plt.title("private institutions 75,001-110,000")
plt.xlabel("Annual Cost of Attendance")
plt.ylabel("Financial aid amount")

plt.subplot(325)
plt.scatter(college_data.COSTT4_A,college_data.COSTT4_A-college_data.NPT45_PRIV, c=colors[college_data.ICLEVEL-1])
plt.title("private institutions 110,001+")
plt.xlabel("Annual Cost of Attendance")
plt.ylabel("Financial aid amount")

# It appears that the more the famlily income is, the more random the data is with Cost of attendance and financial aid.
# There is more variability and lower correlation. As cost of attendance goes up, financial aid increases.
#%%

college_data2 = pd.read_csv('/Users/taylorlast/Documents/GitHub/School/Python/Advanced Statistical Programming/MERGED2007_08_PP.csv', na_values = ['NULL','PrivacySuppressed'])

plt.subplot(221)
plt.scatter(college_data2.DEBT_MDN, college_data2.MN_EARN_WNE_INC1_P10 , c =colors[college_data2.ICLEVEL-1])
plt.xlabel('median debt')
plt.ylabel('Income 10 years after graduation')
plt.title('Low Income Family')

plt.subplot(222)
plt.scatter(college_data2.DEBT_MDN, college_data2.MN_EARN_WNE_INC2_P10 , c =colors[college_data2.ICLEVEL-1])
plt.xlabel('median debt')
plt.ylabel('Income 10 years after graduation')
plt.title('Medium Income Family')

plt.subplot(223)
plt.scatter(college_data2.DEBT_MDN, college_data2.MN_EARN_WNE_INC3_P10 , c =colors[college_data2.ICLEVEL-1])
plt.xlabel('median debt')
plt.ylabel('Income 10 years after graduation')
plt.title('High Income Family')

# As median debt increases, income 10 years after graduation increases too, but the correlation is weak.
# The higher institutions cost more and the students earn more 10 years after graduation.
#%%


'''
plt.subplot(221)
plt.scatter(college_data2.DEBT_MDN, college_data2.MN_EARN_WNE_INC1_P10 , c =colors[college_data2.CONTROL-1])

plt.subplot(222)
plt.scatter(college_data2.DEBT_MDN, college_data2.MN_EARN_WNE_INC2_P10 , c =colors[college_data2.CONTROL-1])

plt.subplot(223)
plt.scatter(college_data2.DEBT_MDN, college_data2.MN_EARN_WNE_INC3_P10 , c =colors[college_data2.CONTROL-1])
'''

#%%

#3

plt.figure()
plt.scatter(college_data2.DEBT_MDN.loc[college_data2.CONTROL==1], college_data2.GT_25K_P10.loc[college_data2.CONTROL==1], color="red",label="Public")
plt.title("Graduates who earn more than median income of high school grads versus median debt ")
plt.xlabel("Debt of College Graduates")
plt.ylabel("Fraction of Stuendts Earning More than High School Graduates" )
plt.legend(labels=["Public","Private Nonprofit","Private for Profit"])
plt.scatter(college_data2.DEBT_MDN.loc[college_data2.CONTROL==2], college_data2.GT_25K_P10.loc[college_data2.CONTROL==2], color="blue",label="Private non-profit")
plt.title("Graduates who earn more than median income of high school grads versus median debt ")
plt.xlabel("Debt of College Graduates")
plt.ylabel("Fraction of Stuendts Earning More than High School Graduates" )
plt.legend(labels=["Public","Private Nonprofit","Private for Profit"])
plt.scatter(college_data2.DEBT_MDN.loc[college_data2.CONTROL==3], college_data2.GT_25K_P10.loc[college_data2.CONTROL==3], color="green",label="Private for-profit")
plt.title("Graduates who earn more than median income of high school grads versus median debt ")
plt.xlabel("Debt of College Graduates")
plt.ylabel("Fraction of Stuendts Earning More than High School Graduates" )
plt.legend(labels=["Public","Private Nonprofit","Private for Profit"])
plt.legend()

# Median debt and fraction of students who earn more than the median high school grad have a logarithmic  
# relationship. The better private institutions appear to have more student who have higher debt but have more
# students that earn more than the median high school grad.




