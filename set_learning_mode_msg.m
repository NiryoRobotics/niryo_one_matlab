%set_learning_mode_msg.m
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


function set_learning_mode_msg(learning_mode_client,learning_mode_req,value,logs,handles) 
    learning_mode_req.Value=value;
    learning_mode_resp = call(learning_mode_client,learning_mode_req,'Timeout',3);
    disp(learning_mode_resp.Message);
    logs=logs+ newline+ learning_mode_resp.Message;
    set(handles.edit56,'string',learning_mode_resp.Message,'visible','on');
    pause(1)