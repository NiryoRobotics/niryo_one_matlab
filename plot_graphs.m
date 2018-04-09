% plot_graph.m
%  Copyright (C) 2018 Niryo
%  All rights reserved.
% 
%  This program is free software: you can redistribute it and/or modify
%  it under the terms of the GNU General Public License as published by
%  the Free Software Foundation, either version 3 of the License, or
%  (at your option) any later version.
% 
%  This program is distributed in the hope that it will be useful,
%  but WITHOUT ANY WARRANTY; without even the implied warranty of
%  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%  GNU General Public License for more details.
% 
%  You should have received a copy of the GNU General Public License
%  along with this program.  If not, see <http://www.gnu.org/licenses/>.


% plot planned trajectory , executed trajectory and the difference 

function plot_graphs(handles,real_time,theor_time,diff_trajectory,thero_trajectory,realtrajectory,i,ymin,ymax)
   
    try
        axes(handles.axestheorique);
        plot(theor_time,thero_trajectory(i,:),'b',real_time,realtrajectory(i,:),'--r');
        xlabel('time');
        ylabel('trajectory');
        legend('theorical','real');
        limits=[ymin,ymax];
        ylim(limits);
        grid on 
        if (get(handles.checkbox1, 'Value')==1)
            diff_trajectory=abs(diff_trajectory);
        end

        axes(handles.axesdiff);
        diff_trajectory(i,:)=round(diff_trajectory(i,:),2);
        plot(theor_time,diff_trajectory(i,:),'g');
        line(get(gca,'XLim'), [0 0], 'Color', 'k', 'LineStyle', '--');
         grid on 
        legend('difference');
    catch e
        disp("error try again ") 
        return; 
    end
