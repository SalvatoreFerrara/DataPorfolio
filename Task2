#!/usr/bin/env python3


# collection of data
data={
	"Sicilia":[37739,4999891,0],
	"Calabria":[8691,1947131,0],
	"Puglia":[54028,4029053,0],
	"Basilicata":[6345,562869,0],
	"Campania":[76343,5801692,0],
	"Molise":[1471,305617,0],
	"Sardegna":[16913,1639591,0],
	"Lazio":[77766,5879082,0],
	"Abruzzo":[11331,1311580,0],
	"Umbria":[2569,882015,0],
	"Marche":[13298,1525271,0],
	"Toscana":[9449,3729641,0],
	"Romagna":[58069,4459477,0],
	"Liguria":[6036,1550640,0],
	"Piemonte":[18415,4356046,0],
	"Valle d'Aosta":[1001,125666,0],
	"Lombardia":[52691,10060574,0],
	"Veneto":[91299,4905854,0],
	"Friuli-Venezia Giulia":[11830,1215220,0],
	"Trento":[2024,541098,0],
	"Bolzano":[11105,531178,0],
	"Italia":[568413,60359186,0]

}


l = []
# calculates the current positives per 100,000 inhabitants
for i in data:
	current=data[i]
	current[2] = int( current[0] * 100000 / current[1])
	l.append(data[i][2])

# sort the regions following the new calculate number and print result
l.sort(reverse=True)
j=0
while j < len(data.items())-2:
	for region,values in data.items():
		if l[j] == values[2] :
			print ("\n",region,"Positivi:",values[0],"Popolazione:",values[1],"Risultato:",values[2])
			j=j+1
