# Initialize an incrementing variable
counter = 1

# Initialize output array
unique_colors_css = []

# sort the unique colors
sorted_unique_colors = unique_colors.sort_by { |s| s.scan(/(?:rgb|rgba)\((\d+)/).flatten.first.to_i }

sorted_unique_colors.each do |line|
  line = line.chomp  # Remove trailing newline character
  # Check if the line contains 'rgba' or 'rgb'
  if line.match?(/rgba?\([^)]+\)/)
    # Prefix the line with "--color-#" and a semicolon
    transformed_line = "--color-#{counter}: #{line};\n"
    # Write the transformed line to the output file
    unique_colors_css << transformed_line
    # Increment the counter
    counter += 1
  end
end

# Write the unique colors to a new file
File.write('Downloads/mochi_dark_uniq_colors_css.css', unique_colors_css.join)