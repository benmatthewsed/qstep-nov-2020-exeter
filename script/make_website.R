# copy combined_slides over to index.html

fs::file_copy(
  here::here("slides", "exeter_qstep_slides.html"),
  here::here("docs", "index.html"),
  overwrite = TRUE
)

# and moving the figure files

fs::dir_copy(
  here::here("figures"),
  here::here("docs", "figures"),
  overwrite = TRUE
)

