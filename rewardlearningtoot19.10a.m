clear all

% Load Behavioral data
% 
% 'C:\Users\benjamin.timberlake\Documents\MATLAB\rldemo\Sub4_Session1_20150519-0941.mat'

% Load behavioral data from separate files into a matrix called 'alldata'
files = dir('/Users/bentimberlake/Documents/MATLAB/tobiassubjectdata/*.mat');
for i=1:length(files)
    alldata(i) = load(['/Users/bentimberlake/Documents/MATLAB/tobiassubjectdata/' files(i).name]);
end


% Reorganize it
% Extract statistics in meaningful way
% Average win or total wins for diff subjects

% TOTAL WINS FOR EACH SUBJECT (ALL THREE SESSIONS)
   % (represented by feedback) column 9

   % check if data 1,1 is 4, then sum 
% get(alldata)
% for j=subject(4:6)
% allWinnings(j) = sum(feedback(session(1:3))
% 
% alldata(1:3)

% run a loop that goes through all the data

%% Winnings
for i=1:length(alldata)
    
    if (alldata(i).data.subject(1) == 4)

    j = (alldata(i).data.subject(1)-3); % differentiate subjects for row position
    k = (alldata(i).data.session) % differentiate sessions for column position
    
% collect the individual session winnings
    winnings(j,k) = sum(alldata(i).data.feedback)
    
    end
    
    if (alldata(i).data.subject(1) == 5)

    j = (alldata(i).data.subject(1)-3); % differentiate subjects for row position
    k = (alldata(i).data.session) % differentiate sessions for column position
    
% collect the individual session winnings
    winnings(j,k) = sum(alldata(i).data.feedback)
    
    end
        
    if (alldata(i).data.subject(1) == 6)

    j = (alldata(i).data.subject(1)-3); % differentiate subjects for row position
    k = (alldata(i).data.session) % differentiate sessions for column position

    % collect the individual session winnings
    winnings(j,k) = sum(alldata(i).data.feedback)
    
    end
end

% add up the winnings for each session, by subject
totalwinnings = sum(winnings,2)

totalwinnings(1) % total winnings for first subject

%% Reaction time
for i=1:length(alldata);
    
    if (alldata(i).data.subject(1) == 4);

    j = (alldata(i).data.subject(1)-3); % differentiate subjects for row position
    k = (alldata(i).data.session); % differentiate sessions for column position
    
% collect the individual session reaction times
    rt(j,k) = sum(alldata(i).data.rt);
    
% get number of trials for each session
    trials(j,k) = length(alldata(i).data.trial)

    end
    
    if (alldata(i).data.subject(1) == 5);

    j = (alldata(i).data.subject(1)-3); % differentiate subjects for row position
    k = (alldata(i).data.session); % differentiate sessions for column position
    
% collect the individual session reaction times
    rt(j,k) = sum(alldata(i).data.rt);
    
% get number of trials for each session
    trials(j,k) = length(alldata(i).data.trial);

    end
        
    if (alldata(i).data.subject(1) == 6);

    j = (alldata(i).data.subject(1)-3); % differentiate subjects for row position
    k = (alldata(i).data.session); % differentiate sessions for column position

% collect the individual session reaction times
    rt(j,k) = sum(alldata(i).data.rt);
    % avrt = mean(rt) %is this any better to get the mean?
% get number of trials for each session
    trials(j,k) = length(alldata(i).data.trial);

    end
    
    % get number of trials for each session
    trials(j,k) = length(alldata(i).data.trial);

    % divide rt for that session by trials for mean rt
    avgrt = (rt./trials)
    
end

% add up the times for each session, by subject
totalrt = sum(rt,2);

% calculate mean reaction time for each subject
mean(avgrt,2)
% mean(rt,2)

% totalrt(1) % total rt for first subject

%%
% Do subjects get faster or slower

for i=1:length(alldata);
    
    if (alldata(i).data.subject(1) == 4);
figure(4)

        plot(alldata(i).data.rt)
        hold on
    end
    
    if (alldata(i).data.subject(1) == 5);
figure(5)

        plot(alldata(i).data.rt) % could use plot(smooth(alldata(i).data.rt)) to smooth out graphs
        hold on
    end
    
    if (alldata(i).data.subject(1) == 6);
figure(6)

        plot(alldata(i).data.rt)
        hold on
    end
% (alldata(i).data.rt)
% (alldata(i).data.trial)

% THOUGHTS on how to analyze statistically
% could do a linear regression to look for increase/decrease

% rt greater than previous = 1
% rt less than previous = 0
% sum this then average 

% plot this

end
%%
% Avg rt ea subject after win vs loss
%       Why is this important?

% feedback: 0=loss, 1= win
% 
% Put all the data for this section in one three-column matrix
alloneplace=[];
for i=1:length(alldata);

    
alloneplace = [alloneplace ; [alldata(i).data.subject, alldata(i).data.feedback, alldata(i).data.rt]]

end


%%
% Do subjects Learn as time goes on?
% increase in winning ratio? - plot or look at binning into a number of
% trials and comparing subsequent bins to previous
%     - some sort of smoothing would help plotting


%%
% Reaction time relative to potential or previous reward?
% - as function of diff b/w the two probabilities
% - faster decisions when easier vs harder choice


% Familiarity with data organization
% 
% Which choices do subjects make