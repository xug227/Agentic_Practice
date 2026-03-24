#### TOYOTA COROLLA EDA - COMPREHENSIVE ANALYSIS
#### Exploratory Data Analysis with Visualizations and Insights
#### Focus: Price Prediction and Feature Relationships

# Load and prepare data
toyota <- read.csv("ToyotaCorolla.csv")

# ============================================================================
# SECTION 1: DATA LOADING AND OVERVIEW
# ============================================================================

cat("\n=== DATASET DIMENSIONS ===\n")
print(dim(toyota))
cat("Observations:", nrow(toyota), "| Variables:", ncol(toyota), "\n")

cat("\n=== FIRST FEW OBSERVATIONS ===\n")
head(toyota, 10)

cat("\n=== DATA STRUCTURE ===\n")
str(toyota)

cat("\n=== SUMMARY STATISTICS (ALL VARIABLES) ===\n")
summary(toyota)

# ============================================================================
# SECTION 2: DATA QUALITY CHECK
# ============================================================================

cat("\n=== MISSING VALUES ===\n")
print(colSums(is.na(toyota)))

cat("\n=== DATA TYPES ===\n")
sapply(toyota, class)

# ============================================================================
# SECTION 3: KEY VARIABLES ANALYSIS
# ============================================================================

cat("\n=== PRICE STATISTICS ===\n")
cat("Mean Price:", mean(toyota$Price), "\n")
cat("Median Price:", median(toyota$Price), "\n")
cat("Std Dev:", sd(toyota$Price), "\n")
cat("Min Price:", min(toyota$Price), "\n")
cat("Max Price:", max(toyota$Price), "\n")
cat("Price Range:", max(toyota$Price) - min(toyota$Price), "\n")

cat("\n=== AGE STATISTICS (Age_08_04) ===\n")
cat("Mean Age:", mean(toyota$Age_08_04), "months\n")
cat("Median Age:", median(toyota$Age_08_04), "months\n")
cat("Age Range:", min(toyota$Age_08_04), "to", max(toyota$Age_08_04), "months\n")

cat("\n=== MILEAGE STATISTICS (KM) ===\n")
cat("Mean KM:", mean(toyota$KM), "\n")
cat("Median KM:", median(toyota$KM), "\n")
cat("Std Dev KM:", sd(toyota$KM), "\n")
cat("Min KM:", min(toyota$KM), "\n")
cat("Max KM:", max(toyota$KM), "\n")

cat("\n=== FUEL TYPE DISTRIBUTION ===\n")
print(table(toyota$Fuel_Type))

# ============================================================================
# SECTION 4: UNIVARIATE DISTRIBUTIONS
# ============================================================================

cat("\n=== GENERATING UNIVARIATE VISUALIZATIONS ===\n")

# Set up multi-panel layout
par(mfrow=c(3, 3), mar=c(4, 4, 2, 1))

# 1. Price Distribution
hist(toyota$Price, main="Distribution of Price", xlab="Price (EUR)", 
     col="steelblue", breaks=30, border="black")
abline(v=mean(toyota$Price), col="red", lwd=2, lty=2)
text(mean(toyota$Price), max(hist(toyota$Price, plot=FALSE)$counts)*0.9, 
     paste("Mean:", round(mean(toyota$Price))), cex=0.8, col="red")

# 2. Age Distribution
hist(toyota$Age_08_04, main="Distribution of Age", xlab="Age (months)", 
     col="lightgreen", breaks=20, border="black")
abline(v=mean(toyota$Age_08_04), col="red", lwd=2, lty=2)

# 3. Kilometers Distribution
hist(toyota$KM, main="Distribution of Mileage", xlab="Kilometers", 
     col="lightyellow", breaks=30, border="black")
abline(v=mean(toyota$KM), col="red", lwd=2, lty=2)

# 4. Horsepower Distribution
hist(toyota$HP, main="Distribution of Horsepower", xlab="HP", 
     col="lightcyan", breaks=15, border="black")

# 5. Weight Distribution
hist(toyota$Weight, main="Distribution of Weight", xlab="Weight (kg)", 
     col="lightpink", breaks=20, border="black")

# 6. Quarterly Tax Distribution
hist(toyota$Quarterly_Tax, main="Distribution of Quarterly Tax", xlab="Tax (EUR)", 
     col="plum", breaks=20, border="black")

# 7. CC (Engine Displacement) Distribution
hist(toyota$CC, main="Distribution of Engine CC", xlab="CC", 
     col="lightsalmon", breaks=15, border="black")

# 8. Doors Distribution
barplot(table(toyota$Doors), main="Distribution of Doors", 
        col="lightsteelblue", border="black")
