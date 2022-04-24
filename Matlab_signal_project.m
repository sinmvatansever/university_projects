clc;
clear all;
%sounds that taken from freesound.org
[s, Fs] = audioread('near-end.wav');%near end signal
[x, Fs] = audioread('far__end.wav');%far end signal
[h, Fs] = audioread('rir.wav');%room impulse response 

L = length(h); %length of adaptive filter(AF)
N = length(x); %number of iteration
S = length(s);%length of near end
T = 1.4; %Threshold value

s_size = zeros(L,1);
w = zeros(L,1); %weight vector of AF Lx1
x_in = zeros(L,1); %input signal of AF Lx1

y =filter(h,1,x);%Echo signal
b = wgn(N,1,-45); %noise signal is created with wgn() command %taken from: mathworks.com
a = [s;zeros((N-S),1)];
d = a + b + y; %desired signal
SNR = snr(y,b)
figure(1),
subplot(2,1,1)
plot(a, 'blue')
xlabel('time(s)')
ylabel('Near-end signal')
grid on
subplot(2,1,2)
plot(x, 'red')
xlabel('time(s)')
ylabel('Far-end signal')
grid on


figure(2),
subplot(2,1,1)
plot(h)
xlabel('Signal Length')
ylabel('Room Impulse Response (rir)')
grid on
axis([0 N -1 1])
subplot(2,1,2)
plot(b)
xlabel('Signal Length')
ylabel('Noise Signal')
grid on
axis([0 N -0.5 0.5])

figure(3),
subplot(4,1,1)
plot(a)
xlabel('Signal Length')
ylabel('Near-end signal')
grid on
axis([0 N -1 1])
subplot(4,1,2)
plot(y)
xlabel('Signal Length')
ylabel('Echo signal')
grid on
axis([0 N -5 5])
subplot(4,1,3)
plot(b)
xlabel('Signal Length')
ylabel('Noise Signal')
grid on
axis([0 N -0.5 0.5])
subplot(4,1,4)
plot(d, 'red')
xlabel('Signal Length')
ylabel('Desired Signal')
grid on
axis([0 N -5 5])


%% LMS for the adaptive filter 
x=x(:); %Far end signal Nx1
d=d(:); %Desired signal Nx1
for i=1:N
    x_in(1)=x(i); 
    a(i) = abs(d(i));
    decisionvar(i) = max(abs(x))/abs(d(i));
    y_hat(i)=w(i)'*x(i);
    e(i)=d(i)-y_hat(i);
    if decisionvar(i) >= T;
        mu = 0.2;
        w(i+1)= w(i)+2*mu*e(i)*x(i);
    else
        mu = 0;
        w(i+1) = w(i) + 2*mu*e(i)*x(i);%Update filter
    end
    mse(i) = (e(i)^2); %mean square error 
    powerD(i) = d(i)^2; %Power of desired signal
    powerE(i)=e(i)^2; %power of error signal
    k(i)=abs(powerD(i))/abs(powerE(i));
end

figure(4),
subplot(3,1,1)
plot(d,'red')
xlabel('Signal Length')
ylabel('Desired Signal')
grid on
axis([0 N -5 5])
subplot(3,1,2)
plot(y_hat)
xlabel('Signal Length')
ylabel('Estimated Echo Signal')
grid on
axis([0 N -2 2])
subplot(3,1,3)
plot(e,'black')
xlabel('Signal Length')
ylabel('Error Signal')
grid on
axis([0 N -5 5])

for i=1:N
    mse_i(i)=mean(mse(i:N)); %MSE 
    ERLE(i)=10*log10(mean(k(i:N)));%ERLE
    if decisionvar(i)>=T;
        DTD(i) = 0;
    else
        DTD(i) = 1;
    end
 end

figure(5),
subplot(2,1,1)
plot(mse_i)
xlabel('Iteration')
ylabel('MSE')
axis([0 N 0 0.5])
subplot(2,1,2)
plot(ERLE)
xlabel('Iteration')
ylabel('ERLE(in dB)')
axis([0 N 0 50])


