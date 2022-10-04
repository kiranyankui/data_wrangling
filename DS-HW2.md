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
library(haven)
```

## Question 1

We want to read and clean the NYC transit dataset from the csv file.

``` r
NYC_transit = read_csv("./data/NYC_Transit_Subway_Entrance_And_Exit_Data.csv") %>% 
  janitor::clean_names()
```

    ## Rows: 1868 Columns: 32
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr (22): Division, Line, Station Name, Route1, Route2, Route3, Route4, Rout...
    ## dbl  (8): Station Latitude, Station Longitude, Route8, Route9, Route10, Rout...
    ## lgl  (2): ADA, Free Crossover
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

``` r
skimr::skim(NYC_transit)
```

|                                                  |             |
|:-------------------------------------------------|:------------|
| Name                                             | NYC_transit |
| Number of rows                                   | 1868        |
| Number of columns                                | 32          |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   |             |
| Column type frequency:                           |             |
| character                                        | 22          |
| logical                                          | 2           |
| numeric                                          | 8           |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ |             |
| Group variables                                  | None        |

Data summary

**Variable type: character**

| skim_variable      | n_missing | complete_rate | min | max | empty | n_unique | whitespace |
|:-------------------|----------:|--------------:|----:|----:|------:|---------:|-----------:|
| division           |         0 |          1.00 |   3 |   3 |     0 |        3 |          0 |
| line               |         0 |          1.00 |   5 |  17 |     0 |       36 |          0 |
| station_name       |         0 |          1.00 |   4 |  39 |     0 |      356 |          0 |
| route1             |         0 |          1.00 |   1 |   2 |     0 |       24 |          0 |
| route2             |       848 |          0.55 |   1 |   2 |     0 |       20 |          0 |
| route3             |      1374 |          0.26 |   1 |   2 |     0 |       18 |          0 |
| route4             |      1547 |          0.17 |   1 |   1 |     0 |       13 |          0 |
| route5             |      1630 |          0.13 |   1 |   1 |     0 |       12 |          0 |
| route6             |      1741 |          0.07 |   1 |   1 |     0 |        7 |          0 |
| route7             |      1788 |          0.04 |   1 |   2 |     0 |        7 |          0 |
| entrance_type      |         0 |          1.00 |   4 |   9 |     0 |        7 |          0 |
| entry              |         0 |          1.00 |   2 |   3 |     0 |        2 |          0 |
| exit_only          |      1812 |          0.03 |   3 |   3 |     0 |        1 |          0 |
| vending            |         0 |          1.00 |   2 |   3 |     0 |        2 |          0 |
| staffing           |         0 |          1.00 |   4 |   6 |     0 |        4 |          0 |
| staff_hours        |      1828 |          0.02 |  16 |  33 |     0 |       16 |          0 |
| ada_notes          |      1793 |          0.04 |   5 |  17 |     0 |       10 |          0 |
| north_south_street |        29 |          0.98 |   4 |  23 |     0 |      307 |          0 |
| east_west_street   |        35 |          0.98 |   6 |  24 |     0 |      352 |          0 |
| corner             |        32 |          0.98 |   1 |   4 |     0 |        8 |          0 |
| station_location   |         0 |          1.00 |  20 |  23 |     0 |      472 |          0 |
| entrance_location  |         0 |          1.00 |  22 |  23 |     0 |     1857 |          0 |

**Variable type: logical**

| skim_variable  | n_missing | complete_rate | mean | count               |
|:---------------|----------:|--------------:|-----:|:--------------------|
| ada            |         0 |             1 | 0.25 | FAL: 1400, TRU: 468 |
| free_crossover |         0 |             1 | 0.78 | TRU: 1448, FAL: 420 |

**Variable type: numeric**

| skim_variable      | n_missing | complete_rate |   mean |   sd |     p0 |    p25 |    p50 |    p75 |   p100 | hist  |
|:-------------------|----------:|--------------:|-------:|-----:|-------:|-------:|-------:|-------:|-------:|:------|
| station_latitude   |         0 |          1.00 |  40.73 | 0.07 |  40.58 |  40.69 |  40.73 |  40.77 |  40.90 | ▂▅▇▃▂ |
| station_longitude  |         0 |          1.00 | -73.94 | 0.06 | -74.03 | -73.99 | -73.96 | -73.91 | -73.76 | ▇▆▃▂▁ |
| route8             |      1820 |          0.03 |   2.98 | 1.94 |   1.00 |   1.00 |   4.00 |   5.00 |   5.00 | ▇▁▁▂▇ |
| route9             |      1840 |          0.01 |   2.54 | 1.17 |   2.00 |   2.00 |   2.00 |   2.00 |   5.00 | ▇▁▁▁▂ |
| route10            |      1845 |          0.01 |   3.00 | 0.00 |   3.00 |   3.00 |   3.00 |   3.00 |   3.00 | ▁▁▇▁▁ |
| route11            |      1845 |          0.01 |   7.00 | 0.00 |   7.00 |   7.00 |   7.00 |   7.00 |   7.00 | ▁▁▇▁▁ |
| entrance_latitude  |         0 |          1.00 |  40.73 | 0.07 |  40.58 |  40.69 |  40.73 |  40.77 |  40.90 | ▂▅▇▃▂ |
| entrance_longitude |         0 |          1.00 | -73.86 | 3.42 | -74.03 | -73.99 | -73.96 | -73.91 |  73.99 | ▇▁▁▁▁ |

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
```

    ## # A tibble: 1,868 × 19
    ##    line     station_…¹ stati…² stati…³ route1 route2 route3 route4 route5 route6
    ##    <chr>    <chr>        <dbl>   <dbl> <chr>  <chr>  <chr>  <chr>  <chr>  <chr> 
    ##  1 4 Avenue 25th St       40.7   -74.0 R      <NA>   <NA>   <NA>   <NA>   <NA>  
    ##  2 4 Avenue 25th St       40.7   -74.0 R      <NA>   <NA>   <NA>   <NA>   <NA>  
    ##  3 4 Avenue 36th St       40.7   -74.0 N      R      <NA>   <NA>   <NA>   <NA>  
    ##  4 4 Avenue 36th St       40.7   -74.0 N      R      <NA>   <NA>   <NA>   <NA>  
    ##  5 4 Avenue 36th St       40.7   -74.0 N      R      <NA>   <NA>   <NA>   <NA>  
    ##  6 4 Avenue 45th St       40.6   -74.0 R      <NA>   <NA>   <NA>   <NA>   <NA>  
    ##  7 4 Avenue 45th St       40.6   -74.0 R      <NA>   <NA>   <NA>   <NA>   <NA>  
    ##  8 4 Avenue 45th St       40.6   -74.0 R      <NA>   <NA>   <NA>   <NA>   <NA>  
    ##  9 4 Avenue 45th St       40.6   -74.0 R      <NA>   <NA>   <NA>   <NA>   <NA>  
    ## 10 4 Avenue 53rd St       40.6   -74.0 R      <NA>   <NA>   <NA>   <NA>   <NA>  
    ## # … with 1,858 more rows, 9 more variables: route7 <chr>, route8 <dbl>,
    ## #   route9 <dbl>, route10 <dbl>, route11 <dbl>, entry <chr>, vending <chr>,
    ## #   entrance_type <chr>, ada <lgl>, and abbreviated variable names
    ## #   ¹​station_name, ²​station_latitude, ³​station_longitude

``` r
NYC_transit
```

    ## # A tibble: 1,868 × 32
    ##    division line     statio…¹ stati…² stati…³ route1 route2 route3 route4 route5
    ##    <chr>    <chr>    <chr>      <dbl>   <dbl> <chr>  <chr>  <chr>  <chr>  <chr> 
    ##  1 BMT      4 Avenue 25th St     40.7   -74.0 R      <NA>   <NA>   <NA>   <NA>  
    ##  2 BMT      4 Avenue 25th St     40.7   -74.0 R      <NA>   <NA>   <NA>   <NA>  
    ##  3 BMT      4 Avenue 36th St     40.7   -74.0 N      R      <NA>   <NA>   <NA>  
    ##  4 BMT      4 Avenue 36th St     40.7   -74.0 N      R      <NA>   <NA>   <NA>  
    ##  5 BMT      4 Avenue 36th St     40.7   -74.0 N      R      <NA>   <NA>   <NA>  
    ##  6 BMT      4 Avenue 45th St     40.6   -74.0 R      <NA>   <NA>   <NA>   <NA>  
    ##  7 BMT      4 Avenue 45th St     40.6   -74.0 R      <NA>   <NA>   <NA>   <NA>  
    ##  8 BMT      4 Avenue 45th St     40.6   -74.0 R      <NA>   <NA>   <NA>   <NA>  
    ##  9 BMT      4 Avenue 45th St     40.6   -74.0 R      <NA>   <NA>   <NA>   <NA>  
    ## 10 BMT      4 Avenue 53rd St     40.6   -74.0 R      <NA>   <NA>   <NA>   <NA>  
    ## # … with 1,858 more rows, 22 more variables: route6 <chr>, route7 <chr>,
    ## #   route8 <dbl>, route9 <dbl>, route10 <dbl>, route11 <dbl>,
    ## #   entrance_type <chr>, entry <chr>, exit_only <chr>, vending <chr>,
    ## #   staffing <chr>, staff_hours <chr>, ada <lgl>, ada_notes <chr>,
    ## #   free_crossover <lgl>, north_south_street <chr>, east_west_street <chr>,
    ## #   corner <chr>, entrance_latitude <dbl>, entrance_longitude <dbl>,
    ## #   station_location <chr>, entrance_location <chr>, and abbreviated variable …

Converting the entry variable into a logical vector.

``` r
recode(NYC_transit$entry, "YES"=TRUE,"NO"=FALSE, .default = NA)
```

    ##    [1]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##   [13]  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE
    ##   [25]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##   [37] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##   [49]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE
    ##   [61]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##   [73]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##   [85]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##   [97]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [109]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [121]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [133]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [145]  TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [157]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [169]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [181]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [193]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [205]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [217]  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [229]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [241]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [253]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE
    ##  [265]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [277]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE
    ##  [289]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE
    ##  [301]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [313]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE
    ##  [325]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [337]  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE FALSE FALSE FALSE
    ##  [349] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [361]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [373]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [385]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [397]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [409]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE FALSE
    ##  [421]  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [433]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [445]  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [457]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE
    ##  [469]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [481]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [493]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE
    ##  [505]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE
    ##  [517]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [529]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [541]  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE
    ##  [553]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [565] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [577]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [589]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE
    ##  [601]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [613]  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE
    ##  [625]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [637]  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [649] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE  TRUE
    ##  [661]  TRUE  TRUE FALSE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [673] FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE
    ##  [685]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [697]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE
    ##  [709]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE
    ##  [721]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE
    ##  [733]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [745]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE FALSE  TRUE
    ##  [757]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [769]  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE
    ##  [781]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [793]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [805]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [817]  TRUE  TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [829]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE
    ##  [841] FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE
    ##  [853]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [865]  TRUE  TRUE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [877]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [889]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [901]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [913]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [925]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [937]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [949]  TRUE FALSE  TRUE FALSE  TRUE FALSE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE
    ##  [961]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE
    ##  [973]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [985]  TRUE  TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ##  [997] FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1009]  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE
    ## [1021]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1033]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE
    ## [1045]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1057]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE
    ## [1069] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1081]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1093]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1105]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1117]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1129]  TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1141]  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1153]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE
    ## [1165] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1177]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1189]  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1201]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1213]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1225]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1237]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1249]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1261]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE
    ## [1273]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1285]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1297]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1309]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1321]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1333]  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1345]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1357]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1369]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1381]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1393] FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE
    ## [1405] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1417]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1429]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1441]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1453]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1465]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1477]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1489]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1501]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE
    ## [1513]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1525]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1537]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1549] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1561]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1573]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1585]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1597]  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE
    ## [1609]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1621]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1633]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE  TRUE
    ## [1645]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1657]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1669]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1681]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1693]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE FALSE
    ## [1705]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1717]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1729]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1741]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1753]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1765]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1777]  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE FALSE FALSE  TRUE
    ## [1789]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1801]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1813]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1825]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1837]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1849]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [1861]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE

``` r
NYC_transit
```

    ## # A tibble: 1,868 × 32
    ##    division line     statio…¹ stati…² stati…³ route1 route2 route3 route4 route5
    ##    <chr>    <chr>    <chr>      <dbl>   <dbl> <chr>  <chr>  <chr>  <chr>  <chr> 
    ##  1 BMT      4 Avenue 25th St     40.7   -74.0 R      <NA>   <NA>   <NA>   <NA>  
    ##  2 BMT      4 Avenue 25th St     40.7   -74.0 R      <NA>   <NA>   <NA>   <NA>  
    ##  3 BMT      4 Avenue 36th St     40.7   -74.0 N      R      <NA>   <NA>   <NA>  
    ##  4 BMT      4 Avenue 36th St     40.7   -74.0 N      R      <NA>   <NA>   <NA>  
    ##  5 BMT      4 Avenue 36th St     40.7   -74.0 N      R      <NA>   <NA>   <NA>  
    ##  6 BMT      4 Avenue 45th St     40.6   -74.0 R      <NA>   <NA>   <NA>   <NA>  
    ##  7 BMT      4 Avenue 45th St     40.6   -74.0 R      <NA>   <NA>   <NA>   <NA>  
    ##  8 BMT      4 Avenue 45th St     40.6   -74.0 R      <NA>   <NA>   <NA>   <NA>  
    ##  9 BMT      4 Avenue 45th St     40.6   -74.0 R      <NA>   <NA>   <NA>   <NA>  
    ## 10 BMT      4 Avenue 53rd St     40.6   -74.0 R      <NA>   <NA>   <NA>   <NA>  
    ## # … with 1,858 more rows, 22 more variables: route6 <chr>, route7 <chr>,
    ## #   route8 <dbl>, route9 <dbl>, route10 <dbl>, route11 <dbl>,
    ## #   entrance_type <chr>, entry <chr>, exit_only <chr>, vending <chr>,
    ## #   staffing <chr>, staff_hours <chr>, ada <lgl>, ada_notes <chr>,
    ## #   free_crossover <lgl>, north_south_street <chr>, east_west_street <chr>,
    ## #   corner <chr>, entrance_latitude <dbl>, entrance_longitude <dbl>,
    ## #   station_location <chr>, entrance_location <chr>, and abbreviated variable …

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

    ## [1] 356

Ans: There are 356 distinct stations.

-   How many stations are ADA compliant?

``` r
NYC_transit %>% 
  select(station_name, ada) %>% 
  filter(ada == TRUE) %>%
  distinct(station_name)
```

    ## # A tibble: 73 × 1
    ##    station_name                  
    ##    <chr>                         
    ##  1 Atlantic Av-Barclays Ctr      
    ##  2 DeKalb Av                     
    ##  3 Pacific St                    
    ##  4 Grand Central                 
    ##  5 34th St                       
    ##  6 47-50th Sts Rockefeller Center
    ##  7 Church Av                     
    ##  8 21st St                       
    ##  9 Lexington Av                  
    ## 10 Roosevelt Island              
    ## # … with 63 more rows

Ans: There are 73 distinct stations who are ADA-compliant.

-   What proportion of station entrances / exits without vending allow
    entrance?

``` r
NYC_transit %>% 
  select(vending, entry) %>% 
  filter(entry == "YES", vending == "NO")
```

    ## # A tibble: 69 × 2
    ##    vending entry
    ##    <chr>   <chr>
    ##  1 NO      YES  
    ##  2 NO      YES  
    ##  3 NO      YES  
    ##  4 NO      YES  
    ##  5 NO      YES  
    ##  6 NO      YES  
    ##  7 NO      YES  
    ##  8 NO      YES  
    ##  9 NO      YES  
    ## 10 NO      YES  
    ## # … with 59 more rows

``` r
NYC_transit %>% 
  select(vending, entry) %>% 
  filter(vending == "NO")
```

    ## # A tibble: 183 × 2
    ##    vending entry
    ##    <chr>   <chr>
    ##  1 NO      NO   
    ##  2 NO      NO   
    ##  3 NO      YES  
    ##  4 NO      NO   
    ##  5 NO      NO   
    ##  6 NO      NO   
    ##  7 NO      YES  
    ##  8 NO      YES  
    ##  9 NO      YES  
    ## 10 NO      YES  
    ## # … with 173 more rows

69 station entrances do not have vending and allow entrance. 183 station
entrances do not have vending.

Ans: Proportion of station entrances / exits without vending allow
entrance is (69/183)\*100 = 37.70%.

I am reformating data so that route number and route name are distinct
variables.

-   How many distinct stations serve the A train? Of the stations that
    serve the A train, how many are ADA compliant?

## Problem 2

We want to read and clean the Mr Trash Wheel dataset from the excel
file.

``` r
Mr_Trash_df = read_excel("./data/Trash-Wheel-Collection-Totals-7-2020-2.xlsx", 
  sheet="Mr. Trash Wheel", 
  range = "A2:N535",
  skip = 1) %>% 
  janitor::clean_names() %>% 
  drop_na(dumpster) %>% 
  transform(sports_balls = as.integer(sports_balls)) 
```

**what does it mean by specify the sheet in the Excel file and to omit
non-data entries (rows with notes / figures; columns containing notes)
using arguments in read_excel?**

I ensured the use of reasonable variable names. I have ommited rows that
do not include dumpster-specific data. I have rounded the number of
sports balls to the nearest integer and converted the result to an
integer variable. I created an ID column (variable) to faciliate the
merging of the two datasets.

``` r
Pf_Trash_df = read_excel("./data/Trash-Wheel-Collection-Totals-7-2020-2.xlsx", 
  sheet = "Professor Trash Wheel",
  range = "A2:N117",
  skip = 1) %>% 
  janitor::clean_names() %>% 
  drop_na(dumpster) %>% 
  transform(sports_balls = as.integer(sports_balls)) %>% 
  add_column(name = "Professor Trash Wheel") %>%
  mutate(dumpster = as.character(dumpster))
```

Joining the datasets for Mr Trash Wheel and Professor Trash Wheel

``` r
Both_Trash_df = 
  full_join(Mr_Trash_df, Pf_Trash_df)
```

    ## Joining, by = c("dumpster", "month", "year", "date", "weight_tons",
    ## "volume_cubic_yards", "plastic_bottles", "polystyrene", "cigarette_butts",
    ## "glass_bottles", "grocery_bags", "chip_bags", "sports_balls", "homes_powered")

**Mr Trash Wheel dataset (Mr_Trash_df)** \* there are 14 columns
(variables) and 454 rows (observations)

**Professor Trash Wheel (Pf_Trash_df)** \* there are 15 columns
(variables) and 71 rows (observations).

**combined dataset (Both_Trash_df)** \* There are 15 columns (variables)
and 525 rows (observations). \* This dataset includes the following
variables: dumpster, month, year, date, weight_tons, volume_cubic_yards,
plastic_bottles, polystyrene, cigarette_butts, glass_bottles,
grocery_bags, chip_bags, sports_balls, homes_powered, name.

This dataset contains:

-   the weight of trash collected in tons
-   number of trash items collected (plastic bottles, polystyrene,
    cigarette butts, grocery bags, glass bottles, chip bags, and sports
    balls)
-   timing of trash collection by Mr Trash wheel and professor trash
    wheel

The total weight of trash collected by Professor Trash Wheel is 135.5
tons.

The total number of sports balls collected by Mr. Trash Wheel in 2020 is
856 balls.

## Problem 3

### Dataset for pols-month.csv

``` r
pols_month_df = read_csv("./data/pols-month.csv") %>% 
  janitor::clean_names() %>% 
  separate(mon, into = c("year", "month", "day"), sep = '-') %>% 
  transform(month = as.numeric(month)) %>%
  mutate(month = month.name[month])
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
| Number of columns                                | 11            |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   |               |
| Column type frequency:                           |               |
| character                                        | 3             |
| numeric                                          | 8             |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ |               |
| Group variables                                  | None          |

Data summary

**Variable type: character**

| skim_variable | n_missing | complete_rate | min | max | empty | n_unique | whitespace |
|:--------------|----------:|--------------:|----:|----:|------:|---------:|-----------:|
| year          |         0 |             1 |   4 |   4 |     0 |       69 |          0 |
| month         |         0 |             1 |   3 |   9 |     0 |       12 |          0 |
| day           |         0 |             1 |   2 |   2 |     0 |        1 |          0 |

**Variable type: numeric**

| skim_variable | n_missing | complete_rate |   mean |    sd |  p0 | p25 | p50 | p75 | p100 | hist  |
|:--------------|----------:|--------------:|-------:|------:|----:|----:|----:|----:|-----:|:------|
| prez_gop      |         0 |             1 |   0.53 |  0.51 |   0 |   0 |   1 |   1 |    2 | ▇▁▇▁▁ |
| gov_gop       |         0 |             1 |  22.48 |  5.68 |  12 |  18 |  22 |  28 |   34 | ▆▆▇▅▅ |
| sen_gop       |         0 |             1 |  46.10 |  6.38 |  32 |  42 |  46 |  51 |   56 | ▃▃▇▇▇ |
| rep_gop       |         0 |             1 | 194.92 | 29.24 | 141 | 176 | 195 | 222 |  253 | ▃▇▆▃▅ |
| prez_dem      |         0 |             1 |   0.47 |  0.50 |   0 |   0 |   0 |   1 |    1 | ▇▁▁▁▇ |
| gov_dem       |         0 |             1 |  27.20 |  5.94 |  17 |  22 |  28 |  32 |   41 | ▆▅▇▆▂ |
| sen_dem       |         0 |             1 |  54.41 |  7.37 |  44 |  48 |  53 |  58 |   71 | ▇▆▇▃▂ |
| rep_dem       |         0 |             1 | 244.97 | 31.37 | 188 | 211 | 250 | 268 |  301 | ▇▂▇▇▅ |

i have loaded and cleaned the data in pols-month.csv, as well as
separated the column “mon” into “year”, “month” and day”. I also
converted the “month” variable into a numeric variable.

``` r
pols_month_df %>%
  mutate(month = month.name[month])
