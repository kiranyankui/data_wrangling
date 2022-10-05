DS HW2
================

# Homework 2

## Load Libraries

``` r
library(tidyverse)
```

    ## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.2 ──
    ## ✔ ggplot2 3.3.6     ✔ purrr   0.3.4
    ## ✔ tibble  3.1.8     ✔ dplyr   1.0.9
    ## ✔ tidyr   1.2.0     ✔ stringr 1.4.1
    ## ✔ readr   2.1.2     ✔ forcats 0.5.2
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()

``` r
library(readxl)
```

## Problem 1

We want to read and clean the NYC transit dataset from the csv file.

``` r
NYC_transit <- read_csv("./data/NYC_Transit_Subway_Entrance_And_Exit_Data.csv") %>% 
  janitor::clean_names()

skimr::skim(NYC_transit)
```

Now, we want to retain the following variables:

-   line
-   station name
-   station latitude / longitude
-   routes served
-   entry
-   vending
-   entrance type
-   ADA compliance

``` r
select(NYC_transit, line, station_name, station_latitude, station_longitude, route1, route2, route3, route4, route5, route6, route7, route8, route9, route10, route11, entry, vending, entrance_type, ada)

NYC_transit
```

Converting the entry variable into a logical vector.

``` r
recode(NYC_transit$entry, "YES"=TRUE,"NO"=FALSE, .default = NA)

NYC_transit
```

## Description about the NYC_transit dataset

1.  The dataset contains 32 columns (variables) and 1868 rows
    (observations).

2.  The variables from the dataset contains line, station_name,
    station_latitude, station_longitude, routes1 to 11, entry, vending,
    entrance_type, ada

division, line, station_name, routes, entrance type, entry, exit only,
vending, staffing, staff hours, ADA notes, north south street, east west
street, corner, station location, entrance location, ada, free
crossover, station lattitude and longitude, and entrance lattitude and
longitude.

3.  I read and clean object names using clean names () in janitor;
    retain line, station, name, station latitude / longitude, routes
    served, entry, vending, entrance type, and ADA compliance. Convert
    the entry variable from character (YES vs NO) to a logical variable

4.  The data are tidy.

Answer the following questions using these data:

-   How many distinct stations are there? Note that stations are
    identified both by name and by line (e.g. 125th St 8th Avenue; 125st
    Broadway; 125st Lenox); the distinct function may be useful here.

``` r
nrow(distinct(NYC_transit, station_name))
```

Ans: There are 356 distinct stations.

-   How many stations are ADA compliant?

``` r
NYC_transit %>% 
  select(station_name, ada) %>% 
  filter(ada == TRUE) %>%
  distinct(station_name)
```

Ans: There are 73 distinct stations who are ADA-compliant.

-   What proportion of station entrances / exits without vending allow
    entrance?

``` r
NYC_transit %>% 
  select(vending, entry) %>% 
  filter(entry == "YES", vending == "NO")

NYC_transit %>% 
  select(vending, entry) %>% 
  filter(vending == "NO")
```

69 station entrances do not have vending and allow entrance. 183 station
entrances do not have vending.

Ans: Proportion of station entrances / exits without vending allow
entrance is (69/183)\*100 = 37.70%.

I am reformating data so that route number and route name are distinct
variables.

-   How many distinct stations serve the A train? Of the stations that
    serve the A train, how many are ADA compliant?

## Problem 2

``` r
# read and clean the Mr Trash Wheel dataset from the excel file

Mr_Trash_df <- read_excel("./data/Trash Wheel Collection Data.xlsx", 
  sheet="Mr. Trash Wheel", 
  range = "A2:N549",
  skip = 1) %>% 
  janitor::clean_names() %>% 
  drop_na(dumpster) %>% 
   mutate(
    sports_balls = as.integer(sports_balls),
    year = as.numeric(year)) %>% 
   add_column(name = "Mr. Trash Wheel")


skimr::skim(Mr_Trash_df)
```

|                                                  |             |
|:-------------------------------------------------|:------------|
| Name                                             | Mr_Trash_df |
| Number of rows                                   | 547         |
| Number of columns                                | 15          |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   |             |
| Column type frequency:                           |             |
| character                                        | 2           |
| numeric                                          | 12          |
| POSIXct                                          | 1           |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ |             |
| Group variables                                  | None        |

