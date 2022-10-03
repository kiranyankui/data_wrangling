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

### Dataset for pols-month.csv

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

i have loaded and cleaned the data in pols-month.csv, as well as
separated the column “mon” into “year”, “month” and day”. I also
converted the “month” variable into a numeric variable.

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
| character                                        | 1             |
| numeric                                          | 8             |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ |               |
| Group variables                                  | None          |

Data summary

**Variable type: character**

| skim_variable | n_missing | complete_rate | min | max | empty | n_unique | whitespace |
|:--------------|----------:|--------------:|----:|----:|------:|---------:|-----------:|
| year          |         0 |             1 |   4 |   4 |     0 |       69 |          0 |

**Variable type: numeric**

| skim_variable | n_missing | complete_rate |   mean |    sd |  p0 | p25 | p50 | p75 | p100 | hist  |
|:--------------|----------:|--------------:|-------:|------:|----:|----:|----:|----:|-----:|:------|
| month         |         0 |             1 |   6.48 |  3.45 |   1 |   3 |   6 |   9 |   12 | ▇▅▅▅▇ |
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

**last part on: This process will involve switching from “wide” to
“long” format; ensuring that key variables have the same name; and
ensuring that key variables take the same values**
