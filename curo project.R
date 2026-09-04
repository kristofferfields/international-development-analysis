library(tidyverse)
library(WDI)
library(countrycode)
library(ggrepel)
library(scales)

setwd("C:/Users/krist/Documents/INTL 4000/")

#====================================================
# 1) WORLD BANK DATA (GDP + Literacy)
#====================================================

wb_raw <- WDI(
  country = "all",
  indicator = c(
    gdp_pc   = "NY.GDP.PCAP.CD",
    literacy = "SE.ADT.LITR.ZS"
  ),
  start = 1970,
  end   = 2020,
  extra = TRUE
)

wb <- wb_raw %>%
  filter(region != "Aggregates") %>%
  transmute(
    country,
    iso3c,
    year,
    gdp_pc,
    literacy
  )

#====================================================
# 2) LOAD OV (organized violence) DATA
#====================================================

ov_raw <- read_csv(file.choose())  # choose the OV dataset

# Inspect
names(ov_raw)

#====================================================
# 3) Clean conflict data
#====================================================

ov_clean <- ov_raw %>%
  transmute(
    country = country_cy,
    year    = year_cy,
    deaths  = sb_total_deaths_best_cy +
      ns_total_deaths_best_cy +
      os_total_deaths_best_cy
  ) %>%
  filter(!is.na(country), !is.na(year))

ov_year <- ov_clean %>%
  group_by(country, year) %>%
  summarise(
    deaths_total = sum(deaths, na.rm = TRUE),
    .groups = "drop"
  )

#====================================================
# 4) MERGE WB + OV
#====================================================

merged <- wb %>%
  left_join(ov_year, by = c("country", "year"))

#====================================================
# 5) REDUCE TO 1 ROW PER COUNTRY
#====================================================

country_data <- merged %>%
  group_by(country, iso3c) %>%
  summarise(
    gdp_pc = mean(gdp_pc, na.rm = TRUE),
    literacy = mean(literacy, na.rm = TRUE),
    deaths_total = sum(deaths_total, na.rm = TRUE),
    .groups = "drop"
  ) %>%
  mutate(
    log_gdp = log(gdp_pc),
    conflict_severity = case_when(
      deaths_total == 0 ~ "No conflict",
      deaths_total < 1000 ~ "Minor conflict",
      TRUE ~ "War (1000+ deaths)"
    )
  ) %>%
  filter(!is.na(log_gdp), !is.na(literacy))

#====================================================
# 6) PICK LABEL COUNTRIES (important, readable)
#====================================================

label_countries <- c(
  "Spain", "South Africa", "Uzbekistan",
  "Bulgaria", "El Salvador", 
  "Rwanda", "Afghanistan", "Iraq", 
  "Ethiopia", "Mexico", "Nigeria", "India"
)

labels_df <- country_data %>%
  filter(country %in% label_countries)

#====================================================
# 7) FINAL GRAPH (GDP vs Literacy, conflict as color)
#====================================================

ggplot(country_data, aes(x = log_gdp, y = literacy, color = conflict_severity)) +
  geom_point(size = 3, alpha = 0.7) +
  geom_smooth(method = "lm", se = FALSE, color = "black") +
  geom_text_repel(
    data = labels_df,
    aes(label = country),
    size = 4,
    max.overlaps = 20
  ) +
  scale_color_manual(
    values = c(
      "No conflict"      = "#77AADD",
      "Minor conflict"   = "#EEBB77",
      "War (1000+ deaths)" = "#CC6677"
    )
  ) +
  labs(
    title = "Log GDP per Capita vs Adult Literacy Rate (OV Dataset)",
    x = "log(GDP per capita)",
    y = "Adult literacy rate (%)",
    color = "Conflict Severity"
  ) +
  theme_minimal(base_size = 16)