Data summary

**Variable type: character**

| skim_variable | n_missing | complete_rate | min | max | empty | n_unique | whitespace |
|:--------------|----------:|--------------:|----:|----:|------:|---------:|-----------:|
| month         |         0 |             1 |   3 |   9 |     0 |       13 |          0 |
| name          |         0 |             1 |  15 |  15 |     0 |        1 |          0 |

**Variable type: numeric**

| skim_variable      | n_missing | complete_rate |     mean |       sd |      p0 |     p25 |     p50 |      p75 |      p100 | hist  |
|:-------------------|----------:|--------------:|---------:|---------:|--------:|--------:|--------:|---------:|----------:|:------|
| dumpster           |         0 |          1.00 |   274.00 |   158.05 |    1.00 |  137.50 |  274.00 |   410.50 |    547.00 | ▇▇▇▇▇ |
| year               |         0 |          1.00 |  2017.97 |     2.37 | 2014.00 | 2016.00 | 2018.00 |  2020.00 |   2022.00 | ▇▆▆▇▆ |
| weight_tons        |         0 |          1.00 |     3.20 |     0.75 |    0.78 |    2.71 |    3.19 |     3.72 |      5.62 | ▁▃▇▅▁ |
| volume_cubic_yards |         0 |          1.00 |    15.33 |     1.38 |    7.00 |   15.00 |   15.00 |    15.00 |     20.00 | ▁▁▁▇▂ |
| plastic_bottles    |         0 |          1.00 |  1958.49 |  1063.82 |  210.00 |  980.00 | 1880.00 |  2740.00 |   5960.00 | ▇▇▅▁▁ |
| polystyrene        |         0 |          1.00 |  1649.08 |  1218.77 |   48.00 |  695.00 | 1250.00 |  2480.00 |   6540.00 | ▇▅▃▁▁ |
| cigarette_butts    |         0 |          1.00 | 20925.08 | 30215.86 |  900.00 | 4000.00 | 7000.00 | 26500.00 | 310000.00 | ▇▁▁▁▁ |
| glass_bottles      |         0 |          1.00 |    21.65 |    16.40 |    0.00 |   10.00 |   18.00 |    31.00 |    110.00 | ▇▃▁▁▁ |
| grocery_bags       |         0 |          1.00 |   965.53 |   844.77 |   24.00 |  330.00 |  680.00 |  1370.00 |   3750.00 | ▇▃▂▁▁ |
| chip_bags          |         0 |          1.00 |  1418.59 |   921.99 |  180.00 |  740.00 | 1100.00 |  1980.00 |   5085.00 | ▇▃▂▁▁ |
| sports_balls       |         0 |          1.00 |    12.56 |     9.28 |    0.00 |    6.00 |   11.00 |    18.00 |     56.00 | ▇▅▂▁▁ |
| homes_powered      |        61 |          0.89 |    45.98 |    21.42 |    0.00 |   39.54 |   51.17 |    59.13 |     93.67 | ▂▂▇▆▁ |

**Variable type: POSIXct**

| skim_variable | n_missing | complete_rate | min        | max        | median     | n_unique |
|:--------------|----------:|--------------:|:-----------|:-----------|:-----------|---------:|
| date          |         0 |             1 | 1900-01-20 | 2022-07-29 | 2018-07-18 |      331 |

I ensured the use of reasonable variable names. I have ommited rows that
do not include dumpster-specific data. I have rounded the number of
sports balls to the nearest integer and converted the result to an
integer variable.

``` r
# read and clean the Professor Trash Wheel dataset from the excel file

Pf_Trash_df <- read_excel("./data/Trash Wheel Collection Data.xlsx", 
  sheet = "Professor Trash Wheel",
  range = "A2:M96",
  skip = 1) %>% 
  janitor::clean_names() %>% 
  drop_na(dumpster) %>% 
  add_column(name = "Professor Trash Wheel") 

skimr::skim(Pf_Trash_df)
```

