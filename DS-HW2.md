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
select(NYC_transit, line, station_name, station_latitude, station_longitude, route1, route2, route3, route4, route5, route6, route7, route8, route9, route10, route11, entry, vending, entrance_type, ada, ada_notes)
```

    ## # A tibble: 1,868 × 20
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
    ## # … with 1,858 more rows, 10 more variables: route7 <chr>, route8 <dbl>,
    ## #   route9 <dbl>, route10 <dbl>, route11 <dbl>, entry <chr>, vending <chr>,
    ## #   entrance_type <chr>, ada <lgl>, ada_notes <chr>, and abbreviated variable
    ## #   names ¹​station_name, ²​station_latitude, ³​station_longitude

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

It took a while but I figured it out.

## Description about the NYC_transit dataset

1.  The dataset contains 32 columns (variables) and 1868 rows
    (observations).

2.  The variables are as follows: division, line, station_name, routes,
    entrance type, entry, exit only, vending, staffing, staff hours, ADA
    notes, north south street, east west street, corner, station
    location, entrance location, ada, free crossover, station lattitude
    and longitude, and entrance lattitude and longitude.

3.  I read and clean the data; retain line, station, name, station
    latitude / longitude, routes served, entry, vending, entrance type,
    and ADA compliance. Convert the entry variable from character (YES
    vs NO) to a logical variable

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

NYC_transit_tidy_data = pivot_longer( NYC_transit, route1:route11,
names_to = “route_name”, values_to = “rout_number”)

**Is the above code right?**

## Problem 2

We want to read and clean the Mr Trash Wheel dataset from the excel
file.

``` r
Mr_Trash_df = read_excel("./data/Trash-Wheel-Collection-Totals-7-2020-2.xlsx", "Mr. Trash Wheel") %>% 
  janitor::clean_names() %>% 
  select(-x15, -x16, -x17) %>% 
  drop_na(dumpster) %>% 
  transform(sports_balls = as.integer(sports_balls)) %>% 
  dplyr::mutate(ID = row_number())
```

    ## New names:
    ## • `` -> `...15`
    ## • `` -> `...16`
    ## • `` -> `...17`

**what does it mean by specify the sheet in the Excel file and to omit
non-data entries (rows with notes / figures; columns containing notes)
using arguments in read_excel?**

I ensured the use of reasonable variable names. I have ommited rows that
do not include dumpster-specific data. I have rounded the number of
sports balls to the nearest integer and converted the result to an
integer variable. I created an ID column (variable) to faciliate the
merging of the two datasets.

``` r
Pf_Trash_df = read_excel("./data/Trash-Wheel-Collection-Totals-7-2020-2.xlsx", "Professor Trash Wheel") %>% 
  janitor::clean_names() %>% 
  drop_na(dumpster) %>% 
  transform(sports_balls = as.integer(sports_balls)) %>% 
  dplyr::mutate(ID = row_number())
```

I used a similar process to import, clean, and organize the data for
Professor Trash Wheel.

**What kind of variables must I create and which kind of join do you
want us to do? **

-   Inner: keeps data that appear in both x and y
-   Left: keeps data that appear in x
-   Right: keeps data that appear in y
-   Full: keeps data that appear in either x or y

## Problem 3

``` r
pols_month_df = read_csv("./data/pols-month.csv") %>% 
  janitor::clean_names() %>% 
  separate(mon, into = c("year", "month", "day"), sep = '-') %>% 
  transform(month = as.numeric(month))
```

    ## Rows: 822 Columns: 9
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## dbl  (8): prez_gop, gov_gop, sen_gop, rep_gop, prez_dem, gov_dem, sen_dem, r...
    ## date (1): mon
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

i have loaded and cleaned the data in pols-month.csv, as well as
separated the column “mon” into “year”, “month” and day”.

``` r
pols_month_df %>%
  mutate(month = month.name[month])
