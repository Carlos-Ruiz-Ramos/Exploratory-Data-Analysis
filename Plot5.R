
library(data.table)
library(png)
library(ggplot2)

setwd("C:/Users/ax25918/Desktop/Trainning/Coursera/Exploratory Data Analysis/Final")

SCC = readRDS("Source_Classification_Code.rds")
SumarySCC = readRDS("summarySCC_PM25.rds")

SCC = data.table(SCC)
SumarySCC = data.table(SumarySCC)

setkey(SCC, SCC)
setkey(SumarySCC, SCC)

Datos = SCC[SumarySCC]

table(Datos$type)

Datos = Datos[type == "ON-ROAD",]  

table(Datos$EI.Sector)

Datos_Motor =Datos[fips == "24510",sum(Emissions), by=year]

names(Datos_Motor)[names(Datos_Motor) == "V1"] = "Emissions"

?ggplot

png("plot5.png",width=480,height=480)
barplot(Datos_Motor$Emissions, 
        Datos_Motor$year,
        legend.text = "total PM2.5 emission per year (Motor Vehicle)",
        xlab= "year",
        names.arg = Datos_Motor$year
        
)
dev.off()