```

    ##     year month day prez_gop gov_gop sen_gop rep_gop prez_dem gov_dem sen_dem
    ## 1   1947  <NA>  15        0      23      51     253        1      23      45
    ## 2   1947  <NA>  15        0      23      51     253        1      23      45
    ## 3   1947  <NA>  15        0      23      51     253        1      23      45
    ## 4   1947  <NA>  15        0      23      51     253        1      23      45
    ## 5   1947  <NA>  15        0      23      51     253        1      23      45
    ## 6   1947  <NA>  15        0      23      51     253        1      23      45
    ## 7   1947  <NA>  15        0      23      51     253        1      23      45
    ## 8   1947  <NA>  15        0      23      51     253        1      23      45
    ## 9   1947  <NA>  15        0      23      51     253        1      23      45
    ## 10  1947  <NA>  15        0      23      51     253        1      23      45
    ## 11  1947  <NA>  15        0      24      51     253        1      23      45
    ## 12  1947  <NA>  15        0      24      51     253        1      23      45
    ## 13  1948  <NA>  15        0      22      53     253        1      24      48
    ## 14  1948  <NA>  15        0      22      53     253        1      24      48
    ## 15  1948  <NA>  15        0      22      53     253        1      24      48
    ## 16  1948  <NA>  15        0      22      53     253        1      24      48
    ## 17  1948  <NA>  15        0      22      53     253        1      24      48
    ## 18  1948  <NA>  15        0      22      53     253        1      24      48
    ## 19  1948  <NA>  15        0      22      53     253        1      24      48
    ## 20  1948  <NA>  15        0      22      53     253        1      24      48
    ## 21  1948  <NA>  15        0      22      53     253        1      24      48
    ## 22  1948  <NA>  15        0      22      53     253        1      24      48
    ## 23  1948  <NA>  15        0      22      53     253        1      24      48
    ## 24  1948  <NA>  15        0      22      53     253        1      24      48
    ## 25  1949  <NA>  15        0      18      45     177        1      29      58
    ## 26  1949  <NA>  15        0      18      45     177        1      29      58
    ## 27  1949  <NA>  15        0      18      45     177        1      29      58
    ## 28  1949  <NA>  15        0      18      45     177        1      29      58
    ## 29  1949  <NA>  15        0      18      45     177        1      29      58
    ## 30  1949  <NA>  15        0      18      45     177        1      29      58
    ## 31  1949  <NA>  15        0      18      45     177        1      30      58
    ## 32  1949  <NA>  15        0      18      45     177        1      30      58
    ## 33  1949  <NA>  15        0      18      45     177        1      30      58
    ## 34  1949  <NA>  15        0      18      45     177        1      30      58
    ## 35  1949  <NA>  15        0      18      45     177        1      30      58
    ## 36  1949  <NA>  15        0      18      45     177        1      30      58
    ## 37  1950  <NA>  15        0      18      44     177        1      29      57
    ## 38  1950  <NA>  15        0      18      44     177        1      29      57
    ## 39  1950  <NA>  15        0      18      44     177        1      29      57
    ## 40  1950  <NA>  15        0      18      44     177        1      29      57
    ## 41  1950  <NA>  15        0      18      44     177        1      29      57
    ## 42  1950  <NA>  15        0      18      44     177        1      29      57
    ## 43  1950  <NA>  15        0      18      44     177        1      29      57
    ## 44  1950  <NA>  15        0      18      44     177        1      29      57
    ## 45  1950  <NA>  15        0      18      44     177        1      29      57
    ## 46  1950  <NA>  15        0      18      44     177        1      29      57
    ## 47  1950  <NA>  15        0      18      44     177        1      29      57
    ## 48  1950  <NA>  15        0      18      44     177        1      29      57
    ## 49  1951  <NA>  15        0      24      47     207        1      22      51
    ## 50  1951  <NA>  15        0      24      47     207        1      22      51
    ## 51  1951  <NA>  15        0      24      47     207        1      22      51
    ## 52  1951  <NA>  15        0      24      47     207        1      22      51
    ## 53  1951  <NA>  15        0      24      47     207        1      22      51
    ## 54  1951  <NA>  15        0      24      47     207        1      22      51
    ## 55  1951  <NA>  15        0      24      47     207        1      22      51
    ## 56  1951  <NA>  15        0      24      47     207        1      22      51
    ## 57  1951  <NA>  15        0      24      47     207        1      22      51
    ## 58  1951  <NA>  15        0      25      47     207        1      22      51
    ## 59  1951  <NA>  15        0      25      47     207        1      22      51
    ## 60  1951  <NA>  15        0      25      47     207        1      22      51
    ## 61  1952  <NA>  15        0      24      50     207        1      22      50
    ## 62  1952  <NA>  15        0      24      50     207        1      22      50
    ## 63  1952  <NA>  15        0      24      50     207        1      22      50
    ## 64  1952  <NA>  15        0      24      50     207        1      22      50
    ## 65  1952  <NA>  15        0      24      50     207        1      22      50
    ## 66  1952  <NA>  15        0      24      50     207        1      22      50
    ## 67  1952  <NA>  15        0      24      50     207        1      22      50
    ## 68  1952  <NA>  15        0      24      50     207        1      22      50
    ## 69  1952  <NA>  15        0      24      50     207        1      22      50
    ## 70  1952  <NA>  15        0      24      50     207        1      22      50
    ## 71  1952  <NA>  15        0      24      50     207        1      22      50
    ## 72  1952  <NA>  15        0      24      50     207        1      22      50
    ## 73  1953  <NA>  15        1      29      50     222        0      17      49
    ## 74  1953  <NA>  15        1      29      50     222        0      17      49
    ## 75  1953  <NA>  15        1      29      50     222        0      17      49
    ## 76  1953  <NA>  15        1      29      50     222        0      17      49
    ## 77  1953  <NA>  15        1      29      50     222        0      17      49
    ## 78  1953  <NA>  15        1      29      50     222        0      17      49
    ## 79  1953  <NA>  15        1      29      50     222        0      17      49
    ## 80  1953  <NA>  15        1      29      50     222        0      17      49
    ## 81  1953  <NA>  15        1      29      50     222        0      17      49
    ## 82  1953  <NA>  15        1      30      50     222        0      18      49
    ## 83  1953  <NA>  15        1      30      50     222        0      18      49
    ## 84  1953  <NA>  15        1      30      50     222        0      18      49
    ## 85  1954  <NA>  15        1      29      55     222        0      18      53
    ## 86  1954  <NA>  15        1      29      55     222        0      18      53
    ## 87  1954  <NA>  15        1      29      55     222        0      18      53
    ## 88  1954  <NA>  15        1      29      55     222        0      18      53
    ## 89  1954  <NA>  15        1      29      55     222        0      18      53
    ## 90  1954  <NA>  15        1      29      55     222        0      18      53
    ## 91  1954  <NA>  15        1      29      55     222        0      18      53
    ## 92  1954  <NA>  15        1      29      55     222        0      18      53
    ## 93  1954  <NA>  15        1      29      55     222        0      18      53
    ## 94  1954  <NA>  15        1      29      55     222        0      18      53
    ## 95  1954  <NA>  15        1      29      55     222        0      19      53
    ## 96  1954  <NA>  15        1      29      55     222        0      19      53
    ## 97  1955  <NA>  15        1      21      47     204        0      26      48
    ## 98  1955  <NA>  15        1      21      47     204        0      26      48
    ## 99  1955  <NA>  15        1      21      47     204        0      26      48
    ## 100 1955  <NA>  15        1      21      47     204        0      26      48
    ## 101 1955  <NA>  15        1      21      47     204        0      26      48
    ## 102 1955  <NA>  15        1      21      47     204        0      26      48
    ## 103 1955  <NA>  15        1      21      47     204        0      26      48
    ## 104 1955  <NA>  15        1      21      47     204        0      26      48
    ## 105 1955  <NA>  15        1      21      47     204        0      26      48
    ## 106 1955  <NA>  15        1      21      47     204        0      26      48
    ## 107 1955  <NA>  15        1      21      47     204        0      26      48
    ## 108 1955  <NA>  15        1      21      47     204        0      26      48
    ## 109 1956  <NA>  15        1      21      49     204        0      26      51
    ## 110 1956  <NA>  15        1      21      49     204        0      26      51
    ## 111 1956  <NA>  15        1      21      49     204        0      26      51
    ## 112 1956  <NA>  15        1      21      49     204        0      26      50
    ## 113 1956  <NA>  15        1      21      49     204        0      26      50
    ## 114 1956  <NA>  15        1      21      49     204        0      26      50
    ## 115 1956  <NA>  15        1      21      49     204        0      26      50
    ## 116 1956  <NA>  15        1      21      49     204        0      26      50
    ## 117 1956  <NA>  15        1      21      49     204        0      26      50
    ## 118 1956  <NA>  15        1      21      49     204        0      26      50
    ## 119 1956  <NA>  15        1      21      49     204        0      26      51
    ## 120 1956  <NA>  15        1      21      49     204        0      26      51
    ## 121 1957  <NA>  15        1      19      47     203        0      28      52
    ## 122 1957  <NA>  15        1      19      47     203        0      28      52
    ## 123 1957  <NA>  15        1      19      47     203        0      28      52
    ## 124 1957  <NA>  15        1      19      47     203        0      28      52
    ## 125 1957  <NA>  15        1      19      47     203        0      28      52
    ## 126 1957  <NA>  15        1      19      47     203        0      28      52
    ## 127 1957  <NA>  15        1      19      47     203        0      28      52
    ## 128 1957  <NA>  15        1      19      47     203        0      28      52
    ## 129 1957  <NA>  15        1      20      47     203        0      28      52
    ## 130 1957  <NA>  15        1      20      47     203        0      28      52
    ## 131 1957  <NA>  15        1      20      47     203        0      28      52
    ## 132 1957  <NA>  15        1      20      47     203        0      28      52
    ## 133 1958  <NA>  15        1      20      47     203        0      28      52
    ## 134 1958  <NA>  15        1      20      47     203        0      28      52
    ## 135 1958  <NA>  15        1      20      47     203        0      28      52
    ## 136 1958  <NA>  15        1      20      47     203        0      28      52
    ## 137 1958  <NA>  15        1      20      47     203        0      28      52
    ## 138 1958  <NA>  15        1      20      47     203        0      28      52
    ## 139 1958  <NA>  15        1      20      47     203        0      28      52
    ## 140 1958  <NA>  15        1      20      47     203        0      28      52
    ## 141 1958  <NA>  15        1      20      47     203        0      28      52
    ## 142 1958  <NA>  15        1      20      47     203        0      28      52
    ## 143 1958  <NA>  15        1      20      47     203        0      28      52
    ## 144 1958  <NA>  15        1      20      47     203        0      28      52
    ## 145 1959  <NA>  15        1      15      35     159        0      35      65
    ## 146 1959  <NA>  15        1      15      35     159        0      35      65
    ## 147 1959  <NA>  15        1      15      35     159        0      35      65
    ## 148 1959  <NA>  15        1      15      35     159        0      35      65
    ## 149 1959  <NA>  15        1      15      35     159        0      35      65
    ## 150 1959  <NA>  15        1      15      35     159        0      35      65
    ## 151 1959  <NA>  15        1      15      35     159        0      35      65
    ## 152 1959  <NA>  15        1      15      35     159        0      35      65
    ## 153 1959  <NA>  15        1      15      35     159        0      35      65
    ## 154 1959  <NA>  15        1      15      35     159        0      35      65
    ## 155 1959  <NA>  15        1      15      35     159        0      35      65
    ## 156 1959  <NA>  15        1      15      35     159        0      35      65
    ## 157 1960  <NA>  15        1      16      35     159        0      34      70
    ## 158 1960  <NA>  15        1      16      35     159        0      34      70
    ## 159 1960  <NA>  15        1      16      35     159        0      34      70
    ## 160 1960  <NA>  15        1      16      35     159        0      34      70
    ## 161 1960  <NA>  15        1      16      35     159        0      34      70
    ## 162 1960  <NA>  15        1      16      35     159        0      34      70
    ## 163 1960  <NA>  15        1      16      35     159        0      34      70
    ## 164 1960  <NA>  15        1      16      35     159        0      34      70
    ## 165 1960  <NA>  15        1      17      35     159        0      34      70
    ## 166 1960  <NA>  15        1      17      35     159        0      34      70
    ## 167 1960  <NA>  15        1      17      35     159        0      34      70
    ## 168 1960  <NA>  15        1      17      35     159        0      34      70
    ## 169 1961  <NA>  15        0      16      37     176        1      34      64
    ## 170 1961  <NA>  15        0      16      37     176        1      34      64
    ## 171 1961  <NA>  15        0      16      37     176        1      34      64
    ## 172 1961  <NA>  15        0      16      37     176        1      34      64
    ## 173 1961  <NA>  15        0      16      37     176        1      34      64
    ## 174 1961  <NA>  15        0      16      37     176        1      34      64
    ## 175 1961  <NA>  15        0      16      37     176        1      34      64
    ## 176 1961  <NA>  15        0      16      37     176        1      34      64
    ## 177 1961  <NA>  15        0      16      37     176        1      34      64
    ## 178 1961  <NA>  15        0      16      37     176        1      34      64
    ## 179 1961  <NA>  15        0      16      37     176        1      34      64
    ## 180 1961  <NA>  15        0      16      37     176        1      34      64
    ## 181 1962  <NA>  15        0      16      42     176        1      34      65
    ## 182 1962  <NA>  15        0      16      42     176        1      34      65
    ## 183 1962  <NA>  15        0      16      42     176        1      34      65
    ## 184 1962  <NA>  15        0      16      42     176        1      34      65
    ## 185 1962  <NA>  15        0      16      42     176        1      34      65
    ## 186 1962  <NA>  15        0      16      42     176        1      34      65
    ## 187 1962  <NA>  15        0      16      42     176        1      34      65
    ## 188 1962  <NA>  15        0      16      42     176        1      34      65
    ## 189 1962  <NA>  15        0      16      42     176        1      34      65
    ## 190 1962  <NA>  15        0      16      42     176        1      34      65
    ## 191 1962  <NA>  15        0      16      42     176        1      34      65
    ## 192 1962  <NA>  15        0      16      42     176        1      34      65
    ## 193 1963  <NA>  15        0      17      34     182        1      33      68
    ## 194 1963  <NA>  15        0      17      34     182        1      33      68
    ## 195 1963  <NA>  15        0      16      34     182        1      34      68
    ## 196 1963  <NA>  15        0      16      34     182        1      34      68
    ## 197 1963  <NA>  15        0      16      34     182        1      34      68
    ## 198 1963  <NA>  15        0      16      34     182        1      34      68
    ## 199 1963  <NA>  15        0      16      34     182        1      34      68
    ## 200 1963  <NA>  15        0      16      34     182        1      34      68
    ## 201 1963  <NA>  15        0      16      34     182        1      34      68
    ## 202 1963  <NA>  15        0      16      34     182        1      34      68
    ## 203 1963  <NA>  15        0      16      34     182        1      34      68
    ## 204 1963  <NA>  15        0      16      34     182        1      34      68
    ## 205 1964  <NA>  15        0      16      34     182        1      34      71
    ## 206 1964  <NA>  15        0      16      34     182        1      34      71
    ## 207 1964  <NA>  15        0      16      34     182        1      34      71
    ## 208 1964  <NA>  15        0      16      34     182        1      34      71
    ## 209 1964  <NA>  15        0      16      34     182        1      34      71
    ## 210 1964  <NA>  15        0      16      34     182        1      34      71
    ## 211 1964  <NA>  15        0      16      34     182        1      34      71
    ## 212 1964  <NA>  15        0      16      34     182        1      34      71
    ## 213 1964  <NA>  15        0      16      34     182        1      34      71
    ## 214 1964  <NA>  15        0      16      34     182        1      34      71
    ## 215 1964  <NA>  15        0      16      34     182        1      34      71
    ## 216 1964  <NA>  15        0      16      34     182        1      34      71
    ## 217 1965  <NA>  15        0      17      32     141        1      33      69
    ## 218 1965  <NA>  15        0      17      32     141        1      33      69
    ## 219 1965  <NA>  15        0      17      32     141        1      33      69
    ## 220 1965  <NA>  15        0      17      32     141        1      33      69
    ## 221 1965  <NA>  15        0      17      32     141        1      33      69
    ## 222 1965  <NA>  15        0      17      32     141        1      33      69
    ## 223 1965  <NA>  15        0      17      32     141        1      33      69
    ## 224 1965  <NA>  15        0      17      32     141        1      33      69
    ## 225 1965  <NA>  15        0      17      32     141        1      33      69
    ## 226 1965  <NA>  15        0      17      32     141        1      33      69
    ## 227 1965  <NA>  15        0      17      32     141        1      33      69
    ## 228 1965  <NA>  15        0      17      32     141        1      33      69
    ## 229 1966  <NA>  15        0      18      33     141        1      33      70
    ## 230 1966  <NA>  15        0      18      33     141        1      33      70
    ## 231 1966  <NA>  15        0      18      33     141        1      33      70
    ## 232 1966  <NA>  15        0      18      33     141        1      33      70
    ## 233 1966  <NA>  15        0      18      33     141        1      33      70
    ## 234 1966  <NA>  15        0      18      33     141        1      33      70
    ## 235 1966  <NA>  15        0      18      33     141        1      33      70
    ## 236 1966  <NA>  15        0      18      33     141        1      33      70
    ## 237 1966  <NA>  15        0      18      33     141        1      33      70
    ## 238 1966  <NA>  15        0      18      33     141        1      33      70
    ## 239 1966  <NA>  15        0      18      33     141        1      33      70
    ## 240 1966  <NA>  15        0      18      33     141        1      33      70
    ## 241 1967  <NA>  15        0      25      36     188        1      27      64
    ## 242 1967  <NA>  15        0      25      36     188        1      27      64
    ## 243 1967  <NA>  15        0      25      36     188        1      27      64
    ## 244 1967  <NA>  15        0      25      36     188        1      27      64
    ## 245 1967  <NA>  15        0      25      36     188        1      27      64
    ## 246 1967  <NA>  15        0      25      36     188        1      27      64
    ## 247 1967  <NA>  15        0      25      36     188        1      27      64
    ## 248 1967  <NA>  15        0      25      36     188        1      27      64
    ## 249 1967  <NA>  15        0      25      36     188        1      27      64
    ## 250 1967  <NA>  15        0      25      36     188        1      27      64
    ## 251 1967  <NA>  15        0      25      36     188        1      27      64
    ## 252 1967  <NA>  15        0      25      36     188        1      27      64
    ## 253 1968  <NA>  15        0      26      39     188        1      26      65
    ## 254 1968  <NA>  15        0      26      39     188        1      26      65
    ## 255 1968  <NA>  15        0      26      39     188        1      26      65
    ## 256 1968  <NA>  15        0      26      39     188        1      26      65
    ## 257 1968  <NA>  15        0      26      39     188        1      26      65
    ## 258 1968  <NA>  15        0      26      39     188        1      26      65
    ## 259 1968  <NA>  15        0      26      39     188        1      26      65
    ## 260 1968  <NA>  15        0      26      39     188        1      26      65
    ## 261 1968  <NA>  15        0      26      39     188        1      26      65
    ## 262 1968  <NA>  15        0      26      39     188        1      26      65
    ## 263 1968  <NA>  15        0      26      39     188        1      26      65
    ## 264 1968  <NA>  15        0      26      39     188        1      26      65
    ## 265 1969  <NA>  15        1      31      43     199        0      22      57
    ## 266 1969  <NA>  15        1      31      43     199        0      22      57
    ## 267 1969  <NA>  15        1      31      43     199        0      22      57
    ## 268 1969  <NA>  15        1      31      43     199        0      22      57
    ## 269 1969  <NA>  15        1      31      43     199        0      22      57
    ## 270 1969  <NA>  15        1      31      43     199        0      22      57
    ## 271 1969  <NA>  15        1      31      43     199        0      22      57
    ## 272 1969  <NA>  15        1      31      43     199        0      22      57
    ## 273 1969  <NA>  15        1      31      43     199        0      22      57
    ## 274 1969  <NA>  15        1      31      43     199        0      22      57
    ## 275 1969  <NA>  15        1      31      43     199        0      22      57
    ## 276 1969  <NA>  15        1      31      43     199        0      22      57
    ## 277 1970  <NA>  15        1      32      43     199        0      20      58
    ## 278 1970  <NA>  15        1      32      43     199        0      20      58
    ## 279 1970  <NA>  15        1      32      43     199        0      20      58
    ## 280 1970  <NA>  15        1      32      43     199        0      20      58
    ## 281 1970  <NA>  15        1      32      43     199        0      20      58
    ## 282 1970  <NA>  15        1      32      43     199        0      20      58
    ## 283 1970  <NA>  15        1      32      43     199        0      20      58
    ## 284 1970  <NA>  15        1      32      43     199        0      20      58
    ## 285 1970  <NA>  15        1      32      43     199        0      20      58
    ## 286 1970  <NA>  15        1      32      43     199        0      20      58
    ## 287 1970  <NA>  15        1      32      43     199        0      20      58
    ## 288 1970  <NA>  15        1      32      43     199        0      20      58
    ## 289 1971  <NA>  15        1      21      44     185        0      30      55
    ## 290 1971  <NA>  15        1      21      44     185        0      30      55
    ## 291 1971  <NA>  15        1      21      44     185        0      30      55
    ## 292 1971  <NA>  15        1      21      44     185        0      30      55
    ## 293 1971  <NA>  15        1      21      44     185        0      30      55
    ## 294 1971  <NA>  15        1      21      44     185        0      30      55
    ## 295 1971  <NA>  15        1      21      44     185        0      30      55
    ## 296 1971  <NA>  15        1      21      44     185        0      30      55
    ## 297 1971  <NA>  15        1      21      44     185        0      30      55
    ## 298 1971  <NA>  15        1      21      44     185        0      30      55
    ## 299 1971  <NA>  15        1      21      44     185        0      30      55
    ## 300 1971  <NA>  15        1      21      44     185        0      30      55
    ## 301 1972  <NA>  15        1      20      44     185        0      31      57
    ## 302 1972  <NA>  15        1      20      44     185        0      31      57
    ## 303 1972  <NA>  15        1      20      44     185        0      31      57
    ## 304 1972  <NA>  15        1      20      44     185        0      31      57
    ## 305 1972  <NA>  15        1      20      44     185        0      31      57
    ## 306 1972  <NA>  15        1      20      44     185        0      31      57
    ## 307 1972  <NA>  15        1      20      44     185        0      31      57
    ## 308 1972  <NA>  15        1      20      44     185        0      31      57
    ## 309 1972  <NA>  15        1      20      44     185        0      31      57
    ## 310 1972  <NA>  15        1      20      44     185        0      31      57
    ## 311 1972  <NA>  15        1      20      44     185        0      31      57
    ## 312 1972  <NA>  15        1      20      44     185        0      31      57
    ## 313 1973  <NA>  15        1      19      42     195        0      32      56
    ## 314 1973  <NA>  15        1      19      42     195        0      32      56
    ## 315 1973  <NA>  15        1      19      42     195        0      32      56
    ## 316 1973  <NA>  15        1      19      42     195        0      32      56
    ## 317 1973  <NA>  15        1      19      42     195        0      32      56
    ## 318 1973  <NA>  15        1      19      42     195        0      32      56
    ## 319 1973  <NA>  15        1      19      42     195        0      32      56
    ## 320 1973  <NA>  15        1      20      42     195        0      32      56
    ## 321 1973  <NA>  15        1      20      42     195        0      32      56
    ## 322 1973  <NA>  15        1      20      42     195        0      32      56
    ## 323 1973  <NA>  15        1      20      42     195        0      32      56
    ## 324 1973  <NA>  15        1      20      42     195        0      32      56
    ## 325 1974  <NA>  15        1      18      45     195        0      34      59
    ## 326 1974  <NA>  15        1      18      45     195        0      34      59
    ## 327 1974  <NA>  15        1      18      45     195        0      34      59
    ## 328 1974  <NA>  15        1      18      45     195        0      34      59
    ## 329 1974  <NA>  15        1      18      45     195        0      34      59
    ## 330 1974  <NA>  15        1      18      45     195        0      34      59
    ## 331 1974  <NA>  15        1      18      45     195        0      34      59
    ## 332 1974  <NA>  15        2      18      45     195        0      34      59
    ## 333 1974  <NA>  15        2      18      45     195        0      34      59
    ## 334 1974  <NA>  15        2      18      45     195        0      34      59
    ## 335 1974  <NA>  15        2      18      45     195        0      34      59
    ## 336 1974  <NA>  15        2      18      45     195        0      34      59
    ## 337 1975  <NA>  15        1      13      38     148        0      37      61
    ## 338 1975  <NA>  15        1      13      38     148        0      37      61
    ## 339 1975  <NA>  15        1      13      38     148        0      37      61
    ## 340 1975  <NA>  15        1      13      38     148        0      37      61
    ## 341 1975  <NA>  15        1      13      38     148        0      37      61
    ## 342 1975  <NA>  15        1      13      38     148        0      37      61
    ## 343 1975  <NA>  15        1      13      38     148        0      37      61
    ## 344 1975  <NA>  15        1      13      38     148        0      37      61
    ## 345 1975  <NA>  15        1      13      38     148        0      37      61
    ## 346 1975  <NA>  15        1      13      38     148        0      37      61
    ## 347 1975  <NA>  15        1      13      38     148        0      37      61
    ## 348 1975  <NA>  15        1      13      38     148        0      37      61
    ## 349 1976  <NA>  15        1      13      39     148        0      37      65
    ## 350 1976  <NA>  15        1      13      39     148        0      37      65
    ## 351 1976  <NA>  15        1      13      39     148        0      37      65
    ## 352 1976  <NA>  15        1      13      39     148        0      37      65
    ## 353 1976  <NA>  15        1      13      39     148        0      37      65
    ## 354 1976  <NA>  15        1      13      39     148        0      37      65
    ## 355 1976  <NA>  15        1      13      39     148        0      37      65
    ## 356 1976  <NA>  15        1      13      39     148        0      37      65
    ## 357 1976  <NA>  15        1      13      39     148        0      37      65
    ## 358 1976  <NA>  15        1      13      39     148        0      37      65
    ## 359 1976  <NA>  15        1      13      39     148        0      37      65
    ## 360 1976  <NA>  15        1      13      39     148        0      37      65
    ## 361 1977  <NA>  15        0      12      38     147        1      38      62
    ## 362 1977  <NA>  15        0      12      38     147        1      38      62
    ## 363 1977  <NA>  15        0      12      38     147        1      38      62
    ## 364 1977  <NA>  15        0      12      38     147        1      38      62
    ## 365 1977  <NA>  15        0      12      38     147        1      38      62
    ## 366 1977  <NA>  15        0      12      38     147        1      39      62
    ## 367 1977  <NA>  15        0      12      38     147        1      40      62
    ## 368 1977  <NA>  15        0      12      38     147        1      40      62
    ## 369 1977  <NA>  15        0      12      38     147        1      40      62
    ## 370 1977  <NA>  15        0      12      38     147        1      40      62
    ## 371 1977  <NA>  15        0      12      38     147        1      41      62
    ## 372 1977  <NA>  15        0      12      38     147        1      41      62
    ## 373 1978  <NA>  15        0      12      41     147        1      38      66
    ## 374 1978  <NA>  15        0      12      41     147        1      38      66
    ## 375 1978  <NA>  15        0      12      41     147        1      38      66
    ## 376 1978  <NA>  15        0      12      41     147        1      38      66
    ## 377 1978  <NA>  15        0      12      41     147        1      38      66
    ## 378 1978  <NA>  15        0      12      41     147        1      38      66
    ## 379 1978  <NA>  15        0      12      41     147        1      38      66
    ## 380 1978  <NA>  15        0      12      41     147        1      39      66
    ## 381 1978  <NA>  15        0      12      41     147        1      39      66
    ## 382 1978  <NA>  15        0      12      41     147        1      39      66
    ## 383 1978  <NA>  15        0      12      41     147        1      39      66
    ## 384 1978  <NA>  15        0      12      41     147        1      39      66
    ## 385 1979  <NA>  15        0      19      41     160        1      32      58
    ## 386 1979  <NA>  15        0      19      41     160        1      32      58
    ## 387 1979  <NA>  15        0      19      41     160        1      32      58
    ## 388 1979  <NA>  15        0      19      41     160        1      32      58
    ## 389 1979  <NA>  15        0      19      41     160        1      32      58
    ## 390 1979  <NA>  15        0      19      41     160        1      32      58
    ## 391 1979  <NA>  15        0      19      41     160        1      32      58
    ## 392 1979  <NA>  15        0      19      41     160        1      32      58
    ## 393 1979  <NA>  15        0      19      41     160        1      32      58
    ## 394 1979  <NA>  15        0      19      41     160        1      32      58
    ## 395 1979  <NA>  15        0      19      41     160        1      32      58
    ## 396 1979  <NA>  15        0      19      41     160        1      32      58
    ## 397 1980  <NA>  15        0      19      42     160        1      32      59
    ## 398 1980  <NA>  15        0      19      42     160        1      32      59
    ## 399 1980  <NA>  15        0      20      42     160        1      31      59
    ## 400 1980  <NA>  15        0      20      42     160        1      31      59
    ## 401 1980  <NA>  15        0      20      42     160        1      31      59
    ## 402 1980  <NA>  15        0      20      42     160        1      31      59
    ## 403 1980  <NA>  15        0      20      42     160        1      31      59
    ## 404 1980  <NA>  15        0      20      42     160        1      31      59
    ## 405 1980  <NA>  15        0      20      42     160        1      31      59
    ## 406 1980  <NA>  15        0      20      42     160        1      31      59
    ## 407 1980  <NA>  15        0      20      42     160        1      31      59
    ## 408 1980  <NA>  15        0      20      42     160        1      31      59
    ## 409 1981  <NA>  15        1      24      53     196        0      27      46
    ## 410 1981  <NA>  15        1      24      53     196        0      27      46
    ## 411 1981  <NA>  15        1      24      53     196        0      27      46
    ## 412 1981  <NA>  15        1      24      53     196        0      27      46
    ## 413 1981  <NA>  15        1      24      53     196        0      27      46
    ## 414 1981  <NA>  15        1      24      53     196        0      27      46
    ## 415 1981  <NA>  15        1      24      53     196        0      27      46
    ## 416 1981  <NA>  15        1      24      53     196        0      27      46
    ## 417 1981  <NA>  15        1      24      53     196        0      27      46
    ## 418 1981  <NA>  15        1      24      53     196        0      27      46
    ## 419 1981  <NA>  15        1      24      53     196        0      27      46
    ## 420 1981  <NA>  15        1      24      53     196        0      27      46
    ## 421 1982  <NA>  15        1      24      54     196        0      27      47
    ## 422 1982  <NA>  15        1      24      54     196        0      27      47
    ## 423 1982  <NA>  15        1      24      54     196        0      27      47
    ## 424 1982  <NA>  15        1      24      54     196        0      27      47
    ## 425 1982  <NA>  15        1      24      54     196        0      27      47
    ## 426 1982  <NA>  15        1      24      54     196        0      27      47
    ## 427 1982  <NA>  15        1      24      54     196        0      27      47
    ## 428 1982  <NA>  15        1      24      54     196        0      27      47
    ## 429 1982  <NA>  15        1      24      54     196        0      27      47
    ## 430 1982  <NA>  15        1      24      54     196        0      27      47
    ## 431 1982  <NA>  15        1      24      54     196        0      27      47
    ## 432 1982  <NA>  15        1      24      54     196        0      27      47
    ## 433 1983  <NA>  15        1      16      55     168        0      34      46
    ## 434 1983  <NA>  15        1      16      55     168        0      34      46
    ## 435 1983  <NA>  15        1      16      55     168        0      34      46
    ## 436 1983  <NA>  15        1      16      55     168        0      34      46
    ## 437 1983  <NA>  15        1      16      55     168        0      34      46
    ## 438 1983  <NA>  15        1      16      55     168        0      34      46
    ## 439 1983  <NA>  15        1      16      55     168        0      34      46
    ## 440 1983  <NA>  15        1      16      55     168        0      34      46
    ## 441 1983  <NA>  15        1      16      55     168        0      34      46
    ## 442 1983  <NA>  15        1      16      55     168        0      34      46
    ## 443 1983  <NA>  15        1      16      55     168        0      34      46
    ## 444 1983  <NA>  15        1      16      55     168        0      34      46
    ## 445 1984  <NA>  15        1      16      55     168        0      34      45
    ## 446 1984  <NA>  15        1      16      55     168        0      34      45
    ## 447 1984  <NA>  15        1      15      55     168        0      34      45
    ## 448 1984  <NA>  15        1      15      55     168        0      34      45
    ## 449 1984  <NA>  15        1      15      55     168        0      35      45
    ## 450 1984  <NA>  15        1      15      55     168        0      35      45
    ## 451 1984  <NA>  15        1      15      55     168        0      35      45
    ## 452 1984  <NA>  15        1      15      55     168        0      35      45
    ## 453 1984  <NA>  15        1      15      55     168        0      35      45
    ## 454 1984  <NA>  15        1      15      55     168        0      35      45
    ## 455 1984  <NA>  15        1      15      55     168        0      35      45
    ## 456 1984  <NA>  15        1      15      55     168        0      35      45
    ## 457 1985  <NA>  15        1      16      53     183        0      34      47
    ## 458 1985  <NA>  15        1      16      53     183        0      34      47
    ## 459 1985  <NA>  15        1      16      53     183        0      34      47
    ## 460 1985  <NA>  15        1      16      53     183        0      34      47
    ## 461 1985  <NA>  15        1      16      53     183        0      34      47
    ## 462 1985  <NA>  15        1      16      53     183        0      34      47
    ## 463 1985  <NA>  15        1      16      53     183        0      34      47
    ## 464 1985  <NA>  15        1      16      53     183        0      34      47
    ## 465 1985  <NA>  15        1      16      53     183        0      34      47
    ## 466 1985  <NA>  15        1      16      53     183        0      34      47
    ## 467 1985  <NA>  15        1      16      53     183        0      34      47
    ## 468 1985  <NA>  15        1      16      53     183        0      34      47
    ## 469 1986  <NA>  15        1      16      53     183        0      34      48
    ## 470 1986  <NA>  15        1      16      53     183        0      34      48
    ## 471 1986  <NA>  15        1      16      53     183        0      34      48
    ## 472 1986  <NA>  15        1      16      53     183        0      34      48
    ## 473 1986  <NA>  15        1      16      53     183        0      34      48
    ## 474 1986  <NA>  15        1      16      53     183        0      34      48
    ## 475 1986  <NA>  15        1      16      54     183        0      34      48
    ## 476 1986  <NA>  15        1      16      54     183        0      34      48
    ## 477 1986  <NA>  15        1      16      54     183        0      34      48
    ## 478 1986  <NA>  15        1      16      54     183        0      34      48
    ## 479 1986  <NA>  15        1      16      54     183        0      34      48
    ## 480 1986  <NA>  15        1      16      54     183        0      34      48
    ## 481 1987  <NA>  15        1      24      46     179        0      27      55
    ## 482 1987  <NA>  15        1      24      46     179        0      27      55
    ## 483 1987  <NA>  15        1      24      46     179        0      27      55
    ## 484 1987  <NA>  15        1      24      46     179        0      27      55
    ## 485 1987  <NA>  15        1      24      46     179        0      27      55
    ## 486 1987  <NA>  15        1      24      46     179        0      27      55
    ## 487 1987  <NA>  15        1      24      46     179        0      27      55
    ## 488 1987  <NA>  15        1      24      46     179        0      27      55
    ## 489 1987  <NA>  15        1      24      46     179        0      27      55
    ## 490 1987  <NA>  15        1      24      46     179        0      27      55
    ## 491 1987  <NA>  15        1      24      46     179        0      27      55
    ## 492 1987  <NA>  15        1      24      46     179        0      27      55
    ## 493 1988  <NA>  15        1      24      46     179        0      28      54
    ## 494 1988  <NA>  15        1      24      46     179        0      28      54
    ## 495 1988  <NA>  15        1      25      46     179        0      28      54
    ## 496 1988  <NA>  15        1      24      46     179        0      28      54
    ## 497 1988  <NA>  15        1      24      46     179        0      28      54
    ## 498 1988  <NA>  15        1      24      46     179        0      28      54
    ## 499 1988  <NA>  15        1      24      46     178        0      28      54
    ## 500 1988  <NA>  15        1      24      46     178        0      28      54
    ## 501 1988  <NA>  15        1      24      46     178        0      28      54
    ## 502 1988  <NA>  15        1      24      46     178        0      28      54
    ## 503 1988  <NA>  15        1      24      46     179        0      28      54
    ## 504 1988  <NA>  15        1      24      46     179        0      28      54
    ## 505 1989  <NA>  15        1      23      46     178        0      29      55
    ## 506 1989  <NA>  15        1      23      46     178        0      29      55
    ## 507 1989  <NA>  15        1      23      46     178        0      29      55
    ## 508 1989  <NA>  15        1      23      46     178        0      29      55
    ## 509 1989  <NA>  15        1      23      46     178        0      29      55
    ## 510 1989  <NA>  15        1      23      46     178        0      29      55
    ## 511 1989  <NA>  15        1      23      46     178        0      29      55
    ## 512 1989  <NA>  15        1      23      46     178        0      29      55
    ## 513 1989  <NA>  15        1      23      46     178        0      29      55
    ## 514 1989  <NA>  15        1      23      46     178        0      29      55
    ## 515 1989  <NA>  15        1      23      46     178        0      29      55
    ## 516 1989  <NA>  15        1      23      46     178        0      29      55
    ## 517 1990  <NA>  15        1      22      46     176        0      30      55
    ## 518 1990  <NA>  15        1      22      46     176        0      30      55
    ## 519 1990  <NA>  15        1      22      46     176        0      30      55
    ## 520 1990  <NA>  15        1      22      46     176        0      30      55
    ## 521 1990  <NA>  15        1      22      46     176        0      30      55
    ## 522 1990  <NA>  15        1      22      46     176        0      30      56
    ## 523 1990  <NA>  15        1      22      46     176        0      30      56
    ## 524 1990  <NA>  15        1      22      46     176        0      30      56
    ## 525 1990  <NA>  15        1      22      46     176        0      30      56
    ## 526 1990  <NA>  15        1      22      46     176        0      30      56
    ## 527 1990  <NA>  15        1      22      46     176        0      30      56
    ## 528 1990  <NA>  15        1      22      46     176        0      30      56
    ## 529 1991  <NA>  15        1      20      45     168        0      29      57
    ## 530 1991  <NA>  15        1      20      45     168        0      29      57
    ## 531 1991  <NA>  15        1      21      45     166        0      28      57
    ## 532 1991  <NA>  15        1      21      45     166        0      28      57
    ## 533 1991  <NA>  15        1      21      45     166        0      28      57
    ## 534 1991  <NA>  15        1      21      45     166        0      28      57
    ## 535 1991  <NA>  15        1      21      45     166        0      28      57
    ## 536 1991  <NA>  15        1      21      45     166        0      29      57
    ## 537 1991  <NA>  15        1      21      45     166        0      29      57
    ## 538 1991  <NA>  15        1      21      45     166        0      29      57
    ## 539 1991  <NA>  15        1      21      45     167        0      29      57
    ## 540 1991  <NA>  15        1      21      45     167        0      29      57
    ## 541 1992  <NA>  15        1      20      43     166        0      27      58
    ## 542 1992  <NA>  15        1      20      43     166        0      27      58
    ## 543 1992  <NA>  15        1      20      43     166        0      28      58
    ## 544 1992  <NA>  15        1      20      43     166        0      28      58
    ## 545 1992  <NA>  15        1      20      43     166        0      28      58
    ## 546 1992  <NA>  15        1      20      43     166        0      28      58
    ## 547 1992  <NA>  15        1      20      43     166        0      28      58
    ## 548 1992  <NA>  15        1      20      43     166        0      28      58
    ## 549 1992  <NA>  15        1      20      43     166        0      28      58
    ## 550 1992  <NA>  15        1      20      43     166        0      28      59
    ## 551 1992  <NA>  15        1      20      43     166        0      28      60
    ## 552 1992  <NA>  15        1      20      43     166        0      28      60
    ## 553 1993  <NA>  15        0      18      46     175        1      30      57
    ## 554 1993  <NA>  15        0      18      46     175        1      30      57
    ## 555 1993  <NA>  15        0      18      46     175        1      30      57
    ## 556 1993  <NA>  15        0      18      46     175        1      30      57
    ## 557 1993  <NA>  15        0      17      46     177        1      31      57
    ## 558 1993  <NA>  15        0      17      46     178        1      31      57
    ## 559 1993  <NA>  15        0      17      46     178        1      31      57
    ## 560 1993  <NA>  15        0      17      46     178        1      31      57
    ## 561 1993  <NA>  15        0      17      46     178        1      31      57
    ## 562 1993  <NA>  15        0      17      46     178        1      31      57
    ## 563 1993  <NA>  15        0      17      46     178        1      31      57
    ## 564 1993  <NA>  15        0      17      46     178        1      31      57
    ## 565 1994  <NA>  15        0      19      48     178        1      28      54
    ## 566 1994  <NA>  15        0      19      48     178        1      28      54
    ## 567 1994  <NA>  15        0      19      48     178        1      28      54
    ## 568 1994  <NA>  15        0      19      48     178        1      28      54
    ## 569 1994  <NA>  15        0      19      48     178        1      28      54
    ## 570 1994  <NA>  15        0      19      48     178        1      28      54
    ## 571 1994  <NA>  15        0      19      48     178        1      28      54
    ## 572 1994  <NA>  15        0      19      48     178        1      28      54
    ## 573 1994  <NA>  15        0      19      48     178        1      28      54
    ## 574 1994  <NA>  15        0      19      48     178        1      28      54
    ## 575 1994  <NA>  15        0      19      48     178        1      28      54
    ## 576 1994  <NA>  15        0      19      48     178        1      28      54
    ## 577 1995  <NA>  15        0      30      54     235        1      20      46
    ## 578 1995  <NA>  15        0      30      54     235        1      20      46
    ## 579 1995  <NA>  15        0      30      54     235        1      20      46
    ## 580 1995  <NA>  15        0      30      54     235        1      20      46
    ## 581 1995  <NA>  15        0      30      54     235        1      20      46
    ## 582 1995  <NA>  15        0      30      54     235        1      20      46
    ## 583 1995  <NA>  15        0      30      54     235        1      20      46
    ## 584 1995  <NA>  15        0      30      54     235        1      20      46
    ## 585 1995  <NA>  15        0      30      54     235        1      20      46
    ## 586 1995  <NA>  15        0      30      54     235        1      20      46
    ## 587 1995  <NA>  15        0      30      54     235        1      20      46
    ## 588 1995  <NA>  15        0      30      54     235        1      20      46
    ## 589 1996  <NA>  15        0      31      54     236        1      19      47
    ## 590 1996  <NA>  15        0      31      54     236        1      19      47
    ## 591 1996  <NA>  15        0      31      54     236        1      19      47
    ## 592 1996  <NA>  15        0      31      54     236        1      19      47
    ## 593 1996  <NA>  15        0      31      54     236        1      19      47
    ## 594 1996  <NA>  15        0      31      54     236        1      19      47
    ## 595 1996  <NA>  15        0      32      54     235        1      19      47
    ## 596 1996  <NA>  15        0      32      54     235        1      19      47
    ## 597 1996  <NA>  15        0      32      54     235        1      19      47
    ## 598 1996  <NA>  15        0      32      54     235        1      19      47
    ## 599 1996  <NA>  15        0      32      55     235        1      19      47
    ## 600 1996  <NA>  15        0      32      55     235        1      19      47
    ## 601 1997  <NA>  15        0      32      55     227        1      18      45
    ## 602 1997  <NA>  15        0      32      55     227        1      18      45
    ## 603 1997  <NA>  15        0      32      55     227        1      18      45
    ## 604 1997  <NA>  15        0      32      55     227        1      18      45
    ## 605 1997  <NA>  15        0      32      55     228        1      18      45
    ## 606 1997  <NA>  15        0      32      55     228        1      18      45
    ## 607 1997  <NA>  15        0      32      55     228        1      18      45
    ## 608 1997  <NA>  15        0      33      55     228        1      18      45
    ## 609 1997  <NA>  15        0      34      55     228        1      18      45
    ## 610 1997  <NA>  15        0      34      55     228        1      18      45
    ## 611 1997  <NA>  15        0      34      55     229        1      18      45
    ## 612 1997  <NA>  15        0      34      55     229        1      18      45
    ## 613 1998  <NA>  15        0      32      55     227        1      18      45
    ## 614 1998  <NA>  15        0      32      55     227        1      18      45
    ## 615 1998  <NA>  15        0      32      55     227        1      18      45
    ## 616 1998  <NA>  15        0      32      55     227        1      18      45
    ## 617 1998  <NA>  15        0      32      55     227        1      18      45
    ## 618 1998  <NA>  15        0      32      55     227        1      18      45
    ## 619 1998  <NA>  15        0      32      55     228        1      18      45
    ## 620 1998  <NA>  15        0      32      55     228        1      18      45
    ## 621 1998  <NA>  15        0      32      55     228        1      18      45
    ## 622 1998  <NA>  15        0      32      55     228        1      18      45
    ## 623 1998  <NA>  15        0      32      55     228        1      18      45
    ## 624 1998  <NA>  15        0      32      55     228        1      18      45
    ## 625 1999  <NA>  15        0      31      55     223        1      17      45
    ## 626 1999  <NA>  15        0      31      55     223        1      17      45
    ## 627 1999  <NA>  15        0      31      55     222        1      17      45
    ## 628 1999  <NA>  15        0      31      55     222        1      17      45
    ## 629 1999  <NA>  15        0      31      55     222        1      17      45
    ## 630 1999  <NA>  15        0      31      55     223        1      17      45
    ## 631 1999  <NA>  15        0      31      55     223        1      17      45
    ## 632 1999  <NA>  15        0      31      55     223        1      17      45
    ## 633 1999  <NA>  15        0      31      55     223        1      17      45
    ## 634 1999  <NA>  15        0      31      55     223        1      17      45
    ## 635 1999  <NA>  15        0      31      56     223        1      17      45
    ## 636 1999  <NA>  15        0      31      56     223        1      17      45
    ## 637 2000  <NA>  15        0      30      55     223        1      18      45
    ## 638 2000  <NA>  15        0      30      55     223        1      18      45
    ## 639 2000  <NA>  15        0      30      55     223        1      18      45
    ## 640 2000  <NA>  15        0      30      55     223        1      18      45
    ## 641 2000  <NA>  15        0      30      55     223        1      18      45
    ## 642 2000  <NA>  15        0      30      55     223        1      18      45
    ## 643 2000  <NA>  15        0      30      55     223        1      18      45
    ## 644 2000  <NA>  15        0      30      55     223        1      18      46
    ## 645 2000  <NA>  15        0      30      55     223        1      18      46
    ## 646 2000  <NA>  15        0      30      55     223        1      18      46
    ## 647 2000  <NA>  15        0      30      55     223        1      19      46
    ## 648 2000  <NA>  15        0      30      55     223        1      19      46
    ## 649 2001  <NA>  15        1      29      49     220        0      19      50
    ## 650 2001  <NA>  15        1      29      49     220        0      19      50
    ## 651 2001  <NA>  15        1      29      49     220        0      19      50
    ## 652 2001  <NA>  15        1      29      49     220        0      19      50
    ## 653 2001  <NA>  15        1      29      49     220        0      19      50
    ## 654 2001  <NA>  15        1      29      49     221        0      19      50
    ## 655 2001  <NA>  15        1      29      49     222        0      19      50
    ## 656 2001  <NA>  15        1      29      49     222        0      19      50
    ## 657 2001  <NA>  15        1      29      49     222        0      19      50
    ## 658 2001  <NA>  15        1      30      49     222        0      19      50
    ## 659 2001  <NA>  15        1      30      49     223        0      19      50
    ## 660 2001  <NA>  15        1      30      49     223        0      19      50
    ## 661 2002  <NA>  15        1      27      50     221        0      21      50
    ## 662 2002  <NA>  15        1      27      50     221        0      21      50
    ## 663 2002  <NA>  15        1      27      50     222        0      21      50
    ## 664 2002  <NA>  15        1      27      50     222        0      21      50
    ## 665 2002  <NA>  15        1      27      50     222        0      21      50
    ## 666 2002  <NA>  15        1      27      50     222        0      21      50
    ## 667 2002  <NA>  15        1      27      50     222        0      21      50
    ## 668 2002  <NA>  15        1      27      50     222        0      21      50
    ## 669 2002  <NA>  15        1      27      50     222        0      21      50
    ## 670 2002  <NA>  15        1      27      50     222        0      21      50
    ## 671 2002  <NA>  15        1      27      50     222        0      21      50
    ## 672 2002  <NA>  15        1      27      50     222        0      21      50
    ## 673 2003  <NA>  15        1      26      51     231        0      24      48
    ## 674 2003  <NA>  15        1      26      51     231        0      24      48
    ## 675 2003  <NA>  15        1      26      51     231        0      24      48
    ## 676 2003  <NA>  15        1      26      51     231        0      24      48
    ## 677 2003  <NA>  15        1      26      51     231        0      24      48
    ## 678 2003  <NA>  15        1      26      51     231        0      24      48
    ## 679 2003  <NA>  15        1      26      51     231        0      24      48
    ## 680 2003  <NA>  15        1      26      51     231        0      24      48
    ## 681 2003  <NA>  15        1      26      51     231        0      25      48
    ## 682 2003  <NA>  15        1      26      51     231        0      25      48
    ## 683 2003  <NA>  15        1      27      51     231        0      25      48
    ## 684 2003  <NA>  15        1      27      51     231        0      25      48
    ## 685 2004  <NA>  15        1      28      51     229        0      22      48
    ## 686 2004  <NA>  15        1      28      51     229        0      22      48
    ## 687 2004  <NA>  15        1      28      51     229        0      22      48
    ## 688 2004  <NA>  15        1      28      51     229        0      22      48
    ## 689 2004  <NA>  15        1      28      51     229        0      22      48
    ## 690 2004  <NA>  15        1      28      51     229        0      22      48
    ## 691 2004  <NA>  15        1      29      51     229        0      22      48
    ## 692 2004  <NA>  15        1      29      51     229        0      22      48
    ## 693 2004  <NA>  15        1      29      51     229        0      22      48
    ## 694 2004  <NA>  15        1      29      51     229        0      22      48
    ## 695 2004  <NA>  15        1      29      51     229        0      23      48
    ## 696 2004  <NA>  15        1      29      51     229        0      23      48
    ## 697 2005  <NA>  15        1      28      54     232        0      22      45
    ## 698 2005  <NA>  15        1      28      54     232        0      22      45
    ## 699 2005  <NA>  15        1      28      54     232        0      22      45
    ## 700 2005  <NA>  15        1      28      54     232        0      22      45
    ## 701 2005  <NA>  15        1      28      54     231        0      22      45
    ## 702 2005  <NA>  15        1      28      54     231        0      22      45
    ## 703 2005  <NA>  15        1      28      54     231        0      22      45
    ## 704 2005  <NA>  15        1      28      54     231        0      22      45
    ## 705 2005  <NA>  15        1      28      54     232        0      22      45
    ## 706 2005  <NA>  15        1      28      54     232        0      22      45
    ## 707 2005  <NA>  15        1      28      54     232        0      22      45
    ## 708 2005  <NA>  15        1      28      54     232        0      22      45
    ## 709 2006  <NA>  15        1      28      54     231        0      22      45
    ## 710 2006  <NA>  15        1      28      54     231        0      22      45
    ## 711 2006  <NA>  15        1      28      54     231        0      22      45
    ## 712 2006  <NA>  15        1      28      54     231        0      22      45
    ## 713 2006  <NA>  15        1      28      54     231        0      22      45
    ## 714 2006  <NA>  15        1      28      54     231        0      22      45
    ## 715 2006  <NA>  15        1      28      54     231        0      22      45
    ## 716 2006  <NA>  15        1      28      54     231        0      22      45
    ## 717 2006  <NA>  15        1      28      54     231        0      22      45
    ## 718 2006  <NA>  15        1      28      54     231        0      22      45
    ## 719 2006  <NA>  15        1      28      54     232        0      22      45
    ## 720 2006  <NA>  15        1      28      54     232        0      22      45
    ## 721 2007  <NA>  15        1      22      48     201        0      28      50
    ## 722 2007  <NA>  15        1      22      48     201        0      28      50
    ## 723 2007  <NA>  15        1      22      48     201        0      28      50
    ## 724 2007  <NA>  15        1      22      48     201        0      28      50
    ## 725 2007  <NA>  15        1      22      48     201        0      28      50
    ## 726 2007  <NA>  15        1      22      47     201        0      28      50
    ## 727 2007  <NA>  15        1      22      48     201        0      28      50
    ## 728 2007  <NA>  15        1      22      48     202        0      28      50
    ## 729 2007  <NA>  15        1      22      48     202        0      28      50
    ## 730 2007  <NA>  15        1      22      48     202        0      28      50
    ## 731 2007  <NA>  15        1      22      48     202        0      28      50
    ## 732 2007  <NA>  15        1      22      48     202        0      28      50
    ## 733 2008  <NA>  15        1      22      48     198        0      28      50
    ## 734 2008  <NA>  15        1      22      48     198        0      28      50
    ## 735 2008  <NA>  15        1      22      48     198        0      28      50
    ## 736 2008  <NA>  15        1      22      48     198        0      28      50
    ## 737 2008  <NA>  15        1      22      48     199        0      28      50
    ## 738 2008  <NA>  15        1      22      48     199        0      28      50
    ## 739 2008  <NA>  15        1      22      48     199        0      28      50
    ## 740 2008  <NA>  15        1      22      48     199        0      28      50
    ## 741 2008  <NA>  15        1      22      48     199        0      28      50
    ## 742 2008  <NA>  15        1      22      48     199        0      28      50
    ## 743 2008  <NA>  15        1      22      48     199        0      28      50
    ## 744 2008  <NA>  15        1      22      48     199        0      28      50
    ## 745 2009  <NA>  15        0      22      40     179        1      28      57
    ## 746 2009  <NA>  15        0      22      40     179        1      28      57
    ## 747 2009  <NA>  15        0      22      40     179        1      28      57
    ## 748 2009  <NA>  15        0      22      40     179        1      28      57
    ## 749 2009  <NA>  15        0      22      40     179        1      28      57
    ## 750 2009  <NA>  15        0      22      40     179        1      28      57
    ## 751 2009  <NA>  15        0      22      40     179        1      28      58
    ## 752 2009  <NA>  15        0      24      40     179        1      28      58
    ## 753 2009  <NA>  15        0      24      41     179        1      28      58
    ## 754 2009  <NA>  15        0      24      41     179        1      28      59
    ## 755 2009  <NA>  15        0      24      41     179        1      28      59
    ## 756 2009  <NA>  15        0      24      41     179        1      28      59
    ## 757 2010  <NA>  15        0      24      41     178        1      26      57
    ## 758 2010  <NA>  15        0      24      41     178        1      26      57
    ## 759 2010  <NA>  15        0      24      41     178        1      26      57
    ## 760 2010  <NA>  15        0      24      41     177        1      26      57
    ## 761 2010  <NA>  15        0      24      41     177        1      26      57
    ## 762 2010  <NA>  15        0      24      41     178        1      26      57
    ## 763 2010  <NA>  15        0      24      41     178        1      26      56
    ## 764 2010  <NA>  15        0      24      41     178        1      26      57
    ## 765 2010  <NA>  15        0      24      41     178        1      26      57
    ## 766 2010  <NA>  15        0      24      41     178        1      26      57
    ## 767 2010  <NA>  15        0      24      41     178        1      27      59
    ## 768 2010  <NA>  15        0      24      41     178        1      27      59
    ## 769 2011  <NA>  15        0      29      47     241        1      21      51
    ## 770 2011  <NA>  15        0      29      47     241        1      21      51
    ## 771 2011  <NA>  15        0      29      47     241        1      21      51
    ## 772 2011  <NA>  15        0      29      47     241        1      21      51
    ## 773 2011  <NA>  15        0      29      47     240        1      21      51
    ## 774 2011  <NA>  15        0      29      47     240        1      21      51
    ## 775 2011  <NA>  15        0      29      47     240        1      21      51
    ## 776 2011  <NA>  15        0      29      47     240        1      21      51
    ## 777 2011  <NA>  15        0      29      47     242        1      21      51
    ## 778 2011  <NA>  15        0      29      47     242        1      21      51
    ## 779 2011  <NA>  15        0      29      47     242        1      21      51
    ## 780 2011  <NA>  15        0      29      47     242        1      21      51
    ## 781 2012  <NA>  15        0      29      47     242        1      21      51
    ## 782 2012  <NA>  15        0      29      47     242        1      21      51
    ## 783 2012  <NA>  15        0      29      47     242        1      21      51
    ## 784 2012  <NA>  15        0      29      47     242        1      21      51
    ## 785 2012  <NA>  15        0      29      47     242        1      21      51
    ## 786 2012  <NA>  15        0      29      47     242        1      21      51
    ## 787 2012  <NA>  15        0      29      47     242        1      21      51
    ## 788 2012  <NA>  15        0      29      47     242        1      21      51
    ## 789 2012  <NA>  15        0      29      47     242        1      21      51
    ## 790 2012  <NA>  15        0      29      47     242        1      21      51
    ## 791 2012  <NA>  15        0      29      47     243        1      21      51
    ## 792 2012  <NA>  15        0      29      47     243        1      21      51
    ## 793 2013  <NA>  15        0      30      45     232        1      20      53
    ## 794 2013  <NA>  15        0      30      45     232        1      20      53
    ## 795 2013  <NA>  15        0      30      45     232        1      20      53
    ## 796 2013  <NA>  15        0      30      45     232        1      20      53
    ## 797 2013  <NA>  15        0      30      45     233        1      20      53
    ## 798 2013  <NA>  15        0      30      46     234        1      20      52
    ## 799 2013  <NA>  15        0      30      46     234        1      20      52
    ## 800 2013  <NA>  15        0      30      46     234        1      20      53
    ## 801 2013  <NA>  15        0      30      46     234        1      20      53
    ## 802 2013  <NA>  15        0      30      46     234        1      20      53
    ## 803 2013  <NA>  15        0      30      46     234        1      20      54
    ## 804 2013  <NA>  15        0      30      46     234        1      20      54
    ## 805 2014  <NA>  15        0      29      45     232        1      21      53
    ## 806 2014  <NA>  15        0      29      45     232        1      21      53
    ## 807 2014  <NA>  15        0      29      45     233        1      21      53
    ## 808 2014  <NA>  15        0      29      45     233        1      21      53
    ## 809 2014  <NA>  15        0      29      45     233        1      21      53
    ## 810 2014  <NA>  15        0      29      45     233        1      21      53
    ## 811 2014  <NA>  15        0      29      45     234        1      21      53
    ## 812 2014  <NA>  15        0      29      45     234        1      21      53
    ## 813 2014  <NA>  15        0      29      45     234        1      21      53
    ## 814 2014  <NA>  15        0      29      45     234        1      21      53
    ## 815 2014  <NA>  15        0      29      45     235        1      21      53
    ## 816 2014  <NA>  15        0      29      45     235        1      21      53
    ## 817 2015  <NA>  15        0      31      54     245        1      18      44
    ## 818 2015  <NA>  15        0      31      54     245        1      18      44
    ## 819 2015  <NA>  15        0      31      54     245        1      18      44
    ## 820 2015  <NA>  15        0      31      54     244        1      18      44
    ## 821 2015  <NA>  15        0      31      54     245        1      18      44
    ## 822 2015  <NA>  15        0      31      54     246        1      18      44
    ##     rep_dem
    ## 1       198
    ## 2       198
    ## 3       198
    ## 4       198
    ## 5       198
    ## 6       198
    ## 7       198
    ## 8       198
    ## 9       198
    ## 10      198
    ## 11      198
    ## 12      198
    ## 13      198
    ## 14      198
    ## 15      198
    ## 16      198
    ## 17      198
    ## 18      198
    ## 19      198
    ## 20      198
    ## 21      198
    ## 22      198
    ## 23      198
    ## 24      198
    ## 25      269
    ## 26      269
    ## 27      269
    ## 28      269
    ## 29      269
    ## 30      269
    ## 31      269
    ## 32      269
    ## 33      269
    ## 34      269
    ## 35      269
    ## 36      269
    ## 37      269
    ## 38      269
    ## 39      269
    ## 40      269
    ## 41      269
    ## 42      269
    ## 43      269
    ## 44      269
    ## 45      269
    ## 46      269
    ## 47      269
    ## 48      269
    ## 49      242
    ## 50      242
    ## 51      242
    ## 52      242
    ## 53      242
    ## 54      242
    ## 55      242
    ## 56      242
    ## 57      242
    ## 58      242
    ## 59      242
    ## 60      242
    ## 61      242
    ## 62      242
    ## 63      242
    ## 64      242
    ## 65      242
    ## 66      242
    ## 67      242
    ## 68      242
    ## 69      242
    ## 70      242
    ## 71      242
    ## 72      242
    ## 73      220
    ## 74      220
    ## 75      220
    ## 76      220
    ## 77      220
    ## 78      220
    ## 79      220
    ## 80      220
    ## 81      220
    ## 82      220
    ## 83      220
    ## 84      220
    ## 85      220
    ## 86      220
    ## 87      220
    ## 88      220
    ## 89      220
    ## 90      220
    ## 91      220
    ## 92      220
    ## 93      220
    ## 94      220
    ## 95      220
    ## 96      220
    ## 97      237
    ## 98      237
    ## 99      237
    ## 100     237
    ## 101     237
    ## 102     237
    ## 103     237
    ## 104     237
    ## 105     237
    ## 106     237
    ## 107     237
    ## 108     237
    ## 109     237
    ## 110     237
    ## 111     237
    ## 112     237
    ## 113     237
    ## 114     237
    ## 115     237
    ## 116     237
    ## 117     237
    ## 118     237
    ## 119     237
    ## 120     237
    ## 121     242
    ## 122     242
    ## 123     242
    ## 124     242
    ## 125     242
    ## 126     242
    ## 127     242
    ## 128     242
    ## 129     242
    ## 130     242
    ## 131     242
    ## 132     242
    ## 133     242
    ## 134     242
    ## 135     242
    ## 136     242
    ## 137     242
    ## 138     242
    ## 139     242
    ## 140     242
    ## 141     242
    ## 142     242
    ## 143     242
    ## 144     242
    ## 145     289
    ## 146     289
    ## 147     289
    ## 148     289
    ## 149     289
    ## 150     289
    ## 151     289
    ## 152     289
    ## 153     289
    ## 154     289
    ## 155     289
    ## 156     289
    ## 157     289
    ## 158     289
    ## 159     289
    ## 160     289
    ## 161     289
    ## 162     289
    ## 163     289
    ## 164     289
    ## 165     289
    ## 166     289
    ## 167     289
    ## 168     289
    ## 169     273
    ## 170     273
    ## 171     273
    ## 172     273
    ## 173     273
    ## 174     273
    ## 175     273
    ## 176     273
    ## 177     273
    ## 178     273
    ## 179     273
    ## 180     273
    ## 181     273
    ## 182     273
    ## 183     273
    ## 184     273
    ## 185     273
    ## 186     273
    ## 187     273
    ## 188     273
    ## 189     273
    ## 190     273
    ## 191     273
    ## 192     273
    ## 193     262
    ## 194     262
    ## 195     262
    ## 196     262
    ## 197     262
    ## 198     262
    ## 199     262
    ## 200     262
    ## 201     262
    ## 202     262
    ## 203     262
    ## 204     262
    ## 205     262
    ## 206     262
    ## 207     262
    ## 208     262
    ## 209     262
    ## 210     262
    ## 211     262
    ## 212     262
    ## 213     262
    ## 214     262
    ## 215     262
    ## 216     262
    ## 217     301
    ## 218     301
    ## 219     301
    ## 220     301
    ## 221     301
    ## 222     301
    ## 223     301
    ## 224     301
    ## 225     301
    ## 226     301
    ## 227     301
    ## 228     301
    ## 229     301
    ## 230     301
    ## 231     301
    ## 232     301
    ## 233     301
    ## 234     301
    ## 235     301
    ## 236     301
    ## 237     301
    ## 238     301
    ## 239     301
    ## 240     301
    ## 241     251
    ## 242     251
    ## 243     251
    ## 244     251
    ## 245     251
    ## 246     251
    ## 247     251
    ## 248     251
    ## 249     251
    ## 250     251
    ## 251     251
    ## 252     251
    ## 253     251
    ## 254     251
    ## 255     251
    ## 256     251
    ## 257     251
    ## 258     251
    ## 259     251
    ## 260     251
    ## 261     251
    ## 262     251
    ## 263     251
    ## 264     251
    ## 265     250
    ## 266     250
    ## 267     250
    ## 268     250
    ## 269     250
    ## 270     250
    ## 271     250
    ## 272     250
    ## 273     250
    ## 274     250
    ## 275     250
    ## 276     250
    ## 277     250
    ## 278     250
    ## 279     250
    ## 280     250
    ## 281     250
    ## 282     250
    ## 283     250
    ## 284     250
    ## 285     250
    ## 286     250
    ## 287     250
    ## 288     250
    ## 289     259
    ## 290     259
    ## 291     259
    ## 292     259
    ## 293     259
    ## 294     259
    ## 295     259
    ## 296     259
    ## 297     259
    ## 298     259
    ## 299     259
    ## 300     259
    ## 301     259
    ## 302     259
    ## 303     259
    ## 304     259
    ## 305     259
    ## 306     259
    ## 307     259
    ## 308     259
    ## 309     259
    ## 310     259
    ## 311     259
    ## 312     259
    ## 313     249
    ## 314     249
    ## 315     249
    ## 316     249
    ## 317     249
    ## 318     249
    ## 319     249
    ## 320     249
    ## 321     249
    ## 322     249
    ## 323     249
    ## 324     249
    ## 325     249
    ## 326     249
    ## 327     249
    ## 328     249
    ## 329     249
    ## 330     249
    ## 331     249
    ## 332     249
    ## 333     249
    ## 334     249
    ## 335     249
    ## 336     249
    ## 337     295
    ## 338     295
    ## 339     295
    ## 340     295
    ## 341     295
    ## 342     295
    ## 343     295
    ## 344     295
    ## 345     295
    ## 346     295
    ## 347     295
    ## 348     295
    ## 349     295
    ## 350     295
    ## 351     295
    ## 352     295
    ## 353     295
    ## 354     295
    ## 355     295
    ## 356     295
    ## 357     295
    ## 358     295
    ## 359     295
    ## 360     295
    ## 361     294
    ## 362     294
    ## 363     294
    ## 364     294
    ## 365     294
    ## 366     294
    ## 367     294
    ## 368     294
    ## 369     294
    ## 370     294
    ## 371     294
    ## 372     294
    ## 373     294
    ## 374     294
    ## 375     294
    ## 376     294
    ## 377     294
    ## 378     294
    ## 379     294
    ## 380     294
    ## 381     294
    ## 382     294
    ## 383     294
    ## 384     294
    ## 385     280
    ## 386     280
    ## 387     280
    ## 388     280
    ## 389     280
    ## 390     280
    ## 391     280
    ## 392     280
    ## 393     280
    ## 394     280
    ## 395     280
    ## 396     280
    ## 397     280
    ## 398     280
    ## 399     280
    ## 400     280
    ## 401     280
    ## 402     280
    ## 403     280
    ## 404     280
    ## 405     280
    ## 406     280
    ## 407     280
    ## 408     280
    ## 409     246
    ## 410     246
    ## 411     246
    ## 412     246
    ## 413     246
    ## 414     246
    ## 415     246
    ## 416     246
    ## 417     246
    ## 418     246
    ## 419     246
    ## 420     246
    ## 421     246
    ## 422     246
    ## 423     246
    ## 424     246
    ## 425     246
    ## 426     246
    ## 427     246
    ## 428     246
    ## 429     246
    ## 430     246
    ## 431     246
    ## 432     246
    ## 433     272
    ## 434     272
    ## 435     272
    ## 436     271
    ## 437     271
    ## 438     271
    ## 439     272
    ## 440     272
    ## 441     272
    ## 442     272
    ## 443     272
    ## 444     272
    ## 445     271
    ## 446     271
    ## 447     271
    ## 448     271
    ## 449     271
    ## 450     271
    ## 451     271
    ## 452     271
    ## 453     271
    ## 454     271
    ## 455     271
    ## 456     271
    ## 457     257
    ## 458     257
    ## 459     257
    ## 460     257
    ## 461     257
    ## 462     257
    ## 463     257
    ## 464     257
    ## 465     257
    ## 466     257
    ## 467     257
    ## 468     257
    ## 469     257
    ## 470     257
    ## 471     257
    ## 472     257
    ## 473     257
    ## 474     257
    ## 475     257
    ## 476     257
    ## 477     257
    ## 478     257
    ## 479     257
    ## 480     257
    ## 481     262
    ## 482     262
    ## 483     262
    ## 484     262
    ## 485     262
    ## 486     262
    ## 487     262
    ## 488     262
    ## 489     262
    ## 490     262
    ## 491     262
    ## 492     262
    ## 493     262
    ## 494     262
    ## 495     262
    ## 496     262
    ## 497     262
    ## 498     262
    ## 499     262
    ## 500     262
    ## 501     262
    ## 502     262
    ## 503     262
    ## 504     262
    ## 505     264
    ## 506     264
    ## 507     264
    ## 508     264
    ## 509     264
    ## 510     262
    ## 511     261
    ## 512     261
    ## 513     261
    ## 514     261
    ## 515     261
    ## 516     261
    ## 517     258
    ## 518     258
    ## 519     258
    ## 520     258
    ## 521     257
    ## 522     257
    ## 523     257
    ## 524     257
    ## 525     257
    ## 526     258
    ## 527     259
    ## 528     259
    ## 529     269
    ## 530     269
    ## 531     269
    ## 532     269
    ## 533     268
    ## 534     268
    ## 535     268
    ## 536     268
    ## 537     268
    ## 538     268
    ## 539     269
    ## 540     269
    ## 541     268
    ## 542     268
    ## 543     268
    ## 544     268
    ## 545     268
    ## 546     268
    ## 547     268
    ## 548     268
    ## 549     268
    ## 550     268
    ## 551     270
    ## 552     270
    ## 553     255
    ## 554     255
    ## 555     255
    ## 556     256
    ## 557     257
    ## 558     258
    ## 559     258
    ## 560     258
    ## 561     258
    ## 562     258
    ## 563     258
    ## 564     258
    ## 565     257
    ## 566     257
    ## 567     257
    ## 568     256
    ## 569     256
    ## 570     256
    ## 571     256
    ## 572     256
    ## 573     256
    ## 574     256
    ## 575     256
    ## 576     256
    ## 577     199
    ## 578     199
    ## 579     199
    ## 580     199
    ## 581     199
    ## 582     199
    ## 583     199
    ## 584     199
    ## 585     199
    ## 586     199
    ## 587     199
    ## 588     199
    ## 589     196
    ## 590     196
    ## 591     195
    ## 592     196
    ## 593     197
    ## 594     198
    ## 595     198
    ## 596     198
    ## 597     198
    ## 598     198
    ## 599     198
    ## 600     198
    ## 601     207
    ## 602     207
    ## 603     207
    ## 604     207
    ## 605     207
    ## 606     207
    ## 607     207
    ## 608     207
    ## 609     207
    ## 610     207
    ## 611     207
    ## 612     207
    ## 613     203
    ## 614     203
    ## 615     204
    ## 616     205
    ## 617     205
    ## 618     206
    ## 619     206
    ## 620     206
    ## 621     206
    ## 622     206
    ## 623     206
    ## 624     206
    ## 625     210
    ## 626     210
    ## 627     210
    ## 628     210
    ## 629     210
    ## 630     210
    ## 631     210
    ## 632     210
    ## 633     210
    ## 634     210
    ## 635     211
    ## 636     211
    ## 637     210
    ## 638     210
    ## 639     210
    ## 640     210
    ## 641     210
    ## 642     210
    ## 643     210
    ## 644     210
    ## 645     210
    ## 646     210
    ## 647     210
    ## 648     210
    ## 649     211
    ## 650     211
    ## 651     211
    ## 652     210
    ## 653     210
    ## 654     210
    ## 655     210
    ## 656     210
    ## 657     210
    ## 658     210
    ## 659     211
    ## 660     211
    ## 661     211
    ## 662     211
    ## 663     211
    ## 664     211
    ## 665     211
    ## 666     211
    ## 667     211
    ## 668     211
    ## 669     211
    ## 670     211
    ## 671     211
    ## 672     211
    ## 673     203
    ## 674     203
    ## 675     203
    ## 676     203
    ## 677     203
    ## 678     203
    ## 679     203
    ## 680     203
    ## 681     203
    ## 682     203
    ## 683     203
    ## 684     203
    ## 685     203
    ## 686     203
    ## 687     204
    ## 688     204
    ## 689     204
    ## 690     204
    ## 691     204
    ## 692     205
    ## 693     205
    ## 694     205
    ## 695     205
    ## 696     205
    ## 697     201
    ## 698     201
    ## 699     202
    ## 700     202
    ## 701     202
    ## 702     202
    ## 703     202
    ## 704     202
    ## 705     202
    ## 706     202
    ## 707     202
    ## 708     202
    ## 709     201
    ## 710     201
    ## 711     201
    ## 712     201
    ## 713     201
    ## 714     201
    ## 715     201
    ## 716     201
    ## 717     201
    ## 718     201
    ## 719     202
    ## 720     202
    ## 721     233
    ## 722     233
    ## 723     233
    ## 724     233
    ## 725     232
    ## 726     232
    ## 727     232
    ## 728     232
    ## 729     233
    ## 730     233
    ## 731     234
    ## 732     234
    ## 733     231
    ## 734     231
    ## 735     233
    ## 736     234
    ## 737     235
    ## 738     235
    ## 739     236
    ## 740     236
    ## 741     236
    ## 742     236
    ## 743     236
    ## 744     236
    ## 745     254
    ## 746     254
    ## 747     253
    ## 748     254
    ## 749     255
    ## 750     255
    ## 751     254
    ## 752     255
    ## 753     255
    ## 754     255
    ## 755     257
    ## 756     257
    ## 757     255
    ## 758     255
    ## 759     253
    ## 760     254
    ## 761     254
    ## 762     255
    ## 763     255
    ## 764     255
    ## 765     255
    ## 766     255
    ## 767     255
    ## 768     255
    ## 769     193
    ## 770     193
    ## 771     192
    ## 772     192
    ## 773     192
    ## 774     193
    ## 775     192
    ## 776     193
    ## 777     193
    ## 778     193
    ## 779     193
    ## 780     193
    ## 781     192
    ## 782     192
    ## 783     191
    ## 784     190
    ## 785     190
    ## 786     191
    ## 787     191
    ## 788     191
    ## 789     191
    ## 790     191
    ## 791     194
    ## 792     194
    ## 793     200
    ## 794     200
    ## 795     200
    ## 796     201
    ## 797     201
    ## 798     201
    ## 799     201
    ## 800     201
    ## 801     201
    ## 802     201
    ## 803     201
    ## 804     201
    ## 805     200
    ## 806     200
    ## 807     199
    ## 808     199
    ## 809     199
    ## 810     199
    ## 811     199
    ## 812     199
    ## 813     199
    ## 814     199
    ## 815     201
    ## 816     201
    ## 817     188
    ## 818     188
    ## 819     188
    ## 820     188
    ## 821     188
    ## 822     188

``` r
skimr::skim(pols_month_df)
```

|                                                  |               |
|:-------------------------------------------------|:--------------|
| Name                                             | pols_month_df |
| Number of rows                                   | 822           |
| Number of columns                                | 11            |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   |               |
| Column type frequency:                           |               |
| character                                        | 3             |
| numeric                                          | 8             |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ |               |
| Group variables                                  | None          |

Data summary

**Variable type: character**

| skim_variable | n_missing | complete_rate | min | max | empty | n_unique | whitespace |
|:--------------|----------:|--------------:|----:|----:|------:|---------:|-----------:|
| year          |         0 |             1 |   4 |   4 |     0 |       69 |          0 |
| month         |         0 |             1 |   3 |   9 |     0 |       12 |          0 |
| day           |         0 |             1 |   2 |   2 |     0 |        1 |          0 |

**Variable type: numeric**

| skim_variable | n_missing | complete_rate |   mean |    sd |  p0 | p25 | p50 | p75 | p100 | hist  |
|:--------------|----------:|--------------:|-------:|------:|----:|----:|----:|----:|-----:|:------|
| prez_gop      |         0 |             1 |   0.53 |  0.51 |   0 |   0 |   1 |   1 |    2 | ▇▁▇▁▁ |
| gov_gop       |         0 |             1 |  22.48 |  5.68 |  12 |  18 |  22 |  28 |   34 | ▆▆▇▅▅ |
| sen_gop       |         0 |             1 |  46.10 |  6.38 |  32 |  42 |  46 |  51 |   56 | ▃▃▇▇▇ |
| rep_gop       |         0 |             1 | 194.92 | 29.24 | 141 | 176 | 195 | 222 |  253 | ▃▇▆▃▅ |
| prez_dem      |         0 |             1 |   0.47 |  0.50 |   0 |   0 |   0 |   1 |    1 | ▇▁▁▁▇ |
| gov_dem       |         0 |             1 |  27.20 |  5.94 |  17 |  22 |  28 |  32 |   41 | ▆▅▇▆▂ |
| sen_dem       |         0 |             1 |  54.41 |  7.37 |  44 |  48 |  53 |  58 |   71 | ▇▆▇▃▂ |
| rep_dem       |         0 |             1 | 244.97 | 31.37 | 188 | 211 | 250 | 268 |  301 | ▇▂▇▇▅ |

I replaced the month number with a month name.

``` r
pols_month_df = pols_month_df %>%
     mutate(president = prez_gop + prez_dem) %>% 
    select(-prez_gop, -prez_dem, -day)

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
| year          |         0 |             1 |   4 |   4 |     0 |       69 |          0 |
| month         |         0 |             1 |   3 |   9 |     0 |       12 |          0 |

