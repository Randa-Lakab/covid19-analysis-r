# 🦠 COVID-19 Mortality Data Analysis in R

This repository presents a simple but insightful analysis of COVID-19 mortality data using R.  
The goal is to explore how **age** and **gender** influence mortality rates, and to visualize these relationships through basic statistical tests and plots.

---

## 📂 Project Structure

| File                          | Description                                  |
|-------------------------------|----------------------------------------------|
| `covid_analysis.R`            | Main R script that performs the full analysis. |
| `COVID19_line_list_data.csv`  | The dataset used in the analysis.            |
| `boxplot_age_by_death.png`    | Visualization of age distribution by death status. |
| `barplot_death_rate_by_age_group.png` | Death rate by age group as a bar plot. |

---

## 📊 What This Analysis Covers

###  Data Summary
- Using the `Hmisc::describe()` function to get a general overview of the dataset.

###  Data Cleaning
- A new binary column `death_dummy` is created:  
  - `1` for death ≠ 0  
  - `0` otherwise

###  Death Rate
- Calculates the **overall mortality rate**.

###  Age Analysis
- Compares the **mean age** of deceased vs. alive individuals.
- Performs a **t-test** to check if the difference is statistically significant.
- Plots a **boxplot** comparing age distribution by death status.

###  Gender Analysis
- Compares **mortality rate for males and females**.
- Performs a **t-test** to assess statistical significance.

###  Age Group Mortality
- Age is grouped into ranges: `0–20`, `21–40`, `41–60`, `61–80`, `81–100`, `100+`.
- Calculates the **death rate in each age group**.
- Displays the results as a **bar plot**.

---

## 📌 Dependencies

Make sure the following R packages are installed:

```r
install.packages("Hmisc")
