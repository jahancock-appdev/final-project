namespace :slurp do
  desc "TODO"
  task yelpdata: :environment do
    require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "yelp_all_cats.csv"))
    
    csv = CSV.parse(csv_text, :headers => true)
 
  #   csv.each do |row|
  #     r = Restaurant.new
  #     r.name = row[""]
  #   end
  # end

end
