# JP AI-Assistent Script

Dit script biedt een reeks handige AI-functionaliteiten voor FiveM-servers. Spelers kunnen informatie opvragen over voertuigen, het weer checken, en een vluchtroute instellen met behulp van eenvoudige commando's.

## Functionaliteiten

1. **Voertuiginformatie** (`/aiauto`)
   - Geeft details over het voertuig waarin je zit, zoals:
     - Modelnaam.
     - Snelheid (in km/u).
     - Motorstatus met adviezen.
     - Brandstofniveau.

2. **Weerinformatie** (`/aiweer`)
   - Laat het huidige weer zien.

3. **Vluchtroute Generator** (`/aiontsnap`)
   - Stelt een waypoint in naar de dichtstbijzijnde veilige locatie.

## Installatie

1. **Download of Clone de Repository**
   - Plaats de bestanden in een map genaamd `jp-aiassistant` binnen de `resources` directory van je FiveM-server.

2. **Voeg de Resource Toe aan `server.cfg`**
   - Voeg de volgende regel toe aan je `server.cfg`:
     ```
     ensure jp-aiassistant
     ```

3. **Start of Herstart de Server**
   - Herstart je server om het script te activeren.

## Commando's

### 1. `/aiauto`
- Gebruik dit commando in een voertuig om informatie te ontvangen, zoals:
  - Het model van het voertuig.
  - De huidige snelheid in km/u.
  - De status van de motor, inclusief advies.
  - Het brandstofniveau.

### 2. `/aiweer`
- Geeft een melding met het huidige weer in de spelwereld.

### 3. `/aiontsnap`
- Stelt een waypoint in naar de dichtstbijzijnde veilige locatie.
- Veilige locaties kunnen worden uitgebreid in het script.

## Configuratie

### Safe Locations (`/aiontsnap`)
De veilige locaties zijn vooraf gedefinieerd in het script. Voeg eenvoudig meer locaties toe door nieuwe coördinaten aan de lijst toe te voegen:
```lua
local safeLocations = {
    {x = 124.23, y = -1287.71, z = 29.27, label = "Schuilplaats 1"},
    {x = -303.91, y = -830.91, z = 32.42, label = "Schuilplaats 2"},
    {x = 895.35, y = -179.63, z = 74.70, label = "Schuilplaats 3"},
    {x = -1021.49, y = -2645.91, z = 13.76, label = "Schuilplaats 4"}
}
```

### Brandstofniveau
Als de server een brandstofsysteem gebruikt, wordt dit automatisch gedetecteerd via `DecorExistOn`. Als dit niet beschikbaar is, genereert het script een willekeurig brandstofpercentage.

## Bijdragen
Voel je vrij om bij te dragen aan dit project door pull requests in te dienen of nieuwe functies aan te vragen.

## Licentie
Dit script is vrij te gebruiken en aan te passen binnen jouw server. Geef wel credits aan de originele maker wanneer je dit deelt.

