#tidyverse is a collection of packages
library(tidyverse)

options(tibble.print_min = 3)

##Load in the FAS litters data

#load litters data
litters_data = read_csv("./data/FAS_litters.csv",col_types = "ccddiiii")

#CLEAN NAMES from janitor makes the names nice and neat
litters_data = janitor::clean_names(litters_data)


pups_data = read_csv("./data/FAS_pups.csv",
                     col_types = "ciiiii")
pups_data = janitor::clean_names(pups_data)

# SELECT: choose some columns and not others 
select(litters_data, group, litter_number, gd0_weight, pups_born_alive)

select(litters_data, group:gd_of_birth)

##get rid of pups survive column 
select(litters_data, -pups_survive)

#RENAME the column numbers NEW NAME=old name
rename(litters_data, GROUP = group, LiTtEr_NuMbEr = litter_number)

###########################################
# ?select_helpers to help 
############################################


#SELECT everything that starts with "gd"
select(litters_data, starts_with("gd"))

#SELECT litter number, pups_survive as the first few columns but keep everything else!
select(litters_data, litter_number, pups_survive, everything())

#RELOCATE does the same as above, but you don't have to say everything!
relocate(litters_data, litter_number, pups_survive)

###FILTER THE LITTERS DATA 
#gd_of_birth == 20
#pups_born_alive >= 2
#pups_survive != 4
#!(pups_survive == 4)
#group %in% c("Con7", "Con8")
#group == "Con7" & gd_of_birth == 20

#OMIT NA missing observations
#drop_na(litters_data): remove any rows with a missing value
#drop_na(litters_data, wt_increase): remove rows for which wt_increase is missing



#FILTER: remove rows or keep rows for subsequent analysis BUT you have to GIVE IT SOME CONDITION [<, >, = ] using logical operators!!!

filter(litters_data, gd0_weight <22)

filter(litters_data, gd0_weight >=22)

filter(litters_data, gd0_weight ==22) #note 2 equal signs 

filter(litters_data, gd0_weight !=22) #not equal to "!="

filter(litters_data, gd0_weight >=22, gd_of_birth == 20) 

filter(litters_data, group=="Mod8")

filter(litters_data, group %>% c("Con7","Mod8")) # group in Con6 and Mod8

#MUTATE: modify some variable + create new variable
mutate(litters_data, wt_gain = gd18_weight - gd0_weight,group = str_to_lower(group)) #new variable called "wt_gain" + make the group variable to LOWERCASE, new variables at the end!!

#ARRANGE: just arranging stuff in columns I guess
head(arrange(litters_data, group, pups_born_alive), 10) #INCREASING order of the pups born alive

#DID NOT USE %>% 
litters_data_raw = read_csv("./data/FAS_litters.csv",col_types = "ccddiiii")

litters_data_clean_names = janitor::clean_names(litters_data_raw)

litters_data_selected_cols = select(litters_data_clean_names, -pups_survive)

litters_mutated = mutate(litters_data_selected_cols, t_gain = gd18_weight - gd0_weight)

litters_without_missing = drop_na(litters_mutated, gd0_weight)

litters_data_with_vars = 
  mutate(
    litters_data_selected_cols, 
    wt_gain = gd18_weight - gd0_weight,
    group = str_to_lower(group))
litters_data_with_vars_without_missing = 
  drop_na(litters_data_with_vars, wt_gain)
litters_data_with_vars_without_missing

#USE %>%!!!!!!
litters_df = 
  read_csv("./data/FAS_litters.csv",col_types = "ccddiiii") %>% 
janitor::clean_names() %>% 
select (-pups_survive) %>% 
mutate(wt_gain = gd18_weight - gd0_weight,
group = str_to_lower(group)) %>% 
drop_na(gd0_weight)

  litters_data = 
  read_csv("./data/FAS_litters.csv", col_types = "ccddiiii") %>%
  janitor::clean_names() %>%
  select(-pups_survive) %>%
  mutate(
    wt_gain = gd18_weight - gd0_weight,
    group = str_to_lower(group)) %>% 
  drop_na(wt_gain)
  
  drop_na(
    mutate(
      select(
        janitor::clean_names(
          read_csv("./data/FAS_litters.csv", col_types = "ccddiiii")
        ), 
        -pups_survive
      ),
      wt_gain = gd18_weight - gd0_weight,
      group = str_to_lower(group)
    ),
    wt_gain
  )

litters_data_clean

litters_data = 
  read_csv("./data/FAS_litters.csv", col_types = "ccddiiii") %>%
  janitor::clean_names() %>%
  select(-pups_survive) %>%
  mutate(
    wt_gain = gd18_weight - gd0_weight,
    group = str_to_lower(group)) %>% 
  drop_na(wt_gain)

litters_data

litters_data = 
  read_csv("./data/FAS_litters.csv", col_types = "ccddiiii") %>%
  janitor::clean_names(dat = .) %>%
  select(.data = ., -pups_survive) %>%
  mutate(.data = .,
         wt_gain = gd18_weight - gd0_weight,
         group = str_to_lower(group)) %>% 
  drop_na(data = ., wt_gain)

litters_data %>%
  lm(wt_gain ~ pups_born_alive, data = .) %>%
  broom::tidy()



