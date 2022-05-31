function data = mdf_v2_1(subject,trial)
    db = 'P:\DB\MDF\cat\bladder';
    % subject = input('subject: ');
    % trial = input('trial: ');
    nerve_select = menu('Select nerve','Sciatic Distal', 'Pelv', 'Deep Per', ' Caud Rect', ' Pudendal', ' Sci Prox', 'Sens Branch', 'SELECT ALL');
    nrv_lst = {'Sciatic_Distal', 'Pelv', 'Deep_Per', 'Caud_Rect', 'Pudendal', 'Sci_Prox', 'Sens_Branch', 'SELECT ALL'};
    nerve = nrv_lst{nerve_select};
    if nerve_select ~= length(nrv_lst)
        data = load([db,'\',subject,'\engData\Trial_',trial,'_',nerve,'.data.mat']);
    else
        w1 = figure('Name', 'Waveform 1');
        for i = 1:(length(nrv_lst)-1)
            nerve = nrv_lst{i};
            nrv_title = replace(nerve, '_', ' ');
            try
                data = load([db,'\',subject,'\engData\Trial_',trial,'_',nerve,'.data.mat']);
                figure(w1)
                subplot(4,2,i)
                plot(data.time,(data.wf(1,:)-data.wf(2,:)))
                title(nrv_title)
                legend('wf 1')
                xlabel('time')
            catch
                disp([nerve, ' nerve Data not available'])
            end
        end
    end
    disp(data)
    choice = input('exit [0], plot [1], load new [2]:  ');
    while choice ~= 0 && choice ~= 1 && choice ~= 2
        choice = input('exit [e], plot [p], load new [n]:  ');
    end
    if choice == 0
        disp('data loaded')
    elseif choice == 1
        figure
        plot(data.time,(data.wf(1,:)-data.wf(2,:)))
    elseif choice == 2
        disp('error: function not available yet')
    end