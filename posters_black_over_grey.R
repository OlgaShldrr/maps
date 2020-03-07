library(tidyverse)
library(osmdata)
#available_tags("highway")
#available_features()
place <- "Berlin Germny"
search <- getbb(place)
streets <- search %>%
  opq()%>%
  add_osm_feature(key = "highway", 
                  value = c("motorway", "primary", 
                            "secondary", "tertiary")) %>%
  osmdata_sf()

small_streets <- search%>%
  opq()%>%
  add_osm_feature(key = "highway", 
                  value = c("residential", "living_street",
                            "unclassified",
                            "service", "footway")) %>%
  osmdata_sf()

#river <- getbb("Novokuznetsk")%>%
#  opq()%>%
#  add_osm_feature(key = "name:en", value = "Tom River") %>%
#  osmdata_sf()


#ggplot() +
#  geom_sf(data = streets$osm_lines,
#          inherit.aes = FALSE,
#          color = "black",
#          size = .4,
#          alpha = .8) +
#  coord_sf(xlim = search[1,], 
#           ylim = search[2,],
#           expand = FALSE) 
#
#ggplot() +
#  geom_sf(data = streets$osm_lines,
#          inherit.aes = FALSE,
#          color = "black",
#          size = .4,
#          alpha = .8) +
#  geom_sf(data = small_streets$osm_lines,
#          inherit.aes = FALSE,
#          color = "black",
#          size = .4,
#          alpha = .6) +
#  coord_sf(xlim = search[1,], 
#           ylim = search[2,],
#           expand = FALSE) 
#
#ggplot() +
#  geom_sf(data = streets$osm_lines,
#          inherit.aes = FALSE,
#          color = "steelblue",
#          size = .4,
#          alpha = .8) +
#  geom_sf(data = small_streets$osm_lines,
#          inherit.aes = FALSE,
#          color = "black",
#          size = .4,
#          alpha = .6) +
#  coord_sf(xlim = search[1,], 
#           ylim = search[2,],
#           expand = FALSE)   

ggplot() +
  geom_sf(data = small_streets$osm_lines,
          inherit.aes = FALSE,
          color = "grey",
          size = .3,
          alpha = .6) +
  geom_sf(data = streets$osm_lines,
          inherit.aes = FALSE,
          color = "#323232",
          size = .4,
          alpha = .8) +
  coord_sf(xlim = search[1,], 
           ylim = search[2,],
           expand = FALSE)  +
  theme_void()

#ggplot() +
#  geom_sf(data = streets$osm_lines,
#          inherit.aes = FALSE,
#          color = "#b3950e",
#          size = .4,
#          alpha = .8) +
#  geom_sf(data = small_streets$osm_lines,
#          inherit.aes = FALSE,
#          color = "#b3950e",
#          size = .2,
#          alpha = .6) +
#  coord_sf(xlim = search[1,], 
#           ylim = search[2,],
#           expand = FALSE)   +
#  theme_void() +
#  theme(
#    plot.background = element_rect(fill = "#282828")
#  )
ggsave(paste0("map_of_",place,".png"), dpi = 300, width = 300, height = 400, units = "mm")

