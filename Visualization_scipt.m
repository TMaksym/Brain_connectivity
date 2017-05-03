load('macaque71.mat')
C = cellstr(Names); 
%------------------------GTRID COMMUNITIES--------------------------------%
%-------------------------------------------------------------------------%
[Ci Q] = modularity_dir(CIJ)
[X,Y,INDSORT] = grid_communities(Ci);    % call function
figure(1);
imagesc(CIJ(INDSORT,INDSORT));           % plot ordered adjacency matrix
hold on;                                 % hold on to overlay community visualization
plot(X,Y,'r','linewidth',2);             % plot community boundaries
C_ind(:)=C(INDSORT)
set(gca, 'XTick', 1:71, 'XTickLabel',C_ind, 'FontSize',6, 'YTick', 1:71, 'YTickLabel',C_ind)
xlabel('Node Name'); xtickangle(45); ylabel('Node Name');
title('Network communities');grid on

%------------------------NODE REODERING WITH SIMULATED ANNEALING----------%
%-------------------------------------------------------------------------%
[Mreordered,Mindices,cost] = reorder_matrix(CIJ,'circ',flag)
C_sort(:)=C(Mindices)
figure(2);              
imagesc(Mreordered); 
set(gca, 'XTick', 1:71, 'XTickLabel',C_sort, 'FontSize',6, 'YTick', 1:71, 'YTickLabel',C_sort)
grid on
xlabel('Node Name'); xtickangle(45)
ylabel('Node Name');
title('Reordered matrix');

%------------------------NODE REODERING-----------------------------------%
%-------------------------------------------------------------------------%
[MATreordered,MATindices,MATcost] = reorderMAT(CIJ,1,'line')
figure(3);              
imagesc(MATreordered);
C_sort_MAT(:)=C(MATindices) 
set(gca, 'XTick', 1:71, 'XTickLabel',C_sort_MAT, 'FontSize',6, 'YTick', 1:71, 'YTickLabel',C_sort_MAT)
grid on
xlabel('Node Name'); xtickangle(45), ylabel('Node Name');
title('Reordered matrix');

%------------------------NODE REODERING BY MODULAR STRUCTURE--------------%
%-------------------------------------------------------------------------%
M  = community_louvain(CIJ);
[On,Wr] = reorder_mod(CIJ,M)

figure(4);  imagesc(Wr);
C_sor(:)=C(On); 
set(gca, 'XTick', 1:71, 'XTickLabel',C_sor, 'FontSize',6, 'YTick', 1:71, 'YTickLabel',C_sor)
xlabel('Node Name'); xtickangle(45), ylabel('Node Name');
title('Reordered matrix by modular structura'); grid on