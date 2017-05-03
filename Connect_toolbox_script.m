%------Load macaque network of cortical connectivity----------------------%  
% load('macaque71.mat')
% C = cellstr(Names);    %-----Convert Node Names to Cell Format------------%
  
%--------------------1_NODE DEGREE----------------------------------------%
% [id,od,deg] = degrees_dir(CIJ);
%                                 Output:     id,     node indegree
%                                             od,     node outdegree
%                                             deg,    node degree (indegree + outdegree)

%------------------1_a) NODE INDEGREE stemplot----------------------------%
% figure(1); 
% S=stem(id(1:end));
% ybounds = ylim;
% set(gca,'XTick', 1:71, 'XTickLabel',C,'YTick',ybounds(1):ybounds(2));
% set(S,'LineWidth',2);
% xtickangle(45);
% xlim([1 71]);
% xlabel('Node name');
% ylabel('Number of inward links');
% grid on
% title('Node indegree');

%------------------1_b) NODE INDEGREE histplot----------------------------%
% figure(2); hist(id);
% xlabel('Node degree'); ylabel('Occurrence');
% title('Node indegree distribution'); grid on

%------------------1_c) NODE INDEGREE boxplot-----------------------------%
% figure(3); boxplot(id)
% xlabel('Macaque Network'); ylabel('Number of node inward links'); 
% set(gca,'YTick',0:1:27)
% title('InDegree distribution of nodes in macaque cortical connectivity network');
% grid on

%------------------1_d) NODE OUTDEGREE stemplot---------------------------%
% figure(4); S=stem(od(1:end));
% ybounds = ylim;
% set(gca,'XTick', 1:71, 'XTickLabel',C,'YTick',ybounds(1):ybounds(2));
% set(S,'LineWidth',2);
% xtickangle(45); xlim([1 71]);
% xlabel('Node name'); ylabel('Number of outward links');
% title('Node outdegree'); grid on

%------------------1_e) NODE OUTDEGREE histplot---------------------------%
% figure(5); hist(od);
% xlabel('Node degree'); ylabel('Occurrence');
% title('Node outdegree distribution'); grid on

%------------------1_f) NODE OUTDEGREE boxplot----------------------------%
% figure(6); boxplot(od)
% xlabel('Macaque Network'); ylabel('Number of node outward links'); 
% set(gca,'YTick',0:1:27)
% title('OutDegree distribution of nodes in macaque cortical connectivity network');
% grid on

%------------------1_g) NODE DEGREE boxplot-------------------------------%
% figure(7);  S=stem(deg(1:end));
% ybounds = ylim;
% set(gca,'XTick', 1:71, 'XTickLabel',C,'YTick',ybounds(1):ybounds(2));
% set(S,'LineWidth',2);
% xtickangle(45); xlim([1 71]);
% xlabel('Node name'); ylabel('Number of links');
% title('Node degree'); grid on

%------------------1_h) NODE DEGREE histplot------------------------------%
% figure(8);  hist(deg);
% xlabel('Node degree'); ylabel('Occurrence');
% title('Node degree distribution'); grid on

%------------------1_i) NODE DEGREE boxplot-------------------------------%
% figure(9); boxplot(deg)
% xlabel('Macaque Network'); ylabel('Number of node links'); 
% set(gca,'YTick',0:2:54)
% title('Degree distribution of nodes in macaque cortical connectivity network');
% grid on

%------------------2_JOINT DEGREE-----------------------------------------%
%-------------------------------------------------------------------------%
% [J,J_od,J_id,J_bl] = jdegree(CIJ);
%                                  Outputs:    J,      joint degree distribution matrix (shifted by one)
%                                              J_od,   number of vertices with od>id.
%                                              J_id,   number of vertices with id>od.
%                                              J_bl,   number of vertices with id=od.
% figure(10); imagesc(J);
% colormap('jet');
% xlabel('OutDegree'); ylabel('InDegree');
% title('Joint Degree Matrix'); grid on
% hC=colorbar; LabelText = 'Fraction of Nodes';
% ylabel(hC,LabelText,'FontSize',14)