**Variable type: numeric**

| skim_variable | n_missing | complete_rate |   mean |    sd |  p0 | p25 | p50 | p75 | p100 | hist  |
|:--------------|----------:|--------------:|-------:|------:|----:|----:|----:|----:|-----:|:------|
| gov_gop       |         0 |             1 |  22.48 |  5.68 |  12 |  18 |  22 |  28 |   34 | ▆▆▇▅▅ |
| sen_gop       |         0 |             1 |  46.10 |  6.38 |  32 |  42 |  46 |  51 |   56 | ▃▃▇▇▇ |
| rep_gop       |         0 |             1 | 194.92 | 29.24 | 141 | 176 | 195 | 222 |  253 | ▃▇▆▃▅ |
| gov_dem       |         0 |             1 |  27.20 |  5.94 |  17 |  22 |  28 |  32 |   41 | ▆▅▇▆▂ |
| sen_dem       |         0 |             1 |  54.41 |  7.37 |  44 |  48 |  53 |  58 |   71 | ▇▆▇▃▂ |
| rep_dem       |         0 |             1 | 244.97 | 31.37 | 188 | 211 | 250 | 268 |  301 | ▇▂▇▇▅ |
| president     |         0 |             1 |   1.01 |  0.08 |   1 |   1 |   1 |   1 |    2 | ▇▁▁▁▁ |

