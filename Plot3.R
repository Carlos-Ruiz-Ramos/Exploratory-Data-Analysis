
library(data.table)
library(png)
library(ggplot2)

setwd("C:/Users/ax25918/Desktop/Trainning/Coursera/Exploratory Data Analysis/Final")

SCC = readRDS("Source_Classification_Code.rds")
SumarySCC = readRDS("summarySCC_PM25.rds")

SCC = data.table(SCC)
SumarySCC = data.table(SumarySCC)

table(SumarySCC$type)

Datos = SumarySCC[fips == "24510", sum(Emissions),by=list(year,type)]
Datos$year= as.character(Datos$year)

names(Datos)[names(Datos) == "V1"] = "Emissions"

?ggplot

png("plot3.png",width=480,height=480)
ggplot(data=Datos, aes(x = year, y = Emissions, color=type))+
  geom_point()

dev.off()
