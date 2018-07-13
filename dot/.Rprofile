options(error = NULL)

packages = rownames(utils::installed.packages())

# Install data.table
if (!("data.table" %in% packages)) {
  install.packages(data.table)
}

# Always print data.tables instead of data.frames
print.data.frame = function(df) {
  data.table::setDT(df)
  print(df)
}

# Look at package info in a nice table
if ("tibble" %in% packages) {
  
  pkg_details = function(pkg) {
    details = installed.packages()[pkg, ]
    tibble::tibble(var = names(details), value = unname(details))
  }
  
}

# Save either pkl or fst objects to cache
if (all(c("fst", "reticulate") %in% packages)) {
  
  save_to_cache = function(object, filename, cache_dir = "cache", save_type = c("R", "py")) {
    
    r_save = "R" %in% save_type
    py_save = "py" %in% save_type
    
    base_path = file.path(cache_dir, filename)
    if (r_save) fst::write.fst(object, paste0(base_path, ".fst"))
    if (py_save) reticulate::py_save_object(object, paste0(base_path, "pkl"), pickle = "pickle")
  }
}

# Use grep in R, printing the result to the console
if (all(c("purrr", "tibble") %in% packages)) {
  str_view_all = function(x, pattern, style = crayon::red $ bold $ underline) {
    
    # Split the string into chunks, delimited at the pattern
    split = stringr::str_split(x, pattern)
    
    # Get the text grep eats to return coloured
    eaten = stringr::str_extract_all(x, pattern)
    
    # Knit these back together colouring the eaten text
    str = purrr::map2(split, eaten, ~ purrr::map2(.x, style(c(.y, "")), paste0))
    
    # Cat the text to colour in the terminal
    strs = unlist(purrr::map(str, ~ paste0(.x, collapse = "")))
    cat(paste0(strs, collapse = "\n"))
    
  }
}

# Splat assignment
if ("zeallot" %in% packages)) {
  "%<s%" = zeallot::`%<-%`
}

# Arrow notation assignation
if (all(c("zeallot", "stringr") %in% packages)) {
  "%=>%" = function(..., f) {
    expr = sys.call(which = 0)
    c(str_handle, str_body) %<s% stringr::str_split(deparse(expr), "%=>%")[[1]]
    c(call, args) %<s% stringr::str_split(str_handle, "(?=\\()")[[1]]
    assign(call, eval(parse(text = paste0("function", args, str_body))), envir = globalenv())
  }
}
