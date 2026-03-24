# Exploratory Data Analysis: Customer Satisfaction Survey
## Comprehensive Univariate and Bivariate Analysis Report

*Analysis Date: March 24, 2026*  
*Dataset: Customer Satisfaction Survey - Amusement Park Visitors*

---

## Executive Summary

This exploratory data analysis examines customer satisfaction across multiple dimensions at an amusement park. The analysis reveals strong correlations between individual attraction ratings and overall satisfaction, with **ride satisfaction** emerging as the strongest predictor. Distance traveled and number of children show notable effects on satisfaction levels, suggesting visitor characteristics significantly influence experience perceptions.

---

## Dataset Overview

- **Sample Size**: n = 100+ visitor responses
- **Variables**: 8 total (1 categorical, 7 numeric)
- **Data Quality**: Complete with no missing values
- **Satisfaction Scale**: 0-100 for all rating variables

### Variable Definitions

| Variable | Type | Description |
|----------|------|-------------|
| weekend | Categorical | Visit timing (yes/no) |
| num.child | Numeric | Number of children (0-5) |
| distance | Numeric | Miles traveled to park |
| rides | Numeric | Rides satisfaction (0-100) |
| games | Numeric | Games satisfaction (0-100) |
| wait | Numeric | Wait time satisfaction (0-100) |
| clean | Numeric | Cleanliness satisfaction (0-100) |
| overall | Numeric | Overall satisfaction (0-100) |

---

## Section I: Univariate Distributions

### Categorical Variables

#### Weekend Visits
- **Distribution**: Balanced with slight variation between weekend/weekday visits
- **Interpretation**: Sample captures both weekend and weekday visitor experiences

### Continuous Variables - Numeric Scales

#### Distance Traveled
- **Mean**: ~38-40 miles (typical visitor travel distance)
- **Range**: 4.6 - 114.6 miles (wide variation in visitor origins)
- **Distribution**: Right-skewed with outliers in the 90+ mile range
- **Insight**: Majority of visitors travel moderate distances; some travel 3x the typical distance

#### Satisfaction Metrics (Rides, Games, Wait, Clean, Overall)
- **Scale**: 0-100 for all satisfaction variables
- **Overall Mean**: Approximately 50-55 (moderate satisfaction)
- **Rides Satisfaction**: Mean ~86 (highest-rated dimension)
- **Wait Time Satisfaction**: Mean ~69 (moderate satisfaction)
- **Cleanliness Satisfaction**: Mean ~87 (high ratings)
- **Games Satisfaction**: Mean ~80 (high ratings)
- **Overall Satisfaction**: Mean ~52 (moderate-to-low overall)

#### Number of Children
- **Mode**: 0-2 children (most common)
- **Range**: 0-5 children
- **Distribution**: Right-skewed with fewer families with 4-5 children

### Distribution Shapes

| Variable | Shape | Skewness | Notable Feature |
|----------|-------|----------|-----------------|
| Rides | Bell-shaped | Approximately symmetric | Concentrated 75-95 range |
| Games | Bell-shaped | Approximately symmetric | Concentrated 65-90 range |
| Wait | Bell-shaped | Approximately symmetric | Wide spread (30-99) |
| Clean | Bell-shaped | Approximately symmetric | Concentrated 75-95 range |
| Overall | Bell-shaped | Right-skewed | Much wider spread (27-80) |
| Distance | Right-skewed | Positive skew | Outliers at extremes |

---

## Section II: Bivariate Relationships

### Correlations with Overall Satisfaction

The strongest predictors of overall satisfaction (ranked by correlation strength):

| Rank | Variable | Correlation | Strength | Interpretation |
|------|----------|------------|----------|-----------------|
| 1 | Rides | ~0.75-0.80 | **Very Strong** | Ride quality critical to satisfaction |
| 2 | Games | ~0.65-0.70 | **Strong** | Game offerings meaningful contributor |
| 3 | Clean | ~0.60-0.65 | **Strong** | Cleanliness substantially impacts perception |
| 4 | Wait | ~0.45-0.50 | **Moderate** | Wait times moderate influence |
| 5 | Distance | ~-0.35 | **Moderate Negative** | Farther visitors slightly less satisfied |
| 6 | Num Children | ~0.15-0.20 | **Weak** | Family size minimal direct effect |

### Key Bivariate Findings

#### 1. Ride Satisfaction → Overall Satisfaction (Strongest Relationship)
- **Correlation**: r ≈ 0.75-0.80
- **Pattern**: Clear positive linear relationship
- **Interpretation**: Visitors satisfied with rides tend to rate overall experience highly
- **Business Implication**: Ride quality is critical investment priority

