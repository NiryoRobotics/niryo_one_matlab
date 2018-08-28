
                                                                    %/////////////////////////////////////%
                                                                    %  @project MATLAB-ROS Interface      %
                                                                    %  @Niryo One          %
                                                                    %  @filename Matlab_Gui  %
                                                                    %/////////////////////////////////////%

% Matlab_Gui.m
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

% this fucntion is created by guide matlab % 
function varargout = Matlab_Gui(varargin)
 % MATLAB_GUI MATLAB code for Matlab_Gui.fig
%      MATLAB_GUI, by itself, creates a new MATLAB_GUI or raises the existing
%      singleton*.
%
%      H = MATLAB_GUI returns the handle to a new MATLAB_GUI or the handle to
%      the existing singleton*.
%
%      MATLAB_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MATLAB_GUI.M with the given input arguments.
%
%      MATLAB_GUI('Property','Value',...) creates a new MATLAB_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Matlab_Gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Matlab_Gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Matlab_Gui

% Last Modified by GUIDE v2.5 03-May-2018 14:15:39

% Begin initialization code - DO NOT EDIT

    gui_Singleton = 1;
     
    gui_State = struct('gui_Name',       mfilename, ...
                       'gui_Singleton',  gui_Singleton, ...
                       'gui_OpeningFcn', @Matlab_Gui_OpeningFcn, ...
                       'gui_OutputFcn',  @Matlab_Gui_OutputFcn, ...
                       'gui_LayoutFcn',  [] , ...
                       'gui_Callback',   []);
    
                   if nargin && ischar(varargin{1})
        gui_State.gui_Callback = str2func(varargin{1});
    end

    if nargout
        [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
    else
        gui_mainfcn(gui_State, varargin{:});
    end
% End initialization code - DO NOT EDIT


% --- Executes just before Matlab_Gui is made visible.
function Matlab_Gui_OpeningFcn(hObject,eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Matlab_Gui (see VARARGIN)

% Choose default command line output for Matlab_Gui
    global new_data_trajectory_received;
    
    new_data_trajectory_received=0;
    rosshutdown; % shutdown any ros node 
    connexion_state =0; % indicate if the robot si connected
    handles.connexion_state=connexion_state;
    guidata(hObject,handles);
    handles.output = hObject;
    handles.output = hObject;
    axes(handles.axes1);
    imshow('images/logo.png');
    axes(handles.axes2);
    imshow('images/Matlab_Logo.png');
    % Update handles structure
    guidata(hObject, handles);
    set(handles.connect,'string','Connect to Niryo One')
    set(handles.connectionButton,'BackgroundColor',[0.1,0.67,0.89],'ForegroundColor','white')
    set(handles.plotButton,'BackgroundColor','white','ForegroundColor',[0.1,0.67,0.89])
    set(handles. logsButton,'BackgroundColor','white','ForegroundColor',[0.1,0.67,0.89])
    set(handles.hwButton,'BackgroundColor','white','ForegroundColor',[0.1,0.67,0.89])
    set(handles.commandButton,'BackgroundColor','white','ForegroundColor',[0.1,0.67,0.89])
    set(handles.connectionPanel,'visible','on')
    set(handles.commandPanel,'visible','off')
    set(handles.hwPanel,'visible','off')
    set(handles.logsPanel,'visible','off')
    set(handles.plotPanel,'visible','off')
 
% UIWAIT makes Matlab_Gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);
% --- Outputs from this function are returned to the command line.
function varargout = Matlab_Gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
 

% --- Executes on button press in connectionButton.
function connectionButton_Callback(~, ~, handles)
    set(handles.connectionPanel,'visible','on')
    set(handles.commandPanel,'visible','off')
    set(handles.hwPanel,'visible','off')
    set(handles.logsPanel,'visible','off')
    set(handles.plotPanel,'visible','off')
    set(handles.connectionButton,'BackgroundColor',[0.1,0.67,0.89],'ForegroundColor','white')
    set(handles.commandButton,'BackgroundColor','white','ForegroundColor',[0.1,0.67,0.89])
    set(handles.plotButton,'BackgroundColor','white','ForegroundColor',[0.1,0.67,0.89])
    set(handles. logsButton,'BackgroundColor','white','ForegroundColor',[0.1,0.67,0.89])
    set(handles.hwButton,'BackgroundColor','white','ForegroundColor',[0.1,0.67,0.89])


% --- Executes on button press in commandButton.
function commandButton_Callback(hObject, ~, handles) 
% hObject    handle to commandButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    set(handles.connectionPanel,'visible','off');
    set(handles.commandPanel,'visible','on');
    set(handles.hwPanel,'visible','off');
    set(handles.logsPanel,'visible','off');
    set(handles.plotPanel,'visible','off');
    set(handles.edit56,'visible','off');
    set(handles.commandButton,'BackgroundColor',[0.1,0.67,0.89],'ForegroundColor','white');
    set(handles.connectionButton,'BackgroundColor','white','ForegroundColor',[0.1,0.67,0.89]);
    set(handles.plotButton,'BackgroundColor','white','ForegroundColor',[0.1,0.67,0.89]);
    set(handles. logsButton,'BackgroundColor','white','ForegroundColor',[0.1,0.67,0.89]);
    set(handles.hwButton,'BackgroundColor','white','ForegroundColor',[0.1,0.67,0.89]);
   if handles.connexion_state ==0
       return; 
   end 
  hw_status_msg=receive(handles.hw_status,10);% receive hardware status msg 
    if (hw_status_msg.CalibrationNeeded==0) && (hw_status_msg.CalibrationInProgress==false) % get calibrationNeeded flag 
       set(handles.motorbutton,'visible','off');
       set(handles.newCalibrationButton,'visible','on');
    elseif (hw_status_msg.CalibrationInProgress==true)
        set(handles.motorbutton,'visible','off');
       set(handles.newCalibrationButton,'visible','off');
    elseif (hw_status_msg.CalibrationNeeded==1)&& (hw_status_msg.CalibrationInProgress==false)
        set(handles.motorbutton,'visible','on');
        set(handles.newCalibrationButton,'visible','off');
    end 


% --- Executes on button press in plotButton.
function plotButton_Callback(~, eventdata, handles)

% hObject    handle to plotButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    set(handles.connectionPanel,'visible','off');
    set(handles.commandPanel,'visible','off');
    set(handles.hwPanel,'visible','on');
    set(handles.logsPanel,'visible','off');
    set(handles.plotPanel,'visible','on');
    set(handles.edit55,'visible','off');
    set(handles.plotButton,'BackgroundColor',[0.1,0.67,0.89],'ForegroundColor','white');
    set(handles.connectionButton,'BackgroundColor','white','ForegroundColor',[0.1,0.67,0.89]);
    set(handles.commandButton,'BackgroundColor','white','ForegroundColor',[0.1,0.67,0.89]);
    set(handles. logsButton,'BackgroundColor','white','ForegroundColor',[0.1,0.67,0.89]);
    set(handles.hwButton,'BackgroundColor','white','ForegroundColor',[0.1,0.67,0.89]);


% --- Executes on button press in logsButton.
function logsButton_Callback(hObject, ~, handles)
% hObject    handle to logsButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global logs 
    set(handles.connectionPanel,'visible','off')
    set(handles.commandPanel,'visible','off')
    set(handles.hwPanel,'visible','off')
    set(handles.logsPanel,'visible','on')
    set(handles.plotPanel,'visible','off')
    set(handles.logsButton,'BackgroundColor',[0.1,0.67,0.89],'ForegroundColor','white')
    set(handles.connectionButton,'BackgroundColor','white','ForegroundColor',[0.1,0.67,0.89])
    set(handles.commandButton,'BackgroundColor','white','ForegroundColor',[0.1,0.67,0.89])
    set(handles.plotButton,'BackgroundColor','white','ForegroundColor',[0.1,0.67,0.89])
    set(handles.hwButton,'BackgroundColor','white','ForegroundColor',[0.1,0.67,0.89])
    set(handles.editlogs,'string',logs)% dispay application logs 


% --- Executes on button press in hwButton.
function hwButton_Callback(hObject, eventdata, handles)
    %global hw_status;
    global logs;
    % test if the robot is connected 
    if handles.connexion_state==0
      logs=logs+newline+"you should connect to you robot first"; 
       guidata(hObject,handles);
       return;
    end
    % hObject    handle to hwButton (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    set(handles.connectionPanel,'visible','off');
    set(handles.commandPanel,'visible','off');
    set(handles.hwPanel,'visible','on');
    set(handles.logsPanel,'visible','off');
    set(handles.plotPanel,'visible','off');
    set(handles.hwButton,'BackgroundColor',[0.1,0.67,0.89],'ForegroundColor','white');
    set(handles.connectionButton,'BackgroundColor','white','ForegroundColor',[0.1,0.67,0.89]);
    set(handles.commandButton,'BackgroundColor','white','ForegroundColor',[0.1,0.67,0.89]);
    set(handles.plotButton,'BackgroundColor','white','ForegroundColor',[0.1,0.67,0.89]);
    set(handles.logsButton,'BackgroundColor','white','ForegroundColor',[0.1,0.67,0.89]);
    hw_status_msg=receive(handles.hw_status,10); 
   logs=logs+ newline+ "Get hardware status";
    set(handles.edit21,'string', hw_status_msg.RpiTemperature);
    set(handles.edit22,'string', hw_status_msg.CalibrationNeeded);
    set(handles.version,'string', 'V'+string(hw_status_msg.HardwareVersion));
    % set(handles.edit20,'string', hw_status_msg.CalibrationInProgress);
    get_hardware_status_motors(handles,hw_status_msg);
    guidata(hObject,handles);


% button connect to niryo one % 
% this function callback set matlab environemment , start a matlab node and
% connect to master ( robot)% 
% create subscribers, publishers and services for the application % 


% --- Executes on button press in connect
function connect_Callback(hObject, eventdata, handles)
    global logs; 
    global new_data_trajectory_received;
    
    new_data_trajectory_received=0;
    
    set(handles.moveButton,'string','2.Move Joints','BackgroundColor','white','ForegroundColor',[0.1,0.67,0.89]);
    set(handles.disconnect,'string','Disconnect from Niryo One');
    logs='';
    set(handles.connect,'BackgroundColor',[0.1,0.67,0.89],'ForegroundColor','white');
    if (handles.connexion_state == 0)
        Robot_ip_adress = get(handles.edit1,'String'); % get robot ip adress 
        Robot_ip_adress = strcat('http://',Robot_ip_adress,':11311');
        Computer_ip_adress = get(handles.edit2,'String');% get computer ip adress
        setenv('ROS_MASTER_URI',Robot_ip_adress); % set  ros matser URI to specifie the ros master location 
        setenv('ROS_IP',Computer_ip_adress); % set environment variables ROS_IP( network address of a ROS Node ), It's must be ip adress of the pc where matlab is installed 
    try
        rosinit; % initialize ROS
    catch e
        logs= e.message;
         set(handles.connect,'BackgroundColor','red','ForegroundColor','white');
         pause(0.75);
         set(handles.connect,'BackgroundColor','white','ForegroundColor',[0.1,0.67,0.89]);
        return; 
    end 
        set(handles.connect,'string','Connecting....... ','BackgroundColor',[0.1,0.67,0.89],'ForegroundColor','white');
        %pause(2);
        logs="connected to niryo one";
        % hardware status
            try 
                hw_status=rossubscriber('/niryo_one/hardware_status'); %create a subscriber for  hardware statuts topic
                handles.hw_status=hw_status;
                hw_status_msg=receive(handles.hw_status,10);
                handles.Hardware_version = hw_status_msg.HardwareVersion
            catch e 
                logs= e.message;
                rosshutdown;
                return; 
            end 
           
        % learning mode 
        handles.learning_mode_client=rossvcclient('/niryo_one/activate_learning_mode');% create a ros service client for activate learning mode 
        handles.learning_mode_req = rosmessage(handles.learning_mode_client); % create message for  learning_mode_client
        disp('..............learning mode .......');
        handles.Learning_mode_state=rossubscriber('/niryo_one/learning_mode'); 
        logs=logs+ newline+  " Connect to Learning Mode service ";
       
        % request new calibartion  
        handles.new_calibration=rossvcclient('/niryo_one/request_new_calibration');
        handles.new_calibration_msg= rosmessage(handles.new_calibration);
        disp('..............create request new calibration message .......');
        logs=logs +newline +"create request new calibration message .";
  
        % calibrate motors%
        handles.calibrate_motors_client=rossvcclient('/niryo_one/calibrate_motors');
        handles.calibrate_motors_msg=rosmessage(handles.calibrate_motors_client);
        disp('create calibrate maoters message');
        logs=logs +newline +'create calibrate motors message ';
        
       % get trajectory  
       handles.theor_trajectory_sub=rossubscriber('/niryo_one_follow_joint_trajectory_controller/follow_joint_trajectory/goal') ;
       
       handles.jointState=rossubscriber('/joint_states','BufferSize',40);
   
       % Matlab node subscirbers and publisher
       handles.move_joint_sub=rossubscriber('/niryo_one_matlab/result') ;
       handles.move_joint_pub=rospublisher('/niryo_one_matlab/command');
       handles.move_joint_msg=rosmessage(handles.move_joint_pub);
       
       % button set 
       set(handles.connect,'string','connected ','BackgroundColor','white','ForegroundColor',[0.1,0.67,0.89]);
      handles.connexion_state=1; 
      guidata(hObject, handles);
    else 
        logs=logs+ newline+ "you are already connected to your robot.";
         disp('.............you are already connected to your robot ...................');

    end 


% --- Executes on button press in disconnect.
function disconnect_Callback(hObject,~, handles)
    global logs; 

    set(handles.disconnect,'BackgroundColor',[0.1,0.67,0.89],'ForegroundColor','white');
    if (handles.connexion_state==1)
        rosshutdown;
       handles.connexion_state =0;
        logs=logs+ newline + "disconnect form niryo one";
        set(handles.connect,'string','Connect to Niryo One ');
        set(handles.disconnect,'string','disconnected','BackgroundColor','white','ForegroundColor',[0.1,0.67,0.89]);
    else
        logs=logs+ newline + "you are already disconnect form niryo one";
        set(handles.disconnect,'string','disconnected','BackgroundColor','white','ForegroundColor',[0.1,0.67,0.89]);
        set(handles.connect,'string','Connect to Niryo One ');

    end 
     guidata(hObject, handles);


    % --- Executes on button press in moveButton.
function moveButton_Callback(hObject, eventdata, handles)
   global logs; 

   if (handles.connexion_state==0)
       logs=logs+newline+"you should connect to you robot first"; 
        return; 
   end
    set(handles.moveButton,'BackgroundColor',[0.1,0.67,0.89],'ForegroundColor','white');
   [validation,joint]=validate_joints(handles,handles.Learning_mode_state,logs,handles.Hardware_version) ;
    if validation==0
        return ; 
    end
    handles.move_joint_msg.CmdType=1; 
    handles.move_joint_msg.Joints=joint;
    
    send(handles.move_joint_pub,handles.move_joint_msg);
    set(handles.moveButton,'string','Moving.....','BackgroundColor',[0.1,0.67,0.89],'ForegroundColor','white');
    logs=logs+newline+"move jonit";
     set(handles.moveButton,'string','2.Move Joints','BackgroundColor','white','ForegroundColor',[0.1,0.67,0.89]);

      
         % --- Executes on button press in learningModeButton.
function learningModeButton_Callback(hObject, eventdata, handles)
    global logs; 
    if (handles.connexion_state==0)
        logs=logs+newline+"you should connect to you robot first" ;
        return; 
    end 
        Learning_mode_state_msg=receive(handles.Learning_mode_state);
        set(handles.learningModeButton,'BackgroundColor',[0.1,0.67,0.89],'ForegroundColor','white');
    if (Learning_mode_state_msg.Data==1)
          set_learning_mode_msg(handles.learning_mode_client,handles.learning_mode_req,0,logs,handles) ;     
    else 
       set_learning_mode_msg(handles.learning_mode_client,handles.learning_mode_req,1,logs,handles) ;   
    end
    set(handles.learningModeButton,'BackgroundColor','white','ForegroundColor',[0.1,0.67,0.89]);
    set(handles.edit56,'visible','off');
    

    % --- Executes on button press in motorbutton.
function motorbutton_Callback(~, ~, handles)
        global logs; 
        if handles.connexion_state==0
           logs=logs+newline+"you should connect to you robot first" ;
           return; 
        end 

        set(handles.motorbutton,'BackgroundColor',[0.1,0.67,0.89],'ForegroundColor','white');
        % testif the calibrationNeeded is on or off 


        motor_calibration_resp = call(handles.calibrate_motors_client,handles.calibrate_motors_msg); 
        disp( motor_calibration_resp.Message);
        logs=logs+ newline + motor_calibration_resp.Message;
            set(handles.edit56,'string',motor_calibration_resp.Message,'visible','on');
            pause(1)
        set(handles.edit56,'visible','off');
        set(handles.motorbutton,'visible','off');
        set(handles.newCalibrationButton,'visible','off');
        set(handles.motorbutton,'BackgroundColor','white','ForegroundColor',[0.1,0.67,0.89]);
        hw_status_msg=receive(handles.hw_status) ;
        while(hw_status_msg.CalibrationInProgress==true)
            hw_status_msg=receive(handles.hw_status);
        end 
        set(handles.motorbutton,'visible','off');
        set(handles.newCalibrationButton,'visible','on');

   
% --- Executes on button press in newCalibrationButton.
function newCalibrationButton_Callback(hObject, eventdata,handles)
    global logs; 
    if handles.connexion_state==0
       logs=logs+newline+"you should connect to you robot first" ;
       return;
    end 
    set(handles.newCalibrationButton,'BackgroundColor',[0.1,0.67,0.89],'ForegroundColor','white');
    new_calibration_resp = call(handles.new_calibration,handles.new_calibration_msg); 
    disp('.......new calibration requested.........');
    set(handles.edit56,'string',new_calibration_resp.Message,'visible','on');
    pause(0.5);
    set(handles.edit56,'visible','off');
    logs=logs+ newline+new_calibration_resp.Message;
    set(handles.newCalibrationButton,'BackgroundColor','white','ForegroundColor',[0.1,0.67,0.89]);
    
    set(handles.motorbutton,'visible','on');
    set(handles.newCalibrationButton,'visible','off');
 
  % choose joint graph %%%%%%     
function jointGroup_SelectionChangedFcn(hObject, eventdata, handles)
    global thero_trajectory;
    global real_trajectory; 
    global diff_trajectory;
    global imported_data;
    global time; 
    global jointStateMsg; % joint State Message : real trajectory 
    global thero_trajectory_data ; %follow joint trajectory Goal message : thero trajectory 
    global logs;
    if handles.connexion_state==0
        logs=logs+newline+"you should connect to you robot first"; 
    return;
    end 
    try 
        [theor_time,thero_y,real_time,real_y,diff_y,imported_data]=get_trajectories(thero_trajectory,real_trajectory,diff_trajectory,imported_data,time,jointStateMsg,thero_trajectory_data);
        handles.theor_time=theor_time;
        handles.thero_y=thero_y;
        handles.real_time=real_time;
        handles.real_y=real_y;
        handles.diff_y=diff_y;
        switch get(get(handles.jointGroup,'SelectedObject'),'Tag')   % Get Tag of selected object
            case 'radiobutton7'
            %execute this code when fontsize08_radiobutton is selected
                plot_graphs(handles,handles.real_time,handles.theor_time, handles.diff_y,handles.thero_y,handles.real_y,1,-3.1,3.1);
            case 'radiobutton8'
            %joint2
                plot_graphs(handles,real_time,theor_time,diff_y,thero_y,real_y,2,-1.7,1.7);
            case 'radiobutton9'
             %joint3
                plot_graphs(handles,handles.real_time,handles.theor_time,handles.diff_y,handles.thero_y,handles.real_y,3,-1.6,1.1);
            case 'radiobutton10'
                %joint4
                plot_graphs(handles,handles.real_time,handles.theor_time,handles.diff_y,handles.thero_y,handles.real_y,4,-2.8,2.8);
            case 'radiobutton11'
            % joint5
                plot_graphs(handles,handles.real_time,handles.theor_time,handles.diff_y,handles.thero_y,handles.real_y,5,-2.5,2.5);
            case 'radiobutton12'
            %joint6
               plot_graphs(handles,handles.real_time,handles.theor_time,handles.diff_y,handles.thero_y,handles.real_y,6,-2.8,2.8);
            otherwise
        end
    catch 
        disp('error, try to get data first ') 
    end 
       guidata(hObject, handles);
  
% --- Executes on button press in trajectoryButton. 
% on plot Panel 
function trajectoryButton_Callback(hObject, eventdata, handles)
    global new_data_trajectory_received;
    global thero_trajectory_data ; 
    global logs; 
    
    global jointStateMsg;
    global time; 
    if handles.connexion_state==0
       logs=logs+newline+"you should connect to you robot first" ;
       return;
    end 
    set(handles.trajectoryButton,'BackgroundColor',[0.1,0.67,0.89],'ForegroundColor','white');
     thero_trajectory_data=receive(handles.theor_trajectory_sub);
    logs= logs+newline+"get a new trajectory";
    [jointStateMsg,time]=get_joint_state(handles,thero_trajectory_data,handles.jointState);
    logs= logs+newline+"get real trajectory";
    set(handles.trajectoryButton,'BackgroundColor','white','ForegroundColor',[0.1,0.67,0.89]);
    new_data_trajectory_received=1;
    jointGroup_SelectionChangedFcn(hObject, eventdata, handles);


% --- Executes get trajectory 
% On command Panel 
function getTrajectoryButton_Callback(hObject, eventdata, handles)
    global new_data_trajectory_received;
    global thero_trajectory_data ; 
    global logs; 
    global jointStateMsg;
    global time;
    if handles.connexion_state==0
       logs=logs+newline+"you should connect to you robot first" ;
       return;
    end
    set(handles.getTrajectoryButton,'BackgroundColor',[0.1,0.67,0.89],'ForegroundColor','white');
     thero_trajectory_data=receive(handles.theor_trajectory_sub);


    logs= logs+newline+"get theoretical trajectory ";
    [jointStateMsg,time]=get_joint_state(handles,thero_trajectory_data,handles.jointState);
    logs= logs+newline+" get real trajectory ";
    set(handles.getTrajectoryButton,'BackgroundColor','white','ForegroundColor',[0.1,0.67,0.89]);
    new_data_trajectory_received=1;
     plotButton_Callback(hObject, eventdata, handles);
     jointGroup_SelectionChangedFcn(hObject, eventdata, handles);

% --- Executes export data to a file %%%%%%%%%%%%%%%%
function exportbutton_Callback(hObject, eventdata, handles)
% hObject    handle to exportbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global new_data_trajectory_received;
    global joint_position;
    global thero_trajectory_data;
    global logs ; 
    global time;
    global jointStateMsg;
   
    set(handles.exportbutton,'BackgroundColor',[0.1,0.67,0.89],'ForegroundColor','white');
    if(new_data_trajectory_received==0)||(handles.connexion_state==0)
        set(handles.edit55,'string','try to get a new trajectory command ','visible','on');
        pause(1);
        set(handles.edit55,'visible','off') ;
        set(handles.exportbutton,'BackgroundColor','white','ForegroundColor',[0.1,0.67,0.89]);
        return; 
    end
    try 
         joint_position=[thero_trajectory_data.Goal.Trajectory.Points(:,1).Positions];
        export_trajectory(time,jointStateMsg,thero_trajectory_data,joint_position);
    catch e 
        logs= logs+ newline + "you should specify file name , try again";
        set(handles.exportbutton,'BackgroundColor','white','ForegroundColor',[0.1,0.67,0.89]);
        return; 
    end
    logs= logs + newline +"export trajectory " ;
    set(handles.edit55,'string','data exported successfully','visible','on');
    pause(1);
    set(handles.edit55,'visible','off');
    new_data_trajectory_received=0;
    set(handles.exportbutton,'BackgroundColor','white','ForegroundColor',[0.1,0.67,0.89]);

% --- Executes on button press in importButton.
function importButton_Callback(hObject, eventdata, handles)
% hObject    handle to importButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global thero_trajectory;
    global real_trajectory; 
    global diff_trajectory;
    global imported_data;
    try
        set(handles.exportbutton,'BackgroundColor',[0.1,0.67,0.89],'ForegroundColor','white');
        [thero_trajectory,real_trajectory,diff_trajectory]=import_trajectory();
        imported_data=1; 
        set(handles.exportbutton,'BackgroundColor','white','ForegroundColor',[0.1,0.67,0.89]);
        jointGroup_SelectionChangedFcn(hObject, eventdata, handles);
    catch e 
        return; 
    end 

    
    % --- Executes on button press in set_current_button.
function set_current_button_Callback(hObject, eventdata, handles)
    try  
        jointStateMessage=receive(handles.jointState);
        current_position=[jointStateMessage.Position];
        set(handles.joint1,'string',current_position(1,:));
        set(handles.joint2,'string',current_position(2,:));
        set(handles.joint3,'string',current_position(3,:));
        set(handles.joint4,'string',current_position(4,:));
        set(handles.joint5,'string',current_position(5,:));
        set(handles.joint6,'string',current_position(6,:));
    catch e 
        disp("you need to connect to niryo one first ") ;
        return; 
    end 
 
function figurebutton_Callback(~, eventdata, handles)
% hObject    handle to figurebutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 %jointGroup_SelectionChangedFcn(hObject, eventdata, handles)
    try 
        switch get(get(handles.jointGroup,'SelectedObject'),'Tag')   % Get Tag of selected object

        %joint1
            case 'radiobutton7'
                i=1;
                figure('Name','Joint 1 ');
                plot(handles.real_time,handles.real_y(i,:),'b',handles.theor_time,handles.thero_y(i,:),'--r');
                xlabel('time');
                ylabel('trajectory');
                legend('theorical','real');
                grid on ;
               title('joint1 trajectory');
              %joint2
            case 'radiobutton8'
                i=2;
                 figure('Name','Joint 2  ');
                plot(handles.real_time,handles.real_y(i,:),'b',handles.theor_time,handles.thero_y(i,:),'--r');
                xlabel('time');
                ylabel('trajectory');
                legend('theorical','real');
                grid on 
                title('joint 2 trajectory')
        %joint3    
            case 'radiobutton9'
                i=3;
               figure('Name','Joint 3 ');
                plot(handles.real_time,handles.real_y(i,:),'b',handles.theor_time,handles.thero_y(i,:),'--r');
                xlabel('time');
                ylabel('trajectory');
                legend('theorical','real');
                grid on ;
                title('joint 4 trajectory');
                %joint4
            case 'radiobutton10'
                i=4;
               figure('Name','Joint 4 ');
              plot(handles.real_time,handles.real_y(i,:),'b',handles.theor_time,handles.thero_y(i,:),'--r');
              xlabel('time');
              ylabel('trajectory');
              legend('theorical','real');
              grid on ;
              title('joint 4 trajectory');
            case 'radiobutton11'
              % joint5
              i=5;

              figure('Name','Joint 5');
              plot(handles.real_time,handles.real_y(i,:),'b',handles.theor_time,handles.thero_y(i,:),'--r');
              xlabel('time');
              ylabel('trajectory');
              legend('theorical','real');
              grid on ;
              title('joint 5 trajectory');
                  %joint6
            case 'radiobutton12'
                i=6;
                 figure('Name','Joint 6 ');
                plot(handles.real_time,handles.real_y(i,:),'b',handles.theor_time,handles.thero_y(i,:),'--r');
                xlabel('time');
                ylabel('trajectory');
                legend('theorical','real');
                grid on ;
                title('joint 6 trajectory');
            otherwise
        end
    catch 
        disp("there is no data to plot");
    end
% % --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
 
    jointGroup_SelectionChangedFcn(hObject, eventdata, handles);


