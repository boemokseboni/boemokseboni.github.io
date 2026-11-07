# Step 1: Install  & Load the Package
# install.packages("quantmod")
library(quantmod)

# Step 2: Get Data from the internet
# Collect stock data (Yahoo finance default)
getSymbols("MSFT")
Microsoft <- getSymbols("MSFT", auto.assign = F) # create a variable and label name

# Collect Economic Data from FRED
Unemployment <- getSymbols("UNRATE", src = 'FRED', 
                           from = "2016-01-01", to = "2026-01-01", auto.assign = F)

# Step 3: Data Exploration
Cl(Microsoft) # Extract Closing Price Column
Ad(Microsoft) # Extract Adj Price Column
summary(Microsoft)
summary(Unemployment)

# Step 4: Visualization
# line chart displaying unemployment rate
chartSeries(Unemployment,
            theme = 'white', 
            name = "U.S. Unemployment Rate")   # Title of chart

# candlestick chart
chartSeries(Microsoft, 
            subset = '2016-09', # Specify a date range
            theme = "white",
            name = "Microsoft Stock Price Sept 2016")

# Adding indicators to the chart
chartSeries(Microsoft,
            subset = '2020',
            theme = "white",
            name = "Microsoft with Moving Averages")
addSMA(n = 20)   # 20 day moving average
addSMA(n = 50, col = "blue") # 50 day moving average

# Step 5: Calculating Returns
yearlyReturn(Microsoft)

Microsoft_2020 <- monthlyReturn(Microsoft['2020'])  # Monthly returns for 2020 only
round(Microsoft_2020 * 100, 2) # formatting
