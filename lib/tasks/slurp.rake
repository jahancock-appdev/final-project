namespace :slurp do
  desc "TODO"
  task yelpdata: :environment do
    require "csv"
  
    csv_text = File.read(Rails.root.join("lib", "csvs", "yelp_all_cats_sample.csv"))
    
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")

    csv.each_with_index do |row, the_index|
      #row.to_hash
      c = Category.new
      c.category = row["categories"]
      c.save
      puts "#{the_index} category saved"

    end

    # csv_text = File.read(Rails.root.join("lib", "csvs", "yelp_academic_dataset_business_sample.csv"))
    
    # csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")

    # csv.each_with_index do |row, the_index|
    #   #row.to_hash
    #   r = Restaurant.new
    #   r.name = row["name"]
    #   r.address = row["address"]
    #   r.city = row["city"]
    #   r.state = row["state"]
    #   r.postal_code = row["postal_code"]
    #   r.latitude = row["latitude"]
    #   r.yelp_business_id = row["business_id"]
    #   r.longitude = row["longitude"]
    #   r.stars = row["stars"]
    #   r.review_count = row["review_count"]
    #   r.save
    #   puts "#{the_index} restaurant saved"
    # end
    
    
    csv_text = File.read(Rails.root.join("lib", "csvs", "yelp_bus_id_to_cats_sample.csv"))
    
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each_with_index do |row, the_index|
      #row.to_hash
      rc = RestaurantCategory.new
      rc.category_id = Category.where({category: row["categories"] }).first.id 
      rc.restaurant_id = Restaurant.where({yelp_business_id: row["business_id"] }).first.id 
      rc.save
      puts "#{the_index} RC saved"
    end
    


  end
  
end
