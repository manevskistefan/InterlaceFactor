function [ Data ] = AppendClusterLabels( Data, k )


    Data2 = Data(:,2:end);
    labels = kmeans(Data2, k);
    Data = [Data labels];
    
	% Dodavanje na nov atribut - klasterot vo kojsto pripagja dadenata instanca
    fid = fopen('complete_set_cluster_labels.csv', 'wt');
    fprintf(fid, 'ImageID,Rows,Columns,NumberOfOnes,BrHorizontalniPromeni,AvgHorizontalnaPromena,BrVertikalniPromeni,AvgVertikalnaPromena,Cluster\n');
    for i=1:size(Data,1)
       fprintf(fid,'%d,%d,%d,%f,%f,%f,%f,%f,%d\n',...
           Data(i,1),...
           Data(i,2),...
           Data(i,3),...
           Data(i,4),...
           Data(i,5),...
           Data(i,6),...
           Data(i,7),...
           Data(i,8),...
           Data(i,9)...
       ); 
    end
    
	% Po kolku ima vo sekoj klaster
    'Cluster 1:'
    sum(labels==1)
    '    Cluster 2:'
    sum(labels==2)
    '    Cluster 3:'
    sum(labels==3)
    
    fclose(fid);
    


end

