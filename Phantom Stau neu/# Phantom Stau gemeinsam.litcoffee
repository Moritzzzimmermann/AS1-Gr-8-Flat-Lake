# 1. Purpose and patterns
Wir wollen wissen, warum und unter welchen Bedingungen Phantomstaus entstehen.

Spontane Staubildung
Stabile Staucluster
Rückwärstlaufende Stauwelle

# 2. Entities, State Variables, and Scales

Fahrzeuge: 
- Geschwindigkeit
- Position
Straße 230 m
Anzahl Fahrzeuge 22
Sicherheitsabstand
Maximalgeschwindigkeit 30 km/h
Simulationsdauer: 300s
Zeitschritt Dauer: 0.01s

# 4. Design Concepts

Stochasticity:
Fahrzeuge fahren zufällig plötzlich langsamer (menschliche variabilität)

# 5. Initialisierung

22 Fahrzeuge, gleichmäßig verteilt

# 7. Submodels

Fahrverhalten
Wenn Abstand < Sicherheitsabstand -> plötzlich abbremsen v = 0
Wenn Abstand > Sicherheitsabstand und Geschwindigkeit < v_max -> beschleunigen v += 3
Wenn Abstand > Sicherheitsabstand und Geschwindigkeit = v_max -> keine Veränderung
Position Veränderung abhängig von Geschwindigkeit und Zeitschrittlänge