# Data-Workflow-LFDS

## Verzameling van data
De verzamelde data gaat over het gebruik van Blue Bikes in Gent, meerbepaald in de St. Denijslaan. De data werd verzameld door crontab te gebruiken in de terminal, zoals getoond in de les. Ik paste via "crontab -e" het bestand aan en zorgde ervoor dat de data elk uur gedownload werd, precies om 27 min na elk uur. De dataverzameling begon op 9/12/2022 om 14:27 en eindigde om 10/12/2022 13:27. Daarna werd het crontab bestand weer aangepast zodat de dataverzameling stopte. De bestanden werden dan opgeslagen via het script "scrapingbB.sh". Als we het script openen zien we dat er een variabele "output" gemaakt wordt die de JSON-files in een map "output" plaatst. De files krijgen allemaal de naam van de datum, wanneer ze gecreëerd werden.

## Omzetting van JSON- naar csv-file
Het script genaamd "json_to_csv.sh" is hier van toepassing. Als we kijken naar het script zien we dat er eerst een controle wordt uitgevoerd, we kijken of "jq" is geïnstalleerd op onze machine. Als dit niet het geval is, stopt het script en geeft het de gebruiker de gepaste melding dat jq niet geïnstalleerd is. Verder kijkt het script naar al de JSON-files in de map en vervolgens wordt het jq-commando uitgevoerd. Als we wat beter kijken naar het commando zien we dat er column headers gecreëerd worden, dit is later nodig. Al de data die afkomstig is van de JSON-files worden in 1 csv-file omgezet. Het gemaakte bestand wordt dan opgeslagen onder de naam "dataBikes.csv".

## Dubbele data er uit filteren
Als we het gemaakte csv-bestand openen zien we dat de column-headers telkens opnieuw voorkomen, want de verschillende getransformeerde JSON-files zijn in 1 csv-file geplaatst. We gebruiken hier het script "datakolomcleanerblueBikes.sh". Wanneer we het script openen zien we dat er eerst een controle uitgevoerd wordt. We zoeken in de map of het bestand "dataBikes.csv" aanwezig is, anders wordt de gepaste foutmelding weergeven. Aan de hand van "awk '!seen[$0]++'" wordt er op elke lijn van het volledige document gecontroleerd op dubbels. Vanaf dat het een lijn ziet die exact hetzelfde is als een vorige lijn wordt deze verwijderd. Zo wordt bv. niet dezelfde naam van een bestand ook gezien als om een dubbel omdat er andere waarden volgen op de lijn. Bv: 2022-12-09, 54, 6 en 2022-12-09, 47, 13. Het begin van de lijn is hetzelfde maar de volgende waarden zijn verschillend. Als alles overlopen is, wordt het bestand opgeslagen onder de naam "data-cleaned-headers.csv". Om de hoeveelheid aan bestanden te vermijden en om alles overzichtelijk te houden zorgen we ervoor dat het vorig bestand overschreven wordt. "dataBikes.csv" wordt dus het enige bestand dat opgeslagen wordt in ons map. "data-cleaned-headers.csv" wordt dus verwijderd.

## Een grafiek maken van de data
Om een grafiek van het csv-bestand te maken hebben we python nodig. Hiervoor hebben libraries matplotlib.pyplot en pandas nodig. De module pyplot in de matplotlib-library biedt functies voor het maken en aanpassen van verschillende soorten plots, waaronder: lijnplots, scatterplots, balkplots en meer. Het biedt ook functies voor het regelen van het algemene uiterlijk van de plots, zoals de grootte en de kleur van de plotelementen. Met pyplot kan je figuren van hoge kwaliteit maken die kunnen worden gebruikt voor publicatie of presentatie, of voor het verkennen en begrijpen van gegevens. 

Pandas fungeert als een wrapper over deze libraries, waardoor je veel van de methoden van matplotlib en NumPy met minder code kunt gebruiken. Zo combineert pandas' .plot() meerdere matplotlib-methodes in een enkele methode, zodat je in een paar regels de grafiek kan plotten.

We lezen ons csv bestand in de functie pd.read_csv('dataBikes.csv') en plaatsen die in de variabele "df". We creëren het staafdiagram via "df.plot(kind='bar')". Zo voegen we ook nog titels aan de assen toe en een hoofdtitel. Via "plt.show()" tonen we de grafiek die u dan kan opslaan.

Omdat we later een overkoepelend script maken plaatsen we de uitvoering van dit kleine py-programma in een script, genaamd "pythonToPhoto.sh", waar het commando staat om het py-programma te runnen.

## Rapport genereren
Wanneer we het script openen zien we dat we het csv-bestand inlezen onder de naam "csv_file". We transformeren het CSV- naar een md-bestand in de variable "md_file". Vervolgens gebruiken we IFS. IFS staat voor "Internal Field Separator". In een bash-script is het een speciale variabele die bepaalt hoe de velden (d.w.z. de afzonderlijke stukken gegevens) in een record worden herkend en gescheiden. Standaard is de IFS variabele ingesteld op een spatie, een tab en een newline teken, wat betekent dat velden in een record worden gescheiden door een van deze tekens. Je kan de waarde van de IFS-variabele echter wijzigen om andere tekens als veldscheidingsteken te gebruiken. Dit kan nuttig zijn in situaties waarin je gegevens moet verwerken die een ander formaat voor het scheiden van velden gebruiken. Zo kan je bijvoorbeeld de IFS-variabele instellen op een komma als u met een CSV-bestand werkt. Vervolgens slaan we het gemaakte bestand op onder dezelfde naam als het CSV-bestand.

## Overkoepelend script dat alles uitvoert
Om alles in één keer te laten uitvoeren maken we een Makefile-bestand. In het bestand maken we de variabele "all". In de variabele staan al de andere gemaakte variabelen die elk een script uitvoeren. Wanneer we in ons terminal "make all" schrijven wordt alles uitgevoerd. Voor "clean" wordt alles van gemaakte bestanden verwijdert zodat alles proper opgeruimd is.