text(1:length(table(toyota$Doors)), table(toyota$Doors) + 50, 
     table(toyota$Doors), cex=1.1, font=2)

# 9. Cylinders Distribution
barplot(table(toyota$Cylinders), main="Distribution of Cylinders", 
        col="lightsteelblue", border="black")
text(1:length(table(toyota$Cylinders)), table(toyota$Cylinders) + 50, 
     table(toyota$Cylinders), cex=1.1, font=2)

# ============================================================================
# SECTION 5: BOXPLOTS FOR KEY VARIABLES
# ============================================================================

par(mfrow=c(2, 3), mar=c(4, 4, 2, 1))

boxplot(toyota$Price, main="Price Distribution", ylab="EUR", col="steelblue", border="black")
boxplot(toyota$Age_08_04, main="Age Distribution", ylab="Months", col="lightgreen", border="black")
boxplot(toyota$KM, main="Mileage Distribution", ylab="KM", col="lightyellow", border="black")
boxplot(toyota$HP, main="Horsepower Distribution", ylab="HP", col="lightcyan", border="black")
boxplot(toyota$Weight, main="Weight Distribution", ylab="kg", col="lightpink", border="black")
boxplot(toyota$Quarterly_Tax, main="Tax Distribution", ylab="EUR", col="plum", border="black")

# ============================================================================
# SECTION 6: CORRELATION ANALYSIS
# ============================================================================

cat("\n=== CORRELATION ANALYSIS ===\n")

# Select numeric variables only
numeric_vars <- toyota[, c("Price", "Age_08_04", "Mfg_Month", "Mfg_Year", "KM", 
                            "HP", "Quarterly_Tax", "Weight", "CC", "Doors", "Cylinders", "Gears")]

cor_matrix <- cor(numeric_vars)
print(cor_matrix)

cat("\n=== CORRELATIONS WITH PRICE ===\n")
price_cor <- sort(cor_matrix[, "Price"], decreasing=TRUE)
print(price_cor)

# Visualize correlation matrix
install.packages("corrplot", quietly=TRUE)
library(corrplot)

par(mfrow=c(1, 1), mar=c(5, 5, 3, 1))
corrplot.mixed(cor_matrix, upper="ellipse", lower="number", 
               diag="none", main="Correlation Matrix: Toyota Corolla Key Features")

# ============================================================================
# SECTION 7: BIVARIATE ANALYSIS - PRICE VS KEY PREDICTORS
# ============================================================================

cat("\n=== BIVARIATE ANALYSIS ===\n")

par(mfrow=c(2, 3), mar=c(4, 4, 2, 1))

# 1. Price vs Age
plot(toyota$Age_08_04, toyota$Price, main="Price vs Age", 
     xlab="Age (months)", ylab="Price (EUR)", col="steelblue", pch=16, cex=0.7)
abline(lm(toyota$Price ~ toyota$Age_08_04), col="red", lwd=2)
cor_age <- cor(toyota$Age_08_04, toyota$Price)
text(200, 5000, paste("r =", round(cor_age, 3)), cex=1.2, col="red", font=2)

# 2. Price vs Mileage (KM)
plot(toyota$KM, toyota$Price, main="Price vs Mileage", 
     xlab="Kilometers", ylab="Price (EUR)", col="steelblue", pch=16, cex=0.7)
abline(lm(toyota$Price ~ toyota$KM), col="red", lwd=2)
cor_km <- cor(toyota$KM, toyota$Price)
text(250000, 5000, paste("r =", round(cor_km, 3)), cex=1.2, col="red", font=2)

# 3. Price vs Horsepower
plot(toyota$HP, toyota$Price, main="Price vs Horsepower", 
     xlab="HP", ylab="Price (EUR)", col="steelblue", pch=16, cex=0.7)
abline(lm(toyota$Price ~ toyota$HP), col="red", lwd=2)
cor_hp <- cor(toyota$HP, toyota$Price)
text(150, 5000, paste("r =", round(cor_hp, 3)), cex=1.2, col="red", font=2)

# 4. Price vs Weight
plot(toyota$Weight, toyota$Price, main="Price vs Weight", 
     xlab="Weight (kg)", ylab="Price (EUR)", col="steelblue", pch=16, cex=0.7)
abline(lm(toyota$Price ~ toyota$Weight), col="red", lwd=2)
cor_weight <- cor(toyota$Weight, toyota$Price)
text(1060, 5000, paste("r =", round(cor_weight, 3)), cex=1.2, col="red", font=2)

