function  plot_fan_curve
close all

x1=[0 60 120 180];
y1=[0 180 800 1300];

x2=[0 0 0 0];
y2=[0 0 0 0];

figure(1)
hold on
if sum(x1)>0
    f1=fit(x1',y1','poly3');
    plot(x1,y1,'og')
    plot(f1)
end









grid on
xlabel('Flow Rate (m^3/s)')
ylabel('Total pressure rise (Pa)')
legend('Curve 1','Curve 2')