I also created a president variable taking values gop and dem, and
remove prez_dem and prez_gop; and remove the day variable.

### Dataset for snp.csv

``` r
snp_df = read_csv("./data/snp.csv") %>% 
  janitor::clean_names() %>% 
  separate(date, into = c("month", "day", "year"), sep = '/') %>% 
  transform(month = as.numeric(month))
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
| Number of columns                                | 4      |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   |        |
| Column type frequency:                           |        |
| character                                        | 2      |
| numeric                                          | 2      |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ |        |
| Group variables                                  | None   |

Data summary

**Variable type: character**

| skim_variable | n_missing | complete_rate | min | max | empty | n_unique | whitespace |
|:--------------|----------:|--------------:|----:|----:|------:|---------:|-----------:|
| day           |         0 |             1 |   1 |   1 |     0 |        4 |          0 |
| year          |         0 |             1 |   2 |   2 |     0 |       66 |          0 |

**Variable type: numeric**

| skim_variable | n_missing | complete_rate |   mean |     sd |    p0 |   p25 |    p50 |   p75 |    p100 | hist  |
|:--------------|----------:|--------------:|-------:|-------:|------:|------:|-------:|------:|--------:|:------|
| month         |         0 |             1 |   6.48 |   3.45 |  1.00 |  3.00 |   6.00 |   9.0 |   12.00 | ▇▅▅▅▇ |
| close         |         0 |             1 | 474.89 | 545.96 | 17.05 | 83.74 | 138.53 | 941.8 | 2107.39 | ▇▁▂▁▁ |

i have loaded and cleaned the data in snp.csv, as well as separated the
column “date” into “month”, “day”, “year”. I also converted the “month”
variable into a numeric variable.

``` r
snp_df %>%
  mutate(month = month.name[month])
