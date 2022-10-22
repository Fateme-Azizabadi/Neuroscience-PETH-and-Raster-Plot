%%
clc;
clear;
%% Loading .mat file and preparing it 
load('Q2_data.mat');
% finding the numbers of trials and the number of total spikes(0 or 1)
a=size(trials);
% a cell array for saving the time of spikes
spikes_time=cell(1,a(1));


% Finding the spike time for each trials
for i=1:a(1)
    stime=[];
    for j=1:a(2)
        if trials(i,j)==1
            stime=[stime; j/Fs-0.05]; 
        end
    end 
    spikes_time{1,i}=stime;
end

%% Raster plot

figure('Units','normalized','Position',[0 0 .3 1])
ax = subplot(2,1,1); hold on

% For all trials...
for iTrial = 1:length(spikes_time)
                  
    spks            = spikes_time{iTrial}';         % Get all spikes of respective trial    
    xspikes         = repmat(spks,3,1);             % Replicate array
    yspikes      	= nan(size(xspikes));           % NaN array
    
    if ~isempty(yspikes)
        yspikes(1,:) = iTrial-1;                    % Y-offset for raster plot
        yspikes(2,:) = iTrial;
    end
    
    plot(xspikes, yspikes, 'Color', 'k')
end

ax.XLim             = [-.05 .2];
%ax.YLim             = [0 length(spikes_time)];
ax.YLim             = [0 20];
ax.XTick            = [0 .2];
hold on 
line([0,0], ylim(), 'LineWidth', 2, 'Color', 'r');

ax.XLabel.String  	= 'Time [s]';
ax.YLabel.String  	= 'Trials';

%% Peristimulus time histogram (PSTH)

all = [];
for iTrial = 1:length(spikes_time)
    all             = [all; spikes_time{iTrial}];               % Concatenate spikes of all trials             
end

ax                  = subplot(2,1,2);
nbins               = 25;
h                   = histogram(all,nbins);
h.FaceColor         = 'k';

mVal                = max(h.Values)+round(max(h.Values)*.1);
ax.XLim             = [-.05 .2];
ax.YLim             = [0 mVal];
ax.XTick            = [0 .2];
ax.XLabel.String  	= 'Time [s]';
ax.YLabel.String  	= 'Spikes/Bin';

slength             = 250;                                  % Length of signal trace [ms]
bdur                = slength/nbins;                        % Bin duration in [ms]
nobins              = 1000/bdur;                            % No of bins/sec
for iLab = 1:length(ax.YTickLabel)
    lab             = str2num(ax.YTickLabel{iLab});
    conv            = (lab / length(spikes_time)) * nobins; 	% Convert to [Hz]: avg spike count * bins/sec
    newlabel{iLab}  = num2str(round(conv));                 % Change YLabel
end
ax.YTickLabel       = newlabel;
ax.YLabel.String  	= 'Firing Rate [Hz]';
hold on
line([0,0], ylim(), 'LineWidth', 2, 'Color', 'r');

