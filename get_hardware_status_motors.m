%get_hardware_status_motors.m
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





 
function get_hardware_status_motors(handles,hw_status_msg)
    get_motors_temperatures(handles,hw_status_msg); 
    get_motors_voltages(handles,hw_status_msg);
    get_motors_names(handles,hw_status_msg);
    
    
% get Motors Temperatures to dispay it in hardawre panel
function  get_motors_temperatures(handles,hw_status_msg)
    sz=size(hw_status_msg.Temperatures);
    Temperatures= "";
    i=1;
    while (i<sz(1)) 
        T=num2str(hw_status_msg.Temperatures(i));
        Temperatures=  Temperatures+ newline + T;
        i=i+1;
    end 
    set(handles.t1,'string',Temperatures);
    
    % get Voltages hardware staute function

function  get_motors_voltages(handles,hw_status_msg)
     sz=size(hw_status_msg.Voltages);
     Voltages= "";
     i=1;
     while (i<sz(1)) 
         v=num2str(hw_status_msg.Voltages(i));
         Voltages=  Voltages+ newline + v;
         i=i+1;
     end 
     set(handles.v1,'string',Voltages);
     
     
     % get Motors names to display its in hardware panel 

function  get_motors_names(handles,hw_status_msg)
    sz=size(hw_status_msg.MotorNames);
    Motors= "";
    i=1;
    while (i<sz(1)) 
        Name=hw_status_msg.MotorNames{i};
        Motors=  Motors+ newline + Name;
        i=i+1;
    end 
    set(handles.motor1,'string',Motors);