```

    ##         month day year   close
    ## 1        July   1   15 2079.65
    ## 2        June   1   15 2063.11
    ## 3         May   1   15 2107.39
    ## 4       April   1   15 2085.51
    ## 5       March   2   15 2067.89
    ## 6    February   2   15 2104.50
    ## 7     January   2   15 1994.99
    ## 8    December   1   14 2058.90
    ## 9    November   3   14 2067.56
    ## 10    October   1   14 2018.05
    ## 11  September   2   14 1972.29
    ## 12     August   1   14 2003.37
    ## 13       July   1   14 1930.67
    ## 14       June   2   14 1960.23
    ## 15        May   1   14 1923.57
    ## 16      April   1   14 1883.95
    ## 17      March   3   14 1872.34
    ## 18   February   3   14 1859.45
    ## 19    January   2   14 1782.59
    ## 20   December   2   13 1848.36
    ## 21   November   1   13 1805.81
    ## 22    October   1   13 1756.54
    ## 23  September   3   13 1681.55
    ## 24     August   1   13 1632.97
    ## 25       July   1   13 1685.73
    ## 26       June   3   13 1606.28
    ## 27        May   1   13 1630.74
    ## 28      April   1   13 1597.57
    ## 29      March   1   13 1569.19
    ## 30   February   1   13 1514.68
    ## 31    January   2   13 1498.11
    ## 32   December   3   12 1426.19
    ## 33   November   1   12 1416.18
    ## 34    October   1   12 1412.16
    ## 35  September   4   12 1440.67
    ## 36     August   1   12 1406.58
    ## 37       July   2   12 1379.32
    ## 38       June   1   12 1362.16
    ## 39        May   1   12 1310.33
    ## 40      April   2   12 1397.91
    ## 41      March   1   12 1408.47
    ## 42   February   1   12 1365.68
    ## 43    January   3   12 1312.41
    ## 44   December   1   11 1257.60
    ## 45   November   1   11 1246.96
    ## 46    October   3   11 1253.30
    ## 47  September   1   11 1131.42
    ## 48     August   1   11 1218.89
    ## 49       July   1   11 1292.28
    ## 50       June   1   11 1320.64
    ## 51        May   2   11 1345.20
    ## 52      April   1   11 1363.61
    ## 53      March   1   11 1325.83
    ## 54   February   1   11 1327.22
    ## 55    January   3   11 1286.12
    ## 56   December   1   10 1257.64
    ## 57   November   1   10 1180.55
    ## 58    October   1   10 1183.26
    ## 59  September   1   10 1141.20
    ## 60     August   2   10 1049.33
    ## 61       July   1   10 1101.60
    ## 62       June   1   10 1030.71
    ## 63        May   3   10 1089.41
    ## 64      April   1   10 1186.69
    ## 65      March   1   10 1169.43
    ## 66   February   1   10 1104.49
    ## 67    January   4   10 1073.87
    ## 68   December   1   09 1115.10
    ## 69   November   2   09 1095.63
    ## 70    October   1   09 1036.19
    ## 71  September   1   09 1057.08
    ## 72     August   3   09 1020.62
    ## 73       July   1   09  987.48
    ## 74       June   1   09  919.32
    ## 75        May   1   09  919.14
    ## 76      April   1   09  872.81
    ## 77      March   2   09  797.87
    ## 78   February   2   09  735.09
    ## 79    January   2   09  825.88
    ## 80   December   1   08  903.25
    ## 81   November   3   08  896.24
    ## 82    October   1   08  968.75
    ## 83  September   2   08 1166.36
    ## 84     August   1   08 1282.83
    ## 85       July   1   08 1267.38
    ## 86       June   2   08 1280.00
    ## 87        May   1   08 1400.38
    ## 88      April   1   08 1385.59
    ## 89      March   3   08 1322.70
    ## 90   February   1   08 1330.63
    ## 91    January   2   08 1378.55
    ## 92   December   3   07 1468.36
    ## 93   November   1   07 1481.14
    ## 94    October   1   07 1549.38
    ## 95  September   4   07 1526.75
    ## 96     August   1   07 1473.99
    ## 97       July   2   07 1455.27
    ## 98       June   1   07 1503.35
    ## 99        May   1   07 1530.62
    ## 100     April   2   07 1482.37
    ## 101     March   1   07 1420.86
    ## 102  February   1   07 1406.82
    ## 103   January   3   07 1438.24
    ## 104  December   1   06 1418.30
    ## 105  November   1   06 1400.63
    ## 106   October   2   06 1377.94
    ## 107 September   1   06 1335.85
    ## 108    August   1   06 1303.82
    ## 109      July   3   06 1276.66
    ## 110      June   1   06 1270.20
    ## 111       May   1   06 1270.09
    ## 112     April   3   06 1310.61
    ## 113     March   1   06 1294.87
    ## 114  February   1   06 1280.66
    ## 115   January   3   06 1280.08
    ## 116  December   1   05 1248.29
    ## 117  November   1   05 1249.48
    ## 118   October   3   05 1207.01
    ## 119 September   1   05 1228.81
    ## 120    August   1   05 1220.33
    ## 121      July   1   05 1234.18
    ## 122      June   1   05 1191.33
    ## 123       May   2   05 1191.50
    ## 124     April   1   05 1156.85
    ## 125     March   1   05 1180.59
    ## 126  February   1   05 1203.60
    ## 127   January   3   05 1181.27
    ## 128  December   1   04 1211.92
    ## 129  November   1   04 1173.82
    ## 130   October   1   04 1130.20
    ## 131 September   1   04 1114.58
    ## 132    August   2   04 1104.24
    ## 133      July   1   04 1101.72
    ## 134      June   1   04 1140.84
    ## 135       May   3   04 1120.68
    ## 136     April   1   04 1107.30
    ## 137     March   1   04 1126.21
    ## 138  February   2   04 1144.94
    ## 139   January   2   04 1131.13
    ## 140  December   1   03 1111.92
    ## 141  November   3   03 1058.20
    ## 142   October   1   03 1050.71
    ## 143 September   2   03  995.97
    ## 144    August   1   03 1008.01
    ## 145      July   1   03  990.31
    ## 146      June   2   03  974.50
    ## 147       May   1   03  963.59
    ## 148     April   1   03  916.92
    ## 149     March   3   03  848.18
    ## 150  February   3   03  841.15
    ## 151   January   2   03  855.70
    ## 152  December   2   02  879.82
    ## 153  November   1   02  936.31
    ## 154   October   1   02  885.76
    ## 155 September   3   02  815.28
    ## 156    August   1   02  916.07
    ## 157      July   1   02  911.62
    ## 158      June   3   02  989.82
    ## 159       May   1   02 1067.14
    ## 160     April   1   02 1076.92
    ## 161     March   1   02 1147.39
    ## 162  February   1   02 1106.73
    ## 163   January   2   02 1130.20
    ## 164  December   3   01 1148.08
    ## 165  November   1   01 1139.45
    ## 166   October   1   01 1059.78
    ## 167 September   4   01 1040.94
    ## 168    August   1   01 1133.58
    ## 169      July   2   01 1211.23
    ## 170      June   1   01 1224.38
    ## 171       May   1   01 1255.82
    ## 172     April   2   01 1249.46
    ## 173     March   1   01 1160.33
    ## 174  February   1   01 1239.94
    ## 175   January   2   01 1366.01
    ## 176  December   1   00 1320.28
    ## 177  November   1   00 1314.95
    ## 178   October   2   00 1429.40
    ## 179 September   1   00 1436.51
    ## 180    August   1   00 1517.68
    ## 181      July   3   00 1430.83
    ## 182      June   1   00 1454.60
    ## 183       May   1   00 1420.60
    ## 184     April   3   00 1452.43
    ## 185     March   1   00 1498.58
    ## 186  February   1   00 1366.42
    ## 187   January   3   00 1394.46
    ## 188  December   1   99 1469.25
    ## 189  November   1   99 1388.91
    ## 190   October   1   99 1362.93
    ## 191 September   1   99 1282.71
    ## 192    August   2   99 1320.41
    ## 193      July   1   99 1328.72
    ## 194      June   1   99 1372.71
    ## 195       May   3   99 1301.84
    ## 196     April   1   99 1335.18
    ## 197     March   1   99 1286.37
    ## 198  February   1   99 1238.33
    ## 199   January   4   99 1279.64
    ## 200  December   1   98 1229.23
    ## 201  November   2   98 1163.63
    ## 202   October   1   98 1098.67
    ## 203 September   1   98 1017.01
    ## 204    August   3   98  957.28
    ## 205      July   1   98 1120.67
    ## 206      June   1   98 1133.84
    ## 207       May   1   98 1090.82
    ## 208     April   1   98 1111.75
    ## 209     March   2   98 1101.75
    ## 210  February   2   98 1049.34
    ## 211   January   2   98  980.28
    ## 212  December   1   97  970.43
    ## 213  November   3   97  955.40
    ## 214   October   1   97  914.62
    ## 215 September   2   97  947.28
    ## 216    August   1   97  899.47
    ## 217      July   1   97  954.31
    ## 218      June   2   97  885.14
    ## 219       May   1   97  848.28
    ## 220     April   1   97  801.34
    ## 221     March   3   97  757.12
    ## 222  February   3   97  790.82
    ## 223   January   2   97  786.16
    ## 224  December   2   96  740.74
    ## 225  November   1   96  757.02
    ## 226   October   1   96  705.27
    ## 227 September   3   96  687.33
    ## 228    August   1   96  651.99
    ## 229      July   1   96  639.95
    ## 230      June   3   96  670.63
    ## 231       May   1   96  669.12
    ## 232     April   1   96  654.17
    ## 233     March   1   96  645.50
    ## 234  February   1   96  640.43
    ## 235   January   2   96  636.02
    ## 236  December   1   95  615.93
    ## 237  November   1   95  605.37
    ## 238   October   2   95  581.50
    ## 239 September   1   95  584.41
    ## 240    August   1   95  561.88
    ## 241      July   3   95  562.06
    ## 242      June   1   95  544.75
    ## 243       May   1   95  533.40
    ## 244     April   3   95  514.71
    ## 245     March   1   95  500.71
    ## 246  February   1   95  487.39
    ## 247   January   3   95  470.42
    ## 248  December   1   94  459.27
    ## 249  November   1   94  453.69
    ## 250   October   3   94  472.35
    ## 251 September   1   94  462.71
    ## 252    August   1   94  475.49
    ## 253      July   1   94  458.26
    ## 254      June   1   94  444.27
    ## 255       May   2   94  456.50
    ## 256     April   4   94  450.91
    ## 257     March   1   94  445.77
    ## 258  February   1   94  467.14
    ## 259   January   3   94  481.61
    ## 260  December   1   93  466.45
    ## 261  November   1   93  461.79
    ## 262   October   1   93  467.83
    ## 263 September   1   93  458.93
    ## 264    August   2   93  463.56
    ## 265      July   1   93  448.13
    ## 266      June   1   93  450.53
    ## 267       May   3   93  450.19
    ## 268     April   1   93  440.19
    ## 269     March   1   93  451.67
    ## 270  February   1   93  443.38
    ## 271   January   4   93  438.78
    ## 272  December   1   92  435.71
    ## 273  November   2   92  431.35
    ## 274   October   1   92  418.68
    ## 275 September   1   92  417.80
    ## 276    August   3   92  414.03
    ## 277      July   1   92  424.21
    ## 278      June   1   92  408.14
    ## 279       May   1   92  415.35
    ## 280     April   1   92  414.95
    ## 281     March   2   92  403.69
    ## 282  February   3   92  412.70
    ## 283   January   2   92  408.78
    ## 284  December   2   91  417.09
    ## 285  November   1   91  375.22
    ## 286   October   1   91  392.45
    ## 287 September   3   91  387.86
    ## 288    August   1   91  395.43
    ## 289      July   1   91  387.81
    ## 290      June   3   91  371.16
    ## 291       May   1   91  389.83
    ## 292     April   1   91  375.34
    ## 293     March   1   91  375.22
    ## 294  February   1   91  367.07
    ## 295   January   2   91  343.93
    ## 296  December   3   90  330.22
    ## 297  November   1   90  322.22
    ## 298   October   1   90  304.00
    ## 299 September   4   90  306.05
    ## 300    August   1   90  322.56
    ## 301      July   2   90  356.15
    ## 302      June   1   90  358.02
    ## 303       May   1   90  361.23
    ## 304     April   2   90  330.80
    ## 305     March   1   90  339.94
    ## 306  February   1   90  331.89
    ## 307   January   2   90  329.08
    ## 308  December   1   89  353.40
    ## 309  November   1   89  345.99
    ## 310   October   2   89  340.36
    ## 311 September   1   89  349.15
    ## 312    August   1   89  351.45
    ## 313      July   3   89  346.08
    ## 314      June   1   89  317.98
    ## 315       May   1   89  320.52
    ## 316     April   3   89  309.64
    ## 317     March   1   89  294.87
    ## 318  February   1   89  288.86
    ## 319   January   3   89  297.47
    ## 320  December   1   88  277.72
    ## 321  November   1   88  273.70
    ## 322   October   3   88  278.97
    ## 323 September   1   88  271.91
    ## 324    August   1   88  261.52
    ## 325      July   1   88  272.02
    ## 326      June   1   88  273.50
    ## 327       May   2   88  262.16
    ## 328     April   4   88  261.33
    ## 329     March   1   88  258.89
    ## 330  February   1   88  267.82
    ## 331   January   4   88  257.07
    ## 332  December   1   87  247.08
    ## 333  November   2   87  230.30
    ## 334   October   1   87  251.79
    ## 335 September   1   87  321.83
    ## 336    August   3   87  329.80
    ## 337      July   1   87  318.66
    ## 338      June   1   87  304.00
    ## 339       May   1   87  290.10
    ## 340     April   1   87  288.36
    ## 341     March   2   87  291.70
    ## 342  February   2   87  284.20
    ## 343   January   2   87  274.08
    ## 344  December   1   86  242.17
    ## 345  November   3   86  249.22
    ## 346   October   1   86  243.98
    ## 347 September   2   86  231.32
    ## 348    August   1   86  252.93
    ## 349      July   1   86  236.12
    ## 350      June   2   86  250.84
    ## 351       May   1   86  247.35
    ## 352     April   1   86  235.52
    ## 353     March   3   86  238.90
    ## 354  February   3   86  226.92
    ## 355   January   2   86  211.78
    ## 356  December   2   85  211.28
    ## 357  November   1   85  202.17
    ## 358   October   1   85  189.82
    ## 359 September   3   85  182.08
    ## 360    August   1   85  188.63
    ## 361      July   1   85  190.92
    ## 362      June   3   85  191.85
    ## 363       May   1   85  189.55
    ## 364     April   1   85  179.83
    ## 365     March   1   85  180.66
    ## 366  February   1   85  181.18
    ## 367   January   2   85  179.63
    ## 368  December   3   84  167.24
    ## 369  November   1   84  163.58
    ## 370   October   1   84  166.09
    ## 371 September   4   84  166.10
    ## 372    August   1   84  166.68
    ## 373      July   2   84  150.66
    ## 374      June   1   84  153.18
    ## 375       May   1   84  150.55
    ## 376     April   2   84  160.05
    ## 377     March   1   84  159.18
    ## 378  February   1   84  157.06
    ## 379   January   3   84  163.41
    ## 380  December   1   83  164.93
    ## 381  November   1   83  166.40
    ## 382   October   3   83  163.55
    ## 383 September   1   83  166.07
    ## 384    August   1   83  164.40
    ## 385      July   1   83  162.56
    ## 386      June   1   83  167.64
    ## 387       May   2   83  162.39
    ## 388     April   4   83  164.43
    ## 389     March   1   83  152.96
    ## 390  February   1   83  148.06
    ## 391   January   3   83  145.30
    ## 392  December   1   82  140.64
    ## 393  November   1   82  138.53
    ## 394   October   1   82  133.72
    ## 395 September   1   82  120.42
    ## 396    August   2   82  119.51
    ## 397      July   1   82  107.09
    ## 398      June   1   82  109.61
    ## 399       May   3   82  111.88
    ## 400     April   1   82  116.44
    ## 401     March   1   82  111.96
    ## 402  February   1   82  113.11
    ## 403   January   4   82  120.40
    ## 404  December   1   81  122.55
    ## 405  November   2   81  126.35
    ## 406   October   1   81  121.89
    ## 407 September   1   81  116.18
    ## 408    August   3   81  122.79
    ## 409      July   1   81  130.92
    ## 410      June   1   81  131.21
    ## 411       May   1   81  132.59
    ## 412     April   1   81  132.81
    ## 413     March   2   81  136.00
    ## 414  February   2   81  131.27
    ## 415   January   2   81  129.55
    ## 416  December   1   80  135.76
    ## 417  November   3   80  140.52
    ## 418   October   1   80  127.47
    ## 419 September   2   80  125.46
    ## 420    August   1   80  122.38
    ## 421      July   1   80  121.67
    ## 422      June   2   80  114.24
    ## 423       May   1   80  111.24
    ## 424     April   1   80  106.29
    ## 425     March   3   80  102.09
    ## 426  February   1   80  113.66
    ## 427   January   2   80  114.16
    ## 428  December   3   79  107.94
    ## 429  November   1   79  106.16
    ## 430   October   1   79  101.82
    ## 431 September   4   79  109.32
    ## 432    August   1   79  109.32
    ## 433      July   2   79  103.81
    ## 434      June   1   79  102.91
    ## 435       May   1   79   99.08
    ## 436     April   2   79  101.76
    ## 437     March   1   79  101.59
    ## 438  February   1   79   96.28
    ## 439   January   2   79   99.93
    ## 440  December   1   78   96.11
    ## 441  November   1   78   94.70
    ## 442   October   2   78   93.15
    ## 443 September   1   78  102.54
    ## 444    August   1   78  103.29
    ## 445      July   3   78  100.68
    ## 446      June   1   78   95.53
    ## 447       May   1   78   97.24
    ## 448     April   3   78   96.83
    ## 449     March   1   78   89.21
    ## 450  February   1   78   87.04
    ## 451   January   3   78   89.25
    ## 452  December   1   77   95.10
    ## 453  November   1   77   94.83
    ## 454   October   3   77   92.34
    ## 455 September   1   77   96.53
    ## 456    August   1   77   96.77
    ## 457      July   1   77   98.85
    ## 458      June   1   77  100.48
    ## 459       May   2   77   96.12
    ## 460     April   1   77   98.44
    ## 461     March   1   77   98.42
    ## 462  February   1   77   99.82
    ## 463   January   3   77  102.03
    ## 464  December   1   76  107.46
    ## 465  November   1   76  102.10
    ## 466   October   1   76  102.90
    ## 467 September   1   76  105.24
    ## 468    August   2   76  102.91
    ## 469      July   1   76  103.44
    ## 470      June   1   76  104.28
    ## 471       May   3   76  100.18
    ## 472     April   1   76  101.64
    ## 473     March   1   76  102.77
    ## 474  February   2   76   99.71
    ## 475   January   2   76  100.86
    ## 476  December   1   75   90.19
    ## 477  November   3   75   91.24
    ## 478   October   1   75   89.04
    ## 479 September   2   75   83.87
    ## 480    August   1   75   86.88
    ## 481      July   1   75   88.75
    ## 482      June   2   75   95.19
    ## 483       May   1   75   91.15
    ## 484     April   1   75   87.30
    ## 485     March   3   75   83.36
    ## 486  February   3   75   81.59
    ## 487   January   2   75   76.98
    ## 488  December   2   74   68.56
    ## 489  November   1   74   69.97
    ## 490   October   1   74   73.90
    ## 491 September   3   74   63.54
    ## 492    August   1   74   72.15
    ## 493      July   1   74   79.31
    ## 494      June   3   74   86.00
    ## 495       May   1   74   87.28
    ## 496     April   1   74   90.31
    ## 497     March   1   74   93.98
    ## 498  February   1   74   96.22
    ## 499   January   2   74   96.57
    ## 500  December   3   73   97.55
    ## 501  November   1   73   95.96
    ## 502   October   1   73  108.29
    ## 503 September   4   73  108.43
    ## 504    August   1   73  104.25
    ## 505      July   2   73  108.22
    ## 506      June   1   73  104.26
    ## 507       May   1   73  104.95
    ## 508     April   2   73  106.97
    ## 509     March   1   73  111.52
    ## 510  February   1   73  111.68
    ## 511   January   2   73  116.03
    ## 512  December   1   72  118.05
    ## 513  November   1   72  116.67
    ## 514   October   2   72  111.58
    ## 515 September   1   72  110.55
    ## 516    August   1   72  111.09
    ## 517      July   3   72  107.39
    ## 518      June   1   72  107.14
    ## 519       May   1   72  109.53
    ## 520     April   3   72  107.67
    ## 521     March   1   72  107.20
    ## 522  February   1   72  106.57
    ## 523   January   3   72  103.94
    ## 524  December   1   71  102.09
    ## 525  November   1   71   93.99
    ## 526   October   1   71   94.23
    ## 527 September   1   71   98.34
    ## 528    August   2   71   99.03
    ## 529      July   1   71   95.58
    ## 530      June   1   71   98.70
    ## 531       May   3   71   99.63
    ## 532     April   1   71  103.95
    ## 533     March   1   71  100.31
    ## 534  February   1   71   96.75
    ## 535   January   4   71   95.88
    ## 536  December   1   70   92.15
    ## 537  November   2   70   87.20
    ## 538   October   1   70   83.25
    ## 539 September   1   70   84.30
    ## 540    August   3   70   81.52
    ## 541      July   1   70   78.05
    ## 542      June   1   70   72.72
    ## 543       May   1   70   76.55
    ## 544     April   1   70   81.52
    ## 545     March   2   70   89.63
    ## 546  February   2   70   89.50
    ## 547   January   2   70   85.02
    ## 548  December   1   69   92.06
    ## 549  November   3   69   93.81
    ## 550   October   1   69   97.12
    ## 551 September   2   69   93.12
    ## 552    August   1   69   95.51
    ## 553      July   1   69   91.83
    ## 554      June   2   69   97.71
    ## 555       May   1   69  103.46
    ## 556     April   1   69  103.69
    ## 557     March   3   69  101.51
    ## 558  February   3   69   98.13
    ## 559   January   2   69  103.01
    ## 560  December   2   68  103.86
    ## 561  November   1   68  108.37
    ## 562   October   1   68  103.41
    ## 563 September   3   68  102.67
    ## 564    August   1   68   98.86
    ## 565      July   1   68   97.74
    ## 566      June   3   68   99.58
    ## 567       May   1   68   98.68
    ## 568     April   1   68   97.46
    ## 569     March   1   68   90.20
    ## 570  February   1   68   89.36
    ## 571   January   2   68   92.24
    ## 572  December   1   67   96.47
    ## 573  November   1   67   94.00
    ## 574   October   2   67   93.30
    ## 575 September   1   67   96.71
    ## 576    August   1   67   93.64
    ## 577      July   3   67   94.75
    ## 578      June   1   67   90.64
    ## 579       May   1   67   89.08
    ## 580     April   3   67   94.01
    ## 581     March   1   67   90.20
    ## 582  February   1   67   86.78
    ## 583   January   3   67   86.61
    ## 584  December   1   66   80.33
    ## 585  November   1   66   80.45
    ## 586   October   3   66   80.20
    ## 587 September   1   66   76.56
    ## 588    August   1   66   77.10
    ## 589      July   1   66   83.60
    ## 590      June   1   66   84.74
    ## 591       May   2   66   86.13
    ## 592     April   1   66   91.06
    ## 593     March   1   66   89.23
    ## 594  February   1   66   91.22
    ## 595   January   3   66   92.88
    ## 596  December   1   65   92.43
    ## 597  November   1   65   91.61
    ## 598   October   1   65   92.42
    ## 599 September   1   65   89.96
    ## 600    August   2   65   87.17
    ## 601      July   1   65   85.25
    ## 602      June   1   65   84.12
    ## 603       May   3   65   88.42
    ## 604     April   1   65   89.11
    ## 605     March   1   65   86.16
    ## 606  February   1   65   87.43
    ## 607   January   4   65   87.56
    ## 608  December   1   64   84.75
    ## 609  November   2   64   84.42
    ## 610   October   1   64   84.86
    ## 611 September   1   64   84.18
    ## 612    August   3   64   81.83
    ## 613      July   1   64   83.18
    ## 614      June   1   64   81.69
    ## 615       May   1   64   80.37
    ## 616     April   1   64   79.46
    ## 617     March   2   64   78.98
    ## 618  February   3   64   77.80
    ## 619   January   2   64   77.04
    ## 620  December   2   63   75.02
    ## 621  November   1   63   73.23
    ## 622   October   1   63   74.01
    ## 623 September   3   63   71.70
    ## 624    August   1   63   72.50
    ## 625      July   1   63   69.13
    ## 626      June   3   63   69.37
    ## 627       May   1   63   70.80
    ## 628     April   1   63   69.80
    ## 629     March   1   63   66.57
    ## 630  February   1   63   64.29
    ## 631   January   2   63   66.20
    ## 632  December   3   62   63.10
    ## 633  November   1   62   62.26
    ## 634   October   1   62   56.52
    ## 635 September   4   62   56.27
    ## 636    August   1   62   59.12
    ## 637      July   2   62   58.23
    ## 638      June   1   62   54.75
    ## 639       May   1   62   59.63
    ## 640     April   2   62   65.24
    ## 641     March   1   62   69.55
    ## 642  February   1   62   69.96
    ## 643   January   2   62   68.84
    ## 644  December   1   61   71.55
    ## 645  November   1   61   71.32
    ## 646   October   2   61   68.62
    ## 647 September   1   61   66.73
    ## 648    August   1   61   68.07
    ## 649      July   3   61   66.76
    ## 650      June   1   61   64.64
    ## 651       May   1   61   66.56
    ## 652     April   3   61   65.31
    ## 653     March   1   61   65.06
    ## 654  February   1   61   63.44
    ## 655   January   3   61   61.78
    ## 656  December   1   60   58.11
    ## 657  November   1   60   55.54
    ## 658   October   3   60   53.39
    ## 659 September   1   60   53.52
    ## 660    August   1   60   56.96
    ## 661      July   1   60   55.51
    ## 662      June   1   60   56.92
    ## 663       May   2   60   55.83
    ## 664     April   1   60   54.37
    ## 665     March   1   60   55.34
    ## 666  February   1   60   56.12
    ## 667   January   4   60   55.61
    ## 668  December   1   59   59.89
    ## 669  November   2   59   58.28
    ## 670   October   1   59   57.52
    ## 671 September   1   59   56.88
    ## 672    August   3   59   59.60
    ## 673      July   1   59   60.51
    ## 674      June   1   59   58.47
    ## 675       May   1   59   58.68
    ## 676     April   1   59   57.59
    ## 677     March   2   59   55.44
    ## 678  February   2   59   55.41
    ## 679   January   2   59   55.45
    ## 680  December   1   58   55.21
    ## 681  November   3   58   52.48
    ## 682   October   1   58   51.33
    ## 683 September   2   58   50.06
    ## 684    August   1   58   47.75
    ## 685      July   1   58   47.19
    ## 686      June   2   58   45.24
    ## 687       May   1   58   44.09
    ## 688     April   1   58   43.44
    ## 689     March   3   58   42.10
    ## 690  February   3   58   40.84
    ## 691   January   2   58   41.70
    ## 692  December   2   57   39.99
    ## 693  November   1   57   41.72
    ## 694   October   1   57   41.06
    ## 695 September   3   57   42.42
    ## 696    August   1   57   45.22
    ## 697      July   1   57   47.91
    ## 698      June   3   57   47.37
    ## 699       May   1   57   47.43
    ## 700     April   1   57   45.74
    ## 701     March   1   57   44.11
    ## 702  February   1   57   43.26
    ## 703   January   2   57   44.72
    ## 704  December   3   56   46.67
    ## 705  November   1   56   45.08
    ## 706   October   1   56   45.58
    ## 707 September   4   56   45.35
    ## 708    August   1   56   47.51
    ## 709      July   2   56   49.39
    ## 710      June   1   56   46.97
    ## 711       May   1   56   45.20
    ## 712     April   2   56   48.38
    ## 713     March   1   56   48.48
    ## 714  February   1   56   45.34
    ## 715   January   3   56   43.82
    ## 716  December   1   55   45.48
    ## 717  November   1   55   45.51
    ## 718   October   3   55   42.34
    ## 719 September   1   55   43.67
    ## 720    August   1   55   43.18
    ## 721      July   1   55   43.52
    ## 722      June   1   55   41.03
    ## 723       May   2   55   37.91
    ## 724     April   1   55   37.96
    ## 725     March   1   55   36.58
    ## 726  February   1   55   36.76
    ## 727   January   3   55   36.63
    ## 728  December   1   54   35.98
    ## 729  November   1   54   34.24
    ## 730   October   1   54   31.68
    ## 731 September   1   54   32.31
    ## 732    August   2   54   29.83
    ## 733      July   1   54   30.88
    ## 734      June   1   54   29.21
    ## 735       May   3   54   29.19
    ## 736     April   1   54   28.26
    ## 737     March   1   54   26.94
    ## 738  February   1   54   26.15
    ## 739   January   4   54   26.08
    ## 740  December   1   53   24.81
    ## 741  November   2   53   24.76
    ## 742   October   1   53   24.54
    ## 743 September   1   53   23.35
    ## 744    August   3   53   23.32
    ## 745      July   1   53   24.75
    ## 746      June   1   53   24.14
    ## 747       May   1   53   24.54
    ## 748     April   1   53   24.62
    ## 749     March   2   53   25.29
    ## 750  February   2   53   25.90
    ## 751   January   2   53   26.38
    ## 752  December   1   52   26.57
    ## 753  November   3   52   25.66
    ## 754   October   1   52   24.52
    ## 755 September   2   52   24.54
    ## 756    August   1   52   25.03
    ## 757      July   1   52   25.40
    ## 758      June   2   52   24.96
    ## 759       May   1   52   23.86
    ## 760     April   1   52   23.32
    ## 761     March   3   52   24.37
    ## 762  February   1   52   23.26
    ## 763   January   2   52   24.14
    ## 764  December   3   51   23.77
    ## 765  November   1   51   22.88
    ## 766   October   1   51   22.94
    ## 767 September   4   51   23.26
    ## 768    August   1   51   23.28
    ## 769      July   2   51   22.40
    ## 770      June   1   51   20.96
    ## 771       May   1   51   21.52
    ## 772     April   2   51   22.43
    ## 773     March   1   51   21.48
    ## 774  February   1   51   21.80
    ## 775   January   2   51   21.66
    ## 776  December   1   50   20.43
    ## 777  November   1   50   19.51
    ## 778   October   2   50   19.53
    ## 779 September   1   50   19.45
    ## 780    August   1   50   18.42
    ## 781      July   3   50   17.84
    ## 782      June   1   50   17.69
    ## 783       May   1   50   18.78
    ## 784     April   3   50   17.96
    ## 785     March   1   50   17.29
    ## 786  February   1   50   17.22
    ## 787   January   3   50   17.05

``` r
skimr::skim(snp_df)
```

|                                                  |        |
|:-------------------------------------------------|:-------|
| Name                                             | snp_df |
| Number of rows                                   | 787    |
| Number of columns                                | 4      |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   |        |
| Column type frequency:                           |        |
| character                                        | 2      |
| numeric                                          | 2      |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ |        |
| Group variables                                  | None   |

Data summary

**Variable type: character**

| skim_variable | n_missing | complete_rate | min | max | empty | n_unique | whitespace |
|:--------------|----------:|--------------:|----:|----:|------:|---------:|-----------:|
| day           |         0 |             1 |   1 |   1 |     0 |        4 |          0 |
| year          |         0 |             1 |   2 |   2 |     0 |       66 |          0 |

**Variable type: numeric**

| skim_variable | n_missing | complete_rate |   mean |     sd |    p0 |   p25 |    p50 |   p75 |    p100 | hist  |
|:--------------|----------:|--------------:|-------:|-------:|------:|------:|-------:|------:|--------:|:------|
| month         |         0 |             1 |   6.48 |   3.45 |  1.00 |  3.00 |   6.00 |   9.0 |   12.00 | ▇▅▅▅▇ |
| close         |         0 |             1 | 474.89 | 545.96 | 17.05 | 83.74 | 138.53 | 941.8 | 2107.39 | ▇▁▂▁▁ |

I replaced the month number with a month name.

### Tidying unemployment data

**WHAT SHOULD WE CALL THE NEW VARIABLE?**

``` r
unemp_df = read_csv("./data/unemployment.csv") %>% 
  janitor::clean_names() 
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
| Number of rows                                   | 68       |
| Number of columns                                | 13       |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   |          |
| Column type frequency:                           |          |
| numeric                                          | 13       |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ |          |
| Group variables                                  | None     |

