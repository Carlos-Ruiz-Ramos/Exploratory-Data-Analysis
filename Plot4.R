
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

Datos = Datos[,Coal := grepl("coal", Datos$Short.Name, ignore.case = TRUE),]

table(Datos[Coal == TRUE, Short.Name])

Datos_Coal =Datos[ Coal == TRUE,sum(Emissions), by=year]

names(Datos_Coal)[names(Datos_Coal) == "V1"] = "Emissions"

?ggplot

png("plot4.png",width=480,height=480)
barplot(Datos_Coal$Emissions, 
        Datos_Coal$year,
        legend.text = "total PM2.5 emission per year (Coal)",
        xlab= "year",
        names.arg = Datos_Coal$year
        
)
dev.off()
