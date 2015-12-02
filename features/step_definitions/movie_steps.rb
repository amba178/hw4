Given(/^the following movies exist:$/) do |movies_table|
	movies_table.hashes.each do |movie|
    Movie.create!(movie)
  end
end

Then(/^the director of "(.*?)" should be "(.*?)"$/) do |title, director|
	@movie = Movie.find_by_title(title)
	expect(@movie.director).to eql(director)
end


# Then(/^I should see "(.*?)"$/) do |title|
#     page.find('#movies').has_content?("<td>#{title}<td>")
# end