Data summary

**Variable type: numeric**

| skim_variable | n_missing | complete_rate |    mean |    sd |     p0 |     p25 |     p50 |     p75 |   p100 | hist  |
|:--------------|----------:|--------------:|--------:|------:|-------:|--------:|--------:|--------:|-------:|:------|
| year          |         0 |          1.00 | 1981.50 | 19.77 | 1948.0 | 1964.75 | 1981.50 | 1998.25 | 2015.0 | ▇▇▇▇▇ |
| jan           |         0 |          1.00 |    5.81 |  1.62 |    2.9 |    4.68 |    5.70 |    6.60 |   10.4 | ▅▇▃▂▁ |
| feb           |         0 |          1.00 |    5.81 |  1.64 |    2.6 |    4.70 |    5.55 |    6.75 |   10.4 | ▃▇▅▂▁ |
| mar           |         0 |          1.00 |    5.82 |  1.65 |    2.6 |    4.70 |    5.65 |    6.82 |   10.3 | ▃▇▇▃▁ |
| apr           |         0 |          1.00 |    5.82 |  1.69 |    2.7 |    4.70 |    5.60 |    7.03 |   10.2 | ▃▇▆▃▂ |
| may           |         0 |          1.00 |    5.82 |  1.70 |    2.5 |    4.60 |    5.60 |    7.10 |   10.1 | ▃▇▆▅▂ |
| jun           |         0 |          1.00 |    5.84 |  1.69 |    2.5 |    4.60 |    5.60 |    7.05 |   10.1 | ▃▇▆▃▂ |
| jul           |         1 |          0.99 |    5.84 |  1.67 |    2.6 |    4.70 |    5.60 |    6.95 |    9.8 | ▃▆▇▃▂ |
| aug           |         1 |          0.99 |    5.83 |  1.66 |    2.7 |    4.65 |    5.70 |    6.90 |    9.8 | ▅▇▇▃▂ |
| sep           |         1 |          0.99 |    5.83 |  1.65 |    2.9 |    4.65 |    5.60 |    6.85 |   10.1 | ▅▇▇▂▂ |
| oct           |         1 |          0.99 |    5.84 |  1.67 |    3.0 |    4.55 |    5.70 |    6.90 |   10.4 | ▅▇▅▂▁ |
| nov           |         1 |          0.99 |    5.84 |  1.66 |    2.8 |    4.65 |    5.80 |    6.80 |   10.8 | ▅▇▅▂▁ |
| dec           |         1 |          0.99 |    5.84 |  1.64 |    2.7 |    4.80 |    5.60 |    6.65 |   10.8 | ▅▇▇▂▁ |

