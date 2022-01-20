.onAttach <- function(lib, pkg)  {
  packageStartupMessage("This is lefse ",
                        utils::packageDescription("lefse",
                                                  fields="Version"),
                        appendLF = TRUE)
}
