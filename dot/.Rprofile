# Install data.table
if (!("data.table" %in% rownames(installed.packages()))) {
    install.packages(data.table)
}

# Always print data.tables instead of data.frames
print.data.frame = function(df) {
  data.table::setDT(df)
  print(df)
}