``` r
unemp_tidy_df = 
  pivot_longer(
    unemp_df, 
    jan:dec,
    names_to = "month", 
    values_to = "persons")

skimr::skim(unemp_tidy_df)
```

|                                                  |               |
|:-------------------------------------------------|:--------------|
| Name                                             | unemp_tidy_df |
| Number of rows                                   | 816           |
| Number of columns                                | 3             |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   |               |
| Column type frequency:                           |               |
| character                                        | 1             |
| numeric                                          | 2             |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ |               |
| Group variables                                  | None          |

Data summary

**Variable type: character**

| skim_variable | n_missing | complete_rate | min | max | empty | n_unique | whitespace |
|:--------------|----------:|--------------:|----:|----:|------:|---------:|-----------:|
| month         |         0 |             1 |   3 |   3 |     0 |       12 |          0 |

**Variable type: numeric**

| skim_variable | n_missing | complete_rate |    mean |    sd |     p0 |     p25 |    p50 |     p75 |   p100 | hist  |
|:--------------|----------:|--------------:|--------:|------:|-------:|--------:|-------:|--------:|-------:|:------|
| year          |         0 |          1.00 | 1981.50 | 19.64 | 1948.0 | 1964.75 | 1981.5 | 1998.25 | 2015.0 | ▇▇▇▇▇ |
| persons       |         6 |          0.99 |    5.83 |  1.65 |    2.5 |    4.70 |    5.6 |    6.90 |   10.8 | ▃▇▅▂▁ |

