# Customer Satisfaction Analysis: Simple Linear Regression
## BUAN 348/448 - Week 4

---

## Objective

This analysis aims to identify the primary drivers of overall customer satisfaction at an amusement park through simple linear regression modeling. Specifically, we examine the relationship between ride satisfaction ratings and overall park satisfaction.

---

## Dataset Description

The analysis utilizes customer satisfaction survey data collected from amusement park visitors. The dataset contains the following variables:

| Variable | Description | Scale |
|----------|-------------|-------|
| **weekend** | Whether the respondent visited on a weekend | Binary |
| **num.child** | Number of children accompanying the visitor | Count |
| **distance** | Distance traveled to reach the park | Numeric |
| **rides** | Satisfaction with rides | 0-100 |
| **games** | Satisfaction with games | 0-100 |
| **wait** | Satisfaction with waiting times | 0-100 |
| **clean** | Satisfaction with cleanliness | 0-100 |
| **overall** | Overall park satisfaction | 0-100 |

---

## Methodology

### 1. Exploratory Data Analysis

**Step 1: Scatter Plot Matrix**

A comprehensive scatterplot matrix was generated to visualize relationships between all variables. Fitted lines overlaid on the scatterplots reveal the nature and strength of linear relationships between predictors and the response variable.

### 2. Data Transformation

Two transformation approaches were applied to improve linearity and model fit:

#### Log Transformation
- Applied to the variable `distance` to linearize its relationship with overall satisfaction
- Formula: `logDistance = ln(distance)`
- Result: Improved visualization of the distance-satisfaction relationship

#### Box-Cox Transformation
- A more sophisticated approach to normalize non-linear distributions
- The optimal power transformation coefficient was calculated: **λ = 0.0515469**
- This coefficient was applied to create the transformed variable `bcDistance`
- **Benefit**: This flexible method handles multiple distribution types more effectively than simple log transformation

### 3. Correlation Analysis

**Cohen's Rules of Thumb for Correlation Magnitude:**

| Correlation Range | Interpretation |
|-------------------|-----------------|
| \|r\| ≤ 0.1 | Small (but noteworthy) |
| \|r\| ≤ 0.3 | Medium |
| \|r\| ≥ 0.5 | Large (observable to casual observer) |

A correlation matrix was computed for all continuous variables, and relationships were visualized using an enhanced mixed corrplot. This provides insight into which satisfaction dimensions most strongly associate with overall satisfaction.

### 4. Variable Selection

Based on initial exploratory analysis, **ride satisfaction** was selected as the primary predictor variable due to:
- Strong linear relationship with overall satisfaction
- Clear positive correlation
- Amenability to interpretation and business application

---

## Model Specification

A simple linear regression model was fitted with the following specification:

$$\text{overall satisfaction} = \beta_0 + \beta_1 \times \text{rides satisfaction} + \epsilon$$

### Estimated Model

$$\text{overall satisfaction} = -94.962 + 1.703 \times \text{rides satisfaction}$$

**Interpretation:**
- **Intercept (-94.962)**: Theoretical overall satisfaction when ride satisfaction is zero (not practically meaningful)
- **Slope (1.703)**: For each unit increase in ride satisfaction rating, overall satisfaction increases by approximately 1.70 points on average

---

## Model Assessment

### Key Regression Results

The model demonstrates:

- **R-squared value**: Indicates the proportion of variance in overall satisfaction explained by ride satisfaction
- **T-statistic**: Assesses the statistical significance of the ride satisfaction coefficient
- **Model significance**: The relationship between ride satisfaction and overall satisfaction is statistically significant

### Model Fit and Validity

The positive slope coefficient confirms the expected relationship: visitors who rate rides highly also tend to rate overall park satisfaction more favorably. The scatter plot visualization confirmed linearity of this relationship, validating the appropriateness of the linear regression approach.

---

## Predictions

### Example Prediction

For a visitor providing a ride satisfaction rating of **90/100**:

$$\text{Predicted Overall Satisfaction} = -94.962 + 1.703 \times 90 = 58.33$$

**Interpretation**: A visitor with a ride satisfaction rating of 90 is predicted to have an overall park satisfaction rating of approximately **58.33 out of 100**.

---

## Key Findings

1. **Ride Satisfaction is a Key Driver**: Ride quality demonstrates a strong, statistically significant positive relationship with overall park satisfaction.

2. **Quantifiable Relationship**: The regression model enables precise prediction of overall satisfaction based on ride satisfaction scores.

3. **Linear Relationship**: The scatter plot analysis confirms the appropriateness of linear regression methodology for this relationship.

4. **Practical Application**: The model provides actionable insights for park management regarding the importance of ride maintenance and enhancement.

---

## Important Caveats

### Correlation vs. Causation

**This analysis identifies observed correlation, not causal relationships.** While the data show that visitors satisfied with rides tend to be more satisfied overall, this does not imply that:

- Investing in new rides will definitively increase overall satisfaction
- Ride improvements are the only factor driving overall satisfaction
- Other factors (cleanliness, wait times, games) are less important

The model is specifically designed for **predictive purposes**, not for causal inference or investment decision-making without additional context and domain expertise.

### Limitations

- Analysis considers only ride satisfaction as a predictor; a multivariate model would provide a more complete picture
- The relationship may vary across visitor segments (e.g., families vs. couples)
- External factors not captured in survey data may influence satisfaction
- The model assumes the observed relationship remains stable over time

---

## Conclusion

This analysis successfully demonstrates the application of simple linear regression to identify customer satisfaction drivers. Ride satisfaction emerges as a significant predictor of overall park satisfaction, providing a quantifiable basis for understanding visitor experiences. However, comprehensive park satisfaction improvement strategies should integrate findings from multivariate analysis and domain expertise alongside this regression insight.

---

*Analysis Date: March 24, 2026*  
*Course: BUAN 348/448*  
*Topic: Simple Linear Regression*
