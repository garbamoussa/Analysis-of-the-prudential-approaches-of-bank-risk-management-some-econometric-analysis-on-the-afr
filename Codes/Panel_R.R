library("ExPanDaR")
library("knitr")
library("tidyverse")
library("xlsx")
library("readxl")
library(readxl)
install.packages("IRdisplay")
data <- read_excel("/Users/garbamoussa/Desktop/Python_ML/Datathon_MIT/patterns_cty_week_overall_deaths_ses.xlsx")
head(data, n=10)
prepare_missing_values_graph(data, ts_id = "date")
t <- prepare_descriptive_table(data)
IRdisplay::display_html(htmltools::HTML(t$kable_ret))
graph <- prepare_trend_graph(data, ts_id = "date", "cases")
graph$plot
graph <- prepare_quantile_trend_graph(data, ts_id = "date", quantiles = c(0.05, 0.25, 0.5, 0.75, 0.95), 
                                      var = "cases")
graph$plot
t<- prepare_correlation_table(data, bold = 0.01, format="html")
IRdisplay::display_html(htmltools::HTML(t$kable_ret))
ret <- prepare_correlation_graph(data)
prepare_scatter_plot(data, x="deaths", y="cases", color="county", loess = 1)

data1 <- data
data1$date <- as.numeric(as.character(data1$date))
prepare_scatter_plot(data1, x="date", y="cases", color="county", loess = 1)
