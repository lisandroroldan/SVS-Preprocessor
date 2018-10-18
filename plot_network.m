function  plot_network(NODES,LINE_SECTIONS,VENT_SECTIONS)


figure(1)
hold on


for i=1:length(LINE_SECTIONS)
       
    n1=LINE_SECTIONS(i,2);
    n2=LINE_SECTIONS(i,3);
    m1=find(NODES(:,1)==n1);
    m2=find(NODES(:,1)==n2);
    
    x1=NODES(m1,2);
    x2=NODES(m2,2);
    y1=NODES(m1,3);
    y2=NODES(m2,3);
    z1=NODES(m1,4);
    z2=NODES(m2,4);
    
    h4=plot3([x1 x2],[y1 y2],[z1 z2],'b','LineWidth',2);
    
    text((x1+x2)/2,(y1+y2)/2,(z1+z2)/2,[num2str(LINE_SECTIONS(i,1)),'\rightarrow'],'HorizontalAlignment','right','FontSize',10,'Color','b');
    
    seg=LINE_SECTIONS(i,4);
    
    if seg>1
        xl=linspace(x1, x2, seg+1);
        yl=linspace(y1, y2, seg+1);
        zl=linspace(z1, z2, seg+1);
        
        h1=plot3(xl(2:end-1),yl(2:end-1),zl(2:end-1),'kx','LineWidth',2);
    end
end

for i=1:length(VENT_SECTIONS)
       
    n1=VENT_SECTIONS(i,2);
    n2=VENT_SECTIONS(i,3);
    m1=find(NODES(:,1)==n1);
    m2=find(NODES(:,1)==n2);
    
    x1=NODES(m1,2);
    x2=NODES(m2,2);
    y1=NODES(m1,3);
    y2=NODES(m2,3);
    z1=NODES(m1,4);
    z2=NODES(m2,4);
    
    h2=plot3([x1 x2],[y1 y2],[z1 z2],'g','LineWidth',2);
    
    text((x1+x2)/2,(y1+y2)/2,(z1+z2)/2,[num2str(VENT_SECTIONS(i,1)),'\rightarrow'],'HorizontalAlignment','right','FontSize',10,'Color','g');
    
end

for i=1:length(NODES)
    h3=plot3(NODES(i,2),NODES(i,3),NODES(i,4),'-mo','MarkerFaceColor','r');
    
    text(NODES(i,2),NODES(i,3),NODES(i,4),['\leftarrow',num2str(NODES(i,1))],'HorizontalAlignment','left','FontSize',10,'Color','r')
end

daspect([1 1 1]);
xlim([min(NODES(:,2))-100 max(NODES(:,2))+100]);
ylim([min(NODES(:,3))-100 max(NODES(:,3))+100]);
zlim([min(NODES(:,4))-100 max(NODES(:,4))+100]);
view(3);
grid on;

title('NETWORK GEOMETRY');
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0.5, 0.5, 0.5, 0.5]);

legend([h3 h4 h2  h1],{'Nodes','Line sections','Vent. shaft sections','Segment interfaces'});