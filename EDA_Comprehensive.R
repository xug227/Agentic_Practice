#### EXPLORATORY DATA ANALYSIS
#### Customer Satisfaction Survey Data
#### Comprehensive Univariate and Bivariate Analysis

# Load data
park <- read.csv("customer satisfaction.csv")

# ============================================================================
# SECTION 1: DATA OVERVIEW AND SUMMARY STATISTICS
# ============================================================================

cat("\n=== DATASET DIMENSIONS ===\n")
print(dim(park))
cat("Rows:", nrow(park), "| Columns:", ncol(park), "\n")

cat("\n=== DATA STRUCTURE ===\n")
str(park)

cat("\n=== FIRST FEW OBSERVATIONS ===\n")
head(park, 10)

cat("\n=== SUMMARY STATISTICS ===\n")
summary(park)

# ============================================================================
# SECTION 2: DETAILED DESCRIPTIVE STATISTICS
# ============================================================================

cat("\n=== DESCRIPTIVE STATISTICS (DETAILED) ===\n")

# Install and load psych for more detailed statistics
install.packages("psych", quiet=TRUE)
library(psych)

describe(park)

# ============================================================================
# SECTION 3: UNIVARIATE DISTRIBUTIONS
# ============================================================================

cat("\n=== UNIVARIATE ANALYSIS ===\n")

# Create a comprehensive visualization layout
par(mfrow=c(3, 3), mar=c(4, 4, 2, 1))

# Categorical: weekend
barplot(table(park$weekend), main="Distribution of Weekend Visits", 
        col=c("steelblue", "coral"), border="black")
text(1:2, table(park$weekend) + 1, table(park$weekend), cex=1.2, font=2)

# Numerical variables: histograms with density
hist(park$num.child, main="Number of Children", xlab="Count", col="lightblue", 
     breaks=seq(0, max(park$num.child)+1, by=1), border="black")

hist(park$distance, main="Distance Traveled", xlab="Miles", col="lightgreen", 
     breaks=20, border="black")

hist(park$rides, main="Rides Satisfaction", xlab="Rating (0-100)", col="lightyellow", 
     breaks=15, border="black")

hist(park$games, main="Games Satisfaction", xlab="Rating (0-100)", col="lightcyan", 
     breaks=15, border="black")

hist(park$wait, main="Wait Time Satisfaction", xlab="Rating (0-100)", col="lightpink", 
     breaks=15, border="black")

hist(park$clean, main="Cleanliness Satisfaction", xlab="Rating (0-100)", col="plum", 
     breaks=15, border="black")

hist(park$overall, main="Overall Satisfaction", xlab="Rating (0-100)", col="lightsalmon", 
     breaks=15, border="black")

# Empty plot for alignment
plot.new()

# ============================================================================
# SECTION 4: DISTRIBUTION CHARACTERISTICS
# ============================================================================

cat("\n=== SKEWNESS AND KURTOSIS ===\n")
print(describe(park))

# ============================================================================
# SECTION 5: BOXPLOTS FOR UNIVARIATE ANALYSIS
# ============================================================================

par(mfrow=c(2, 3), mar=c(4, 4, 2, 1))

boxplot(park$distance, main="Distance Distribution", ylab="Miles", 
        col="lightblue", border="black")
boxplot(park$rides, main="Rides Satisfaction", ylab="Rating", 
        col="lightyellow", border="black")
boxplot(park$games, main="Games Satisfaction", ylab="Rating", 
        col="lightcyan", border="black")
boxplot(park$wait, main="Wait Time Satisfaction", ylab="Rating", 
        col="lightpink", border="black")
boxplot(park$clean, main="Cleanliness Satisfaction", ylab="Rating", 
        col="plum", border="black")
boxplot(park$overall, main="Overall Satisfaction", ylab="Rating", 
        col="lightsalmon", border="black")

# ============================================================================
# SECTION 6: CORRELATION ANALYSIS
# ============================================================================

cat("\n=== CORRELATION MATRIX ===\n")

# Select only numeric variables
numeric_vars <- park[, c("num.child", "distance", "rides", "games", "wait", "clean", "overall")]
cor_matrix <- cor(numeric_vars)
print(cor_matrix)

cat("\n=== CORRELATION WITH OVERALL SATISFACTION ===\n")
overall_cor <- cor_matrix[, "overall"]
overall_cor_sorted <- sort(overall_cor, decreasing=TRUE)
print(overall_cor_sorted)

# Visualize correlation matrix
install.packages("corrplot", quiet=TRUE)
library(corrplot)

par(mfrow=c(1, 1), mar=c(5, 5, 3, 1))
corrplot.mixed(cor_matrix, upper="ellipse", lower="number", 
               diag="none", main="Correlation Matrix: All Numeric Variables")

# ============================================================================
# SECTION 7: BIVARIATE RELATIONSHIPS
# ============================================================================

cat("\n=== BIVARIATE ANALYSIS ===\n")

# Satisfaction dimensions vs Overall satisfaction
par(mfrow=c(2, 2), mar=c(4, 4, 2, 1))

plot(park$rides, park$overall, main="Rides vs Overall Satisfaction", 
     xlab="Rides Rating", ylab="Overall Rating", col="steelblue", pch=16, cex=1.2)
abline(lm(park$overall ~ park$rides), col="red", lwd=2)

plot(park$games, park$overall, main="Games vs Overall Satisfaction", 
     xlab="Games Rating", ylab="Overall Rating", col="steelblue", pch=16, cex=1.2)
