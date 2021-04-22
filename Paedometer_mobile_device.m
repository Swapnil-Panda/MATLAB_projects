%% data input
m=mobiledev;
m.AccelerationSensorEnabled=1;
m.Logging=1;
m.Logging=input('Are you done?');
[a, t]=accellog(m);
x=a(:,1);
y=a(:,2);
z=a(:,3);
mag=sqrt(sum(x.^2+y.^2+z.^2,2));
magNoG=mag-mean(mag);
%% plot & decision

 N=floor(length(magNoG)/100);
 for i=1:N
 data=magNoG((1+(i-1)*100):i*100)
minPeakHeight=std(data);
[pks,logs]=findpeaks(data,'MINPEAKHEIGHT',minPeakHeight);
numsteps=numel(pks);
magNoG=mag-mean(mag);
% subplot(2,2,i)
 subplot(floor(N/2)+1,floor(N/2)+1,i);
 plot(data);
 
x=['number of steps=',num2str(numsteps)];

if minPeakHeight>=7
    title('Running');
    xlabel(x);

else
    title('Walking');
     xlabel(x);

end
 end