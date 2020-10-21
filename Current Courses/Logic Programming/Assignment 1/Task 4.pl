% https://swi-prolog.discourse.group/t/how-to-eliminate-the-warning/484
% due to warnings, the following line is required (above url links to a solution which eliminates those warnings):
:- (discontiguous siggeneia/3, kalipsi_ipiresias_perithalpsis/2, eidos_ipiresias_perithalpsis/2, kalipsi_asfalisis/2, eidos_asfaleias/2, aitoumeni_apozimiosi/2).
% the template of Task 3 won't work with Task 4, that's why there are "instructions" here and the line above.


siggeneia(kostas, maria, paidi).
kalipsi_ipiresias_perithalpsis(kostas, nosokomeiaki).
eidos_ipiresias_perithalpsis(maria, nosokomeiaki).
kalipsi_asfalisis(kostas, pliris).
eidos_asfaleias(kostas, oikogeneiaki).
aitoumeni_apozimiosi(kostas, 8000).

siggeneia(nikos, anna, sizigos).
kalipsi_ipiresias_perithalpsis(nikos, nosokomeiaki).
eidos_ipiresias_perithalpsis(anna, nosokomeiaki).
kalipsi_asfalisis(nikos, meriki).
eidos_asfaleias(nikos, oikogeneiaki).
aitoumeni_apozimiosi(nikos, 5000).


kalipsi_asthenous(Asfalismenos, Asthenis) :-
    siggeneia(Asfalismenos, Asthenis, paidi),
    eidos_asfaleias(Asfalismenos, oikogeneiaki).

kalipsi_asthenous(Asfalismenos, Asthenis) :-
    siggeneia(Asfalismenos, Asthenis, sizigos),
    eidos_asfaleias(Asfalismenos, oikogeneiaki).

apozimiosi(Asfalismenos, Poso) :-
    kalipsi_asthenous(Asfalismenos, Asthenis),
    kalipsi_ipiresias_perithalpsis(Asfalismenos, nosokomeiaki),
    eidos_ipiresias_perithalpsis(Asthenis, nosokomeiaki),
    aitoumeni_apozimiosi(Asfalismenos, Poso),
    Poso>5000,
    kalipsi_asfalisis(Asfalismenos, pliris).

apozimiosi(Asfalismenos, Poso) :-
    kalipsi_asthenous(Asfalismenos, Asthenis),
    kalipsi_ipiresias_perithalpsis(Asfalismenos, nosokomeiaki),
    eidos_ipiresias_perithalpsis(Asthenis, nosokomeiaki),
    aitoumeni_apozimiosi(Asfalismenos, Poso),
    Poso=<5000,
    kalipsi_asfalisis(Asfalismenos, meriki).

