# Problem

Determine the second lowest cost silver plan (SLCSP) for a group of zipcodes.

# Output

Modified `[slcsp.csv]`(slcsp.csv).

## Requirements

- First column contains zipcodes in the same order as the [original file](data/slcsp.csv)
- Second column contains the rate of the second lowest cost silver plan for that zipcode
- Any zipcode mapped to more than one rate area is left blank
- Any zipcode with fewer than three plan options is left blank

# Run the tests

Running `bundle exec rspec` from the root directory will execute all tests. Don't forget to `bundle install` before running.

# Run the code through rake tasks

To find an individual rate for an individual zipcode, run `rake slcsp:zipcode ZIPCODE=<zipcode>`

To generate a new CSV of the rates for a list of zipcodes, run `rake slcsp:csv ZIPCODES_PATH=<input file path> OUTPUT_PATH=<output file path>`

Don't forget to `bundle install` before running.