|                                                  |             |
|:-------------------------------------------------|:------------|
| Name                                             | Pf_Trash_df |
| Number of rows                                   | 94          |
| Number of columns                                | 14          |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   |             |
| Column type frequency:                           |             |
| character                                        | 2           |
| numeric                                          | 11          |
| POSIXct                                          | 1           |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ |             |
| Group variables                                  | None        |

Data summary

**Variable type: character**

| skim_variable | n_missing | complete_rate | min | max | empty | n_unique | whitespace |
|:--------------|----------:|--------------:|----:|----:|------:|---------:|-----------:|
| month         |         0 |             1 |   3 |   9 |     0 |       12 |          0 |
| name          |         0 |             1 |  21 |  21 |     0 |        1 |          0 |

**Variable type: numeric**

| skim_variable      | n_missing | complete_rate |     mean |      sd |      p0 |     p25 |     p50 |      p75 |     p100 | hist  |
|:-------------------|----------:|--------------:|---------:|--------:|--------:|--------:|--------:|---------:|---------:|:------|
| dumpster           |         0 |          1.00 |    47.50 |   27.28 |    1.00 |   24.25 |   47.50 |    70.75 |    94.00 | ▇▇▇▇▇ |
| year               |         0 |          1.00 |  2019.11 |    1.64 | 2017.00 | 2018.00 | 2019.00 |  2020.75 |  2022.00 | ▇▃▂▃▂ |
| weight_tons        |         0 |          1.00 |     2.02 |    0.67 |    0.61 |    1.58 |    1.94 |     2.49 |     3.72 | ▃▇▆▅▂ |
| volume_cubic_yards |         0 |          1.00 |    14.59 |    1.64 |    6.00 |   15.00 |   15.00 |    15.00 |    18.00 | ▁▁▁▇▁ |
| plastic_bottles    |         0 |          1.00 |  5411.13 | 2411.88 |  657.00 | 3925.00 | 5050.00 |  7400.00 |  9830.00 | ▃▅▇▅▅ |
| polystyrene        |         0 |          1.00 |  4647.71 | 3283.68 |  280.00 | 1534.75 | 4000.00 |  7800.00 | 11528.00 | ▇▇▂▆▂ |
| cigarette_butts    |         0 |          1.00 | 12324.23 | 6602.04 | 4200.00 | 7250.00 | 9700.00 | 16000.00 | 33320.00 | ▇▃▂▁▁ |
| glass_bottles      |         0 |          1.00 |    15.20 |   10.33 |    0.00 |    6.50 |   14.00 |    22.00 |    48.00 | ▇▇▆▂▁ |
| grocery_bags       |         0 |          1.00 |  2684.83 | 3412.14 |  270.00 |  882.50 | 1200.00 |  2050.00 | 13450.00 | ▇▁▁▁▁ |
| chip_bags          |         0 |          1.00 |  8148.74 | 4467.53 | 2900.00 | 4900.00 | 6400.00 | 10400.00 | 20100.00 | ▇▃▂▂▁ |
| homes_powered      |        12 |          0.87 |    33.04 |   10.80 |   10.17 |   26.33 |   31.08 |    40.88 |    62.00 | ▃▇▆▅▂ |

**Variable type: POSIXct**

| skim_variable | n_missing | complete_rate | min        | max        | median     | n_unique |
|:--------------|----------:|--------------:|:-----------|:-----------|:-----------|---------:|
| date          |         0 |             1 | 2017-01-02 | 2022-07-18 | 2019-04-24 |       92 |

``` r
# Joining the datasets for Mr Trash Wheel and Professor Trash Wheel
Both_Trash_df <- 
  full_join(Mr_Trash_df, Pf_Trash_df)
```

    ## Joining, by = c("dumpster", "month", "year", "date", "weight_tons",
    ## "volume_cubic_yards", "plastic_bottles", "polystyrene", "cigarette_butts",
    ## "glass_bottles", "grocery_bags", "chip_bags", "homes_powered", "name")

