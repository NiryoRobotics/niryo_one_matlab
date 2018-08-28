%get_trajectories.m
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



function [theor_time,thero_y,real_time,real_y,diff_y,imported_data]=get_trajectories(thero_trajectory,real_trajectory,diff_trajectory,imported_data,time,jointStateMsg,thero_trajectory_data)
    try 
        if imported_data==1
            theor_time=thero_trajectory(1,:);
            thero_y=thero_trajectory(2:7,:);
            real_time= real_trajectory(1,:);
            real_y=real_trajectory(2:7,:);
            diff_y=diff_trajectory(2:7,:);
        
        else
            real_time=time;
            diff_y=calcul_diff(thero_trajectory_data,jointStateMsg,time);
            real_y=[jointStateMsg.Position];
            array_time=[thero_trajectory_data.Goal.Trajectory.Points(:,1).TimeFromStart];
            theor_time=[array_time.Nsec]/10^9+[array_time.Sec];
            thero_y=[thero_trajectory_data.Goal.Trajectory.Points(:,1).Positions];
        end 
    imported_data=0;
    catch 
        disp('error, there is no data ') 
        
    end 