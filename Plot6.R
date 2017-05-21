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

Datos = Datos[,Motor := grepl("vehicles", Datos$Short.Name, ignore.case = TRUE),]

Datos_Motor =Datos[(fips == "24510" | fips == "06037"),sum(Emissions), by=list(year,fips)]

names(Datos_Motor)[names(Datos_Motor) == "V1"] = "Emissions"

?ggplot

png("plot6.png",width=480,height=480)
ggplot(data=Datos_Motor, aes(x = year, y = Emissions, color=fips))+
  geom_point()

dev.off()
