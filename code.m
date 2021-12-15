clc
clear all
close all
a = arduino('COM3','mega2560','Libraries','Adafruit/MotorShieldV2');
shield = addon(a,'Adafruit/MotorShieldV2');
configurePin(a, 'A8', 'AnalogInput');
configurePin(a, 'A9', 'AnalogInput');
configurePin(a, 'A10', 'AnalogInput');
configurePin(a, 'A11', 'AnalogInput');
configurePin(a, 'D22', 'Digitaloutput');
configurePin(a, 'D23', 'Digitaloutput');
configurePin(a, 'D24', 'Digitaloutput');
configurePin(a, 'D25', 'Digitaloutput');
configurePin(a, 'D26', 'Digitaloutput');
configurePin(a, 'D27', 'Digitaloutput');
configurePin(a, 'D28', 'Digitaloutput');
configurePin(a, 'D29', 'Digitaloutput');
writeDigitalPin(a,'D22',1);
writeDigitalPin(a,'D23',0);
writeDigitalPin(a,'D24',1);
writeDigitalPin(a,'D25',0);
writeDigitalPin(a,'D26',1);
writeDigitalPin(a,'D27',0);
writeDigitalPin(a,'D28',1);
writeDigitalPin(a,'D29',0);

dcm1 = dcmotor(shield,1);
dcm2 = dcmotor(shield,2);
dcm3 = dcmotor(shield,3);
dcm4 = dcmotor(shield,4);
cam=webcam('USB Video Device');
while true
e=cam.snapshot;
ks=rgb2gray(e);
[centers, radii]=imfindcircles(ks,[1 2],'ObjectPolarity','dark','Sensitivity',0.9);
imshow(e);
hold on;
viscircles(centers, radii,'EdgeColor','r');
%plot(centers(1), centers(2), '+');
p1=centers(1,1);
p2=centers(1,2);
p3=centers(2,1);
p4=centers(2,2);
pin1=readVoltage(a,'A8');
pin2=readVoltage(a,'A9');
pin3=readVoltage(a,'A10');
pin4=readVoltage(a,'A11');while abs(pin1-p1) > 0.2
pin1=readVoltage(a,'A8');
fprintf('value of a: %d\n', pin1);
if pin1>p1
dcm1.Speed = -0.9;
start(dcm1);
else
dcm1.Speed = 0.9;
start(dcm1);
end
stop(dcm1);
end
while abs(pin1-p1) >= 0.09
writeDigitalPin(a,'D22',1);
writeDigitalPin(a,'D23',0);
pin1=readVoltage(a,'A8');
fprintf('value of a: %d\n', pin1);
if pin1>p1
dcm1.Speed = -0.9;
start(dcm1);
else
dcm1.Speed = 0.9;
start(dcm1);
end
stop(dcm1);
writeDigitalPin(a,'D22',0);
end


%Motor2
 while abs(pin2-p2) > 0.2
pin2=readVoltage(a,'A9');
fprintf('value of b: %d\n', pin2);
if pin2>p2
dcm2.Speed = -0.9;
start(dcm2);
else
dcm2.Speed = 0.9;
start(dcm2);
end
stop(dcm2);
end
while abs(pin2-p2) >= 0.02
writeDigitalPin(a,'D22',1);
writeDigitalPin(a,'D23',0);
pin2=readVoltage(a,'A9');
fprintf('value of b: %d\n', pin2);
if pin2>p2
dcm2.Speed = -0.9;
start(dcm2);
else
dcm2.Speed = 0.9;
start(dcm2);
end
stop(dcm2);
writeDigitalPin(a,'D22',0);
end


%Motor3
while abs(pin3-p3) > 0.2
pin3=readVoltage(a,'A10');
fprintf('value of c: %d\n', pin3);
if pin3>p3
dcm3.Speed = -0.9;
start(dcm3);
else
dcm3.Speed = 0.9;
start(dcm3);
end
stop(dcm3);
end
while abs(pin3-p3) >= 0.03
writeDigitalPin(a,'D22',1);
writeDigitalPin(a,'D23',0);
pin3=readVoltage(a,'A10');
fprintf('value of c: %d\n', pin3);
if pin3>p3
dcm3.Speed = -0.9;
start(dcm3);
else
dcm3.Speed = 0.9;
start(dcm3);
end
stop(dcm3);
writeDigitalPin(a,'D22',0);
end

%Motor4
while abs(pin4-p4) > 0.2
pin4=readVoltage(a,'A11');
fprintf('value of c: %d\n', pin4);
if pin4>p4
dcm4.Speed = -0.9;
start(dcm3);
else
dcm4.Speed = 0.9;
start(dcm4);
end
stop(dcm4);
end
while abs(pin4-p4) >= 0.03
writeDigitalPin(a,'D22',1);
writeDigitalPin(a,'D23',0);
pin3=readVoltage(a,'A11');
fprintf('value of c: %d\n', pin4);
if pin4>p4
dcm4.Speed = -0.9;
start(dcm4);
else
dcm4.Speed = 0.9;
start(dcm4);
end
stop(dcm4);
writeDigitalPin(a,'D22',0);
end

end
