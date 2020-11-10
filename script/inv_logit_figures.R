library(tidyverse)

vals <- c(-4, -3, -2, -1, 0)
vals2 <- seq(-1, 3, 1)

df <- 
tibble(
  n_risk_factors = list(c("0", "1", "2", "3", "4")),
  logit_x = list(vals, vals2),
  condition = list("low baseline", "high baseline")
  ) %>% 
  unnest() %>% 
  mutate(prob_y = boot::inv.logit(logit_x))

logit_plot <- 
df %>% 
  ggplot(aes(x = logit_x, y = prob_y, colour = n_risk_factors)) +
  geom_point(size = 3, alpha = 0.8) +
  facet_wrap(~fct_rev(condition)) +
  theme_minimal() +
  scale_colour_viridis_d()


h <- 4.5
w <- 7


ggsave(
  here::here("figures", "logit_plot.png"),
  logit_plot,
  type = "cairo-png",
  width = w,
  height = h
)