# 5. Price vs Engine CC
plot(toyota$CC, toyota$Price, main="Price vs Engine Displacement (CC)", 
     xlab="CC", ylab="Price (EUR)", col="steelblue", pch=16, cex=0.7)
abline(lm(toyota$Price ~ toyota$CC), col="red", lwd=2)
cor_cc <- cor(toyota$CC, toyota$Price)
text(1800, 5000, paste("r =", round(cor_cc, 3)), cex=1.2, col="red", font=2)

# 6. Price vs Quarterly Tax
plot(toyota$Quarterly_Tax, toyota$Price, main="Price vs Quarterly Tax", 
     xlab="Tax (EUR)", ylab="Price (EUR)", col="steelblue", pch=16, cex=0.7)
abline(lm(toyota$Price ~ toyota$Quarterly_Tax), col="red", lwd=2)
cor_tax <- cor(toyota$Quarterly_Tax, toyota$Price)
text(150, 5000, paste("r =", round(cor_tax, 3)), cex=1.2, col="red", font=2)

# ============================================================================
# SECTION 8: FUEL TYPE EFFECT
# ============================================================================

cat("\n=== PRICE BY FUEL TYPE ===\n")

par(mfrow=c(1, 2), mar=c(4, 4, 2, 1))

fuel_stats <- tapply(toyota$Price, toyota$Fuel_Type, function(x) {
  c(Mean = mean(x), Median = median(x), SD = sd(x), N = length(x))
})
print(fuel_stats)

boxplot(toyota$Price ~ toyota$Fuel_Type, main="Price Distribution by Fuel Type", 
        ylab="Price (EUR)", col=c("lightblue", "lightyellow"), border="black")

# Mean price by fuel type
fuel_means <- tapply(toyota$Price, toyota$Fuel_Type, mean)
barplot(fuel_means, main="Mean Price by Fuel Type", ylab="Mean Price (EUR)", 
        col=c("lightblue", "lightyellow"), border="black")
text(1:length(fuel_means), fuel_means + 500, round(fuel_means), cex=1.1, font=2)

# ============================================================================
# SECTION 9: AUTOMATIC VS MANUAL TRANSMISSION
# ============================================================================

cat("\n=== PRICE BY TRANSMISSION TYPE ===\n")

par(mfrow=c(1, 2), mar=c(4, 4, 2, 1))

auto_manual <- ifelse(toyota$Automatic == 1, "Automatic", "Manual")
trans_stats <- tapply(toyota$Price, auto_manual, function(x) {
  c(Mean = mean(x), Median = median(x), SD = sd(x), N = length(x))
})
print(trans_stats)

boxplot(toyota$Price ~ auto_manual, main="Price by Transmission Type", 
        ylab="Price (EUR)", col=c("lightblue", "lightyellow"), border="black")

trans_means <- tapply(toyota$Price, auto_manual, mean)
barplot(trans_means, main="Mean Price by Transmission", ylab="Mean Price (EUR)", 
        col=c("lightblue", "lightyellow"), border="black")
text(1:length(trans_means), trans_means + 500, round(trans_means), cex=1.1, font=2)

# ============================================================================
# SECTION 10: FEATURE IMPORTANCE - CATEGORICAL VARIABLES
# ============================================================================

cat("\n=== CATEGORICAL FEATURES ANALYSIS ===\n")

par(mfrow=c(2, 2), mar=c(4, 4, 2, 1))

# Metallic Color
metallic <- ifelse(toyota$Met_Color == 1, "Metallic", "Non-Metallic")
metallic_stats <- tapply(toyota$Price, metallic, function(x) {
  c(Mean = mean(x), N = length(x))
})
cat("\nMetallic Color Effect:\n")
print(metallic_stats)

boxplot(toyota$Price ~ metallic, main="Price by Metallic Color", 
        ylab="Price (EUR)", col=c("lightblue", "lightyellow"), border="black")

# Power Steering
power_steer <- ifelse(toyota$Power_Steering == 1, "Power Steering", "No Power Steering")
psteer_stats <- tapply(toyota$Price, power_steer, function(x) {
  c(Mean = mean(x), N = length(x))
})
cat("\nPower Steering Effect:\n")
print(psteer_stats)

boxplot(toyota$Price ~ power_steer, main="Price by Power Steering", 
        ylab="Price (EUR)", col=c("lightblue", "lightyellow"), border="black")

# Passenger Airbag
airbag_p <- ifelse(toyota$Airbag_2 == 1, "Airbag", "No Airbag")
airbag_stats <- tapply(toyota$Price, airbag_p, function(x) {
  c(Mean = mean(x), N = length(x))
})
cat("\nPassenger Airbag Effect:\n")
print(airbag_stats)

