# Phantom Stau Model ODD Description
Diese Datei beschreibt ein Pahntom Stau Modell. Dieses Datei verwendet markup language, verwndet von NetLogo's Info tab, sarting with NetLogo version 5.0.

## 1. Purpose and patterns
Diese Modell wurde designed, um Fragen über die Entstehung von sogenannten Phantom Staus zu untersuchen. Unter welchem Umständen führen die Interaktionen zwischen den Autofahrern zu der Emergenz von kurzen Unterbrechungen des Verkehrsflusses. Wie verhält sich der Stau - kann das Voranschreitens des Staus in die entgegengesetzte Fahrtrichtung durch diese Modell bestätigt werden? Dieses Modell repräsentiert keinen spezifischen Ort, spezifische Autofahrer oder Autos - es wurden lediglich allgemeine Muster als Kriterien verwendet, um die Fragen zu beantworten: dass Autofahrer auf Änderungen der Geschwindigkeit des Vordermannes reagieren können, wobei die Reaktionszeit und -stärke varriert.

## 2. Entities, State Variables, and Scales
Dieses Modell beinhaltet zwei Arten von Entitteies: 22 Autofahrer in ihren Fahrzeugen (beide Bezeichnungen beziehen in Folge auf die Kombination eines Autofahrers und sein Fahrzeug bzw. Auto) sowie eine kreisförmige Bahn, auf der sich die Autofahrer in ihren Autos im Uhrzeigersinn diskret pro Zeittick bewegen. Ein Zeittick entspricht hier einer zehntel Sekunde. Die kreisförmige hat einen Umfang von 230 m. Die Fahrzeuge sind durch ihre Position auf der Kreisförmigen Bahn sowie deren Geschwindigkeit charakterisiert. Die Position der Fahrzeuge wird in Form einer eindimensionalen Koordinate definiert, welche einer Position auf dem Kreis entspricht, wobei der Koordinatenursprung oben im Kreis platziert wird und die Koordinaten im Uhrzeigersinn in einem Zentimeter-Intervall aufsteigen. Die Geschwindigkeit der Fahrzeuge wird aus m/s abgeleitet, wobei ein m/s 100 Koordinaten pro 10 Ticks - also 10 Koordinaten pro Tick entspricht. Wenn sich die Geschwindigkeit ändert, kann sie dies nur in 1 Koordinaten/Tick schritten - es wird zu Rundungsfehlern kommen. Die Simulation soll, sobald das erste Fahrzeug eine Geschwindigkeit von <4 Koordinaten/Tick erreicht, nach weitere 1800 Ticks beendet werden. Die Reaktionszeit der Autofahrer erfolgt durch eine stochastische Ermittlung, welche eventuell noch folgende diskutiert wird oder vielleicht auch nicht mehr.

## 3. Process Overview and Scheduling
Es gibt nur einen Prozess in diesem Modell: die Anpassung der eigenen Geschwindigkeit aller Autofahrer in Abhängigkeit der Geschwindigkeit ihrer Vordermänner.

## 4. Design Concepts
The _basic principle_ addressed by this model is the concept of virtual corridors—pathways used by many individuals when there is nothing particularly beneficial about the habitat in them. This concept is addressed by seeing when corridors _emerge_ from two parts of the model: the adaptive movement behavior of butterflies and the landscape they move through. This _adaptive behavior_ is modeled via a simple empirical rule that reproduces the behavior observed in real butterflies: moving uphill. This behavior is based on the understanding (not included in the model) that moving uphill leads to mating, which conveys fitness (success at passing on genes, the presumed ultimate objective of organisms). Because the hilltopping behavior is assumed a priori to be the objective of the butterflies, the concepts of  and _Prediction_ are not explicitly considered. There is no _learning_ in the model.

_Objectives_ aller Agenten ist die Wahrung eines Gleichmäßiges Abstandes. Zu Beginn entsprcht dieser bei allen Autofahrern genau 1/22 der 230 m langen Kreisbahn abzgl. 22 Autos * 4 Meter Länge pro Auto -> 142 m, was 644 bis 645 Koordinaten (Rundungsfehler) entspricht.

_Sensing_ ist in diesem Modell wichtig: die Autofahrer sollen den Abstand zum Vordermann abschätzen. Diese Schätzung beruht auf einer stochastischen Abweichung des tatsächlichem Abstandes.

Dieses Modell beinhaltet _interaction_ zwischen den Autofahrern: jeder Autofahrer soll nach Möglichkeit einen konstanten Abstand zu einem Vordermann wahren.

_Stochasticity_ wird in diesem Modell bei folgenden Parametern eingesetzt: 
Die grundsätzliche __Reaktionszeit__ sowie dessen zeitliche Variation bzw. Abnahme jedes Autofahres.
Die __Abstandsabschätzung__ jedes Autofahrers bzgl. seines Vordermannes.
Die Wahl der __Geschwindigkeit__ der Autofahrer.
Die Art der __Geschwindigkeitsanpassung__ der Autofahrer.

_Collectives_ sind in diesem Modell nicht zutreffend.

_Observation_ Ein grapfisches Display stellt die Fahrzeuge auf der kreisförmigen Bahn dar.

## 5. Initialization
The topography of the landscape (the elevation of each patch) is initialized when the model starts. Two kinds of landscapes are used in different versions of the model: (1) a simple artificial topography, and (2) the topography of a real study site, imported from a file containing elevation values for each patch. The butterflies are initialized by creating five hundred of them and dispersing them throughout the landscape: each butterfly’s initial location is set to a patch selected randomly from among all patches.

## 6. Input Data
The environment is assumed to be constant, so the model has no input data.

## 7. Submodels
The movement submodel defines exactly how butterflies decide whether to move uphill or randomly. First, to “move uphill” is defined specifically as moving to the neighbor patch that has the highest elevation; if two patches have the same elevation, one is chosen randomly. “Move randomly” is defined as moving to one of the neighboring patches, with equal probability of choosing any patch. “Neighbor patches” are the eight patches surrounding the butterfly’s current patch. The decision of whether to move uphill or randomly is controlled by the parameter _q_, which ranges from 0.0 to 1.0 (_q_ is a global variable: all butterflies use the same value). On each time step, each butterfly draws a random number from a uniform distribution between 0.0 and 1.0. If this random number is less than _q_, the butterfly moves uphill; otherwise, the butterfly moves randomly.