%---------------3_MATCHING INDEX------------------------------------------%
%-------------------------------------------------------------------------%
% [Min,Mout,Mall] = matching_ind(CIJ)
%                                  Output:     Min,    matching index for incoming connections
%                                                Mout,   matching index for outgoing connections
%                                                Mall,   matching index for all connections
% figure(11);  imagesc(Mall);       %--Set up the value (Min, Mout, Mall) to plot------%
% colormap('jet');
% set(gca,'XTick', 1:71,'YTick', 1:71, 'YTickLabel',C, 'FontSize',6);
% grid on
% ylabel('Node name'); title('Matching index for all connections');
% hC=colorbar

%---------------4_DENSITY-------------------------------------------------%
%-------------------------------------------------------------------------%
% [kden,N,K] = density_dir(CIJ)
%                                Output:     id,     node indegree
%                                            od,     node outdegree
%                                            deg,    node degree (indegree + outdegree)

%---------------5-CLUSTERING COEFFICIENT----------------------------------%
%-------------------------------------------------------------------------%
% Cl=clustering_coef_bd(CIJ)
%                                Output:     C,      clustering coefficient vector

%---------------5_a)_Clustering coefficient stemplot----------------------%
% figure(12); S=stem(Cl(1:end));
% ybounds = ylim;
% set(gca,'XTick', 1:71, 'XTickLabel',C,'YTick',0:0.05:1);
% set(S,'LineWidth',2);
% xtickangle(45); xlim([1 71]);
% xlabel('Node name'); ylabel('Clustering coefficient'); grid on

%---------------5_b)_Clustering coefficient histplot----------------------%
% figure(13);
% hist(Cl);
% xlabel('Clustering coefficient');
% ylabel('Occurrence');
% title('Distribution of clustering coefficients');
% grid on

%---------------5_c)_Clustering coefficient boxplot-----------------------%
% figure(14);
% boxplot(Cl)
% xlabel('Macaque Network');
% ylabel('Clustering coefficient'); 
% set(gca,'YTick',0:0.05:1)
% grid on

%---------------6_TRANSITIVITY--------------------------------------------%
%-------------------------------------------------------------------------%
% T=transitivity_bd(CIJ)                 %-----Transitivity is the ratio of 'triangles to triplets' in the network.

%---------------7_LOCAL EFFICIENCY----------------------------------------%
%-------------------------------------------------------------------------%
% Eloc=efficiency_bin(CIJ,1) 
%                                   Output:     Eloc,     local efficiency (vector)

%---------------8_a)_Local efficiency stem plot---------------------------%
%  figure(15); S=stem(Eloc(1:end));
%  ybounds = ylim;
%  set(gca,'XTick', 1:71, 'XTickLabel',C,'YTick',0:0.05:1);
%  set(S,'LineWidth',2); xtickangle(45);
%  xlim([1 71]);
%  xlabel('Node name'); ylabel('Local efficiency'); grid on

%--------------8_b)_Local efficiency  histplot----------------------------%
% figure(16); hist(Eloc);
% xlabel('Local efficiency'); ylabel('Occurrence'); grid on

%--------------8_c)_Local efficiency boxplot------------------------------%
% figure(17); boxplot(Eloc)
% xlabel('Macaque Network'); ylabel('Local efficiency'); 
% set(gca,'YTick',0:0.05:1); grid on


%---------------9_GLOBAL EFFICIENCY---------------------------------------%
%-------------------------------------------------------------------------%
% Eglob=efficiency_bin(CIJ)
%                                    Output:     Eglob,    global efficiency (scalar)

%---------------10_ASSORTATIVITY------------------------------------------%
%-------------------------------------------------------------------------%
% r = assortativity_bin(CIJ,flag)   
%                                   Outputs:    r,      assortativity coefficient

%                                   flag,   1, directed graph: out-degree/in-degree correlation
%                                           2, directed graph: in-degree/out-degree correlation
%                                           3, directed graph: out-degree/out-degree correlation
%                                           4, directed graph: in-degree/in-degree correlation

%---------------11_MEAN FIRST PASSAGE TIME--------------------------------%
%-------------------------------------------------------------------------%
% MFPT = mean_first_passage_time(CIJ)
%                                   Output:   MFPT, 	Pairwise mean first passage time matrix. 
% figure(18);  imagesc(MFPT); 
% colormap('jet');
% set(gca, 'XTick', 1:72, 'XTickLabel',C, 'FontSize',6, 'YTick', 1:72, 'YTickLabel',C)
% xlabel('Node Name'); xtickangle(45); ylabel('Node Name');
% title('Mean First Passage Time');
% grid on
% hC=colorbar; LabelText = 'Expected number of steps';
% ylabel(hC,LabelText,'FontSize',14)


