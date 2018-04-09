%validate_joints.m
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

% this function test if joints puted by the user are in rangs % 


function [validation,joint]=validate_joints(handles,Learning_mode_state,logs) 
    
    % read joints value form text box 
    joint(1)=str2double(get(handles.joint1,'String'));
    joint(2)=str2double(get(handles.joint2,'String'));
    joint(3)=str2double(get(handles.joint3,'String'));
    joint(4)=str2double(get(handles.joint4,'String'));
    joint(5)=str2double(get(handles.joint5,'String'));
    joint(6)=str2double(get(handles.joint6,'String'));
    joint_max=[3.054,0.628319,0.994838,2.61799,2.26893,2.57]
    joint_min=[-3.054,-1.5707,-1.4101,-2.61799,-2.26893,-2.57]
    validation=0;
    Learning_mode_state_msg=receive( Learning_mode_state); 
    if (Learning_mode_state_msg.Data==1)
        set(handles.edit56,'string','you need to desactivate Learning Mode','visible','on','BackgroundColor','red','ForegroundColor','white');
        pause(1);
        set(handles.edit56,'visible','off','BackgroundColor','green','ForegroundColor','white');
         set(handles.moveButton,'string','Move Joints','BackgroundColor','white','ForegroundColor',[0.1,0.67,0.89]);
         return ; 
    elseif (joint(1)>joint_max(1))||(joint(1)<joint_min(1))
        set(handles.joint1,'string',0); 
        set(handles.edit56,'string','joint 1 not in range(-3.054,3.054)','visible','on','BackgroundColor','red','ForegroundColor','white');
        pause(1);
        set(handles.edit56,'visible','off','BackgroundColor','green','ForegroundColor','white');
         set(handles.moveButton,'string','Move Joints','BackgroundColor','white','ForegroundColor',[0.1,0.67,0.89]);
         return;
    elseif(joint(2)>joint_max(2))||(joint(2)<joint_min(1))
        set(handles.joint2,'string',0); 
        set(handles.edit56,'string','joint 2 not in range(-1.5707,0.628319)','visible','on','BackgroundColor','red','ForegroundColor','white');
        pause(1);
        set(handles.edit56,'visible','off','BackgroundColor','green','ForegroundColor','white');
         set(handles.moveButton,'string','Move Joints','BackgroundColor','white','ForegroundColor',[0.1,0.67,0.89]);
         return;
    elseif (joint(3)>joint_max(3))||(joint(3)<joint_min(3))
        set(handles.joint3,'string',0); 
        set(handles.edit56,'string','joint 3 not in range(-1.4101,0.994838)','visible','on','BackgroundColor','red','ForegroundColor','white');
        pause(1);
        set(handles.edit56,'visible','off','BackgroundColor','green','ForegroundColor','white');
         set(handles.moveButton,'string','Move Joints','BackgroundColor','white','ForegroundColor',[0.1,0.67,0.89])
         return;

    elseif(joint(4)>joint_max(4))||(joint(4)<joint_min(4))
        set(handles.joint4,'string',0); 
        set(handles.edit56,'string','joint 4not in range(-2.61799,2.61799)','visible','on','BackgroundColor','red','ForegroundColor','white');
        pause(0.5);
        set(handles.edit56,'visible','off','BackgroundColor','green','ForegroundColor','white');
         set(handles.moveButton,'string','Move Joints','BackgroundColor','white','ForegroundColor',[0.1,0.67,0.89]);
         return;


    elseif(joint(5)>joint_max(5))||(joint(5)<joint_min(5))
        set(handles.joint5,'string',0); 
        set(handles.edit56,'string','joint 5 not in range(-2.26893,2.26893)','visible','on','BackgroundColor','red','ForegroundColor','white');
        pause(0.5);
        set(handles.edit56,'visible','off','BackgroundColor','green','ForegroundColor','white');
         set(handles.moveButton,'string','Move Joints','BackgroundColor','white','ForegroundColor',[0.1,0.67,0.89]);
         return;


    elseif (joint(6)>joint_max(6))||(joint(6)<joint_min(6))
        set(handles.joint6,'string',0); 
        set(handles.edit56,'string','joint 6 not in range(-2.57,2.57)','visible','on','BackgroundColor','red','ForegroundColor','white')
        pause(0.5);
        set(handles.edit56,'visible','off','BackgroundColor','green','ForegroundColor','white');
         set(handles.moveButton,'string','Move Joints','BackgroundColor','white','ForegroundColor',[0.1,0.67,0.89]);
       return;
    else disp("joints in range") ;
      logs=logs+newline+"Joints in range";
     validation=1; 
    end