``` r
unemp_tidy_df %>% 
  transform(month = as.numeric(month))
```

    ## Warning in eval(substitute(list(...)), `_data`, parent.frame()): NAs introduced
    ## by coercion

    ##     year month persons
    ## 1   1948    NA     3.4
    ## 2   1948    NA     3.8
    ## 3   1948    NA     4.0
    ## 4   1948    NA     3.9
    ## 5   1948    NA     3.5
    ## 6   1948    NA     3.6
    ## 7   1948    NA     3.6
    ## 8   1948    NA     3.9
    ## 9   1948    NA     3.8
    ## 10  1948    NA     3.7
    ## 11  1948    NA     3.8
    ## 12  1948    NA     4.0
    ## 13  1949    NA     4.3
    ## 14  1949    NA     4.7
    ## 15  1949    NA     5.0
    ## 16  1949    NA     5.3
    ## 17  1949    NA     6.1
    ## 18  1949    NA     6.2
    ## 19  1949    NA     6.7
    ## 20  1949    NA     6.8
    ## 21  1949    NA     6.6
    ## 22  1949    NA     7.9
    ## 23  1949    NA     6.4
    ## 24  1949    NA     6.6
    ## 25  1950    NA     6.5
    ## 26  1950    NA     6.4
    ## 27  1950    NA     6.3
    ## 28  1950    NA     5.8
    ## 29  1950    NA     5.5
    ## 30  1950    NA     5.4
    ## 31  1950    NA     5.0
    ## 32  1950    NA     4.5
    ## 33  1950    NA     4.4
    ## 34  1950    NA     4.2
    ## 35  1950    NA     4.2
    ## 36  1950    NA     4.3
    ## 37  1951    NA     3.7
    ## 38  1951    NA     3.4
    ## 39  1951    NA     3.4
    ## 40  1951    NA     3.1
    ## 41  1951    NA     3.0
    ## 42  1951    NA     3.2
    ## 43  1951    NA     3.1
    ## 44  1951    NA     3.1
    ## 45  1951    NA     3.3
    ## 46  1951    NA     3.5
    ## 47  1951    NA     3.5
    ## 48  1951    NA     3.1
    ## 49  1952    NA     3.2
    ## 50  1952    NA     3.1
    ## 51  1952    NA     2.9
    ## 52  1952    NA     2.9
    ## 53  1952    NA     3.0
    ## 54  1952    NA     3.0
    ## 55  1952    NA     3.2
    ## 56  1952    NA     3.4
    ## 57  1952    NA     3.1
    ## 58  1952    NA     3.0
    ## 59  1952    NA     2.8
    ## 60  1952    NA     2.7
    ## 61  1953    NA     2.9
    ## 62  1953    NA     2.6
    ## 63  1953    NA     2.6
    ## 64  1953    NA     2.7
    ## 65  1953    NA     2.5
    ## 66  1953    NA     2.5
    ## 67  1953    NA     2.6
    ## 68  1953    NA     2.7
    ## 69  1953    NA     2.9
    ## 70  1953    NA     3.1
    ## 71  1953    NA     3.5
    ## 72  1953    NA     4.5
    ## 73  1954    NA     4.9
    ## 74  1954    NA     5.2
    ## 75  1954    NA     5.7
    ## 76  1954    NA     5.9
    ## 77  1954    NA     5.9
    ## 78  1954    NA     5.6
    ## 79  1954    NA     5.8
    ## 80  1954    NA     6.0
    ## 81  1954    NA     6.1
    ## 82  1954    NA     5.7
    ## 83  1954    NA     5.3
    ## 84  1954    NA     5.0
    ## 85  1955    NA     4.9
    ## 86  1955    NA     4.7
    ## 87  1955    NA     4.6
    ## 88  1955    NA     4.7
    ## 89  1955    NA     4.3
    ## 90  1955    NA     4.2
    ## 91  1955    NA     4.0
    ## 92  1955    NA     4.2
    ## 93  1955    NA     4.1
    ## 94  1955    NA     4.3
    ## 95  1955    NA     4.2
    ## 96  1955    NA     4.2
    ## 97  1956    NA     4.0
    ## 98  1956    NA     3.9
    ## 99  1956    NA     4.2
    ## 100 1956    NA     4.0
    ## 101 1956    NA     4.3
    ## 102 1956    NA     4.3
    ## 103 1956    NA     4.4
    ## 104 1956    NA     4.1
    ## 105 1956    NA     3.9
    ## 106 1956    NA     3.9
    ## 107 1956    NA     4.3
    ## 108 1956    NA     4.2
    ## 109 1957    NA     4.2
    ## 110 1957    NA     3.9
    ## 111 1957    NA     3.7
    ## 112 1957    NA     3.9
    ## 113 1957    NA     4.1
    ## 114 1957    NA     4.3
    ## 115 1957    NA     4.2
    ## 116 1957    NA     4.1
    ## 117 1957    NA     4.4
    ## 118 1957    NA     4.5
    ## 119 1957    NA     5.1
    ## 120 1957    NA     5.2
    ## 121 1958    NA     5.8
    ## 122 1958    NA     6.4
    ## 123 1958    NA     6.7
    ## 124 1958    NA     7.4
    ## 125 1958    NA     7.4
    ## 126 1958    NA     7.3
    ## 127 1958    NA     7.5
    ## 128 1958    NA     7.4
    ## 129 1958    NA     7.1
    ## 130 1958    NA     6.7
    ## 131 1958    NA     6.2
    ## 132 1958    NA     6.2
    ## 133 1959    NA     6.0
    ## 134 1959    NA     5.9
    ## 135 1959    NA     5.6
    ## 136 1959    NA     5.2
    ## 137 1959    NA     5.1
    ## 138 1959    NA     5.0
    ## 139 1959    NA     5.1
    ## 140 1959    NA     5.2
    ## 141 1959    NA     5.5
    ## 142 1959    NA     5.7
    ## 143 1959    NA     5.8
    ## 144 1959    NA     5.3
    ## 145 1960    NA     5.2
    ## 146 1960    NA     4.8
    ## 147 1960    NA     5.4
    ## 148 1960    NA     5.2
    ## 149 1960    NA     5.1
    ## 150 1960    NA     5.4
    ## 151 1960    NA     5.5
    ## 152 1960    NA     5.6
    ## 153 1960    NA     5.5
    ## 154 1960    NA     6.1
    ## 155 1960    NA     6.1
    ## 156 1960    NA     6.6
    ## 157 1961    NA     6.6
    ## 158 1961    NA     6.9
    ## 159 1961    NA     6.9
    ## 160 1961    NA     7.0
    ## 161 1961    NA     7.1
    ## 162 1961    NA     6.9
    ## 163 1961    NA     7.0
    ## 164 1961    NA     6.6
    ## 165 1961    NA     6.7
    ## 166 1961    NA     6.5
    ## 167 1961    NA     6.1
    ## 168 1961    NA     6.0
    ## 169 1962    NA     5.8
    ## 170 1962    NA     5.5
    ## 171 1962    NA     5.6
    ## 172 1962    NA     5.6
    ## 173 1962    NA     5.5
    ## 174 1962    NA     5.5
    ## 175 1962    NA     5.4
    ## 176 1962    NA     5.7
    ## 177 1962    NA     5.6
    ## 178 1962    NA     5.4
    ## 179 1962    NA     5.7
    ## 180 1962    NA     5.5
    ## 181 1963    NA     5.7
    ## 182 1963    NA     5.9
    ## 183 1963    NA     5.7
    ## 184 1963    NA     5.7
    ## 185 1963    NA     5.9
    ## 186 1963    NA     5.6
    ## 187 1963    NA     5.6
    ## 188 1963    NA     5.4
    ## 189 1963    NA     5.5
    ## 190 1963    NA     5.5
    ## 191 1963    NA     5.7
    ## 192 1963    NA     5.5
    ## 193 1964    NA     5.6
    ## 194 1964    NA     5.4
    ## 195 1964    NA     5.4
    ## 196 1964    NA     5.3
    ## 197 1964    NA     5.1
    ## 198 1964    NA     5.2
    ## 199 1964    NA     4.9
    ## 200 1964    NA     5.0
    ## 201 1964    NA     5.1
    ## 202 1964    NA     5.1
    ## 203 1964    NA     4.8
    ## 204 1964    NA     5.0
    ## 205 1965    NA     4.9
    ## 206 1965    NA     5.1
    ## 207 1965    NA     4.7
    ## 208 1965    NA     4.8
    ## 209 1965    NA     4.6
    ## 210 1965    NA     4.6
    ## 211 1965    NA     4.4
    ## 212 1965    NA     4.4
    ## 213 1965    NA     4.3
    ## 214 1965    NA     4.2
    ## 215 1965    NA     4.1
    ## 216 1965    NA     4.0
    ## 217 1966    NA     4.0
    ## 218 1966    NA     3.8
    ## 219 1966    NA     3.8
    ## 220 1966    NA     3.8
    ## 221 1966    NA     3.9
    ## 222 1966    NA     3.8
    ## 223 1966    NA     3.8
    ## 224 1966    NA     3.8
    ## 225 1966    NA     3.7
    ## 226 1966    NA     3.7
    ## 227 1966    NA     3.6
    ## 228 1966    NA     3.8
    ## 229 1967    NA     3.9
    ## 230 1967    NA     3.8
    ## 231 1967    NA     3.8
    ## 232 1967    NA     3.8
    ## 233 1967    NA     3.8
    ## 234 1967    NA     3.9
    ## 235 1967    NA     3.8
    ## 236 1967    NA     3.8
    ## 237 1967    NA     3.8
    ## 238 1967    NA     4.0
    ## 239 1967    NA     3.9
    ## 240 1967    NA     3.8
    ## 241 1968    NA     3.7
    ## 242 1968    NA     3.8
    ## 243 1968    NA     3.7
    ## 244 1968    NA     3.5
    ## 245 1968    NA     3.5
    ## 246 1968    NA     3.7
    ## 247 1968    NA     3.7
    ## 248 1968    NA     3.5
    ## 249 1968    NA     3.4
    ## 250 1968    NA     3.4
    ## 251 1968    NA     3.4
    ## 252 1968    NA     3.4
    ## 253 1969    NA     3.4
    ## 254 1969    NA     3.4
    ## 255 1969    NA     3.4
    ## 256 1969    NA     3.4
    ## 257 1969    NA     3.4
    ## 258 1969    NA     3.5
    ## 259 1969    NA     3.5
    ## 260 1969    NA     3.5
    ## 261 1969    NA     3.7
    ## 262 1969    NA     3.7
    ## 263 1969    NA     3.5
    ## 264 1969    NA     3.5
    ## 265 1970    NA     3.9
    ## 266 1970    NA     4.2
    ## 267 1970    NA     4.4
    ## 268 1970    NA     4.6
    ## 269 1970    NA     4.8
    ## 270 1970    NA     4.9
    ## 271 1970    NA     5.0
    ## 272 1970    NA     5.1
    ## 273 1970    NA     5.4
    ## 274 1970    NA     5.5
    ## 275 1970    NA     5.9
    ## 276 1970    NA     6.1
    ## 277 1971    NA     5.9
    ## 278 1971    NA     5.9
    ## 279 1971    NA     6.0
    ## 280 1971    NA     5.9
    ## 281 1971    NA     5.9
    ## 282 1971    NA     5.9
    ## 283 1971    NA     6.0
    ## 284 1971    NA     6.1
    ## 285 1971    NA     6.0
    ## 286 1971    NA     5.8
    ## 287 1971    NA     6.0
    ## 288 1971    NA     6.0
    ## 289 1972    NA     5.8
    ## 290 1972    NA     5.7
    ## 291 1972    NA     5.8
    ## 292 1972    NA     5.7
    ## 293 1972    NA     5.7
    ## 294 1972    NA     5.7
    ## 295 1972    NA     5.6
    ## 296 1972    NA     5.6
    ## 297 1972    NA     5.5
    ## 298 1972    NA     5.6
    ## 299 1972    NA     5.3
    ## 300 1972    NA     5.2
    ## 301 1973    NA     4.9
    ## 302 1973    NA     5.0
    ## 303 1973    NA     4.9
    ## 304 1973    NA     5.0
    ## 305 1973    NA     4.9
    ## 306 1973    NA     4.9
    ## 307 1973    NA     4.8
    ## 308 1973    NA     4.8
    ## 309 1973    NA     4.8
    ## 310 1973    NA     4.6
    ## 311 1973    NA     4.8
    ## 312 1973    NA     4.9
    ## 313 1974    NA     5.1
    ## 314 1974    NA     5.2
    ## 315 1974    NA     5.1
    ## 316 1974    NA     5.1
    ## 317 1974    NA     5.1
    ## 318 1974    NA     5.4
    ## 319 1974    NA     5.5
    ## 320 1974    NA     5.5
    ## 321 1974    NA     5.9
    ## 322 1974    NA     6.0
    ## 323 1974    NA     6.6
    ## 324 1974    NA     7.2
    ## 325 1975    NA     8.1
    ## 326 1975    NA     8.1
    ## 327 1975    NA     8.6
    ## 328 1975    NA     8.8
    ## 329 1975    NA     9.0
    ## 330 1975    NA     8.8
    ## 331 1975    NA     8.6
    ## 332 1975    NA     8.4
    ## 333 1975    NA     8.4
    ## 334 1975    NA     8.4
    ## 335 1975    NA     8.3
    ## 336 1975    NA     8.2
    ## 337 1976    NA     7.9
    ## 338 1976    NA     7.7
    ## 339 1976    NA     7.6
    ## 340 1976    NA     7.7
    ## 341 1976    NA     7.4
    ## 342 1976    NA     7.6
    ## 343 1976    NA     7.8
    ## 344 1976    NA     7.8
    ## 345 1976    NA     7.6
    ## 346 1976    NA     7.7
    ## 347 1976    NA     7.8
    ## 348 1976    NA     7.8
    ## 349 1977    NA     7.5
    ## 350 1977    NA     7.6
    ## 351 1977    NA     7.4
    ## 352 1977    NA     7.2
    ## 353 1977    NA     7.0
    ## 354 1977    NA     7.2
    ## 355 1977    NA     6.9
    ## 356 1977    NA     7.0
    ## 357 1977    NA     6.8
    ## 358 1977    NA     6.8
    ## 359 1977    NA     6.8
    ## 360 1977    NA     6.4
    ## 361 1978    NA     6.4
    ## 362 1978    NA     6.3
    ## 363 1978    NA     6.3
    ## 364 1978    NA     6.1
    ## 365 1978    NA     6.0
    ## 366 1978    NA     5.9
    ## 367 1978    NA     6.2
    ## 368 1978    NA     5.9
    ## 369 1978    NA     6.0
    ## 370 1978    NA     5.8
    ## 371 1978    NA     5.9
    ## 372 1978    NA     6.0
    ## 373 1979    NA     5.9
    ## 374 1979    NA     5.9
    ## 375 1979    NA     5.8
    ## 376 1979    NA     5.8
    ## 377 1979    NA     5.6
    ## 378 1979    NA     5.7
    ## 379 1979    NA     5.7
    ## 380 1979    NA     6.0
    ## 381 1979    NA     5.9
    ## 382 1979    NA     6.0
    ## 383 1979    NA     5.9
    ## 384 1979    NA     6.0
    ## 385 1980    NA     6.3
    ## 386 1980    NA     6.3
    ## 387 1980    NA     6.3
    ## 388 1980    NA     6.9
    ## 389 1980    NA     7.5
    ## 390 1980    NA     7.6
    ## 391 1980    NA     7.8
    ## 392 1980    NA     7.7
    ## 393 1980    NA     7.5
    ## 394 1980    NA     7.5
    ## 395 1980    NA     7.5
    ## 396 1980    NA     7.2
    ## 397 1981    NA     7.5
    ## 398 1981    NA     7.4
    ## 399 1981    NA     7.4
    ## 400 1981    NA     7.2
    ## 401 1981    NA     7.5
    ## 402 1981    NA     7.5
    ## 403 1981    NA     7.2
    ## 404 1981    NA     7.4
    ## 405 1981    NA     7.6
    ## 406 1981    NA     7.9
    ## 407 1981    NA     8.3
    ## 408 1981    NA     8.5
    ## 409 1982    NA     8.6
    ## 410 1982    NA     8.9
    ## 411 1982    NA     9.0
    ## 412 1982    NA     9.3
    ## 413 1982    NA     9.4
    ## 414 1982    NA     9.6
    ## 415 1982    NA     9.8
    ## 416 1982    NA     9.8
    ## 417 1982    NA    10.1
    ## 418 1982    NA    10.4
    ## 419 1982    NA    10.8
    ## 420 1982    NA    10.8
    ## 421 1983    NA    10.4
    ## 422 1983    NA    10.4
    ## 423 1983    NA    10.3
    ## 424 1983    NA    10.2
    ## 425 1983    NA    10.1
    ## 426 1983    NA    10.1
    ## 427 1983    NA     9.4
    ## 428 1983    NA     9.5
    ## 429 1983    NA     9.2
    ## 430 1983    NA     8.8
    ## 431 1983    NA     8.5
    ## 432 1983    NA     8.3
    ## 433 1984    NA     8.0
    ## 434 1984    NA     7.8
    ## 435 1984    NA     7.8
    ## 436 1984    NA     7.7
    ## 437 1984    NA     7.4
    ## 438 1984    NA     7.2
    ## 439 1984    NA     7.5
    ## 440 1984    NA     7.5
    ## 441 1984    NA     7.3
    ## 442 1984    NA     7.4
    ## 443 1984    NA     7.2
    ## 444 1984    NA     7.3
    ## 445 1985    NA     7.3
    ## 446 1985    NA     7.2
    ## 447 1985    NA     7.2
    ## 448 1985    NA     7.3
    ## 449 1985    NA     7.2
    ## 450 1985    NA     7.4
    ## 451 1985    NA     7.4
    ## 452 1985    NA     7.1
    ## 453 1985    NA     7.1
    ## 454 1985    NA     7.1
    ## 455 1985    NA     7.0
    ## 456 1985    NA     7.0
    ## 457 1986    NA     6.7
    ## 458 1986    NA     7.2
    ## 459 1986    NA     7.2
    ## 460 1986    NA     7.1
    ## 461 1986    NA     7.2
    ## 462 1986    NA     7.2
    ## 463 1986    NA     7.0
    ## 464 1986    NA     6.9
    ## 465 1986    NA     7.0
    ## 466 1986    NA     7.0
    ## 467 1986    NA     6.9
    ## 468 1986    NA     6.6
    ## 469 1987    NA     6.6
    ## 470 1987    NA     6.6
    ## 471 1987    NA     6.6
    ## 472 1987    NA     6.3
    ## 473 1987    NA     6.3
    ## 474 1987    NA     6.2
    ## 475 1987    NA     6.1
    ## 476 1987    NA     6.0
    ## 477 1987    NA     5.9
    ## 478 1987    NA     6.0
    ## 479 1987    NA     5.8
    ## 480 1987    NA     5.7
    ## 481 1988    NA     5.7
    ## 482 1988    NA     5.7
    ## 483 1988    NA     5.7
    ## 484 1988    NA     5.4
    ## 485 1988    NA     5.6
    ## 486 1988    NA     5.4
    ## 487 1988    NA     5.4
    ## 488 1988    NA     5.6
    ## 489 1988    NA     5.4
    ## 490 1988    NA     5.4
    ## 491 1988    NA     5.3
    ## 492 1988    NA     5.3
    ## 493 1989    NA     5.4
    ## 494 1989    NA     5.2
    ## 495 1989    NA     5.0
    ## 496 1989    NA     5.2
    ## 497 1989    NA     5.2
    ## 498 1989    NA     5.3
    ## 499 1989    NA     5.2
    ## 500 1989    NA     5.2
    ## 501 1989    NA     5.3
    ## 502 1989    NA     5.3
    ## 503 1989    NA     5.4
    ## 504 1989    NA     5.4
    ## 505 1990    NA     5.4
    ## 506 1990    NA     5.3
    ## 507 1990    NA     5.2
    ## 508 1990    NA     5.4
    ## 509 1990    NA     5.4
    ## 510 1990    NA     5.2
    ## 511 1990    NA     5.5
    ## 512 1990    NA     5.7
    ## 513 1990    NA     5.9
    ## 514 1990    NA     5.9
    ## 515 1990    NA     6.2
    ## 516 1990    NA     6.3
    ## 517 1991    NA     6.4
    ## 518 1991    NA     6.6
    ## 519 1991    NA     6.8
    ## 520 1991    NA     6.7
    ## 521 1991    NA     6.9
    ## 522 1991    NA     6.9
    ## 523 1991    NA     6.8
    ## 524 1991    NA     6.9
    ## 525 1991    NA     6.9
    ## 526 1991    NA     7.0
    ## 527 1991    NA     7.0
    ## 528 1991    NA     7.3
    ## 529 1992    NA     7.3
    ## 530 1992    NA     7.4
    ## 531 1992    NA     7.4
    ## 532 1992    NA     7.4
    ## 533 1992    NA     7.6
    ## 534 1992    NA     7.8
    ## 535 1992    NA     7.7
    ## 536 1992    NA     7.6
    ## 537 1992    NA     7.6
    ## 538 1992    NA     7.3
    ## 539 1992    NA     7.4
    ## 540 1992    NA     7.4
    ## 541 1993    NA     7.3
    ## 542 1993    NA     7.1
    ## 543 1993    NA     7.0
    ## 544 1993    NA     7.1
    ## 545 1993    NA     7.1
    ## 546 1993    NA     7.0
    ## 547 1993    NA     6.9
    ## 548 1993    NA     6.8
    ## 549 1993    NA     6.7
    ## 550 1993    NA     6.8
    ## 551 1993    NA     6.6
    ## 552 1993    NA     6.5
    ## 553 1994    NA     6.6
    ## 554 1994    NA     6.6
    ## 555 1994    NA     6.5
    ## 556 1994    NA     6.4
    ## 557 1994    NA     6.1
    ## 558 1994    NA     6.1
    ## 559 1994    NA     6.1
    ## 560 1994    NA     6.0
    ## 561 1994    NA     5.9
    ## 562 1994    NA     5.8
    ## 563 1994    NA     5.6
    ## 564 1994    NA     5.5
    ## 565 1995    NA     5.6
    ## 566 1995    NA     5.4
    ## 567 1995    NA     5.4
    ## 568 1995    NA     5.8
    ## 569 1995    NA     5.6
    ## 570 1995    NA     5.6
    ## 571 1995    NA     5.7
    ## 572 1995    NA     5.7
    ## 573 1995    NA     5.6
    ## 574 1995    NA     5.5
    ## 575 1995    NA     5.6
    ## 576 1995    NA     5.6
    ## 577 1996    NA     5.6
    ## 578 1996    NA     5.5
    ## 579 1996    NA     5.5
    ## 580 1996    NA     5.6
    ## 581 1996    NA     5.6
    ## 582 1996    NA     5.3
    ## 583 1996    NA     5.5
    ## 584 1996    NA     5.1
    ## 585 1996    NA     5.2
    ## 586 1996    NA     5.2
    ## 587 1996    NA     5.4
    ## 588 1996    NA     5.4
    ## 589 1997    NA     5.3
    ## 590 1997    NA     5.2
    ## 591 1997    NA     5.2
    ## 592 1997    NA     5.1
    ## 593 1997    NA     4.9
    ## 594 1997    NA     5.0
    ## 595 1997    NA     4.9
    ## 596 1997    NA     4.8
    ## 597 1997    NA     4.9
    ## 598 1997    NA     4.7
    ## 599 1997    NA     4.6
    ## 600 1997    NA     4.7
    ## 601 1998    NA     4.6
    ## 602 1998    NA     4.6
    ## 603 1998    NA     4.7
    ## 604 1998    NA     4.3
    ## 605 1998    NA     4.4
    ## 606 1998    NA     4.5
    ## 607 1998    NA     4.5
    ## 608 1998    NA     4.5
    ## 609 1998    NA     4.6
    ## 610 1998    NA     4.5
    ## 611 1998    NA     4.4
    ## 612 1998    NA     4.4
    ## 613 1999    NA     4.3
    ## 614 1999    NA     4.4
    ## 615 1999    NA     4.2
    ## 616 1999    NA     4.3
    ## 617 1999    NA     4.2
    ## 618 1999    NA     4.3
    ## 619 1999    NA     4.3
    ## 620 1999    NA     4.2
    ## 621 1999    NA     4.2
    ## 622 1999    NA     4.1
    ## 623 1999    NA     4.1
    ## 624 1999    NA     4.0
    ## 625 2000    NA     4.0
    ## 626 2000    NA     4.1
    ## 627 2000    NA     4.0
    ## 628 2000    NA     3.8
    ## 629 2000    NA     4.0
    ## 630 2000    NA     4.0
    ## 631 2000    NA     4.0
    ## 632 2000    NA     4.1
    ## 633 2000    NA     3.9
    ## 634 2000    NA     3.9
    ## 635 2000    NA     3.9
    ## 636 2000    NA     3.9
    ## 637 2001    NA     4.2
    ## 638 2001    NA     4.2
    ## 639 2001    NA     4.3
    ## 640 2001    NA     4.4
    ## 641 2001    NA     4.3
    ## 642 2001    NA     4.5
    ## 643 2001    NA     4.6
    ## 644 2001    NA     4.9
    ## 645 2001    NA     5.0
    ## 646 2001    NA     5.3
    ## 647 2001    NA     5.5
    ## 648 2001    NA     5.7
    ## 649 2002    NA     5.7
    ## 650 2002    NA     5.7
    ## 651 2002    NA     5.7
    ## 652 2002    NA     5.9
    ## 653 2002    NA     5.8
    ## 654 2002    NA     5.8
    ## 655 2002    NA     5.8
    ## 656 2002    NA     5.7
    ## 657 2002    NA     5.7
    ## 658 2002    NA     5.7
    ## 659 2002    NA     5.9
    ## 660 2002    NA     6.0
    ## 661 2003    NA     5.8
    ## 662 2003    NA     5.9
    ## 663 2003    NA     5.9
    ## 664 2003    NA     6.0
    ## 665 2003    NA     6.1
    ## 666 2003    NA     6.3
    ## 667 2003    NA     6.2
    ## 668 2003    NA     6.1
    ## 669 2003    NA     6.1
    ## 670 2003    NA     6.0
    ## 671 2003    NA     5.8
    ## 672 2003    NA     5.7
    ## 673 2004    NA     5.7
    ## 674 2004    NA     5.6
    ## 675 2004    NA     5.8
    ## 676 2004    NA     5.6
    ## 677 2004    NA     5.6
    ## 678 2004    NA     5.6
    ## 679 2004    NA     5.5
    ## 680 2004    NA     5.4
    ## 681 2004    NA     5.4
    ## 682 2004    NA     5.5
    ## 683 2004    NA     5.4
    ## 684 2004    NA     5.4
    ## 685 2005    NA     5.3
    ## 686 2005    NA     5.4
    ## 687 2005    NA     5.2
    ## 688 2005    NA     5.2
    ## 689 2005    NA     5.1
    ## 690 2005    NA     5.0
    ## 691 2005    NA     5.0
    ## 692 2005    NA     4.9
    ## 693 2005    NA     5.0
    ## 694 2005    NA     5.0
    ## 695 2005    NA     5.0
    ## 696 2005    NA     4.9
    ## 697 2006    NA     4.7
    ## 698 2006    NA     4.8
    ## 699 2006    NA     4.7
    ## 700 2006    NA     4.7
    ## 701 2006    NA     4.6
    ## 702 2006    NA     4.6
    ## 703 2006    NA     4.7
    ## 704 2006    NA     4.7
    ## 705 2006    NA     4.5
    ## 706 2006    NA     4.4
    ## 707 2006    NA     4.5
    ## 708 2006    NA     4.4
    ## 709 2007    NA     4.6
    ## 710 2007    NA     4.5
    ## 711 2007    NA     4.4
    ## 712 2007    NA     4.5
    ## 713 2007    NA     4.4
    ## 714 2007    NA     4.6
    ## 715 2007    NA     4.7
    ## 716 2007    NA     4.6
    ## 717 2007    NA     4.7
    ## 718 2007    NA     4.7
    ## 719 2007    NA     4.7
    ## 720 2007    NA     5.0
    ## 721 2008    NA     5.0
    ## 722 2008    NA     4.9
    ## 723 2008    NA     5.1
    ## 724 2008    NA     5.0
    ## 725 2008    NA     5.4
    ## 726 2008    NA     5.6
    ## 727 2008    NA     5.8
    ## 728 2008    NA     6.1
    ## 729 2008    NA     6.1
    ## 730 2008    NA     6.5
    ## 731 2008    NA     6.8
    ## 732 2008    NA     7.3
    ## 733 2009    NA     7.8
    ## 734 2009    NA     8.3
    ## 735 2009    NA     8.7
    ## 736 2009    NA     9.0
    ## 737 2009    NA     9.4
    ## 738 2009    NA     9.5
    ## 739 2009    NA     9.5
    ## 740 2009    NA     9.6
    ## 741 2009    NA     9.8
    ## 742 2009    NA    10.0
    ## 743 2009    NA     9.9
    ## 744 2009    NA     9.9
    ## 745 2010    NA     9.8
    ## 746 2010    NA     9.8
    ## 747 2010    NA     9.9
    ## 748 2010    NA     9.9
    ## 749 2010    NA     9.6
    ## 750 2010    NA     9.4
    ## 751 2010    NA     9.4
    ## 752 2010    NA     9.5
    ## 753 2010    NA     9.5
    ## 754 2010    NA     9.4
    ## 755 2010    NA     9.8
    ## 756 2010    NA     9.3
    ## 757 2011    NA     9.2
    ## 758 2011    NA     9.0
    ## 759 2011    NA     9.0
    ## 760 2011    NA     9.1
    ## 761 2011    NA     9.0
    ## 762 2011    NA     9.1
    ## 763 2011    NA     9.0
    ## 764 2011    NA     9.0
    ## 765 2011    NA     9.0
    ## 766 2011    NA     8.8
    ## 767 2011    NA     8.6
    ## 768 2011    NA     8.5
    ## 769 2012    NA     8.3
    ## 770 2012    NA     8.3
    ## 771 2012    NA     8.2
    ## 772 2012    NA     8.2
    ## 773 2012    NA     8.2
    ## 774 2012    NA     8.2
    ## 775 2012    NA     8.2
    ## 776 2012    NA     8.0
    ## 777 2012    NA     7.8
    ## 778 2012    NA     7.8
    ## 779 2012    NA     7.7
    ## 780 2012    NA     7.9
    ## 781 2013    NA     8.0
    ## 782 2013    NA     7.7
    ## 783 2013    NA     7.5
    ## 784 2013    NA     7.6
    ## 785 2013    NA     7.5
    ## 786 2013    NA     7.5
    ## 787 2013    NA     7.3
    ## 788 2013    NA     7.2
    ## 789 2013    NA     7.2
    ## 790 2013    NA     7.2
    ## 791 2013    NA     7.0
    ## 792 2013    NA     6.7
    ## 793 2014    NA     6.6
    ## 794 2014    NA     6.7
    ## 795 2014    NA     6.6
    ## 796 2014    NA     6.2
    ## 797 2014    NA     6.3
    ## 798 2014    NA     6.1
    ## 799 2014    NA     6.2
    ## 800 2014    NA     6.1
    ## 801 2014    NA     5.9
    ## 802 2014    NA     5.7
    ## 803 2014    NA     5.8
    ## 804 2014    NA     5.6
    ## 805 2015    NA     5.7
    ## 806 2015    NA     5.5
    ## 807 2015    NA     5.5
    ## 808 2015    NA     5.4
    ## 809 2015    NA     5.5
    ## 810 2015    NA     5.3
    ## 811 2015    NA      NA
    ## 812 2015    NA      NA
    ## 813 2015    NA      NA
    ## 814 2015    NA      NA
    ## 815 2015    NA      NA
    ## 816 2015    NA      NA
