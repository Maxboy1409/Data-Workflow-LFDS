all: jsonbB_to_csv datakolomcleanerblueBikes pythonToPhoto csv_to_md

jsonbB_to_csv:
	bash jsonbB_to_csv.sh -o dataBikes.csv

datakolomcleanerblueBikes:
	bash datakolomcleanerblueBikes.sh -o dataBikes.csv

pythonToPhoto:
	bash pythonToPhoto.sh

csv_to_md:
	bash csv_to_md.sh -o dataBikes.md

clean:
	rm -v dataBikes.csv dataBikes.md