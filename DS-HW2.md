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
NYC_transit = read_csv("./data/NYC_Transit_Subway_Entrance_And_Exit_Data.csv")
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
NYC_transit = janitor::clean_names(NYC_transit)

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

We want to read and clean the Mr Trash Wheek dataset from the excel
file.

``` r
Trash_df = read_excel("./data/Trash-Wheel-Collection-Totals-7-2020-2.xlsx") %>% 
  janitor::clean_names() 
```

    ## New names:
    ## • `` -> `...15`
    ## • `` -> `...16`
    ## • `` -> `...17`

**what does it mean by specify the sheet in the Excel file and to omit
non-data entries (rows with notes / figures; columns containing notes)
using arguments in read_excel?**

``` r
skimr::skim(Trash_df)
```

|                                                  |          |
|:-------------------------------------------------|:---------|
| Name                                             | Trash_df |
| Number of rows                                   | 533      |
| Number of columns                                | 17       |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   |          |
| Column type frequency:                           |          |
| character                                        | 3        |
| logical                                          | 2        |
| numeric                                          | 11       |
| POSIXct                                          | 1        |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ |          |
| Group variables                                  | None     |

Data summary

**Variable type: character**

| skim_variable | n_missing | complete_rate | min | max | empty | n_unique | whitespace |
|:--------------|----------:|--------------:|----:|----:|------:|---------:|-----------:|
| dumpster      |        79 |          0.85 |   1 |  11 |     0 |      454 |          0 |
| month         |         1 |          1.00 |   3 |  15 |     0 |       29 |          0 |
| x15           |       515 |          0.03 |  35 |  35 |     0 |        1 |          0 |

**Variable type: logical**

| skim_variable | n_missing | complete_rate | mean | count |
|:--------------|----------:|--------------:|-----:|:------|
| x16           |       533 |             0 |  NaN | :     |
| x17           |       533 |             0 |  NaN | :     |

**Variable type: numeric**

| skim_variable      | n_missing | complete_rate |     mean |        sd |      p0 |     p25 |      p50 |      p75 |       p100 | hist  |
|:-------------------|----------:|--------------:|---------:|----------:|--------:|--------:|---------:|---------:|-----------:|:------|
| year               |        80 |          0.85 |  2017.26 |      1.95 | 2014.00 | 2015.00 |  2018.00 |  2019.00 |     2021.0 | ▆▃▇▃▃ |
| weight_tons        |         0 |          1.00 |     8.16 |     63.02 |    0.78 |    2.79 |     3.34 |     4.04 |     1449.7 | ▇▁▁▁▁ |
| volume_cubic_yards |         0 |          1.00 |    39.30 |    303.36 |    7.00 |   15.00 |    15.00 |    18.00 |     6982.0 | ▇▁▁▁▁ |
| plastic_bottles    |         0 |          1.00 |  4841.74 |  37361.65 |  210.00 | 1120.00 |  2100.00 |  3000.00 |   860215.0 | ▇▁▁▁▁ |
| polystyrene        |         0 |          1.00 |  4897.81 |  37807.68 |  210.00 |  990.00 |  2100.00 |  3250.00 |   870177.0 | ▇▁▁▁▁ |
| cigarette_butts    |         0 |          1.00 | 62523.38 | 488496.27 |  980.00 | 5500.00 | 15000.00 | 38000.00 | 11108320.0 | ▇▁▁▁▁ |
| glass_bottles      |         0 |          1.00 |    57.25 |    442.98 |    0.00 |   11.00 |    21.00 |    42.00 |    10171.0 | ▇▁▁▁▁ |
| grocery_bags       |         0 |          1.00 |  2813.34 |  21757.93 |   50.00 |  480.00 |   950.00 |  2150.00 |   499448.0 | ▇▁▁▁▁ |
| chip_bags          |         0 |          1.00 |  3971.29 |  30648.58 |  180.00 |  880.00 |  1570.00 |  2750.00 |   704792.0 | ▇▁▁▁▁ |
| sports_balls       |         0 |          1.00 |    29.94 |    231.63 |    0.00 |    6.00 |    11.00 |    22.00 |     5315.4 | ▇▁▁▁▁ |
| homes_powered      |         0 |          1.00 |   115.55 |    893.88 |    0.00 |   40.50 |    52.83 |    64.00 |    20530.0 | ▇▁▁▁▁ |

**Variable type: POSIXct**

| skim_variable | n_missing | complete_rate | min        | max        | median     | n_unique |
|:--------------|----------:|--------------:|:-----------|:-----------|:-----------|---------:|
| date          |        80 |          0.85 | 1900-01-20 | 2021-01-04 | 2018-02-05 |      275 |

I ensured the use of reasonable variable names.