``` r
Both_Trash_df
```

    ## # A tibble: 641 × 15
    ##    dumpster month  year date                weight_tons volume…¹ plast…² polys…³
    ##       <dbl> <chr> <dbl> <dttm>                    <dbl>    <dbl>   <dbl>   <dbl>
    ##  1        1 May    2014 2014-05-16 00:00:00        4.31       18    1450    1820
    ##  2        2 May    2014 2014-05-16 00:00:00        2.74       13    1120    1030
    ##  3        3 May    2014 2014-05-16 00:00:00        3.45       15    2450    3100
    ##  4        4 May    2014 2014-05-17 00:00:00        3.1        15    2380    2730
    ##  5        5 May    2014 2014-05-17 00:00:00        4.06       18     980     870
    ##  6        6 May    2014 2014-05-20 00:00:00        2.71       13    1430    2140
    ##  7        7 May    2014 2014-05-21 00:00:00        1.91        8     910    1090
    ##  8        8 May    2014 2014-05-28 00:00:00        3.7        16    3580    4310
    ##  9        9 June   2014 2014-06-05 00:00:00        2.52       14    2400    2790
    ## 10       10 June   2014 2014-06-11 00:00:00        3.76       18    1340    1730
    ## # … with 631 more rows, 7 more variables: cigarette_butts <dbl>,
    ## #   glass_bottles <dbl>, grocery_bags <dbl>, chip_bags <dbl>,
    ## #   sports_balls <int>, homes_powered <dbl>, name <chr>, and abbreviated
    ## #   variable names ¹​volume_cubic_yards, ²​plastic_bottles, ³​polystyrene

