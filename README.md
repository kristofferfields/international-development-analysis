# international-development-analysis
Analysis of literacy, GDP per capita, education, and conflict using World Bank and UCDP data.
# Global Education Analysis: GDP, Literacy, and Conflict

## Overview

This project examines the relationship between economic development and educational outcomes across countries using data from the **World Bank** and **Uppsala Conflict Data Program (UCDP)**.

The analysis focuses on the relationship between **GDP per capita and adult literacy rates**, while also examining primary-school enrollment and conflict as additional factors that may help explain differences between countries.

The dataset covers observations from **1970–2020**.

## Research Question

**What is the relationship between GDP per capita and literacy, and how might factors such as conflict, inequality, and institutional differences help explain countries that do not follow the overall trend?**

## Data Sources

- World Bank
- Uppsala Conflict Data Program (UCDP)

## Variables

The analysis focuses on four primary indicators:

- GDP per capita
- Adult literacy rate
- Net primary-school enrollment
- Conflict status/severity

## Tools & Methods

- Python
- R
- Data cleaning
- Exploratory data analysis
- Data visualization
- Log-linear regression
- Cross-country comparative analysis

## Analysis

### Primary-School Enrollment

Primary-school enrollment was examined across countries from 1970–2020 to identify differences in educational development over time.

The analysis highlights substantial variation between countries. For example, India experienced significant growth in primary-school enrollment, particularly beginning around 2000, while Nigeria continued to exhibit lower enrollment levels.

### GDP Per Capita and Literacy

A regression analysis was used to examine the relationship between GDP per capita and adult literacy.

Because income varies substantially across countries, GDP per capita was transformed using a logarithmic scale.

The resulting model produced an **R² of approximately 0.48**, indicating that GDP per capita explains a meaningful portion of the observed variation in adult literacy within the analyzed data.

Overall, countries with higher GDP per capita tended to have higher adult literacy rates, although several countries deviated substantially from the predicted relationship.

### Conflict as a Confounding Factor

UCDP conflict data was incorporated into the analysis to examine whether political instability and conflict may help explain some of the variation in educational outcomes.

Countries were compared across categories including:

- No conflict
- Minor conflict
- War

The analysis suggests that economic development alone does not fully explain differences in literacy and educational outcomes.

## Country Comparisons

### Spain and the United States

Spain and the United States were examined as examples of high-income countries with near-universal literacy and political stability.

Despite differences in economic structure and social policy, both countries demonstrate the broader relationship between high economic development and strong educational outcomes.

### Uzbekistan and South Africa

Uzbekistan and South Africa provide an example of why national income alone may not determine educational outcomes.

Despite South Africa's higher GDP per capita, Uzbekistan has historically maintained high literacy and enrollment rates. The comparison highlights the potential importance of institutional history, inequality, and the distribution of educational resources.

### Bulgaria and El Salvador

Bulgaria and El Salvador were compared to examine how countries with different political and institutional histories can produce different educational outcomes.

The comparison explores how political stability, institutional capacity, economic development, and exposure to conflict may contribute to differences in literacy.

## Key Findings

- GDP per capita and adult literacy display a positive relationship in the analyzed data.
- The log-linear regression produced an **R² of approximately 0.48**.
- Economic development does not explain all variation in literacy outcomes.
- Several countries perform above or below what their income level alone would predict.
- Conflict, institutional differences, inequality, and historical conditions provide useful context when examining these outliers.
- Cross-country comparisons demonstrate the importance of looking beyond GDP when evaluating educational development.

## Visualizations

The project includes:

- Primary-school enrollment trends by country
- GDP per capita vs. adult literacy scatterplots
- Log-linear regression analysis
- Conflict-severity visualization
- Cross-country comparative tables

## Repository Contents

- `README.md` — Project overview and findings
- `report.pdf` — Full research report
- Analysis files — Python and R code used for data analysis and visualization
- Data files — World Bank and UCDP data used in the project

## Author

**Kristoffer Fields**  
B.A. International Affairs  
Certificate in Data Analytics in Public Policy  
University of Georgia
