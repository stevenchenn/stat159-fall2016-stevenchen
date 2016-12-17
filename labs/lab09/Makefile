.PHONY: all data clean

all: data eda-output.txt regression.RData report.html

data:
	curl http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv -o data/Advertising.csv

eda-output.txt: code/eda-script.R data/Advertising.csv
	R CMD BATCH code/eda-script.R

regression.RData: code/regression-script.R data/Advertising.csv
	R CMD BATCH code/regression-script.R

report.html: report/report.Rmd data/regression.RData images/scatterplot-tv-sales.png
	Rscript -e "library(rmarkdown); render('report/report.Rmd','pdf_document')"

clean:
	rm report/report.pdf
	rm *.Rout

