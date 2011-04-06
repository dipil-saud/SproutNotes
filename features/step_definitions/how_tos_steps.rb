Given /^the following how_tos:$/ do |how_tos|
  HowTos.create!(how_tos.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) how_tos$/ do |pos|
  visit how_tos_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following how_tos:$/ do |expected_how_tos_table|
  expected_how_tos_table.diff!(tableish('table tr', 'td,th'))
end