``` r
Both_Trash_df$name
```

    ##   [1] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ##   [4] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ##   [7] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ##  [10] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ##  [13] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ##  [16] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ##  [19] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ##  [22] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ##  [25] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ##  [28] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ##  [31] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ##  [34] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ##  [37] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ##  [40] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ##  [43] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ##  [46] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ##  [49] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ##  [52] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ##  [55] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ##  [58] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ##  [61] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ##  [64] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ##  [67] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ##  [70] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ##  [73] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ##  [76] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ##  [79] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ##  [82] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ##  [85] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ##  [88] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ##  [91] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ##  [94] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ##  [97] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [100] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [103] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [106] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [109] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [112] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [115] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [118] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [121] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [124] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [127] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [130] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [133] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [136] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [139] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [142] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [145] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [148] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [151] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [154] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [157] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [160] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [163] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [166] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [169] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [172] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [175] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [178] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [181] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [184] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [187] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [190] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [193] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [196] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [199] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [202] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [205] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [208] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [211] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [214] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [217] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [220] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [223] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [226] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [229] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [232] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [235] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [238] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [241] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [244] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [247] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [250] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [253] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [256] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [259] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [262] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [265] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [268] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [271] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [274] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [277] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [280] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [283] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [286] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [289] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [292] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [295] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [298] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [301] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [304] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [307] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [310] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [313] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [316] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [319] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [322] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [325] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [328] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [331] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [334] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [337] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [340] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [343] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [346] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [349] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [352] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [355] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [358] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [361] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [364] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [367] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [370] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [373] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [376] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [379] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [382] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [385] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [388] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [391] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [394] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [397] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [400] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [403] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [406] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [409] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [412] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [415] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [418] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [421] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [424] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [427] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [430] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [433] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [436] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [439] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [442] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [445] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [448] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [451] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [454] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [457] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [460] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [463] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [466] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [469] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [472] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [475] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [478] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [481] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [484] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [487] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [490] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [493] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [496] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [499] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [502] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [505] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [508] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [511] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [514] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [517] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [520] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [523] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [526] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [529] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [532] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [535] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [538] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [541] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [544] "Mr. Trash Wheel"       "Mr. Trash Wheel"       "Mr. Trash Wheel"      
    ## [547] "Mr. Trash Wheel"       "Professor Trash Wheel" "Professor Trash Wheel"
    ## [550] "Professor Trash Wheel" "Professor Trash Wheel" "Professor Trash Wheel"
    ## [553] "Professor Trash Wheel" "Professor Trash Wheel" "Professor Trash Wheel"
    ## [556] "Professor Trash Wheel" "Professor Trash Wheel" "Professor Trash Wheel"
    ## [559] "Professor Trash Wheel" "Professor Trash Wheel" "Professor Trash Wheel"
    ## [562] "Professor Trash Wheel" "Professor Trash Wheel" "Professor Trash Wheel"
    ## [565] "Professor Trash Wheel" "Professor Trash Wheel" "Professor Trash Wheel"
    ## [568] "Professor Trash Wheel" "Professor Trash Wheel" "Professor Trash Wheel"
    ## [571] "Professor Trash Wheel" "Professor Trash Wheel" "Professor Trash Wheel"
    ## [574] "Professor Trash Wheel" "Professor Trash Wheel" "Professor Trash Wheel"
    ## [577] "Professor Trash Wheel" "Professor Trash Wheel" "Professor Trash Wheel"
    ## [580] "Professor Trash Wheel" "Professor Trash Wheel" "Professor Trash Wheel"
    ## [583] "Professor Trash Wheel" "Professor Trash Wheel" "Professor Trash Wheel"
    ## [586] "Professor Trash Wheel" "Professor Trash Wheel" "Professor Trash Wheel"
    ## [589] "Professor Trash Wheel" "Professor Trash Wheel" "Professor Trash Wheel"
    ## [592] "Professor Trash Wheel" "Professor Trash Wheel" "Professor Trash Wheel"
    ## [595] "Professor Trash Wheel" "Professor Trash Wheel" "Professor Trash Wheel"
    ## [598] "Professor Trash Wheel" "Professor Trash Wheel" "Professor Trash Wheel"
    ## [601] "Professor Trash Wheel" "Professor Trash Wheel" "Professor Trash Wheel"
    ## [604] "Professor Trash Wheel" "Professor Trash Wheel" "Professor Trash Wheel"
    ## [607] "Professor Trash Wheel" "Professor Trash Wheel" "Professor Trash Wheel"
    ## [610] "Professor Trash Wheel" "Professor Trash Wheel" "Professor Trash Wheel"
    ## [613] "Professor Trash Wheel" "Professor Trash Wheel" "Professor Trash Wheel"
    ## [616] "Professor Trash Wheel" "Professor Trash Wheel" "Professor Trash Wheel"
    ## [619] "Professor Trash Wheel" "Professor Trash Wheel" "Professor Trash Wheel"
    ## [622] "Professor Trash Wheel" "Professor Trash Wheel" "Professor Trash Wheel"
    ## [625] "Professor Trash Wheel" "Professor Trash Wheel" "Professor Trash Wheel"
    ## [628] "Professor Trash Wheel" "Professor Trash Wheel" "Professor Trash Wheel"
    ## [631] "Professor Trash Wheel" "Professor Trash Wheel" "Professor Trash Wheel"
    ## [634] "Professor Trash Wheel" "Professor Trash Wheel" "Professor Trash Wheel"
    ## [637] "Professor Trash Wheel" "Professor Trash Wheel" "Professor Trash Wheel"
    ## [640] "Professor Trash Wheel" "Professor Trash Wheel"

**Mr Trash Wheel dataset (Mr_Trash_df)** \* there are 15 columns
(variables) and 547 rows (observations)

**Professor Trash Wheel (Pf_Trash_df)** \* there are 14 columns
(variables) and 94 rows (observations).

**combined dataset (Both_Trash_df)** \* There are 15 columns (variables)
and 641 rows (observations). \* This dataset includes the following
variables: dumpster, month, year, date, weight_tons, volume_cubic_yards,
plastic_bottles, polystyrene, cigarette_butts, glass_bottles,
grocery_bags, chip_bags, sports_balls, homes_powered, name.

The combined dataset Both_Trash_df contains:

-   The year/month/day of trash collection yards
-   The weight of trash collected in tons and the volume in cubic
-   number of trash items collected (plastic bottles, polystyrene,
    cigarette butts, grocery bags, glass bottles, chip bags, and sports
    balls)
-   homes powered
-   and the name of the Trash Wheel (Mr. or Prof.)

The total weight of trash collected by Professor Trash Wheel is 190.12
tons.

The total number of sports balls collected by Mr. Trash Wheel in 2020 is
856 balls.

## Problem 3

### Dataset for pols-month.csv