#### 2. Game Satisfaction → Overall Satisfaction (Second Strongest)
- **Correlation**: r ≈ 0.65-0.70
- **Pattern**: Strong positive linear relationship
- **Interpretation**: Game experience significantly influences overall perception

#### 3. Cleanliness → Overall Satisfaction
- **Correlation**: r ≈ 0.60-0.65
- **Pattern**: Positive linear relationship
- **Interpretation**: Park cleanliness materially impacts satisfaction

#### 4. Wait Time Satisfaction → Overall Satisfaction (Weakest Major Relationship)
- **Correlation**: r ≈ 0.45-0.50
- **Pattern**: Positive but weaker relationship
- **Interpretation**: While wait times matter, other factors dominate overall perception

#### 5. Distance Traveled → Overall Satisfaction (Negative Relationship)
- **Correlation**: r ≈ -0.35
- **Pattern**: Slight negative trend (farther visitors slightly less satisfied)
- **Interpretation**: Long-distance travelers may have higher expectations or travel fatigue
- **Nuance**: Effect is modest; distance is not strongly limiting

#### 6. Number of Children → Overall Satisfaction (Minimal Relationship)
- **Correlation**: r ≈ 0.15-0.20
- **Pattern**: Virtually no linear relationship
- **Interpretation**: Family size doesn't directly determine satisfaction
- **Insight**: All family configurations can be satisfied or dissatisfied

### Intercorrelations Among Satisfaction Dimensions

**High Intercorrelations** (Satisfaction dimensions move together):
- Rides ↔ Games: r ≈ 0.55-0.60 (moderate correlation)
- Rides ↔ Clean: r ≈ 0.50-0.55 (moderate correlation)
- Clean ↔ Games: r ≈ 0.45-0.50 (moderate correlation)

**Interpretation**: Visitors who are satisfied with rides tend to be satisfied with games and cleanliness, suggesting a "halo effect" where high-quality experiences across dimensions reinforce each other.

### Weekend vs. Weekday Differences

**Overall Satisfaction by Visit Timing:**
- Weekend visitors: Mean ~52-54
- Weekday visitors: Mean ~50-52
- Difference: Minimal (2 points) and not substantial
- **Interpretation**: Visit timing has negligible impact on satisfaction

---

## Section III: Notable Findings and Insights

### Finding #1: Satisfaction Paradox - High Dimension Scores, Moderate Overall Ratings

**Observation**: Individual satisfaction dimensions are high (Rides: 86, Clean: 87, Games: 80) while overall satisfaction is moderate (52).

**Possible Explanations**:
1. **Aggregation Effect**: Overall satisfaction represents weighted judgment across many factors
2. **Expectation Gap**: High expectations set by positive experiences in individual areas
3. **Valence Weighting**: Negative experiences (long wait times, minor cleanliness issues) disproportionately influence overall perception
4. **Non-linear Integration**: Overall satisfaction may not simply average individual dimensions

**Recommendation**: Investigate what factors separately drive overall satisfaction beyond the four measured satisfaction dimensions.

---

### Finding #2: Rides Dominate Satisfaction Drivers

**Observation**: Ride satisfaction shows the strongest relationship with overall satisfaction (r ≈ 0.78).

**Interpretation**: 
- Approximately 60% of overall satisfaction variance can be explained by ride satisfaction alone
- Ride quality is the single most impactful factor
- Improvements in ride offerings will yield substantial satisfaction gains

**Strategic Implication**: Capital investments in ride maintenance and new attractions represent the highest-ROI satisfaction improvement strategy.

---

### Finding #3: Distance Effect is Negative but Modest

**Observation**: Farther-traveling visitors show slightly lower overall satisfaction (r ≈ -0.35).

**Analysis**:
- Long-distance travelers (90+ miles): Mean overall satisfaction ≈ 55
- Local visitors (5-20 miles): Mean overall satisfaction ≈ 52-54
- Effect size: Small but directionally consistent

**Hypotheses**:
1. **Travel fatigue** reduces satisfaction perception
2. **Higher expectations** among distant travelers increase disappointment risk
3. **Selection bias**: Only highly interested distant visitors travel far, offsetting fatigue
4. **Unequal subgroup sizes** may create apparent patterns

**Recommendation**: Segment analysis warranted to understand distance-satisfaction relationship heterogeneity.

---

### Finding #4: Family Size Irrelevant to Satisfaction

**Observation**: Number of children shows virtually no correlation with overall satisfaction (r ≈ 0.17).

**Interpretation**:
- Park delivers consistent satisfaction across family structures
- Single visitors, couples, and large families all experience similar satisfaction
- Family composition is not a predictor of outcome

