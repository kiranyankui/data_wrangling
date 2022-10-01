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

1.  The dataset contains 32 columns (variables) and rows (observations).

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