``` r
pols_month_df <- read_csv("./data/pols-month.csv") %>% 
  janitor::clean_names() %>% 
  separate(mon, into = c("year", "month", "day"), sep = '-') %>% 
  mutate(year = as.numeric(year),
        month = month.abb[as.numeric(month)],
        president = case_when(
        prez_dem == 1 ~ "dem",
        prez_gop > 0 ~ "gop",
        TRUE ~ "")) %>% 
  select(-prez_dem, -prez_gop, -day)
```

    ## Rows: 822 Columns: 9
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## dbl  (8): prez_gop, gov_gop, sen_gop, rep_gop, prez_dem, gov_dem, sen_dem, r...
    ## date (1): mon
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

``` r
skimr::skim(pols_month_df)
```

|                                                  |               |
|:-------------------------------------------------|:--------------|
| Name                                             | pols_month_df |
| Number of rows                                   | 822           |
| Number of columns                                | 9             |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   |               |
| Column type frequency:                           |               |
| character                                        | 2             |
| numeric                                          | 7             |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ |               |
| Group variables                                  | None          |

Data summary

**Variable type: character**

| skim_variable | n_missing | complete_rate | min | max | empty | n_unique | whitespace |
|:--------------|----------:|--------------:|----:|----:|------:|---------:|-----------:|
| month         |         0 |             1 |   3 |   3 |     0 |       12 |          0 |
| president     |         0 |             1 |   3 |   3 |     0 |        2 |          0 |

**Variable type: numeric**

| skim_variable | n_missing | complete_rate |    mean |    sd |   p0 |  p25 |  p50 |  p75 | p100 | hist  |
|:--------------|----------:|--------------:|--------:|------:|-----:|-----:|-----:|-----:|-----:|:------|
| year          |         0 |             1 | 1980.75 | 19.79 | 1947 | 1964 | 1981 | 1998 | 2015 | ▇▇▇▇▇ |
| gov_gop       |         0 |             1 |   22.48 |  5.68 |   12 |   18 |   22 |   28 |   34 | ▆▆▇▅▅ |
| sen_gop       |         0 |             1 |   46.10 |  6.38 |   32 |   42 |   46 |   51 |   56 | ▃▃▇▇▇ |
| rep_gop       |         0 |             1 |  194.92 | 29.24 |  141 |  176 |  195 |  222 |  253 | ▃▇▆▃▅ |
| gov_dem       |         0 |             1 |   27.20 |  5.94 |   17 |   22 |   28 |   32 |   41 | ▆▅▇▆▂ |
| sen_dem       |         0 |             1 |   54.41 |  7.37 |   44 |   48 |   53 |   58 |   71 | ▇▆▇▃▂ |
| rep_dem       |         0 |             1 |  244.97 | 31.37 |  188 |  211 |  250 |  268 |  301 | ▇▂▇▇▅ |

i have loaded and cleaned the data in pols-month.csv, as well as
separated the column “mon” into “year”, “month” and day”. I also
converted the “month” variable into a numeric variable. I replaced the
month number with a month name.

I also created a president variable taking values gop and dem, and
remove prez_dem and prez_gop; and remove the day variable.

### Dataset for snp.csv

``` r
snp_df <- read_csv("./data/snp.csv") %>% 
  janitor::clean_names() %>% 
  separate(date, into = c("month", "day", "year"), sep = '/') %>% 
  mutate(year = as.numeric(year)) %>% 
  mutate(month = month.abb[as.numeric(month)]) %>% 
  select(-day) %>% 
      mutate(year=if_else(year<23, year+2000, year+1900))
```

    ## Rows: 787 Columns: 2
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr (1): date
    ## dbl (1): close
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

``` r
skimr::skim(snp_df)
```

|                                                  |        |
|:-------------------------------------------------|:-------|
| Name                                             | snp_df |
| Number of rows                                   | 787    |
| Number of columns                                | 3      |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   |        |
| Column type frequency:                           |        |
| character                                        | 1      |
| numeric                                          | 2      |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ |        |
| Group variables                                  | None   |

Data summary

**Variable type: character**

| skim_variable | n_missing | complete_rate | min | max | empty | n_unique | whitespace |
|:--------------|----------:|--------------:|----:|----:|------:|---------:|-----------:|
| month         |         0 |             1 |   3 |   3 |     0 |       12 |          0 |

