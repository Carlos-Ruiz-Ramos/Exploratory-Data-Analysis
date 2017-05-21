
library(data.table)
library(png)

setwd("C:/Users/ax25918/Desktop/Trainning/Coursera/Exploratory Data Analysis/Final")

SCC = readRDS("Source_Classification_Code.rds")
SumarySCC = readRDS("summarySCC_PM25.rds")

SCC = data.table(SCC)
SumarySCC = data.table(SumarySCC)

table(SumarySCC$fips)

Datos = SumarySCC[fips == 24510, sum(Emissions),by=year]

names(Datos)[names(Datos) == "V1"] = "Emissions"

?barplot

png("plot2.png",width=480,height=480)
barplot(Datos$Emissions, 
        Datos$year,
        legend.text = "total PM2.5 emission per year in Baltimore City, Maryland",
        xlab= "year",
        names.arg = Datos$year
        
)
dev.off()