``` r
Trash_df %>% filter(!is.na(dumpster))
```

    ## # A tibble: 454 × 17
    ##    dumpster month  year date                weight_tons volume…¹ plast…² polys…³
    ##    <chr>    <chr> <dbl> <dttm>                    <dbl>    <dbl>   <dbl>   <dbl>
    ##  1 1        May    2014 2014-05-16 00:00:00        4.31       18    1450    1820
    ##  2 2        May    2014 2014-05-16 00:00:00        2.74       13    1120    1030
    ##  3 3        May    2014 2014-05-16 00:00:00        3.45       15    2450    3100
    ##  4 4        May    2014 2014-05-17 00:00:00        3.1        15    2380    2730
    ##  5 5        May    2014 2014-05-17 00:00:00        4.06       18     980     870
    ##  6 6        May    2014 2014-05-20 00:00:00        2.71       13    1430    2140
    ##  7 7        May    2014 2014-05-21 00:00:00        1.91        8     910    1090
    ##  8 8        May    2014 2014-05-28 00:00:00        3.7        16    3580    4310
    ##  9 9        June   2014 2014-06-05 00:00:00        2.52       14    2400    2790
    ## 10 10       June   2014 2014-06-11 00:00:00        3.76       18    1340    1730
    ## # … with 444 more rows, 9 more variables: cigarette_butts <dbl>,
    ## #   glass_bottles <dbl>, grocery_bags <dbl>, chip_bags <dbl>,
    ## #   sports_balls <dbl>, homes_powered <dbl>, x15 <chr>, x16 <lgl>, x17 <lgl>,
    ## #   and abbreviated variable names ¹​volume_cubic_yards, ²​plastic_bottles,
    ## #   ³​polystyrene

I have ommited rows that do not include dumpster-specific data.

``` r
Trash_df$sports_balls = as.integer(as.numeric(Trash_df$sports_balls))

Trash_df$sports_balls
```

    ##   [1]    7    5    6    6    7    5    3    6   46    5    7    6    7    6    6
    ##  [16]    6    6    5   55    6    6    7    6    6    5    5   42    6    6    8
    ##  [31]    6    4   32    7    3    6   16    6    5    7    5    6   30    6    7
    ##  [46]    6    6   25    6    6    6   18    7    6    5   18    3    3    8   16
    ##  [61]   14   38   13   16    8    5    8   11    7    6   74    8   22   28   19
    ##  [76]   32   24  133   26   36   24    9   16   22   17   13   14   21   15   13
    ##  [91]   18   16   22   32   18   21   34   19   14  420   22   16   25   27   18
    ## [106]   20  128   17   56   32   22    6    3  136   17   13   12    7    8   57
    ## [121]   16   23   33   72   27   27   15   21    9   13   22   17   27    8  132
    ## [136]   17   17   14   21   26    6    4   16   87   24   23   18   46   38  149
    ## [151]   24   36   42   23   34  159   38   26   32   96   43   38   24   35   26
    ## [166]   29  195   31   28   34   26   38   25   16   24  222   15   31   22   28
    ## [181]   32  128   15   28   33   76   11   37   48   22   11   34   67    6   24
    ## [196]   20   15   65   22   22   19   12   31   14   18   10    6   48    8    8
    ## [211]    5    3    5    7    2    7    3    4    5    8   10    5    7    5    8
    ## [226]   10  110   11   14   12    8    5    9    5   14   78   12    8    7   27
    ## [241]   18   11   22   13   21   85   14    9    6   13   11    6    8    5   72
    ## [256]    6   12   18    8    7   15   13   11   24   12    8   20    6    4    6
    ## [271]   12   14    5    4    8    3   62    7   10   17   12    1    4    2    4
    ## [286]    3    4    3    4    2    5    1    3    2    4    2    3   59    4    5
    ## [301]    3    2    3    0    2    3    2    1    2   27    5    4    3    2    4
    ## [316]    2    8    3    2    2   35    3    1    5    3    1    2    7    4    5
    ## [331]    1    7    2    3   44    6    1    9    0    2   18   14   11    6    0
    ## [346]    4    9   16   14   74    8    8   11   27    6    4    0    4    9   14
    ## [361]    2    0    6   45    8    8    0    4   20   13   17   30    2   11   13
    ## [376]   14    9    0    6    6    3   38   11   14    4    8    1    4   42    8
    ## [391]   14    9    4    4   14   22    6    9   10    8  108   17    8   16   41
    ## [406]   11    8   20    7    8   18   14   22   12    4   14   32  170   10    4
    ## [421]   14    0    6   13   21   68    4   12   16   28   12   20    4    2   98
    ## [436]   12    2   11    4    1    0    3   33    9   12   21   16   12    8    6
    ## [451]   14    2    6   14   10   88    9    9   16    7   11   34    6   14    8
    ## [466]    4    4    2   14   19   71   16   22   12   50   24   12   10   10    1
    ## [481]   14    0    4    0    2    3    6   86   11   15   12    8   19   12   10
    ## [496]   87   24   16    9   10   16   75   12   20   18   50   21   24   14    8
    ## [511]   67   11    8    9   28   14   21   18   12   16   21   10   14   20    8
    ## [526]   28    0   14   15  211   12   12 5315

I have rounded the number of sports balls to the nearest integer and
converted the result to an integer variable.