**Variable type: numeric**

| skim_variable | n_missing | complete_rate |    mean |     sd |      p0 |     p25 |     p50 |    p75 |    p100 | hist  |
|:--------------|----------:|--------------:|--------:|-------:|--------:|--------:|--------:|-------:|--------:|:------|
| year          |         0 |             1 | 1982.29 |  18.95 | 1950.00 | 1966.00 | 1982.00 | 1999.0 | 2015.00 | ▇▇▇▇▇ |
| close         |         0 |             1 |  474.89 | 545.96 |   17.05 |   83.74 |  138.53 |  941.8 | 2107.39 | ▇▁▂▁▁ |

i have loaded and cleaned the data in snp.csv, as well as separated the
column “date” into “month”, “day”, “year”. I also converted the “month”
variable into a numeric variable.

I replaced the month number with a month name.

Also I changed the year from a double digit format to a four digit
format.

### Tidying unemployment data

``` r
unemp_df <- 
  read_csv("./data/unemployment.csv") %>%
  janitor::clean_names() %>%
   pivot_longer( 
     cols = jan:dec,
     names_to = "month",
     values_to = "percent_unemployment") 
```

    ## Rows: 68 Columns: 13
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## dbl (13): Year, Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

``` r
skimr::skim(unemp_df)
```

|                                                  |          |
|:-------------------------------------------------|:---------|
| Name                                             | unemp_df |
| Number of rows                                   | 816      |
| Number of columns                                | 3        |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   |          |
| Column type frequency:                           |          |
| character                                        | 1        |
| numeric                                          | 2        |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ |          |
| Group variables                                  | None     |

Data summary

**Variable type: character**

| skim_variable | n_missing | complete_rate | min | max | empty | n_unique | whitespace |
|:--------------|----------:|--------------:|----:|----:|------:|---------:|-----------:|
| month         |         0 |             1 |   3 |   3 |     0 |       12 |          0 |

**Variable type: numeric**

| skim_variable        | n_missing | complete_rate |    mean |    sd |     p0 |     p25 |    p50 |     p75 |   p100 | hist  |
|:---------------------|----------:|--------------:|--------:|------:|-------:|--------:|-------:|--------:|-------:|:------|
| year                 |         0 |          1.00 | 1981.50 | 19.64 | 1948.0 | 1964.75 | 1981.5 | 1998.25 | 2015.0 | ▇▇▇▇▇ |
| percent_unemployment |         6 |          0.99 |    5.83 |  1.65 |    2.5 |    4.70 |    5.6 |    6.90 |   10.8 | ▃▇▅▂▁ |

``` r
pols_snp_df = full_join (pols_month_df, snp_df)
```

    ## Joining, by = c("year", "month")

``` r
pols_snp_unemp_df = full_join (pols_snp_df, unemp_df)
```

    ## Joining, by = c("year", "month")

**pols_month_df dataset**

-   There are 9 columns (variables) and 822 rows (observations).
-   This dataset includes the following variables: year, month, gov_gop,
    sen_gop, rep_gop, gov_dem, sen_dem, rep_dem, president. This shows
    the year and month that democrat and republican presidents,
    governors, senators, house of representatives and senators were in
    office.
-   Range of years is 1947, 2015.

**snp_df dataset**

-   There are 3 columns (variables) and 787 rows (observations).
-   This dataset includes the following variables: month, year, close.
    This shows percent of unemployment in a specific year and month.
-   Range of years is 1950, 2015.

**unemp_df dataset**

-   There are 3 columns (variables) and 816 rows (observations).
-   This dataset includes the following variables: year, month,
    percent_unemployment. This shows the year and month that the stock
    markets close and the closing stock prices.
-   Range of years is 1948, 2015.

**pols_snp_unemp_df**

-   There are 11 columns (variables) and 1639 rows (observations).
-   This dataset includes the following variables: year, month, gov_gop,
    sen_gop, rep_gop, gov_dem, sen_dem, rep_dem, president, close,
    percent_unemployment. This is a combined dataset featuring variables
    from the pols_month_df, snp_df and unemp_df (shown above).
-   Range of years is 1947, 2015.