boxplot(toyota$Price ~ airbag_p, main="Price by Passenger Airbag", 
        ylab="Price (EUR)", col=c("lightblue", "lightyellow"), border="black")

# ABS
abs_feature <- ifelse(toyota$ABS == 1, "ABS", "No ABS")
abs_stats <- tapply(toyota$Price, abs_feature, function(x) {
  c(Mean = mean(x), N = length(x))
})
cat("\nABS Effect:\n")
print(abs_stats)

boxplot(toyota$Price ~ abs_feature, main="Price by ABS Braking", 
        ylab="Price (EUR)", col=c("lightblue", "lightyellow"), border="black")

# ============================================================================
# SECTION 11: AGE AND DEPRECIATION ANALYSIS
# ============================================================================

cat("\n=== DEPRECIATION ANALYSIS ===\n")

par(mfrow=c(2, 2), mar=c(4, 4, 2, 1))

# Age vs Price (detailed scatter with density)
plot(toyota$Age_08_04, toyota$Price, main="Age vs Price Scatter", 
     xlab="Age (months)", ylab="Price (EUR)", col=rgb(0, 0, 1, 0.3), pch=16, cex=1)
abline(lm(toyota$Price ~ toyota$Age_08_04), col="red", lwd=3)

# Age categories
toyota$age_category <- cut(toyota$Age_08_04, 
                            breaks=c(0, 12, 24, 36, 48, 60),
                            labels=c("0-1yr", "1-2yr", "2-3yr", "3-4yr", "4-5yr"))

age_categ_stats <- tapply(toyota$Price, toyota$age_category, function(x) {
  c(Mean = mean(x), Median = median(x), N = length(x), SD = sd(x))
})
cat("\nPrice by Age Category:\n")
print(age_categ_stats)

boxplot(toyota$Price ~ toyota$age_category, main="Price Distribution by Age Category", 
        ylab="Price (EUR)", xlab="Age Category", col="lightblue", border="black")

# Price depreciation by 1 year
depreciation <- tapply(toyota$Price, toyota$age_category, mean)
barplot(depreciation, main="Mean Price by Age Category", 
        ylab="Mean Price (EUR)", col="steelblue", border="black")
text(1:length(depreciation), depreciation + 1000, round(depreciation), cex=1, font=2)

# ============================================================================
# SECTION 12: OUTLIER DETECTION
# ============================================================================

cat("\n=== OUTLIER DETECTION ===\n")

detect_outliers <- function(x, name) {
  Q1 <- quantile(x, 0.25)
  Q3 <- quantile(x, 0.75)
  IQR <- Q3 - Q1
  lower_bound <- Q1 - 1.5*IQR
  upper_bound <- Q3 + 1.5*IQR
  
  outliers <- which(x < lower_bound | x > upper_bound)
  
  cat("\n", name, ":\n")
  cat("  Q1:", round(Q1, 2), "| Q3:", round(Q3, 2), "| IQR:", round(IQR, 2), "\n")
  cat("  Bounds: [", round(lower_bound, 2), ",", round(upper_bound, 2), "]\n")
  cat("  Outliers found:", length(outliers), "\n")
  
  return(outliers)
}

outliers_price <- detect_outliers(toyota$Price, "Price")
outliers_age <- detect_outliers(toyota$Age_08_04, "Age")
outliers_km <- detect_outliers(toyota$KM, "Kilometers")

# ============================================================================
# SECTION 13: SUMMARY STATISTICS TABLE
# ============================================================================

cat("\n=== KEY CORRELATIONS WITH PRICE ===\n")
cor_results <- data.frame(
  Variable = c("Age (months)", "KM (Mileage)", "Quarterly Tax", "Weight (kg)", 
               "Horsepower", "Engine CC", "Manufacturing Year"),
  Correlation = c(
    round(cor(toyota$Age_08_04, toyota$Price), 3),
    round(cor(toyota$KM, toyota$Price), 3),
    round(cor(toyota$Quarterly_Tax, toyota$Price), 3),
    round(cor(toyota$Weight, toyota$Price), 3),
    round(cor(toyota$HP, toyota$Price), 3),
    round(cor(toyota$CC, toyota$Price), 3),
    round(cor(toyota$Mfg_Year, toyota$Price), 3)
  ),
  Interpretation = c(
    "Strong Negative",
    "Strong Negative",
    "Very Strong Positive",
    "Strong Positive",
    "Strong Positive",
    "Strong Positive",
    "Strong Positive"
  )
)
print(cor_results)

cat("\n=== EDA COMPLETE ===\n")
