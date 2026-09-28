
function [t,ah] = plot_intensity_stats(T)

t = tiledlayout(2,1);
%t.XLabel.String = '1/d (Å^{-1})';
t.TileSpacing='tight';
t.Padding='compact';

bin_width = T.s(end)-T.s(end-1);
slim = T.s(end) + bin_width/2;
ymax = 1.2*max(T.sigmaI_exp);

nexttile;
plot(T.s,T.sigmaI_exp,'k.-')
hold on;
plot(T.s,T.sigmaI_latt,'m.-')
ah(1) = gca;
set(ah(1),'Ylim',[0,ymax],'Xlim',[0,slim],'XTickLabel',{},'Box','Off','TickDir','out')
legend({'expt.','sim.'},'Location','northeast','Box','Off')
ylabel('Standard deviation')

nexttile;
plot(T.s,T.ccstar,'k-','Color',[1,1,1]*.5)
hold on;
plot(T.s,T.cclatt,'k.-');
plot([0,slim],[1,1],'k--');
ah(2) = gca;
set(ah(2),'Ylim',[0,1.05],'Xlim',[0,slim],'Box','Off','TickDir','out')
legend({'CC*','expt. vs. sim.'},'Location','south','Box','Off')
ylabel('Correlation coefficient')
xlabel('1/d (Å^{-1})')

end