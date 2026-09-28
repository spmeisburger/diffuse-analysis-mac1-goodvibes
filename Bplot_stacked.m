
function [ah,a] = Bplot_stacked(stats)

% colors: https://colorbrewer2.org/#type=qualitative&scheme=Paired&n=3
c1 = [166,206,227]/255;
c2 = [31,120,180]/255;
c3 = [178,223,138]/255;

% data to plot
x = stats.resSeq;
ylatt = stats.mean_Blatt;
ylattcor = stats.Blatt_cor;
yobs = stats.mean_Biso;

% make the plot
a(1) = area(x,yobs); hold on;
a(2) = area(x,ylatt);
a(3) = area(x,ylattcor);

p = plot(x,yobs,'k.-');

% set the colors
a(1).FaceColor = c3;
a(1).EdgeColor = [0,0,0];
a(1).LineWidth = 0.5;
a(2).FaceColor = c2;
a(2).EdgeColor = [0,0,0];
a(3).FaceColor = c1;
a(3).EdgeColor = [0,0,0];

ah = gca;

% set the axis limit
set(ah,'Ylim',[0,Inf],'Xlim',[0,Inf]);
a = [p,a];

end