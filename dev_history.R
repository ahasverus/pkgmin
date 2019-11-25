# git reset --hard HEAD~1
# remotes::install_github("ropenscilabs/travis")

path   <- "/Users/nicolascasajus/Documents"
pkname <- "pkgmin"

usethis::create_package(file.path(path, pkname))

usethis::use_git()

usethis::edit_file("DESCRIPTION")
## ● Edit 'DESCRIPTION'
system("git add -A")
system("git commit -m 'Edit package metadata'")

usethis::use_mit_license(name = "Nicolas Casajus")
system("git add -A")
system("git commit -m 'Add package license'")

usethis::use_roxygen_md()
system("git add -A")
system("git commit -m 'Setting roxygen2'")

usethis::use_package_doc()
system("git add -A")
system("git commit -m 'Edit package documentation'")

devtools::document()
system("git add -A")
system("git commit -m 'Generate package documentation (Rd file)'")

usethis::use_r("moyenne")
## ● Edit 'R/moyenne.R' (R code)
system("git add -A")
system("git commit -m 'Implement R function'")

usethis::use_r("moyenne")
## ● Edit 'R/moyenne.R' (roxygen)
system("git add -A")
system("git commit -m 'Add roxygen documentation'")

devtools::document()
system("git add -A")
system("git commit -m 'Generate moyenne documentation (Rd file)'")

usethis::use_package(package = "magrittr")
usethis::use_package(package = "stats")
system("git add -A")
system("git commit -m 'Add external dependencies'")

set.seed(1637)
x  <- rnorm(9)
y  <- c(NA, 2:9)
xy <- data.frame(x, y)
usethis::use_data(xy, internal = FALSE)
system("git add -A")
system("git commit -m 'Add internal dataset'")

usethis::use_r("xy")
## ● Edit 'R/xy.R' (roxygen)
system("git add -A")
system("git commit -m 'Add roxygen documentation'")

devtools::document()
system("git add -A")
system("git commit -m 'Generate dataset documentation (Rd file)'")

usethis::use_r("moyenne")
## ● Edit 'R/moyenne.R' (roxygen)
system("git add -A")
system("git commit -m 'Update roxygen example'")

devtools::document()
system("git add -A")
system("git commit -m 'Update moyenne documentation (Rd file)'")

devtools::check()

usethis::use_version(which = "major")

usethis::use_vignette("pkgmin")
system("git add -A")
system("git commit -m 'Create package vignette'")

## ● Edit 'vignettes/pkgmin.Rmd'
system("git add -A")
system("git commit -m 'Edit package vignette'")

usethis::use_readme_rmd()
system("git add -A")
system("git commit -m 'Create README' --no-verify")

## ● Edit 'README.Rmd'
rmarkdown::render("README.Rmd")
usethis::use_git_ignore("README.html")
system("git add -A")
system("git commit -m 'Edit README'")

## ● Remove inst/doc from .gitignore
system("git add -A")
system("git commit -m 'Remove inst/doc'")

usethis::use_github(protocol = "https")

usethis::use_travis()
## ● Edit '.travis.yml'
rmarkdown::render("README.Rmd")
system("git add -A")
system("git commit -m 'Setup Travis CI'")
system("git push")

usethis::use_appveyor()
## ● Edit 'appveyor.yml'
rmarkdown::render("README.Rmd")
system("git add -A")
system("git commit -m 'Setup Appveyor'")
system("git push")

usethis::use_pkgdown()
system("git add -A")
system("git commit -m 'Setup pkgdown'")
system("git push")

pkgdown::build_site()
system("git add -A")
system("git commit -m 'Build website'")
system("git push")

usethis::use_pkgdown_travis()
travis::use_travis_deploy()
## ● Edit '.travis.yml'
system("git add -A")
system("git commit -m 'Build website (with Travis CI)'")
system("git push")
