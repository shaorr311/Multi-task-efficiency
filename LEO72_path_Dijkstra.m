clear,close all


%%% 生成Edges

load('C:\Users\Administrator\Desktop\仿真说明\LEOIPL_ALL.mat'); % 改成LEOIPL_ALL.mat所在的目的文件夹 

%%% 连接关系
s = [1:72,...   %ISL     源节点，相当于仿真说明中的i
     1:60];     %IPL
t = [2:12,1, 14:24,13, 26:36,25, 38:48,37, 50:60,49, 62:72,61,...
     24,13:23, 25:36, 48,37:47, 49:60, 72,61:71];       %目的节点，相当于仿真说明中的j           


weights_ISL = 3871 * ones(72,1);
weights_IPL = LEOIPL_ALL(1,:)';  % 此时s=1，仿真中需依次取s=1,2,……,1441
weights = [weights_ISL;weights_IPL];
EdgeTable = table([s' t'],weights,'VariableNames',{'EndNodes' 'Weight'});


%%% 生成Nodes

names = {'L0101','L0102','L0103','L0104','L0105','L0106','L0107','L0108','L0109','L0110','L0111','L0112',...
         'L0201','L0202','L0203','L0204','L0205','L0206','L0207','L0208','L0209','L0210','L0211','L0212',...
         'L0301','L0302','L0303','L0304','L0305','L0306','L0307','L0308','L0309','L0310','L0311','L0312',...
         'L0401','L0402','L0403','L0404','L0405','L0406','L0407','L0408','L0409','L0410','L0411','L0412',...
         'L0501','L0502','L0503','L0504','L0505','L0506','L0507','L0508','L0509','L0510','L0511','L0512',...
         'L0601','L0602','L0603','L0604','L0605','L0606','L0607','L0608','L0609','L0610','L0611','L0612'}';
NodeTable = table(names,'VariableNames',{'Name'});

%%% 生成Graph

G = graph(EdgeTable,NodeTable);
%plot(G,'NodeLabel',G.Nodes.Country,'EdgeLabel',G.Edges.Code)
%p = plot(G,'NodeLabel',G.Nodes.Name,'EdgeLabel',G.Edges.Weight);

%%% 计算和展示最短路由示例
[path,d] = shortestpath(G,15,44,'Method','positive') ;    %%%可返回最短路径path及其长度d  15和44可换成i,j=1,2,…，72  
%highlight(p,path,'EdgeColor','r');                       %%%!!!返回值缺少经过的节点数number





