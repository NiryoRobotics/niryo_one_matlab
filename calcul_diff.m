% calcul_diff.m
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


% this function calculate difference between planned and executed trajectory 



function [diff]=calcul_diff(thero_trajectory_data,jointStateMsg,time)
    try 
        array_time=[thero_trajectory_data.Goal.Trajectory.Points(:,1).TimeFromStart];
        time_theor=[array_time.Nsec]/10^9+[array_time.Sec];
        A=[thero_trajectory_data.Goal.Trajectory.Points(:,1).Positions];
        B=[jointStateMsg(1,:).Position];
        k=size(time);
        m=size(time_theor);
        if k(2)>m(2) 
            l=m(2);
        else 
            l=k(2);
        end 
        for i=1:6
            for j=1:l
                X = interp1(time,B(i,:),time_theor(j));
                diff(i,j)=(A(i,j)-X);
            end
        end
    catch 
        disp('error while calculating diff')
    end 
        