```

    ##     year     month day prez_gop gov_gop sen_gop rep_gop prez_dem gov_dem
    ## 1   1947   January  15        0      23      51     253        1      23
    ## 2   1947  February  15        0      23      51     253        1      23
    ## 3   1947     March  15        0      23      51     253        1      23
    ## 4   1947     April  15        0      23      51     253        1      23
    ## 5   1947       May  15        0      23      51     253        1      23
    ## 6   1947      June  15        0      23      51     253        1      23
    ## 7   1947      July  15        0      23      51     253        1      23
    ## 8   1947    August  15        0      23      51     253        1      23
    ## 9   1947 September  15        0      23      51     253        1      23
    ## 10  1947   October  15        0      23      51     253        1      23
    ## 11  1947  November  15        0      24      51     253        1      23
    ## 12  1947  December  15        0      24      51     253        1      23
    ## 13  1948   January  15        0      22      53     253        1      24
    ## 14  1948  February  15        0      22      53     253        1      24
    ## 15  1948     March  15        0      22      53     253        1      24
    ## 16  1948     April  15        0      22      53     253        1      24
    ## 17  1948       May  15        0      22      53     253        1      24
    ## 18  1948      June  15        0      22      53     253        1      24
    ## 19  1948      July  15        0      22      53     253        1      24
    ## 20  1948    August  15        0      22      53     253        1      24
    ## 21  1948 September  15        0      22      53     253        1      24
    ## 22  1948   October  15        0      22      53     253        1      24
    ## 23  1948  November  15        0      22      53     253        1      24
    ## 24  1948  December  15        0      22      53     253        1      24
    ## 25  1949   January  15        0      18      45     177        1      29
    ## 26  1949  February  15        0      18      45     177        1      29
    ## 27  1949     March  15        0      18      45     177        1      29
    ## 28  1949     April  15        0      18      45     177        1      29
    ## 29  1949       May  15        0      18      45     177        1      29
    ## 30  1949      June  15        0      18      45     177        1      29
    ## 31  1949      July  15        0      18      45     177        1      30
    ## 32  1949    August  15        0      18      45     177        1      30
    ## 33  1949 September  15        0      18      45     177        1      30
    ## 34  1949   October  15        0      18      45     177        1      30
    ## 35  1949  November  15        0      18      45     177        1      30
    ## 36  1949  December  15        0      18      45     177        1      30
    ## 37  1950   January  15        0      18      44     177        1      29
    ## 38  1950  February  15        0      18      44     177        1      29
    ## 39  1950     March  15        0      18      44     177        1      29
    ## 40  1950     April  15        0      18      44     177        1      29
    ## 41  1950       May  15        0      18      44     177        1      29
    ## 42  1950      June  15        0      18      44     177        1      29
    ## 43  1950      July  15        0      18      44     177        1      29
    ## 44  1950    August  15        0      18      44     177        1      29
    ## 45  1950 September  15        0      18      44     177        1      29
    ## 46  1950   October  15        0      18      44     177        1      29
    ## 47  1950  November  15        0      18      44     177        1      29
    ## 48  1950  December  15        0      18      44     177        1      29
    ## 49  1951   January  15        0      24      47     207        1      22
    ## 50  1951  February  15        0      24      47     207        1      22
    ## 51  1951     March  15        0      24      47     207        1      22
    ## 52  1951     April  15        0      24      47     207        1      22
    ## 53  1951       May  15        0      24      47     207        1      22
    ## 54  1951      June  15        0      24      47     207        1      22
    ## 55  1951      July  15        0      24      47     207        1      22
    ## 56  1951    August  15        0      24      47     207        1      22
    ## 57  1951 September  15        0      24      47     207        1      22
    ## 58  1951   October  15        0      25      47     207        1      22
    ## 59  1951  November  15        0      25      47     207        1      22
    ## 60  1951  December  15        0      25      47     207        1      22
    ## 61  1952   January  15        0      24      50     207        1      22
    ## 62  1952  February  15        0      24      50     207        1      22
    ## 63  1952     March  15        0      24      50     207        1      22
    ## 64  1952     April  15        0      24      50     207        1      22
    ## 65  1952       May  15        0      24      50     207        1      22
    ## 66  1952      June  15        0      24      50     207        1      22
    ## 67  1952      July  15        0      24      50     207        1      22
    ## 68  1952    August  15        0      24      50     207        1      22
    ## 69  1952 September  15        0      24      50     207        1      22
    ## 70  1952   October  15        0      24      50     207        1      22
    ## 71  1952  November  15        0      24      50     207        1      22
    ## 72  1952  December  15        0      24      50     207        1      22
    ## 73  1953   January  15        1      29      50     222        0      17
    ## 74  1953  February  15        1      29      50     222        0      17
    ## 75  1953     March  15        1      29      50     222        0      17
    ## 76  1953     April  15        1      29      50     222        0      17
    ## 77  1953       May  15        1      29      50     222        0      17
    ## 78  1953      June  15        1      29      50     222        0      17
    ## 79  1953      July  15        1      29      50     222        0      17
    ## 80  1953    August  15        1      29      50     222        0      17
    ## 81  1953 September  15        1      29      50     222        0      17
    ## 82  1953   October  15        1      30      50     222        0      18
    ## 83  1953  November  15        1      30      50     222        0      18
    ## 84  1953  December  15        1      30      50     222        0      18
    ## 85  1954   January  15        1      29      55     222        0      18
    ## 86  1954  February  15        1      29      55     222        0      18
    ## 87  1954     March  15        1      29      55     222        0      18
    ## 88  1954     April  15        1      29      55     222        0      18
    ## 89  1954       May  15        1      29      55     222        0      18
    ## 90  1954      June  15        1      29      55     222        0      18
    ## 91  1954      July  15        1      29      55     222        0      18
    ## 92  1954    August  15        1      29      55     222        0      18
    ## 93  1954 September  15        1      29      55     222        0      18
    ## 94  1954   October  15        1      29      55     222        0      18
    ## 95  1954  November  15        1      29      55     222        0      19
    ## 96  1954  December  15        1      29      55     222        0      19
    ## 97  1955   January  15        1      21      47     204        0      26
    ## 98  1955  February  15        1      21      47     204        0      26
    ## 99  1955     March  15        1      21      47     204        0      26
    ## 100 1955     April  15        1      21      47     204        0      26
    ## 101 1955       May  15        1      21      47     204        0      26
    ## 102 1955      June  15        1      21      47     204        0      26
    ## 103 1955      July  15        1      21      47     204        0      26
    ## 104 1955    August  15        1      21      47     204        0      26
    ## 105 1955 September  15        1      21      47     204        0      26
    ## 106 1955   October  15        1      21      47     204        0      26
    ## 107 1955  November  15        1      21      47     204        0      26
    ## 108 1955  December  15        1      21      47     204        0      26
    ## 109 1956   January  15        1      21      49     204        0      26
    ## 110 1956  February  15        1      21      49     204        0      26
    ## 111 1956     March  15        1      21      49     204        0      26
    ## 112 1956     April  15        1      21      49     204        0      26
    ## 113 1956       May  15        1      21      49     204        0      26
    ## 114 1956      June  15        1      21      49     204        0      26
    ## 115 1956      July  15        1      21      49     204        0      26
    ## 116 1956    August  15        1      21      49     204        0      26
    ## 117 1956 September  15        1      21      49     204        0      26
    ## 118 1956   October  15        1      21      49     204        0      26
    ## 119 1956  November  15        1      21      49     204        0      26
    ## 120 1956  December  15        1      21      49     204        0      26
    ## 121 1957   January  15        1      19      47     203        0      28
    ## 122 1957  February  15        1      19      47     203        0      28
    ## 123 1957     March  15        1      19      47     203        0      28
    ## 124 1957     April  15        1      19      47     203        0      28
    ## 125 1957       May  15        1      19      47     203        0      28
    ## 126 1957      June  15        1      19      47     203        0      28
    ## 127 1957      July  15        1      19      47     203        0      28
    ## 128 1957    August  15        1      19      47     203        0      28
    ## 129 1957 September  15        1      20      47     203        0      28
    ## 130 1957   October  15        1      20      47     203        0      28
    ## 131 1957  November  15        1      20      47     203        0      28
    ## 132 1957  December  15        1      20      47     203        0      28
    ## 133 1958   January  15        1      20      47     203        0      28
    ## 134 1958  February  15        1      20      47     203        0      28
    ## 135 1958     March  15        1      20      47     203        0      28
    ## 136 1958     April  15        1      20      47     203        0      28
    ## 137 1958       May  15        1      20      47     203        0      28
    ## 138 1958      June  15        1      20      47     203        0      28
    ## 139 1958      July  15        1      20      47     203        0      28
    ## 140 1958    August  15        1      20      47     203        0      28
    ## 141 1958 September  15        1      20      47     203        0      28
    ## 142 1958   October  15        1      20      47     203        0      28
    ## 143 1958  November  15        1      20      47     203        0      28
    ## 144 1958  December  15        1      20      47     203        0      28
    ## 145 1959   January  15        1      15      35     159        0      35
    ## 146 1959  February  15        1      15      35     159        0      35
    ## 147 1959     March  15        1      15      35     159        0      35
    ## 148 1959     April  15        1      15      35     159        0      35
    ## 149 1959       May  15        1      15      35     159        0      35
    ## 150 1959      June  15        1      15      35     159        0      35
    ## 151 1959      July  15        1      15      35     159        0      35
    ## 152 1959    August  15        1      15      35     159        0      35
    ## 153 1959 September  15        1      15      35     159        0      35
    ## 154 1959   October  15        1      15      35     159        0      35
    ## 155 1959  November  15        1      15      35     159        0      35
    ## 156 1959  December  15        1      15      35     159        0      35
    ## 157 1960   January  15        1      16      35     159        0      34
    ## 158 1960  February  15        1      16      35     159        0      34
    ## 159 1960     March  15        1      16      35     159        0      34
    ## 160 1960     April  15        1      16      35     159        0      34
    ## 161 1960       May  15        1      16      35     159        0      34
    ## 162 1960      June  15        1      16      35     159        0      34
    ## 163 1960      July  15        1      16      35     159        0      34
    ## 164 1960    August  15        1      16      35     159        0      34
    ## 165 1960 September  15        1      17      35     159        0      34
    ## 166 1960   October  15        1      17      35     159        0      34
    ## 167 1960  November  15        1      17      35     159        0      34
    ## 168 1960  December  15        1      17      35     159        0      34
    ## 169 1961   January  15        0      16      37     176        1      34
    ## 170 1961  February  15        0      16      37     176        1      34
    ## 171 1961     March  15        0      16      37     176        1      34
    ## 172 1961     April  15        0      16      37     176        1      34
    ## 173 1961       May  15        0      16      37     176        1      34
    ## 174 1961      June  15        0      16      37     176        1      34
    ## 175 1961      July  15        0      16      37     176        1      34
    ## 176 1961    August  15        0      16      37     176        1      34
    ## 177 1961 September  15        0      16      37     176        1      34
    ## 178 1961   October  15        0      16      37     176        1      34
    ## 179 1961  November  15        0      16      37     176        1      34
    ## 180 1961  December  15        0      16      37     176        1      34
    ## 181 1962   January  15        0      16      42     176        1      34
    ## 182 1962  February  15        0      16      42     176        1      34
    ## 183 1962     March  15        0      16      42     176        1      34
    ## 184 1962     April  15        0      16      42     176        1      34
    ## 185 1962       May  15        0      16      42     176        1      34
    ## 186 1962      June  15        0      16      42     176        1      34
    ## 187 1962      July  15        0      16      42     176        1      34
    ## 188 1962    August  15        0      16      42     176        1      34
    ## 189 1962 September  15        0      16      42     176        1      34
    ## 190 1962   October  15        0      16      42     176        1      34
    ## 191 1962  November  15        0      16      42     176        1      34
    ## 192 1962  December  15        0      16      42     176        1      34
    ## 193 1963   January  15        0      17      34     182        1      33
    ## 194 1963  February  15        0      17      34     182        1      33
    ## 195 1963     March  15        0      16      34     182        1      34
    ## 196 1963     April  15        0      16      34     182        1      34
    ## 197 1963       May  15        0      16      34     182        1      34
    ## 198 1963      June  15        0      16      34     182        1      34
    ## 199 1963      July  15        0      16      34     182        1      34
    ## 200 1963    August  15        0      16      34     182        1      34
    ## 201 1963 September  15        0      16      34     182        1      34
    ## 202 1963   October  15        0      16      34     182        1      34
    ## 203 1963  November  15        0      16      34     182        1      34
    ## 204 1963  December  15        0      16      34     182        1      34
    ## 205 1964   January  15        0      16      34     182        1      34
    ## 206 1964  February  15        0      16      34     182        1      34
    ## 207 1964     March  15        0      16      34     182        1      34
    ## 208 1964     April  15        0      16      34     182        1      34
    ## 209 1964       May  15        0      16      34     182        1      34
    ## 210 1964      June  15        0      16      34     182        1      34
    ## 211 1964      July  15        0      16      34     182        1      34
    ## 212 1964    August  15        0      16      34     182        1      34
    ## 213 1964 September  15        0      16      34     182        1      34
    ## 214 1964   October  15        0      16      34     182        1      34
    ## 215 1964  November  15        0      16      34     182        1      34
    ## 216 1964  December  15        0      16      34     182        1      34
    ## 217 1965   January  15        0      17      32     141        1      33
    ## 218 1965  February  15        0      17      32     141        1      33
    ## 219 1965     March  15        0      17      32     141        1      33
    ## 220 1965     April  15        0      17      32     141        1      33
    ## 221 1965       May  15        0      17      32     141        1      33
    ## 222 1965      June  15        0      17      32     141        1      33
    ## 223 1965      July  15        0      17      32     141        1      33
    ## 224 1965    August  15        0      17      32     141        1      33
    ## 225 1965 September  15        0      17      32     141        1      33
    ## 226 1965   October  15        0      17      32     141        1      33
    ## 227 1965  November  15        0      17      32     141        1      33
    ## 228 1965  December  15        0      17      32     141        1      33
    ## 229 1966   January  15        0      18      33     141        1      33
    ## 230 1966  February  15        0      18      33     141        1      33
    ## 231 1966     March  15        0      18      33     141        1      33
    ## 232 1966     April  15        0      18      33     141        1      33
    ## 233 1966       May  15        0      18      33     141        1      33
    ## 234 1966      June  15        0      18      33     141        1      33
    ## 235 1966      July  15        0      18      33     141        1      33
    ## 236 1966    August  15        0      18      33     141        1      33
    ## 237 1966 September  15        0      18      33     141        1      33
    ## 238 1966   October  15        0      18      33     141        1      33
    ## 239 1966  November  15        0      18      33     141        1      33
    ## 240 1966  December  15        0      18      33     141        1      33
    ## 241 1967   January  15        0      25      36     188        1      27
    ## 242 1967  February  15        0      25      36     188        1      27
    ## 243 1967     March  15        0      25      36     188        1      27
    ## 244 1967     April  15        0      25      36     188        1      27
    ## 245 1967       May  15        0      25      36     188        1      27
    ## 246 1967      June  15        0      25      36     188        1      27
    ## 247 1967      July  15        0      25      36     188        1      27
    ## 248 1967    August  15        0      25      36     188        1      27
    ## 249 1967 September  15        0      25      36     188        1      27
    ## 250 1967   October  15        0      25      36     188        1      27
    ## 251 1967  November  15        0      25      36     188        1      27
    ## 252 1967  December  15        0      25      36     188        1      27
    ## 253 1968   January  15        0      26      39     188        1      26
    ## 254 1968  February  15        0      26      39     188        1      26
    ## 255 1968     March  15        0      26      39     188        1      26
    ## 256 1968     April  15        0      26      39     188        1      26
    ## 257 1968       May  15        0      26      39     188        1      26
    ## 258 1968      June  15        0      26      39     188        1      26
    ## 259 1968      July  15        0      26      39     188        1      26
    ## 260 1968    August  15        0      26      39     188        1      26
    ## 261 1968 September  15        0      26      39     188        1      26
    ## 262 1968   October  15        0      26      39     188        1      26
    ## 263 1968  November  15        0      26      39     188        1      26
    ## 264 1968  December  15        0      26      39     188        1      26
    ## 265 1969   January  15        1      31      43     199        0      22
    ## 266 1969  February  15        1      31      43     199        0      22
    ## 267 1969     March  15        1      31      43     199        0      22
    ## 268 1969     April  15        1      31      43     199        0      22
    ## 269 1969       May  15        1      31      43     199        0      22
    ## 270 1969      June  15        1      31      43     199        0      22
    ## 271 1969      July  15        1      31      43     199        0      22
    ## 272 1969    August  15        1      31      43     199        0      22
    ## 273 1969 September  15        1      31      43     199        0      22
    ## 274 1969   October  15        1      31      43     199        0      22
    ## 275 1969  November  15        1      31      43     199        0      22
    ## 276 1969  December  15        1      31      43     199        0      22
    ## 277 1970   January  15        1      32      43     199        0      20
    ## 278 1970  February  15        1      32      43     199        0      20
    ## 279 1970     March  15        1      32      43     199        0      20
    ## 280 1970     April  15        1      32      43     199        0      20
    ## 281 1970       May  15        1      32      43     199        0      20
    ## 282 1970      June  15        1      32      43     199        0      20
    ## 283 1970      July  15        1      32      43     199        0      20
    ## 284 1970    August  15        1      32      43     199        0      20
    ## 285 1970 September  15        1      32      43     199        0      20
    ## 286 1970   October  15        1      32      43     199        0      20
    ## 287 1970  November  15        1      32      43     199        0      20
    ## 288 1970  December  15        1      32      43     199        0      20
    ## 289 1971   January  15        1      21      44     185        0      30
    ## 290 1971  February  15        1      21      44     185        0      30
    ## 291 1971     March  15        1      21      44     185        0      30
    ## 292 1971     April  15        1      21      44     185        0      30
    ## 293 1971       May  15        1      21      44     185        0      30
    ## 294 1971      June  15        1      21      44     185        0      30
    ## 295 1971      July  15        1      21      44     185        0      30
    ## 296 1971    August  15        1      21      44     185        0      30
    ## 297 1971 September  15        1      21      44     185        0      30
    ## 298 1971   October  15        1      21      44     185        0      30
    ## 299 1971  November  15        1      21      44     185        0      30
    ## 300 1971  December  15        1      21      44     185        0      30
    ## 301 1972   January  15        1      20      44     185        0      31
    ## 302 1972  February  15        1      20      44     185        0      31
    ## 303 1972     March  15        1      20      44     185        0      31
    ## 304 1972     April  15        1      20      44     185        0      31
    ## 305 1972       May  15        1      20      44     185        0      31
    ## 306 1972      June  15        1      20      44     185        0      31
    ## 307 1972      July  15        1      20      44     185        0      31
    ## 308 1972    August  15        1      20      44     185        0      31
    ## 309 1972 September  15        1      20      44     185        0      31
    ## 310 1972   October  15        1      20      44     185        0      31
    ## 311 1972  November  15        1      20      44     185        0      31
    ## 312 1972  December  15        1      20      44     185        0      31
    ## 313 1973   January  15        1      19      42     195        0      32
    ## 314 1973  February  15        1      19      42     195        0      32
    ## 315 1973     March  15        1      19      42     195        0      32
    ## 316 1973     April  15        1      19      42     195        0      32
    ## 317 1973       May  15        1      19      42     195        0      32
    ## 318 1973      June  15        1      19      42     195        0      32
    ## 319 1973      July  15        1      19      42     195        0      32
    ## 320 1973    August  15        1      20      42     195        0      32
    ## 321 1973 September  15        1      20      42     195        0      32
    ## 322 1973   October  15        1      20      42     195        0      32
    ## 323 1973  November  15        1      20      42     195        0      32
    ## 324 1973  December  15        1      20      42     195        0      32
    ## 325 1974   January  15        1      18      45     195        0      34
    ## 326 1974  February  15        1      18      45     195        0      34
    ## 327 1974     March  15        1      18      45     195        0      34
    ## 328 1974     April  15        1      18      45     195        0      34
    ## 329 1974       May  15        1      18      45     195        0      34
    ## 330 1974      June  15        1      18      45     195        0      34
    ## 331 1974      July  15        1      18      45     195        0      34
    ## 332 1974    August  15        2      18      45     195        0      34
    ## 333 1974 September  15        2      18      45     195        0      34
    ## 334 1974   October  15        2      18      45     195        0      34
    ## 335 1974  November  15        2      18      45     195        0      34
    ## 336 1974  December  15        2      18      45     195        0      34
    ## 337 1975   January  15        1      13      38     148        0      37
    ## 338 1975  February  15        1      13      38     148        0      37
    ## 339 1975     March  15        1      13      38     148        0      37
    ## 340 1975     April  15        1      13      38     148        0      37
    ## 341 1975       May  15        1      13      38     148        0      37
    ## 342 1975      June  15        1      13      38     148        0      37
    ## 343 1975      July  15        1      13      38     148        0      37
    ## 344 1975    August  15        1      13      38     148        0      37
    ## 345 1975 September  15        1      13      38     148        0      37
    ## 346 1975   October  15        1      13      38     148        0      37
    ## 347 1975  November  15        1      13      38     148        0      37
    ## 348 1975  December  15        1      13      38     148        0      37
    ## 349 1976   January  15        1      13      39     148        0      37
    ## 350 1976  February  15        1      13      39     148        0      37
    ## 351 1976     March  15        1      13      39     148        0      37
    ## 352 1976     April  15        1      13      39     148        0      37
    ## 353 1976       May  15        1      13      39     148        0      37
    ## 354 1976      June  15        1      13      39     148        0      37
    ## 355 1976      July  15        1      13      39     148        0      37
    ## 356 1976    August  15        1      13      39     148        0      37
    ## 357 1976 September  15        1      13      39     148        0      37
    ## 358 1976   October  15        1      13      39     148        0      37
    ## 359 1976  November  15        1      13      39     148        0      37
    ## 360 1976  December  15        1      13      39     148        0      37
    ## 361 1977   January  15        0      12      38     147        1      38
    ## 362 1977  February  15        0      12      38     147        1      38
    ## 363 1977     March  15        0      12      38     147        1      38
    ## 364 1977     April  15        0      12      38     147        1      38
    ## 365 1977       May  15        0      12      38     147        1      38
    ## 366 1977      June  15        0      12      38     147        1      39
    ## 367 1977      July  15        0      12      38     147        1      40
    ## 368 1977    August  15        0      12      38     147        1      40
    ## 369 1977 September  15        0      12      38     147        1      40
    ## 370 1977   October  15        0      12      38     147        1      40
    ## 371 1977  November  15        0      12      38     147        1      41
    ## 372 1977  December  15        0      12      38     147        1      41
    ## 373 1978   January  15        0      12      41     147        1      38
    ## 374 1978  February  15        0      12      41     147        1      38
    ## 375 1978     March  15        0      12      41     147        1      38
    ## 376 1978     April  15        0      12      41     147        1      38
    ## 377 1978       May  15        0      12      41     147        1      38
    ## 378 1978      June  15        0      12      41     147        1      38
    ## 379 1978      July  15        0      12      41     147        1      38
    ## 380 1978    August  15        0      12      41     147        1      39
    ## 381 1978 September  15        0      12      41     147        1      39
    ## 382 1978   October  15        0      12      41     147        1      39
    ## 383 1978  November  15        0      12      41     147        1      39
    ## 384 1978  December  15        0      12      41     147        1      39
    ## 385 1979   January  15        0      19      41     160        1      32
    ## 386 1979  February  15        0      19      41     160        1      32
    ## 387 1979     March  15        0      19      41     160        1      32
    ## 388 1979     April  15        0      19      41     160        1      32
    ## 389 1979       May  15        0      19      41     160        1      32
    ## 390 1979      June  15        0      19      41     160        1      32
    ## 391 1979      July  15        0      19      41     160        1      32
    ## 392 1979    August  15        0      19      41     160        1      32
    ## 393 1979 September  15        0      19      41     160        1      32
    ## 394 1979   October  15        0      19      41     160        1      32
    ## 395 1979  November  15        0      19      41     160        1      32
    ## 396 1979  December  15        0      19      41     160        1      32
    ## 397 1980   January  15        0      19      42     160        1      32
    ## 398 1980  February  15        0      19      42     160        1      32
    ## 399 1980     March  15        0      20      42     160        1      31
    ## 400 1980     April  15        0      20      42     160        1      31
    ## 401 1980       May  15        0      20      42     160        1      31
    ## 402 1980      June  15        0      20      42     160        1      31
    ## 403 1980      July  15        0      20      42     160        1      31
    ## 404 1980    August  15        0      20      42     160        1      31
    ## 405 1980 September  15        0      20      42     160        1      31
    ## 406 1980   October  15        0      20      42     160        1      31
    ## 407 1980  November  15        0      20      42     160        1      31
    ## 408 1980  December  15        0      20      42     160        1      31
    ## 409 1981   January  15        1      24      53     196        0      27
    ## 410 1981  February  15        1      24      53     196        0      27
    ## 411 1981     March  15        1      24      53     196        0      27
    ## 412 1981     April  15        1      24      53     196        0      27
    ## 413 1981       May  15        1      24      53     196        0      27
    ## 414 1981      June  15        1      24      53     196        0      27
    ## 415 1981      July  15        1      24      53     196        0      27
    ## 416 1981    August  15        1      24      53     196        0      27
    ## 417 1981 September  15        1      24      53     196        0      27
    ## 418 1981   October  15        1      24      53     196        0      27
    ## 419 1981  November  15        1      24      53     196        0      27
    ## 420 1981  December  15        1      24      53     196        0      27
    ## 421 1982   January  15        1      24      54     196        0      27
    ## 422 1982  February  15        1      24      54     196        0      27
    ## 423 1982     March  15        1      24      54     196        0      27
    ## 424 1982     April  15        1      24      54     196        0      27
    ## 425 1982       May  15        1      24      54     196        0      27
    ## 426 1982      June  15        1      24      54     196        0      27
    ## 427 1982      July  15        1      24      54     196        0      27
    ## 428 1982    August  15        1      24      54     196        0      27
    ## 429 1982 September  15        1      24      54     196        0      27
    ## 430 1982   October  15        1      24      54     196        0      27
    ## 431 1982  November  15        1      24      54     196        0      27
    ## 432 1982  December  15        1      24      54     196        0      27
    ## 433 1983   January  15        1      16      55     168        0      34
    ## 434 1983  February  15        1      16      55     168        0      34
    ## 435 1983     March  15        1      16      55     168        0      34
    ## 436 1983     April  15        1      16      55     168        0      34
    ## 437 1983       May  15        1      16      55     168        0      34
    ## 438 1983      June  15        1      16      55     168        0      34
    ## 439 1983      July  15        1      16      55     168        0      34
    ## 440 1983    August  15        1      16      55     168        0      34
    ## 441 1983 September  15        1      16      55     168        0      34
    ## 442 1983   October  15        1      16      55     168        0      34
    ## 443 1983  November  15        1      16      55     168        0      34
    ## 444 1983  December  15        1      16      55     168        0      34
    ## 445 1984   January  15        1      16      55     168        0      34
    ## 446 1984  February  15        1      16      55     168        0      34
    ## 447 1984     March  15        1      15      55     168        0      34
    ## 448 1984     April  15        1      15      55     168        0      34
    ## 449 1984       May  15        1      15      55     168        0      35
    ## 450 1984      June  15        1      15      55     168        0      35
    ## 451 1984      July  15        1      15      55     168        0      35
    ## 452 1984    August  15        1      15      55     168        0      35
    ## 453 1984 September  15        1      15      55     168        0      35
    ## 454 1984   October  15        1      15      55     168        0      35
    ## 455 1984  November  15        1      15      55     168        0      35
    ## 456 1984  December  15        1      15      55     168        0      35
    ## 457 1985   January  15        1      16      53     183        0      34
    ## 458 1985  February  15        1      16      53     183        0      34
    ## 459 1985     March  15        1      16      53     183        0      34
    ## 460 1985     April  15        1      16      53     183        0      34
    ## 461 1985       May  15        1      16      53     183        0      34
    ## 462 1985      June  15        1      16      53     183        0      34
    ## 463 1985      July  15        1      16      53     183        0      34
    ## 464 1985    August  15        1      16      53     183        0      34
    ## 465 1985 September  15        1      16      53     183        0      34
    ## 466 1985   October  15        1      16      53     183        0      34
    ## 467 1985  November  15        1      16      53     183        0      34
    ## 468 1985  December  15        1      16      53     183        0      34
    ## 469 1986   January  15        1      16      53     183        0      34
    ## 470 1986  February  15        1      16      53     183        0      34
    ## 471 1986     March  15        1      16      53     183        0      34
    ## 472 1986     April  15        1      16      53     183        0      34
    ## 473 1986       May  15        1      16      53     183        0      34
    ## 474 1986      June  15        1      16      53     183        0      34
    ## 475 1986      July  15        1      16      54     183        0      34
    ## 476 1986    August  15        1      16      54     183        0      34
    ## 477 1986 September  15        1      16      54     183        0      34
    ## 478 1986   October  15        1      16      54     183        0      34
    ## 479 1986  November  15        1      16      54     183        0      34
    ## 480 1986  December  15        1      16      54     183        0      34
    ## 481 1987   January  15        1      24      46     179        0      27
    ## 482 1987  February  15        1      24      46     179        0      27
    ## 483 1987     March  15        1      24      46     179        0      27
    ## 484 1987     April  15        1      24      46     179        0      27
    ## 485 1987       May  15        1      24      46     179        0      27
    ## 486 1987      June  15        1      24      46     179        0      27
    ## 487 1987      July  15        1      24      46     179        0      27
    ## 488 1987    August  15        1      24      46     179        0      27
    ## 489 1987 September  15        1      24      46     179        0      27
    ## 490 1987   October  15        1      24      46     179        0      27
    ## 491 1987  November  15        1      24      46     179        0      27
    ## 492 1987  December  15        1      24      46     179        0      27
    ## 493 1988   January  15        1      24      46     179        0      28
    ## 494 1988  February  15        1      24      46     179        0      28
    ## 495 1988     March  15        1      25      46     179        0      28
    ## 496 1988     April  15        1      24      46     179        0      28
    ## 497 1988       May  15        1      24      46     179        0      28
    ## 498 1988      June  15        1      24      46     179        0      28
    ## 499 1988      July  15        1      24      46     178        0      28
    ## 500 1988    August  15        1      24      46     178        0      28
    ## 501 1988 September  15        1      24      46     178        0      28
    ## 502 1988   October  15        1      24      46     178        0      28
    ## 503 1988  November  15        1      24      46     179        0      28
    ## 504 1988  December  15        1      24      46     179        0      28
    ## 505 1989   January  15        1      23      46     178        0      29
    ## 506 1989  February  15        1      23      46     178        0      29
    ## 507 1989     March  15        1      23      46     178        0      29
    ## 508 1989     April  15        1      23      46     178        0      29
    ## 509 1989       May  15        1      23      46     178        0      29
    ## 510 1989      June  15        1      23      46     178        0      29
    ## 511 1989      July  15        1      23      46     178        0      29
    ## 512 1989    August  15        1      23      46     178        0      29
    ## 513 1989 September  15        1      23      46     178        0      29
    ## 514 1989   October  15        1      23      46     178        0      29
    ## 515 1989  November  15        1      23      46     178        0      29
    ## 516 1989  December  15        1      23      46     178        0      29
    ## 517 1990   January  15        1      22      46     176        0      30
    ## 518 1990  February  15        1      22      46     176        0      30
    ## 519 1990     March  15        1      22      46     176        0      30
    ## 520 1990     April  15        1      22      46     176        0      30
    ## 521 1990       May  15        1      22      46     176        0      30
    ## 522 1990      June  15        1      22      46     176        0      30
    ## 523 1990      July  15        1      22      46     176        0      30
    ## 524 1990    August  15        1      22      46     176        0      30
    ## 525 1990 September  15        1      22      46     176        0      30
    ## 526 1990   October  15        1      22      46     176        0      30
    ## 527 1990  November  15        1      22      46     176        0      30
    ## 528 1990  December  15        1      22      46     176        0      30
    ## 529 1991   January  15        1      20      45     168        0      29
    ## 530 1991  February  15        1      20      45     168        0      29
    ## 531 1991     March  15        1      21      45     166        0      28
    ## 532 1991     April  15        1      21      45     166        0      28
    ## 533 1991       May  15        1      21      45     166        0      28
    ## 534 1991      June  15        1      21      45     166        0      28
    ## 535 1991      July  15        1      21      45     166        0      28
    ## 536 1991    August  15        1      21      45     166        0      29
    ## 537 1991 September  15        1      21      45     166        0      29
    ## 538 1991   October  15        1      21      45     166        0      29
    ## 539 1991  November  15        1      21      45     167        0      29
    ## 540 1991  December  15        1      21      45     167        0      29
    ## 541 1992   January  15        1      20      43     166        0      27
    ## 542 1992  February  15        1      20      43     166        0      27
    ## 543 1992     March  15        1      20      43     166        0      28
    ## 544 1992     April  15        1      20      43     166        0      28
    ## 545 1992       May  15        1      20      43     166        0      28
    ## 546 1992      June  15        1      20      43     166        0      28
    ## 547 1992      July  15        1      20      43     166        0      28
    ## 548 1992    August  15        1      20      43     166        0      28
    ## 549 1992 September  15        1      20      43     166        0      28
    ## 550 1992   October  15        1      20      43     166        0      28
    ## 551 1992  November  15        1      20      43     166        0      28
    ## 552 1992  December  15        1      20      43     166        0      28
    ## 553 1993   January  15        0      18      46     175        1      30
    ## 554 1993  February  15        0      18      46     175        1      30
    ## 555 1993     March  15        0      18      46     175        1      30
    ## 556 1993     April  15        0      18      46     175        1      30
    ## 557 1993       May  15        0      17      46     177        1      31
    ## 558 1993      June  15        0      17      46     178        1      31
    ## 559 1993      July  15        0      17      46     178        1      31
    ## 560 1993    August  15        0      17      46     178        1      31
    ## 561 1993 September  15        0      17      46     178        1      31
    ## 562 1993   October  15        0      17      46     178        1      31
    ## 563 1993  November  15        0      17      46     178        1      31
    ## 564 1993  December  15        0      17      46     178        1      31
    ## 565 1994   January  15        0      19      48     178        1      28
    ## 566 1994  February  15        0      19      48     178        1      28
    ## 567 1994     March  15        0      19      48     178        1      28
    ## 568 1994     April  15        0      19      48     178        1      28
    ## 569 1994       May  15        0      19      48     178        1      28
    ## 570 1994      June  15        0      19      48     178        1      28
    ## 571 1994      July  15        0      19      48     178        1      28
    ## 572 1994    August  15        0      19      48     178        1      28
    ## 573 1994 September  15        0      19      48     178        1      28
    ## 574 1994   October  15        0      19      48     178        1      28
    ## 575 1994  November  15        0      19      48     178        1      28
    ## 576 1994  December  15        0      19      48     178        1      28
    ## 577 1995   January  15        0      30      54     235        1      20
    ## 578 1995  February  15        0      30      54     235        1      20
    ## 579 1995     March  15        0      30      54     235        1      20
    ## 580 1995     April  15        0      30      54     235        1      20
    ## 581 1995       May  15        0      30      54     235        1      20
    ## 582 1995      June  15        0      30      54     235        1      20
    ## 583 1995      July  15        0      30      54     235        1      20
    ## 584 1995    August  15        0      30      54     235        1      20
    ## 585 1995 September  15        0      30      54     235        1      20
    ## 586 1995   October  15        0      30      54     235        1      20
    ## 587 1995  November  15        0      30      54     235        1      20
    ## 588 1995  December  15        0      30      54     235        1      20
    ## 589 1996   January  15        0      31      54     236        1      19
    ## 590 1996  February  15        0      31      54     236        1      19
    ## 591 1996     March  15        0      31      54     236        1      19
    ## 592 1996     April  15        0      31      54     236        1      19
    ## 593 1996       May  15        0      31      54     236        1      19
    ## 594 1996      June  15        0      31      54     236        1      19
    ## 595 1996      July  15        0      32      54     235        1      19
    ## 596 1996    August  15        0      32      54     235        1      19
    ## 597 1996 September  15        0      32      54     235        1      19
    ## 598 1996   October  15        0      32      54     235        1      19
    ## 599 1996  November  15        0      32      55     235        1      19
    ## 600 1996  December  15        0      32      55     235        1      19
    ## 601 1997   January  15        0      32      55     227        1      18
    ## 602 1997  February  15        0      32      55     227        1      18
    ## 603 1997     March  15        0      32      55     227        1      18
    ## 604 1997     April  15        0      32      55     227        1      18
    ## 605 1997       May  15        0      32      55     228        1      18
    ## 606 1997      June  15        0      32      55     228        1      18
    ## 607 1997      July  15        0      32      55     228        1      18
    ## 608 1997    August  15        0      33      55     228        1      18
    ## 609 1997 September  15        0      34      55     228        1      18
    ## 610 1997   October  15        0      34      55     228        1      18
    ## 611 1997  November  15        0      34      55     229        1      18
    ## 612 1997  December  15        0      34      55     229        1      18
    ## 613 1998   January  15        0      32      55     227        1      18
    ## 614 1998  February  15        0      32      55     227        1      18
    ## 615 1998     March  15        0      32      55     227        1      18
    ## 616 1998     April  15        0      32      55     227        1      18
    ## 617 1998       May  15        0      32      55     227        1      18
    ## 618 1998      June  15        0      32      55     227        1      18
    ## 619 1998      July  15        0      32      55     228        1      18
    ## 620 1998    August  15        0      32      55     228        1      18
    ## 621 1998 September  15        0      32      55     228        1      18
    ## 622 1998   October  15        0      32      55     228        1      18
    ## 623 1998  November  15        0      32      55     228        1      18
    ## 624 1998  December  15        0      32      55     228        1      18
    ## 625 1999   January  15        0      31      55     223        1      17
    ## 626 1999  February  15        0      31      55     223        1      17
    ## 627 1999     March  15        0      31      55     222        1      17
    ## 628 1999     April  15        0      31      55     222        1      17
    ## 629 1999       May  15        0      31      55     222        1      17
    ## 630 1999      June  15        0      31      55     223        1      17
    ## 631 1999      July  15        0      31      55     223        1      17
    ## 632 1999    August  15        0      31      55     223        1      17
    ## 633 1999 September  15        0      31      55     223        1      17
    ## 634 1999   October  15        0      31      55     223        1      17
    ## 635 1999  November  15        0      31      56     223        1      17
    ## 636 1999  December  15        0      31      56     223        1      17
    ## 637 2000   January  15        0      30      55     223        1      18
    ## 638 2000  February  15        0      30      55     223        1      18
    ## 639 2000     March  15        0      30      55     223        1      18
    ## 640 2000     April  15        0      30      55     223        1      18
    ## 641 2000       May  15        0      30      55     223        1      18
    ## 642 2000      June  15        0      30      55     223        1      18
    ## 643 2000      July  15        0      30      55     223        1      18
    ## 644 2000    August  15        0      30      55     223        1      18
    ## 645 2000 September  15        0      30      55     223        1      18
    ## 646 2000   October  15        0      30      55     223        1      18
    ## 647 2000  November  15        0      30      55     223        1      19
    ## 648 2000  December  15        0      30      55     223        1      19
    ## 649 2001   January  15        1      29      49     220        0      19
    ## 650 2001  February  15        1      29      49     220        0      19
    ## 651 2001     March  15        1      29      49     220        0      19
    ## 652 2001     April  15        1      29      49     220        0      19
    ## 653 2001       May  15        1      29      49     220        0      19
    ## 654 2001      June  15        1      29      49     221        0      19
    ## 655 2001      July  15        1      29      49     222        0      19
    ## 656 2001    August  15        1      29      49     222        0      19
    ## 657 2001 September  15        1      29      49     222        0      19
    ## 658 2001   October  15        1      30      49     222        0      19
    ## 659 2001  November  15        1      30      49     223        0      19
    ## 660 2001  December  15        1      30      49     223        0      19
    ## 661 2002   January  15        1      27      50     221        0      21
    ## 662 2002  February  15        1      27      50     221        0      21
    ## 663 2002     March  15        1      27      50     222        0      21
    ## 664 2002     April  15        1      27      50     222        0      21
    ## 665 2002       May  15        1      27      50     222        0      21
    ## 666 2002      June  15        1      27      50     222        0      21
    ## 667 2002      July  15        1      27      50     222        0      21
    ## 668 2002    August  15        1      27      50     222        0      21
    ## 669 2002 September  15        1      27      50     222        0      21
    ## 670 2002   October  15        1      27      50     222        0      21
    ## 671 2002  November  15        1      27      50     222        0      21
    ## 672 2002  December  15        1      27      50     222        0      21
    ## 673 2003   January  15        1      26      51     231        0      24
    ## 674 2003  February  15        1      26      51     231        0      24
    ## 675 2003     March  15        1      26      51     231        0      24
    ## 676 2003     April  15        1      26      51     231        0      24
    ## 677 2003       May  15        1      26      51     231        0      24
    ## 678 2003      June  15        1      26      51     231        0      24
    ## 679 2003      July  15        1      26      51     231        0      24
    ## 680 2003    August  15        1      26      51     231        0      24
    ## 681 2003 September  15        1      26      51     231        0      25
    ## 682 2003   October  15        1      26      51     231        0      25
    ## 683 2003  November  15        1      27      51     231        0      25
    ## 684 2003  December  15        1      27      51     231        0      25
    ## 685 2004   January  15        1      28      51     229        0      22
    ## 686 2004  February  15        1      28      51     229        0      22
    ## 687 2004     March  15        1      28      51     229        0      22
    ## 688 2004     April  15        1      28      51     229        0      22
    ## 689 2004       May  15        1      28      51     229        0      22
    ## 690 2004      June  15        1      28      51     229        0      22
    ## 691 2004      July  15        1      29      51     229        0      22
    ## 692 2004    August  15        1      29      51     229        0      22
    ## 693 2004 September  15        1      29      51     229        0      22
    ## 694 2004   October  15        1      29      51     229        0      22
    ## 695 2004  November  15        1      29      51     229        0      23
    ## 696 2004  December  15        1      29      51     229        0      23
    ## 697 2005   January  15        1      28      54     232        0      22
    ## 698 2005  February  15        1      28      54     232        0      22
    ## 699 2005     March  15        1      28      54     232        0      22
    ## 700 2005     April  15        1      28      54     232        0      22
    ## 701 2005       May  15        1      28      54     231        0      22
    ## 702 2005      June  15        1      28      54     231        0      22
    ## 703 2005      July  15        1      28      54     231        0      22
    ## 704 2005    August  15        1      28      54     231        0      22
    ## 705 2005 September  15        1      28      54     232        0      22
    ## 706 2005   October  15        1      28      54     232        0      22
    ## 707 2005  November  15        1      28      54     232        0      22
    ## 708 2005  December  15        1      28      54     232        0      22
    ## 709 2006   January  15        1      28      54     231        0      22
    ## 710 2006  February  15        1      28      54     231        0      22
    ## 711 2006     March  15        1      28      54     231        0      22
    ## 712 2006     April  15        1      28      54     231        0      22
    ## 713 2006       May  15        1      28      54     231        0      22
    ## 714 2006      June  15        1      28      54     231        0      22
    ## 715 2006      July  15        1      28      54     231        0      22
    ## 716 2006    August  15        1      28      54     231        0      22
    ## 717 2006 September  15        1      28      54     231        0      22
    ## 718 2006   October  15        1      28      54     231        0      22
    ## 719 2006  November  15        1      28      54     232        0      22
    ## 720 2006  December  15        1      28      54     232        0      22
    ## 721 2007   January  15        1      22      48     201        0      28
    ## 722 2007  February  15        1      22      48     201        0      28
    ## 723 2007     March  15        1      22      48     201        0      28
    ## 724 2007     April  15        1      22      48     201        0      28
    ## 725 2007       May  15        1      22      48     201        0      28
    ## 726 2007      June  15        1      22      47     201        0      28
    ## 727 2007      July  15        1      22      48     201        0      28
    ## 728 2007    August  15        1      22      48     202        0      28
    ## 729 2007 September  15        1      22      48     202        0      28
    ## 730 2007   October  15        1      22      48     202        0      28
    ## 731 2007  November  15        1      22      48     202        0      28
    ## 732 2007  December  15        1      22      48     202        0      28
    ## 733 2008   January  15        1      22      48     198        0      28
    ## 734 2008  February  15        1      22      48     198        0      28
    ## 735 2008     March  15        1      22      48     198        0      28
    ## 736 2008     April  15        1      22      48     198        0      28
    ## 737 2008       May  15        1      22      48     199        0      28
    ## 738 2008      June  15        1      22      48     199        0      28
    ## 739 2008      July  15        1      22      48     199        0      28
    ## 740 2008    August  15        1      22      48     199        0      28
    ## 741 2008 September  15        1      22      48     199        0      28
    ## 742 2008   October  15        1      22      48     199        0      28
    ## 743 2008  November  15        1      22      48     199        0      28
    ## 744 2008  December  15        1      22      48     199        0      28
    ## 745 2009   January  15        0      22      40     179        1      28
    ## 746 2009  February  15        0      22      40     179        1      28
    ## 747 2009     March  15        0      22      40     179        1      28
    ## 748 2009     April  15        0      22      40     179        1      28
    ## 749 2009       May  15        0      22      40     179        1      28
    ## 750 2009      June  15        0      22      40     179        1      28
    ## 751 2009      July  15        0      22      40     179        1      28
    ## 752 2009    August  15        0      24      40     179        1      28
    ## 753 2009 September  15        0      24      41     179        1      28
    ## 754 2009   October  15        0      24      41     179        1      28
    ## 755 2009  November  15        0      24      41     179        1      28
    ## 756 2009  December  15        0      24      41     179        1      28
    ## 757 2010   January  15        0      24      41     178        1      26
    ## 758 2010  February  15        0      24      41     178        1      26
    ## 759 2010     March  15        0      24      41     178        1      26
    ## 760 2010     April  15        0      24      41     177        1      26
    ## 761 2010       May  15        0      24      41     177        1      26
    ## 762 2010      June  15        0      24      41     178        1      26
    ## 763 2010      July  15        0      24      41     178        1      26
    ## 764 2010    August  15        0      24      41     178        1      26
    ## 765 2010 September  15        0      24      41     178        1      26
    ## 766 2010   October  15        0      24      41     178        1      26
    ## 767 2010  November  15        0      24      41     178        1      27
    ## 768 2010  December  15        0      24      41     178        1      27
    ## 769 2011   January  15        0      29      47     241        1      21
    ## 770 2011  February  15        0      29      47     241        1      21
    ## 771 2011     March  15        0      29      47     241        1      21
    ## 772 2011     April  15        0      29      47     241        1      21
    ## 773 2011       May  15        0      29      47     240        1      21
    ## 774 2011      June  15        0      29      47     240        1      21
    ## 775 2011      July  15        0      29      47     240        1      21
    ## 776 2011    August  15        0      29      47     240        1      21
    ## 777 2011 September  15        0      29      47     242        1      21
    ## 778 2011   October  15        0      29      47     242        1      21
    ## 779 2011  November  15        0      29      47     242        1      21
    ## 780 2011  December  15        0      29      47     242        1      21
    ## 781 2012   January  15        0      29      47     242        1      21
    ## 782 2012  February  15        0      29      47     242        1      21
    ## 783 2012     March  15        0      29      47     242        1      21
    ## 784 2012     April  15        0      29      47     242        1      21
    ## 785 2012       May  15        0      29      47     242        1      21
    ## 786 2012      June  15        0      29      47     242        1      21
    ## 787 2012      July  15        0      29      47     242        1      21
    ## 788 2012    August  15        0      29      47     242        1      21
    ## 789 2012 September  15        0      29      47     242        1      21
    ## 790 2012   October  15        0      29      47     242        1      21
    ## 791 2012  November  15        0      29      47     243        1      21
    ## 792 2012  December  15        0      29      47     243        1      21
    ## 793 2013   January  15        0      30      45     232        1      20
    ## 794 2013  February  15        0      30      45     232        1      20
    ## 795 2013     March  15        0      30      45     232        1      20
    ## 796 2013     April  15        0      30      45     232        1      20
    ## 797 2013       May  15        0      30      45     233        1      20
    ## 798 2013      June  15        0      30      46     234        1      20
    ## 799 2013      July  15        0      30      46     234        1      20
    ## 800 2013    August  15        0      30      46     234        1      20
    ## 801 2013 September  15        0      30      46     234        1      20
    ## 802 2013   October  15        0      30      46     234        1      20
    ## 803 2013  November  15        0      30      46     234        1      20
    ## 804 2013  December  15        0      30      46     234        1      20
    ## 805 2014   January  15        0      29      45     232        1      21
    ## 806 2014  February  15        0      29      45     232        1      21
    ## 807 2014     March  15        0      29      45     233        1      21
    ## 808 2014     April  15        0      29      45     233        1      21
    ## 809 2014       May  15        0      29      45     233        1      21
    ## 810 2014      June  15        0      29      45     233        1      21
    ## 811 2014      July  15        0      29      45     234        1      21
    ## 812 2014    August  15        0      29      45     234        1      21
    ## 813 2014 September  15        0      29      45     234        1      21
    ## 814 2014   October  15        0      29      45     234        1      21
    ## 815 2014  November  15        0      29      45     235        1      21
    ## 816 2014  December  15        0      29      45     235        1      21
    ## 817 2015   January  15        0      31      54     245        1      18
    ## 818 2015  February  15        0      31      54     245        1      18
    ## 819 2015     March  15        0      31      54     245        1      18
    ## 820 2015     April  15        0      31      54     244        1      18
    ## 821 2015       May  15        0      31      54     245        1      18
    ## 822 2015      June  15        0      31      54     246        1      18
    ##     sen_dem rep_dem
    ## 1        45     198
    ## 2        45     198
    ## 3        45     198
    ## 4        45     198
    ## 5        45     198
    ## 6        45     198
    ## 7        45     198
    ## 8        45     198
    ## 9        45     198
    ## 10       45     198
    ## 11       45     198
    ## 12       45     198
    ## 13       48     198
    ## 14       48     198
    ## 15       48     198
    ## 16       48     198
    ## 17       48     198
    ## 18       48     198
    ## 19       48     198
    ## 20       48     198
    ## 21       48     198
    ## 22       48     198
    ## 23       48     198
    ## 24       48     198
    ## 25       58     269
    ## 26       58     269
    ## 27       58     269
    ## 28       58     269
    ## 29       58     269
    ## 30       58     269
    ## 31       58     269
    ## 32       58     269
    ## 33       58     269
    ## 34       58     269
    ## 35       58     269
    ## 36       58     269
    ## 37       57     269
    ## 38       57     269
    ## 39       57     269
    ## 40       57     269
    ## 41       57     269
    ## 42       57     269
    ## 43       57     269
    ## 44       57     269
    ## 45       57     269
    ## 46       57     269
    ## 47       57     269
    ## 48       57     269
    ## 49       51     242
    ## 50       51     242
    ## 51       51     242
    ## 52       51     242
    ## 53       51     242
    ## 54       51     242
    ## 55       51     242
    ## 56       51     242
    ## 57       51     242
    ## 58       51     242
    ## 59       51     242
    ## 60       51     242
    ## 61       50     242
    ## 62       50     242
    ## 63       50     242
    ## 64       50     242
    ## 65       50     242
    ## 66       50     242
    ## 67       50     242
    ## 68       50     242
    ## 69       50     242
    ## 70       50     242
    ## 71       50     242
    ## 72       50     242
    ## 73       49     220
    ## 74       49     220
    ## 75       49     220
    ## 76       49     220
    ## 77       49     220
    ## 78       49     220
    ## 79       49     220
    ## 80       49     220
    ## 81       49     220
    ## 82       49     220
    ## 83       49     220
    ## 84       49     220
    ## 85       53     220
    ## 86       53     220
    ## 87       53     220
    ## 88       53     220
    ## 89       53     220
    ## 90       53     220
    ## 91       53     220
    ## 92       53     220
    ## 93       53     220
    ## 94       53     220
    ## 95       53     220
    ## 96       53     220
    ## 97       48     237
    ## 98       48     237
    ## 99       48     237
    ## 100      48     237
    ## 101      48     237
    ## 102      48     237
    ## 103      48     237
    ## 104      48     237
    ## 105      48     237
    ## 106      48     237
    ## 107      48     237
    ## 108      48     237
    ## 109      51     237
    ## 110      51     237
    ## 111      51     237
    ## 112      50     237
    ## 113      50     237
    ## 114      50     237
    ## 115      50     237
    ## 116      50     237
    ## 117      50     237
    ## 118      50     237
    ## 119      51     237
    ## 120      51     237
    ## 121      52     242
    ## 122      52     242
    ## 123      52     242
    ## 124      52     242
    ## 125      52     242
    ## 126      52     242
    ## 127      52     242
    ## 128      52     242
    ## 129      52     242
    ## 130      52     242
    ## 131      52     242
    ## 132      52     242
    ## 133      52     242
    ## 134      52     242
    ## 135      52     242
    ## 136      52     242
    ## 137      52     242
    ## 138      52     242
    ## 139      52     242
    ## 140      52     242
    ## 141      52     242
    ## 142      52     242
    ## 143      52     242
    ## 144      52     242
    ## 145      65     289
    ## 146      65     289
    ## 147      65     289
    ## 148      65     289
    ## 149      65     289
    ## 150      65     289
    ## 151      65     289
    ## 152      65     289
    ## 153      65     289
    ## 154      65     289
    ## 155      65     289
    ## 156      65     289
    ## 157      70     289
    ## 158      70     289
    ## 159      70     289
    ## 160      70     289
    ## 161      70     289
    ## 162      70     289
    ## 163      70     289
    ## 164      70     289
    ## 165      70     289
    ## 166      70     289
    ## 167      70     289
    ## 168      70     289
    ## 169      64     273
    ## 170      64     273
    ## 171      64     273
    ## 172      64     273
    ## 173      64     273
    ## 174      64     273
    ## 175      64     273
    ## 176      64     273
    ## 177      64     273
    ## 178      64     273
    ## 179      64     273
    ## 180      64     273
    ## 181      65     273
    ## 182      65     273
    ## 183      65     273
    ## 184      65     273
    ## 185      65     273
    ## 186      65     273
    ## 187      65     273
    ## 188      65     273
    ## 189      65     273
    ## 190      65     273
    ## 191      65     273
    ## 192      65     273
    ## 193      68     262
    ## 194      68     262
    ## 195      68     262
    ## 196      68     262
    ## 197      68     262
    ## 198      68     262
    ## 199      68     262
    ## 200      68     262
    ## 201      68     262
    ## 202      68     262
    ## 203      68     262
    ## 204      68     262
    ## 205      71     262
    ## 206      71     262
    ## 207      71     262
    ## 208      71     262
    ## 209      71     262
    ## 210      71     262
    ## 211      71     262
    ## 212      71     262
    ## 213      71     262
    ## 214      71     262
    ## 215      71     262
    ## 216      71     262
    ## 217      69     301
    ## 218      69     301
    ## 219      69     301
    ## 220      69     301
    ## 221      69     301
    ## 222      69     301
    ## 223      69     301
    ## 224      69     301
    ## 225      69     301
    ## 226      69     301
    ## 227      69     301
    ## 228      69     301
    ## 229      70     301
    ## 230      70     301
    ## 231      70     301
    ## 232      70     301
    ## 233      70     301
    ## 234      70     301
    ## 235      70     301
    ## 236      70     301
    ## 237      70     301
    ## 238      70     301
    ## 239      70     301
    ## 240      70     301
    ## 241      64     251
    ## 242      64     251
    ## 243      64     251
    ## 244      64     251
    ## 245      64     251
    ## 246      64     251
    ## 247      64     251
    ## 248      64     251
    ## 249      64     251
    ## 250      64     251
    ## 251      64     251
    ## 252      64     251
    ## 253      65     251
    ## 254      65     251
    ## 255      65     251
    ## 256      65     251
    ## 257      65     251
    ## 258      65     251
    ## 259      65     251
    ## 260      65     251
    ## 261      65     251
    ## 262      65     251
    ## 263      65     251
    ## 264      65     251
    ## 265      57     250
    ## 266      57     250
    ## 267      57     250
    ## 268      57     250
    ## 269      57     250
    ## 270      57     250
    ## 271      57     250
    ## 272      57     250
    ## 273      57     250
    ## 274      57     250
    ## 275      57     250
    ## 276      57     250
    ## 277      58     250
    ## 278      58     250
    ## 279      58     250
    ## 280      58     250
    ## 281      58     250
    ## 282      58     250
    ## 283      58     250
    ## 284      58     250
    ## 285      58     250
    ## 286      58     250
    ## 287      58     250
    ## 288      58     250
    ## 289      55     259
    ## 290      55     259
    ## 291      55     259
    ## 292      55     259
    ## 293      55     259
    ## 294      55     259
    ## 295      55     259
    ## 296      55     259
    ## 297      55     259
    ## 298      55     259
    ## 299      55     259
    ## 300      55     259
    ## 301      57     259
    ## 302      57     259
    ## 303      57     259
    ## 304      57     259
    ## 305      57     259
    ## 306      57     259
    ## 307      57     259
    ## 308      57     259
    ## 309      57     259
    ## 310      57     259
    ## 311      57     259
    ## 312      57     259
    ## 313      56     249
    ## 314      56     249
    ## 315      56     249
    ## 316      56     249
    ## 317      56     249
    ## 318      56     249
    ## 319      56     249
    ## 320      56     249
    ## 321      56     249
    ## 322      56     249
    ## 323      56     249
    ## 324      56     249
    ## 325      59     249
    ## 326      59     249
    ## 327      59     249
    ## 328      59     249
    ## 329      59     249
    ## 330      59     249
    ## 331      59     249
    ## 332      59     249
    ## 333      59     249
    ## 334      59     249
    ## 335      59     249
    ## 336      59     249
    ## 337      61     295
    ## 338      61     295
    ## 339      61     295
    ## 340      61     295
    ## 341      61     295
    ## 342      61     295
    ## 343      61     295
    ## 344      61     295
    ## 345      61     295
    ## 346      61     295
    ## 347      61     295
    ## 348      61     295
    ## 349      65     295
    ## 350      65     295
    ## 351      65     295
    ## 352      65     295
    ## 353      65     295
    ## 354      65     295
    ## 355      65     295
    ## 356      65     295
    ## 357      65     295
    ## 358      65     295
    ## 359      65     295
    ## 360      65     295
    ## 361      62     294
    ## 362      62     294
    ## 363      62     294
    ## 364      62     294
    ## 365      62     294
    ## 366      62     294
    ## 367      62     294
    ## 368      62     294
    ## 369      62     294
    ## 370      62     294
    ## 371      62     294
    ## 372      62     294
    ## 373      66     294
    ## 374      66     294
    ## 375      66     294
    ## 376      66     294
    ## 377      66     294
    ## 378      66     294
    ## 379      66     294
    ## 380      66     294
    ## 381      66     294
    ## 382      66     294
    ## 383      66     294
    ## 384      66     294
    ## 385      58     280
    ## 386      58     280
    ## 387      58     280
    ## 388      58     280
    ## 389      58     280
    ## 390      58     280
    ## 391      58     280
    ## 392      58     280
    ## 393      58     280
    ## 394      58     280
    ## 395      58     280
    ## 396      58     280
    ## 397      59     280
    ## 398      59     280
    ## 399      59     280
    ## 400      59     280
    ## 401      59     280
    ## 402      59     280
    ## 403      59     280
    ## 404      59     280
    ## 405      59     280
    ## 406      59     280
    ## 407      59     280
    ## 408      59     280
    ## 409      46     246
    ## 410      46     246
    ## 411      46     246
    ## 412      46     246
    ## 413      46     246
    ## 414      46     246
    ## 415      46     246
    ## 416      46     246
    ## 417      46     246
    ## 418      46     246
    ## 419      46     246
    ## 420      46     246
    ## 421      47     246
    ## 422      47     246
    ## 423      47     246
    ## 424      47     246
    ## 425      47     246
    ## 426      47     246
    ## 427      47     246
    ## 428      47     246
    ## 429      47     246
    ## 430      47     246
    ## 431      47     246
    ## 432      47     246
    ## 433      46     272
    ## 434      46     272
    ## 435      46     272
    ## 436      46     271
    ## 437      46     271
    ## 438      46     271
    ## 439      46     272
    ## 440      46     272
    ## 441      46     272
    ## 442      46     272
    ## 443      46     272
    ## 444      46     272
    ## 445      45     271
    ## 446      45     271
    ## 447      45     271
    ## 448      45     271
    ## 449      45     271
    ## 450      45     271
    ## 451      45     271
    ## 452      45     271
    ## 453      45     271
    ## 454      45     271
    ## 455      45     271
    ## 456      45     271
    ## 457      47     257
    ## 458      47     257
    ## 459      47     257
    ## 460      47     257
    ## 461      47     257
    ## 462      47     257
    ## 463      47     257
    ## 464      47     257
    ## 465      47     257
    ## 466      47     257
    ## 467      47     257
    ## 468      47     257
    ## 469      48     257
    ## 470      48     257
    ## 471      48     257
    ## 472      48     257
    ## 473      48     257
    ## 474      48     257
    ## 475      48     257
    ## 476      48     257
    ## 477      48     257
    ## 478      48     257
    ## 479      48     257
    ## 480      48     257
    ## 481      55     262
    ## 482      55     262
    ## 483      55     262
    ## 484      55     262
    ## 485      55     262
    ## 486      55     262
    ## 487      55     262
    ## 488      55     262
    ## 489      55     262
    ## 490      55     262
    ## 491      55     262
    ## 492      55     262
    ## 493      54     262
    ## 494      54     262
    ## 495      54     262
    ## 496      54     262
    ## 497      54     262
    ## 498      54     262
    ## 499      54     262
    ## 500      54     262
    ## 501      54     262
    ## 502      54     262
    ## 503      54     262
    ## 504      54     262
    ## 505      55     264
    ## 506      55     264
    ## 507      55     264
    ## 508      55     264
    ## 509      55     264
    ## 510      55     262
    ## 511      55     261
    ## 512      55     261
    ## 513      55     261
    ## 514      55     261
    ## 515      55     261
    ## 516      55     261
    ## 517      55     258
    ## 518      55     258
    ## 519      55     258
    ## 520      55     258
    ## 521      55     257
    ## 522      56     257
    ## 523      56     257
    ## 524      56     257
    ## 525      56     257
    ## 526      56     258
    ## 527      56     259
    ## 528      56     259
    ## 529      57     269
    ## 530      57     269
    ## 531      57     269
    ## 532      57     269
    ## 533      57     268
    ## 534      57     268
    ## 535      57     268
    ## 536      57     268
    ## 537      57     268
    ## 538      57     268
    ## 539      57     269
    ## 540      57     269
    ## 541      58     268
    ## 542      58     268
    ## 543      58     268
    ## 544      58     268
    ## 545      58     268
    ## 546      58     268
    ## 547      58     268
    ## 548      58     268
    ## 549      58     268
    ## 550      59     268
    ## 551      60     270
    ## 552      60     270
    ## 553      57     255
    ## 554      57     255
    ## 555      57     255
    ## 556      57     256
    ## 557      57     257
    ## 558      57     258
    ## 559      57     258
    ## 560      57     258
    ## 561      57     258
    ## 562      57     258
    ## 563      57     258
    ## 564      57     258
    ## 565      54     257
    ## 566      54     257
    ## 567      54     257
    ## 568      54     256
    ## 569      54     256
    ## 570      54     256
    ## 571      54     256
    ## 572      54     256
    ## 573      54     256
    ## 574      54     256
    ## 575      54     256
    ## 576      54     256
    ## 577      46     199
    ## 578      46     199
    ## 579      46     199
    ## 580      46     199
    ## 581      46     199
    ## 582      46     199
    ## 583      46     199
    ## 584      46     199
    ## 585      46     199
    ## 586      46     199
    ## 587      46     199
    ## 588      46     199
    ## 589      47     196
    ## 590      47     196
    ## 591      47     195
    ## 592      47     196
    ## 593      47     197
    ## 594      47     198
    ## 595      47     198
    ## 596      47     198
    ## 597      47     198
    ## 598      47     198
    ## 599      47     198
    ## 600      47     198
    ## 601      45     207
    ## 602      45     207
    ## 603      45     207
    ## 604      45     207
    ## 605      45     207
    ## 606      45     207
    ## 607      45     207
    ## 608      45     207
    ## 609      45     207
    ## 610      45     207
    ## 611      45     207
    ## 612      45     207
    ## 613      45     203
    ## 614      45     203
    ## 615      45     204
    ## 616      45     205
    ## 617      45     205
    ## 618      45     206
    ## 619      45     206
    ## 620      45     206
    ## 621      45     206
    ## 622      45     206
    ## 623      45     206
    ## 624      45     206
    ## 625      45     210
    ## 626      45     210
    ## 627      45     210
    ## 628      45     210
    ## 629      45     210
    ## 630      45     210
    ## 631      45     210
    ## 632      45     210
    ## 633      45     210
    ## 634      45     210
    ## 635      45     211
    ## 636      45     211
    ## 637      45     210
    ## 638      45     210
    ## 639      45     210
    ## 640      45     210
    ## 641      45     210
    ## 642      45     210
    ## 643      45     210
    ## 644      46     210
    ## 645      46     210
    ## 646      46     210
    ## 647      46     210
    ## 648      46     210
    ## 649      50     211
    ## 650      50     211
    ## 651      50     211
    ## 652      50     210
    ## 653      50     210
    ## 654      50     210
    ## 655      50     210
    ## 656      50     210
    ## 657      50     210
    ## 658      50     210
    ## 659      50     211
    ## 660      50     211
    ## 661      50     211
    ## 662      50     211
    ## 663      50     211
    ## 664      50     211
    ## 665      50     211
    ## 666      50     211
    ## 667      50     211
    ## 668      50     211
    ## 669      50     211
    ## 670      50     211
    ## 671      50     211
    ## 672      50     211
    ## 673      48     203
    ## 674      48     203
    ## 675      48     203
    ## 676      48     203
    ## 677      48     203
    ## 678      48     203
    ## 679      48     203
    ## 680      48     203
    ## 681      48     203
    ## 682      48     203
    ## 683      48     203
    ## 684      48     203
    ## 685      48     203
    ## 686      48     203
    ## 687      48     204
    ## 688      48     204
    ## 689      48     204
    ## 690      48     204
    ## 691      48     204
    ## 692      48     205
    ## 693      48     205
    ## 694      48     205
    ## 695      48     205
    ## 696      48     205
    ## 697      45     201
    ## 698      45     201
    ## 699      45     202
    ## 700      45     202
    ## 701      45     202
    ## 702      45     202
    ## 703      45     202
    ## 704      45     202
    ## 705      45     202
    ## 706      45     202
    ## 707      45     202
    ## 708      45     202
    ## 709      45     201
    ## 710      45     201
    ## 711      45     201
    ## 712      45     201
    ## 713      45     201
    ## 714      45     201
    ## 715      45     201
    ## 716      45     201
    ## 717      45     201
    ## 718      45     201
    ## 719      45     202
    ## 720      45     202
    ## 721      50     233
    ## 722      50     233
    ## 723      50     233
    ## 724      50     233
    ## 725      50     232
    ## 726      50     232
    ## 727      50     232
    ## 728      50     232
    ## 729      50     233
    ## 730      50     233
    ## 731      50     234
    ## 732      50     234
    ## 733      50     231
    ## 734      50     231
    ## 735      50     233
    ## 736      50     234
    ## 737      50     235
    ## 738      50     235
    ## 739      50     236
    ## 740      50     236
    ## 741      50     236
    ## 742      50     236
    ## 743      50     236
    ## 744      50     236
    ## 745      57     254
    ## 746      57     254
    ## 747      57     253
    ## 748      57     254
    ## 749      57     255
    ## 750      57     255
    ## 751      58     254
    ## 752      58     255
    ## 753      58     255
    ## 754      59     255
    ## 755      59     257
    ## 756      59     257
    ## 757      57     255
    ## 758      57     255
    ## 759      57     253
    ## 760      57     254
    ## 761      57     254
    ## 762      57     255
    ## 763      56     255
    ## 764      57     255
    ## 765      57     255
    ## 766      57     255
    ## 767      59     255
    ## 768      59     255
    ## 769      51     193
    ## 770      51     193
    ## 771      51     192
    ## 772      51     192
    ## 773      51     192
    ## 774      51     193
    ## 775      51     192
    ## 776      51     193
    ## 777      51     193
    ## 778      51     193
    ## 779      51     193
    ## 780      51     193
    ## 781      51     192
    ## 782      51     192
    ## 783      51     191
    ## 784      51     190
    ## 785      51     190
    ## 786      51     191
    ## 787      51     191
    ## 788      51     191
    ## 789      51     191
    ## 790      51     191
    ## 791      51     194
    ## 792      51     194
    ## 793      53     200
    ## 794      53     200
    ## 795      53     200
    ## 796      53     201
    ## 797      53     201
    ## 798      52     201
    ## 799      52     201
    ## 800      53     201
    ## 801      53     201
    ## 802      53     201
    ## 803      54     201
    ## 804      54     201
    ## 805      53     200
    ## 806      53     200
    ## 807      53     199
    ## 808      53     199
    ## 809      53     199
    ## 810      53     199
    ## 811      53     199
    ## 812      53     199
    ## 813      53     199
    ## 814      53     199
    ## 815      53     201
    ## 816      53     201
    ## 817      44     188
    ## 818      44     188
    ## 819      44     188
    ## 820      44     188
    ## 821      44     188
    ## 822      44     188

I replaced the month number with a month name.

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
| character                                        | 2             |
| numeric                                          | 9             |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ |               |
| Group variables                                  | None          |

Data summary

**Variable type: character**

| skim_variable | n_missing | complete_rate | min | max | empty | n_unique | whitespace |
|:--------------|----------:|--------------:|----:|----:|------:|---------:|-----------:|
| year          |         0 |             1 |   4 |   4 |     0 |       69 |          0 |
| day           |         0 |             1 |   2 |   2 |     0 |        1 |          0 |

**Variable type: numeric**

| skim_variable | n_missing | complete_rate |   mean |    sd |  p0 | p25 | p50 | p75 | p100 | hist  |
|:--------------|----------:|--------------:|-------:|------:|----:|----:|----:|----:|-----:|:------|
| month         |         0 |             1 |   6.48 |  3.45 |   1 |   3 |   6 |   9 |   12 | ▇▅▅▅▇ |
| prez_gop      |         0 |             1 |   0.53 |  0.51 |   0 |   0 |   1 |   1 |    2 | ▇▁▇▁▁ |
| gov_gop       |         0 |             1 |  22.48 |  5.68 |  12 |  18 |  22 |  28 |   34 | ▆▆▇▅▅ |
| sen_gop       |         0 |             1 |  46.10 |  6.38 |  32 |  42 |  46 |  51 |   56 | ▃▃▇▇▇ |
| rep_gop       |         0 |             1 | 194.92 | 29.24 | 141 | 176 | 195 | 222 |  253 | ▃▇▆▃▅ |
| prez_dem      |         0 |             1 |   0.47 |  0.50 |   0 |   0 |   0 |   1 |    1 | ▇▁▁▁▇ |
| gov_dem       |         0 |             1 |  27.20 |  5.94 |  17 |  22 |  28 |  32 |   41 | ▆▅▇▆▂ |
| sen_dem       |         0 |             1 |  54.41 |  7.37 |  44 |  48 |  53 |  58 |   71 | ▇▆▇▃▂ |
| rep_dem       |         0 |             1 | 244.97 | 31.37 | 188 | 211 | 250 | 268 |  301 | ▇▂▇▇▅ |

Checking the variables using skimr.

I also created a president variable taking values gop and dem, and
remove prez_dem and prez_gop; and remove the day variable.