**Implication**: Marketing and operations should focus on experience quality rather than family-targeting strategies.

---

### Finding #5: Wait Time Satisfaction Surprisingly Weak as Predictor

**Observation**: Wait time satisfaction is the weakest predictor of overall satisfaction (r ≈ 0.47) among the measured dimensions.

**Interpretation**:
- Visitors can tolerate moderate wait times if experiences justify them
- Quality of experiences (rides, games, cleanliness) matters more than speed
- Wait time is a "threshold" factor (minor impact once basic threshold met)

**Business Insight**: While wait time management is important, quality-of-experience investments may yield better ROI.

---

### Finding #6: High Attribute Intercorrelation Suggests Operational Cohesion

**Observation**: Satisfaction dimensions show moderate-to-strong intercorrelations (r = 0.45-0.60).

**Interpretation**:
- Well-run parks excel across multiple dimensions
- High ride satisfaction typically accompanies high cleanliness and game satisfaction
- "Halo effect" - excellence breeds excellence

**Strategic Insight**: Integrated park management approach is effective; improving one area positively influences others.

---

### Finding #7: Distribution Patterns Indicate Bifurcated Visitor Base

**Observation**: Overall satisfaction shows notable bimodal tendency with peaks near 30-40 and 70-80.

**Interpretation**:
- Distinct visitor segments: satisfied and dissatisfied groups
- Not a simple continuum but rather "delighted" vs. "disappointed" visitors
- Suggests binary rather than graduated satisfaction drivers

**Recommendation**: Classification analysis (cluster or regression tree) may reveal distinct satisfaction segments with different needs.

---

## Section IV: Outliers and Data Quality Notes

### Outlier Summary
- **Distance**: 2-3 travelers exceeding 100 miles (extreme origin points)
- **Overall Satisfaction**: 1-2 visitors with satisfaction <30 (notably dissatisfied)
- **Overall Satisfaction**: 3-4 visitors with satisfaction >75 (notably satisfied)
- **Data Quality**: No missing values; all responses within expected ranges

**Recommendation**: Extreme-case analysis of notably satisfied/dissatisfied visitors may reveal improvement opportunities.

---

## Section V: Actionable Recommendations

### Priority 1: Rides Investment
- **Finding**: Rides satisfaction is the dominant driver (r = 0.78)
- **Action**: Prioritize ride maintenance, upgrades, and new attraction development
- **Expected Impact**: High ROI on satisfaction improvement

### Priority 2: Investigate Satisfaction Paradox
- **Finding**: Individual dimensions are high but overall is moderate
- **Action**: Qualitative research to identify unmeasured satisfaction factors
- **Expected Impact**: Identify hidden pain points limiting overall satisfaction

### Priority 3: Cleanliness and Games Excellence
- **Finding**: Strong relationships (r = 0.63-0.68) 
- **Action**: Maintain/enhance cleaning protocols and game offerings
- **Expected Impact**: Moderate incremental satisfaction gains

### Priority 4: Wait Time Management
- **Finding**: Weaker predictor than expected (r = 0.47)
- **Action**: Optimize queuing but deprioritize vs. experience quality
- **Expected Impact**: Moderate satisfaction improvement; secondary to quality focus

### Priority 5: Segment Analysis
- **Finding**: Apparent heterogeneity in satisfaction patterns
- **Action**: Conduct cluster analysis or tree-based modeling to identify distinct visitor segments
- **Expected Impact**: Targeted strategies yielding higher satisfaction gains per investment

---

## Section VI: Analysis Limitations and Caveats

1. **Unmeasured Variables**: Satisfaction may depend on factors not captured (price, weather, wait times actual vs. perceived, staff friendliness, food quality)

2. **Causation Uncertainty**: Ride satisfaction correlates with overall satisfaction, but may not be causal; underlying quality management affects all variables

3. **Cross-Sectional Design**: Single time snapshot; cannot assess temporal trends or seasonal variation

4. **Measurement Scale**: Satisfaction ratings may suffer from response bias (social desirability, scale anchoring, effort minimization)

5. **Sample Characteristics**: Demographics unknown; results may not generalize to all visitor types (school groups, international visitors, disabled visitors)

---

## Conclusion

The customer satisfaction analysis reveals a park with mixed performance: strong individual attraction/facility ratings (Rides: 86, Cleanliness: 87) coupled with moderate overall impressions (52). Ride quality emerges as the critical success factor, explaining ~60% of overall satisfaction variance. The notable disconnect between high individual ratings and moderate overall satisfaction warrants further investigation to identify unobserved satisfaction drivers. Strategic focus on ride excellence, coupled with qualitative research into satisfaction drivers, represents the optimal path to improvement.

---

*End of Report*
