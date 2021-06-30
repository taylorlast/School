######################
# Taylor Last
# Final Project
######################

library(tidyverse)
library(lubridate)
library(usmap)
library(maptools)
library(rgdal)

plot_election_results <- function(electoral = F,vote_type = 'total', region = statepop$abbr){
  
  if (electoral != T && electoral !=F && electoral != TRUE && electoral != FALSE){
    return('error: invalid input for electoral')
  }
  
  # Read in the file and create inperson column votes
  election_latest <- read_csv('/Users/taylorlast/Documents/UGA_FourthYear/STAT_4365/USElection2020-NYT-Results-master/data/latest/presidential.csv', na = c('','NA',"NULL",'PrivacySuppressed'))
  election_latest = mutate(election_latest,results_inperson_trumpd = results_trumpd - results_absentee_trumpd,
                          results_inperson_bidenj = results_bidenj - results_absentee_bidenj,
                          inperson_votes = votes - absentee_votes)
  if(vote_type == 'total'){
    election=select(election_latest,state,votes,results_trumpd,results_bidenj)
    
    election_states=group_by(election,state)
    election_states
    
    #Total votes by state
    total_votes=summarise(election_states,sum(votes))
    total_votes
    
    #Trump votes
    trump_votes=summarise(election_states,sum(results_trumpd))
    trump_votes
    
    #Biden votes
    biden_votes=summarise(election_states,sum(results_bidenj))
    biden_votes
    
    #Mutate the data frame
    voting_data=mutate(total_votes,
                       trump = trump_votes$`sum(results_trumpd)`/total_votes$`sum(votes)`,
                       biden = biden_votes$`sum(results_bidenj)`/total_votes$`sum(votes)`,
                       total = `sum(votes)`)
  }else if (vote_type == 'absentee'){
    election=select(election_latest,state,absentee_votes,results_absentee_trumpd,results_absentee_bidenj)
    
    election_states=group_by(election,state)
    election_states
    
    #Total votes by state
    total_votes=summarise(election_states,sum(absentee_votes))
    total_votes
    
    #Trump votes
    trump_votes=summarise(election_states,sum(results_absentee_trumpd))
    trump_votes
    
    #Biden votes
    biden_votes=summarise(election_states,sum(results_absentee_bidenj))
    biden_votes
    
    #Mutate the data frame
    voting_data=mutate(total_votes,
                       trump = trump_votes$`sum(results_absentee_trumpd)`/total_votes$`sum(absentee_votes)`,
                       biden = biden_votes$`sum(results_absentee_bidenj)`/total_votes$`sum(absentee_votes)`,
                       total = `sum(absentee_votes)`)
  }else if (vote_type == 'in-person'){
    election=select(election_latest,state,inperson_votes,results_inperson_trumpd,results_inperson_bidenj)
    
    election_states=group_by(election,state)
    election_states
    
    #Total votes by state
    total_votes=summarise(election_states,sum(inperson_votes))
    total_votes
    
    #Trump votes
    trump_votes=summarise(election_states,sum(results_inperson_trumpd))
    trump_votes
    
    #Biden votes
    biden_votes=summarise(election_states,sum(results_inperson_bidenj))
    biden_votes
    
    #Mutate the data frame
    voting_data=mutate(total_votes,
                       trump = trump_votes$`sum(results_inperson_trumpd)`/total_votes$`sum(inperson_votes)`,
                       biden = biden_votes$`sum(results_inperson_bidenj)`/total_votes$`sum(inperson_votes)`,
                       total = `sum(inperson_votes)`)
  }else{
    return('error: invalid vote type')
  }

  voting_data = voting_data[c('state','trump','biden','total')]
  
  voting_data = mutate(voting_data, trump_win = ifelse(voting_data$trump > voting_data$biden,1,0))
  
  # Get the centers for each state
  state_centers = usmap_transform(tibble(state.center$x, state.center$y,state.name))
  
  # Read in our electoral dataframe
  electoral_votes <- read_csv('/Users/taylorlast/Documents/UGA_FourthYear/STAT_4365/electoralvotes.csv')
  
  # Data Frame allows us to calculate electoral votes with DC
  electoral_college = merge(voting_data,electoral_votes, by ='state')
  electoral_college = mutate(electoral_college,abbr = statepop$abbr)
  electoral_college = filter(electoral_college, abbr %in% region)
  electoral_biden = sum(electoral_college$`number of votes`) - sum((electoral_college$`number of votes`)*(electoral_college$trump_win))
  electoral_trump = sum((electoral_college$`number of votes`)*(electoral_college$trump_win))
  
  # Remove DC because it doesn't have values for center
  electoral_votes = electoral_votes[-9,]
  electoral_votes = mutate(electoral_votes,center_long = state_centers$state.center.x.1, center_lat = state_centers$state.center.y.1)
  
  # Change the center for Alaska and Hawaii
  electoral_votes[2,3]=-1203560
  electoral_votes[2,4]=-1837070
  electoral_votes[11,3]=-450000
  electoral_votes[11,4]=-2130070
  
  voting_data = mutate(voting_data, state = statepop$full, abbr = statepop$abbr)
  electoral_votes = mutate(electoral_votes,state = state.name)
  election_results = merge(voting_data,electoral_votes, by = 'state')
  
  #Filter by region - will make sure electoral votes don't show for out of region
  election_results = filter(election_results,abbr %in% region)
  
  if (electoral == F){
  plot_usmap(data = election_results, regions = 'states',values = 'trump',include = region) +
    scale_fill_continuous(low = 'white', high = 'red', name = 'Vote Percentage for Trump')+
    theme(legend.position = "right") +
    ggtitle(paste(vote_type, 'popular vote based on the latest update since the election'))+
    theme(plot.title = element_text(size = 12, face = "bold"))
  }else {
  plot_usmap(data = election_results,regions = 'states', values = 'trump_win', include = region) +
    scale_fill_continuous(low= 'blue',high = 'red', labels = c('Biden','Trump'), breaks = c(0,1), name = 'Candidate',guide = 'legend') +
    geom_text(data=election_results,aes(x=center_long,y=center_lat,label = `number of votes`)) +
    theme(legend.position = 'right') +
    ggtitle(paste('Biden:', electoral_biden,
                  'Electoral Votes\nTrump:', electoral_trump,
                  'Electoral Votes\nBased on the latest update since the election'))+
    theme(plot.title = element_text(size = 12, face = "bold"))
  }
}

#Test cases
plot_election_results(electoral = T, vote_type = 'total')
plot_election_results(electoral = T, vote_type = 'total', region = .south_region)
plot_election_results(electoral = F, vote_type = 'total')
plot_election_results(electoral = F, vote_type = 'absentee')
plot_election_results(electoral = F, vote_type = 'in-person')

