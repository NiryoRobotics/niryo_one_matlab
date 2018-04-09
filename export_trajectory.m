%export_trajectory.m
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

% this function export trejectories data in a text file and an excel file 

function export_trajectory(time,jointStateMsg,data,joint_position)
    [fullFileName]=save_folder();
    fileId=fopen(fullFileName,'w');
    excel_file_name=strrep(fullFileName,'.txt','.xls')
    time=time';
     fprintf(fileId,'%s\r\n','----------------------real trajectory--------------------------------');
    fprintf(fileId,'%s\r\n','----------------------------------------------------------------------') ;  
    M=['temps',' joint 1',' joint 2 ',' joint 3',' joint 4',' joint 5 ',' joint 6'];
    JointStatePosition=[jointStateMsg.Position];
    j1=(JointStatePosition(1,:))'
    j2=(JointStatePosition(2,:))';
    j3=(JointStatePosition(3,:))';
    j4=(JointStatePosition(4,:))';
    j5=(JointStatePosition(5,:))';
    j6=(JointStatePosition(6,:))';
    R=[time,j1,j2,j3,j4,j5,j6];

    % fprintf(fileId2,'%5.5f %5.5f %5.5f %5.5f %5.5f %5.5f \r\n',R);
    fprintf(fileId,'%5s %5s %5s,%5s %5s %5s %5s\r\n',M); 
    fprintf(fileId,'\r\n');
    fprintf(fileId,'%s\r\n','--------------------------------------------------------------------------------------');
    fprintf(fileId,'\n');
    for ii=1:size(R,1)
        fprintf(fileId,'%5.5f %5.5f %5.5f %5.5f %5.5f %5.5f %5.5f\r\n',R(ii,:));
    end 
    fprintf(fileId,'%s\r\n','--------------------------------------------------------------------------------------');
    array_time=[data.Goal.Trajectory.Points(:,1).TimeFromStart];
    x=[array_time.Nsec]/10^9+[array_time.Sec];   
    temps=x';
    fprintf(fileId,'%s\r\n','---------------------------------------theoretical trajectory-------------------------');
    fprintf(fileId,'%s\r\n','--------------------------------------------------------------------------------------');
    joint1=(joint_position(1,:))';
    joint2=(joint_position(2,:))';
    joint3=(joint_position(3,:))';
    joint4=(joint_position(4,:))';
    joint5=(joint_position(5,:))';
    joint6=(joint_position(6,:))';
    Mo=['temps',' joint 1',' joint 2 ',' joint 3',' joint 4',' joint 5 ',' joint 6'];
    T=[temps,joint1,joint2,joint3 ,joint4, joint5 ,joint6];
    %fprintf(fileId,'temps \t  joint 1 \t joint 2  \t  joint 3  \t  joint 4 \t  joint 5 \t  joint 6 \n')
    %fprintf(fileId,'%2.4f\t %2.4f \t %2.4f\t %2.4f\t %2.4f\t %2.4f\n',T)  
    fprintf(fileId,'%5s %5s %5s,%5s %5s %5s %5s\r\n',Mo); 
    fprintf(fileId,'\r\n');
    fprintf(fileId,'%s\r\n','---------------------------------------------------------------------------------------');
    fprintf(fileId,'\n');
    for ii=1:size(T,1)
     fprintf(fileId,'%5.5f %5.5f %5.5f %5.5f %5.5f %5.5f %5.5f\r\n',T(ii,:));
    end 
    array_time=[data.Goal.Trajectory.Points(:,1).TimeFromStart];
    x=[array_time.Nsec]/10^9+[array_time.Sec]  
    temps=x';
    diff=calcul_diff(data,jointStateMsg,time') ;
    fprintf(fileId,'%s\r\n','----------------------------------------------------------------------------------------------------------------');
    fprintf(fileId,'%s\r\n','-------------------------------difference between real and theorical trajectory---------------------------------');
    fprintf(fileId,'%s\r\n','----------------------------------------------------------------------------------------------------------------');
    joint1=(diff(1,:))';
    joint2=(diff(2,:))';
    joint3=(diff(3,:))';
    joint4=(diff(4,:))';
    joint5=(diff(5,:))';
    joint6=(diff(6,:))';
    M3=['temps',' joint 1',' joint 2 ',' joint 3',' joint 4',' joint 5 ',' joint 6'];
    Z=[temps,joint1,joint2,joint3 ,joint4, joint5 ,joint6];
    fprintf(fileId,'%5s %5s %5s,%5s %5s %5s %5s\r\n',M3); 
    fprintf(fileId,'\r\n');
    fprintf(fileId,'%s\r\n','-----------------------------------------------------------------------------------------------------------------');
    fprintf(fileId,'\n');
    for ii=1:size(Z,1)
        fprintf(fileId,'%5.5f %5.5f %5.5f %5.5f %5.5f %5.5f %5.5f\r\n',Z(ii,:));
    end 
    teor_excel=[time';j1';j2';j3';j4';j5';j6'];
    real_excel=[x;(joint_position(1,:));(joint_position(2,:));(joint_position(3,:));(joint_position(4,:));(joint_position(5,:));(joint_position(6,:))];
    diff_excel=[x;diff(1,:);(diff(2,:));(diff(3,:));(diff(4,:));(diff(5,:));(diff(6,:))];
    xlswrite(excel_file_name,teor_excel,'Sheet1','A1');
    xlswrite(excel_file_name,real_excel,'Sheet1','A8');
    xlswrite(excel_file_name,diff_excel,'Sheet1','A15');
    
    fclose(fileId); 
    
    % this function open a window to select teh folder location and the
    % file name 
function [fullFileName]=save_folder()
startingFolder = userpath % Or "pwd" or wherever you want.
defaultFileName = fullfile(startingFolder, '*.txt');
[baseFileName, folder] = uiputfile(defaultFileName, 'Specify a file');
if baseFileName == 0
	% User clicked the Cancel button.
	return;
end
fullFileName = fullfile(folder, baseFileName);
    