%---------------12_BETWEENNESS CENTRALITY--------------------------------%
%-------------------------------------------------------------------------%
% BC=betweenness_bin(CIJ)
%                                   Output:     BC,     node betweenness centrality vector
%---------------12_a) Betweenness centrality stemplot---------------------%
% figure(19); S=stem(BC(1:end));
% ybounds = ylim;
% set(gca,'XTick', 1:71, 'XTickLabel',C,'YTick',0:50:800);
% xlim([1 71]);
% set(S,'LineWidth',2); xtickangle(45);
% xlabel('Node name'); ylabel('Betweenness centrality'); grid on

% %--------------12_b)_Betweenness centrality  histplot-------------------%
% figure(20);hist(BC);
% xlabel('Betweenness centrality'); ylabel('Frequency'); grid on

% %--------------12_c)_Betweenness centrality boxplot---------------------%
% figure(21); boxplot(BC)
% xlabel('Macaque Network'); ylabel('Betweenness centrality'); 
% set(gca,'YTick',0:50:800); grid on
 
%----------------13_DISTANCE-------------------------------------------%
%----------------------------------------------------------------------%
% D=distance_bin(CIJ)          %   The distance matrix contains lengths of shortest 
%                                  paths between all pairs of nodes.
% figure(22);  imagesc(D); 
% colormap('jet');
% set(gca, 'XTick', 1:72, 'XTickLabel',C, 'FontSize',6, 'YTick', 1:72, 'YTickLabel',C) 
% xlabel('Node Name'); xtickangle(45); ylabel('Node Name');
% title('Distance matrix'); grid on
% hC=colorbar; LabelText = 'Lengths of shortest path';
% ylabel(hC,LabelText,'FontSize',14)

%---------------14_CHARACTERISTIC PATH LENGTH-----------------------------%
%-------------------------------------------------------------------------%
% lambda = charpath(D)
%
%      The network characteristic path length is the average shortest path
%      length between all pairs of nodes in the network.

%---------------15_NETWORK PATHS------------------------------------------%
%-------------------------------------------------------------------------%
%[Pq,tpath,plq,qstop,allpths,util] = findpaths(CIJ,[1 5 10],4,1)
%[Pq,tpath,plq,qstop,allpths,util] = findpaths(CIJ,sources,qmax,savepths)
%                      Inputs:     CIJ,        binary (directed/undirected) connection matrix
%                                  qmax,       maximal path length
%                                  sources,    source units from which paths are grown
%                                  savepths,   set to 1 if all paths are to be collected in
%                                              'allpths'

%                      Outputs:    Pq,         3D matrix, with P(i,j,q) = number of paths from
%                                              'i' to 'j' of length 'q'.
%                                  tpath,      total number of paths found (lengths 1 to 'qmax')
%                                  plq,        path length distribution as a function of 'q'
%                                  qstop,      path length at which 'findpaths' is stopped
%                                  allpths,    a matrix containing all paths up to 'qmax'
%                                  util,       node use index
%---------------16_NETWORK WALKS------------------------------------------%
%-------------------------------------------------------------------------%
%[Wq,twalk,wlq] = findwalks(CIJ)
%                              Outputs:    Wq          3D matrix, Wq(i,j,q) is the number of walks
%                                                      from 'i' to 'j' of length 'q'.
%                                          twalk       total number of walks found
%                                          wlq         walk length distribution as function of 'q'
%---------------17_STRUCTURAL MOTIFS--------------------------------------%
%-------------------------------------------------------------------------%
%[f,F] = motif3struct_bin(CIJ);
%                              Output:     F,      node motif frequency fingerprint
%                                          f,      network motif frequency fingerprint
%---------------18_RICH CLUB CORFFICIENT---------------------------------%
%-------------------------------------------------------------------------%
% R = rich_club_bd(CIJ)
%                               Output:       R,        vector of rich-club coefficients for levels
%                                                       1 to klevel.
%                                             Nk,        number of nodes with degree>k
%                                             Ek,        number of edges remaining in subgraph with
%                                                        degree>k

