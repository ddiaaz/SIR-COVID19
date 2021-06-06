% Author: Daniel Diaz

%{
    Parameters: S, I, beta, gamma
        S: succeptible population
      s_0: Initial susceptible population
        I: Infected population
      i_0: Initial infected population
        R: Recovered population
      r_0: Initial recovered populati
     Beta: Transmition rate (people)
    gamma: Recovery time (days)
       R0: Reproduction number (the number of cases an infected person can
           cause)

    Note:
        - Beta can be decreased with hand washing, masks, social distancing, etc.
        - S_o can be decreased with more vaccinated population
        - Median R0 value is 2.79. This is the value used for the common
          varriant
        - Contageous variant has R0 of 6.68
%}

%% Original COVID-19 Model for Los Angeles
a = 1;
b = 215;
R_0 = 2.79;
population = 9969510;
vaccinated = 2387785;
i_0 = 116;
r_0 = 1232727;
gamma = 1/10;
s_0 = population - vaccinated - r_0;
beta = (R_0*gamma)/(s_0);

y = [s_0, i_0, r_0];
f = @(t,y) [-beta*y(1)*y(2);
    y(2)*(beta*y(1) - gamma);
    gamma*y(2)];

[t,w] = rk4(a,b,360,y,f);

figure(1)
hold on;
plot(t,w,"LineWidth",2);
legend('Susceptible','Infected','Recovered', 'FontSize',24);
title('COVID-19 Los Angeles', 'FontSize',24);
xlabel('Time (days)', 'FontSize',24); 
ylabel('Population', 'FontSize',24);

%% Scenario 1 COVID-19 Model
% No one in Los Angeles is vaccinated 

a = 1;
b = 215;
R_0 = 2.79;
population = 9969510;
vaccinated = 0;
i_0 = 116;
r_0 = 1232727;
gamma = 1/10;
s_0 = population - vaccinated - r_0;
beta = (R_0*gamma)/(s_0);

y = [s_0, i_0, r_0];
f = @(t,y) [-beta*y(1)*y(2);
    y(2)*(beta*y(1) - gamma);
    gamma*y(2)];

[t,w] = rk4(a,b,360,y,f);

figure(2)
hold on;
plot(t,w,"LineWidth",2);
legend('Susceptible','Infected','Recovered', 'FontSize',24); 
title('Scenario 1 COVID-19 Model', 'FontSize',24); 
xlabel('Time (days)', 'FontSize',24); 
ylabel('Population', 'FontSize',24); 

%% Scenario 2 COVID-19 Model
% 60% of population in Los Angeles is vaccinated 

a = 1;
b = 215;
R_0 = 2.79;
population = 9969510;
vaccinated = population * .6;
i_0 = 116;
r_0 = 1232727;
gamma = 1/10;
s_0 = population - vaccinated - r_0;
beta = (R_0*gamma)/(s_0);

y = [s_0, i_0, r_0];
f = @(t,y) [-beta*y(1)*y(2);
    y(2)*(beta*y(1) - gamma);
    gamma*y(2)];

[t,w] = rk4(a,b,360,y,f);

figure(3)
hold on;
plot(t,w,"LineWidth",2);
legend('Susceptible','Infected','Recovered', 'FontSize',24); 
title('Scenario 2 COVID-19 Models', 'FontSize',24); 
xlabel('Time (days)', 'FontSize',24); 
ylabel('Population', 'FontSize',24); 

%% Scenario 3 COVID-19 Model
% A more infectious COVID varriant in Los Angeles given current vaccinated
% data

a = 1;
b = 215;
R_0 = 6.68;
population = 9969510;
vaccinated = 2387785;
i_0 = 116;
r_0 = 1232727;
gamma = 1/10;
s_0 = population - vaccinated - r_0;
beta = (R_0*gamma)/((s_0));

y = [(s_0), i_0, r_0];
f = @(t,y) [-beta*y(1)*y(2);
    y(2)*(beta*y(1) - gamma);
    gamma*y(2)];

[t,w] = rk4(a,b,360,y,f);

figure(4)
hold on;
plot(t,w,"LineWidth",2);
legend('Susceptible','Infected','Recovered', 'FontSize',24); 
title('Scenario 3 COVID-19 Model', 'FontSize',24); 
xlabel('Time (days)', 'FontSize',24); 
ylabel('Population', 'FontSize',24); 