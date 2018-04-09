% import_trajectory.m
%  Copyright (C) 2018 Niryo
%  All rights reserved.
% 
%  This program is distributed in the hope that it will be useful,
%  but WITHOUT ANY WARRANTY; without even the implied warranty of
%  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%  GNU General Public License for more details.
% 
%  You should have received a copy of the GNU General Public License
%  along with this program.  If not, see <http://www.gnu.org/licenses/>.


% this function import difference , planned and executed trajectory
% the file imported is .xls file 


function [thero_trajectory,real_trajectory,diff_trajectory]=import_trajectory()
    [fullFileName]=open_folder();
    Trajectories=xlsread(fullFileName);
    thero_trajectory=Trajectories(1:7,:);
    real_trajectory=Trajectories(8:14,:);
    diff_trajectory=Trajectories(15:21,:);
    
    
function [fullFileName]=open_folder()
    startingFolder = userpath % Or "pwd" or wherever you want.
    defaultFileName = fullfile(startingFolder, '*.xls');
    [baseFileName, folder] = uigetfile(defaultFileName, 'Specify a file');
    if baseFileName == 0
        % User clicked the Cancel button.
        return;
    end
    fullFileName = fullfile(folder, baseFileName);