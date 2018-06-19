clear all
close all

BP_RF = component(3, 10);
LP_IF = component(0.47, 27);
BP_IF = component(1.5, 27);
SPDT = component(1.4, 27, 44, 30);
LNA_RF = component([14, 0.8], 18.5, 31.5, 7.5);
Mixer_RF = component(6.8, 1, 12, 17);
Mixer_IF = component(5, 1, 12, 17);
AGC = component([6.8, 19.5], 7, 28, 21);

recepteur = systeme([BP_RF, SPDT, LNA_RF, LNA_RF, LNA_RF, Mixer_RF, BP_IF, Mixer_IF, LP_IF, AGC]);
recepteur.calculate();
recepteur
recepteur.diagram('Récepteur');

transmetteur = systeme([LP_IF, Mixer_IF, BP_IF, Mixer_RF, BP_RF, LNA_RF, SPDT, BP_RF]);
transmetteur.calculate();
transmetteur
transmetteur.diagram('Émetteur');