abline(lm(park$overall ~ park$games), col="red", lwd=2)

plot(park$wait, park$overall, main="Wait Time vs Overall Satisfaction", 
     xlab="Wait Time Rating", ylab="Overall Rating", col="steelblue", pch=16, cex=1.2)
abline(lm(park$overall ~ park$wait), col="red", lwd=2)

plot(park$clean, park$overall, main="Cleanliness vs Overall Satisfaction", 
     xlab="Cleanliness Rating", ylab="Overall Rating", col="steelblue", pch=16, cex=1.2)
abline(lm(park$overall ~ park$clean), col="red", lwd=2)

# Distance vs Overall satisfaction
par(mfrow=c(1, 2), mar=c(4, 4, 2, 1))

plot(park$distance, park$overall, main="Distance vs Overall Satisfaction", 
     xlab="Distance (miles)", ylab="Overall Rating", col="steelblue", pch=16, cex=1.2)
abline(lm(park$overall ~ park$distance), col="red", lwd=2)

# Number of children effect
plot(park$num.child, park$overall, main="Number of Children vs Overall Satisfaction", 
     xlab="Number of Children", ylab="Overall Rating", col="steelblue", pch=16, cex=1.2)
abline(lm(park$overall ~ park$num.child), col="red", lwd=2)

# ============================================================================
# SECTION 8: CATEGORICAL VS CONTINUOUS ANALYSIS
# ============================================================================

cat("\n=== WEEKEND EFFECT ON OVERALL SATISFACTION ===\n")

weekend_stats <- tapply(park$overall, park$weekend, function(x) {
  c(Mean = mean(x), Median = median(x), SD = sd(x), N = length(x))
})
print(weekend_stats)

par(mfrow=c(1, 2), mar=c(4, 4, 2, 1))

# Boxplot: Weekend effect
boxplot(park$overall ~ park$weekend, main="Overall Satisfaction by Weekend Visit", 
        ylab="Overall Rating", col=c("steelblue", "coral"), border="black")

# Boxplot: All satisfaction metrics by weekend
park_melted_weekend <- data.frame(
  value = c(park$rides, park$games, park$wait, park$clean),
  metric = rep(c("Rides", "Games", "Wait", "Clean"), each=nrow(park)),
  weekend = rep(park$weekend, 4)
)

# ============================================================================
# SECTION 9: OUTLIER DETECTION
# ============================================================================

cat("\n=== OUTLIER DETECTION (IQR METHOD) ===\n")

detect_outliers <- function(x, name) {
  Q1 <- quantile(x, 0.25)
  Q3 <- quantile(x, 0.75)
  IQR <- Q3 - Q1
  lower_bound <- Q1 - 1.5*IQR
  upper_bound <- Q3 + 1.5*IQR
  
  outliers <- which(x < lower_bound | x > upper_bound)
  
  cat("\n", name, ":\n")
  cat("  Lower bound:", round(lower_bound, 2), "\n")
  cat("  Upper bound:", round(upper_bound, 2), "\n")
  cat("  Number of outliers:", length(outliers), "\n")
  
  if(length(outliers) > 0) {
    cat("  Indices:", paste(outliers, collapse=", "), "\n")
  }
}

detect_outliers(park$distance, "Distance")
detect_outliers(park$num.child, "Number of Children")
detect_outliers(park$rides, "Rides Satisfaction")
detect_outliers(park$games, "Games Satisfaction")
detect_outliers(park$wait, "Wait Time Satisfaction")
detect_outliers(park$clean, "Cleanliness Satisfaction")
detect_outliers(park$overall, "Overall Satisfaction")

# ============================================================================
# SECTION 10: KEY STATISTICS FOR REPORTING
# ============================================================================

cat("\n=== SATISFACTION METRICS SUMMARY ===\n")

satisfaction_vars <- c("rides", "games", "wait", "clean", "overall")
for (var in satisfaction_vars) {
  cat("\n", toupper(var), ":\n")
  cat("  Mean:", round(mean(park[[var]]), 2), "\n")
  cat("  Median:", round(median(park[[var]]), 2), "\n")
  cat("  Std Dev:", round(sd(park[[var]]), 2), "\n")
  cat("  Min:", min(park[[var]]), "\n")
  cat("  Max:", max(park[[var]]), "\n")
  cat("  Range:", max(park[[var]]) - min(park[[var]]), "\n")
}

# ============================================================================
# SECTION 11: SEGMENTATION ANALYSIS
# ============================================================================

cat("\n=== SATISFACTION BY TRIP DISTANCE QUARTILES ===\n")

park$distance_quartile <- cut(park$distance, breaks=quantile(park$distance), 
                               labels=c("Q1 (Closest)", "Q2", "Q3", "Q4 (Farthest)"),
                               include.lowest=TRUE)

distance_seg <- tapply(park$overall, park$distance_quartile, function(x) {
  c(Mean = mean(x), Median = median(x), N = length(x), SD = sd(x))
})
print(distance_seg)

par(mfrow=c(1, 1), mar=c(5, 4, 2, 1))
boxplot(park$overall ~ park$distance_quartile, 
        main="Overall Satisfaction by Distance to Park",
        ylab="Overall Rating", xlab="Distance Quartile",
        col=c("lightgreen", "lightyellow", "lightblue", "lightcoral"),
        border="black")

cat("\n=== EDA COMPLETE ===\n")
