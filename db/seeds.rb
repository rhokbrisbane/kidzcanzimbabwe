##### Users #####

puts 'Creating users...'

users_attributes = [
  { name: "Admin User", email: 'admin@example.com', password: 'rhok2014', admin: true },
  { name: "Example User", email: 'user@example.com',  password: 'rhok2014', admin: false },
]

users = []
users_attributes.each do |user_attributes|
  users << (User.where(email: user_attributes[:email]).first || User.create!(user_attributes))
end

##### Groups ####

puts 'Creating public group...'

public_group = Group.where(name: 'Public').first_or_create
users.each { |user| public_group.users << user }

##### Tag Category ######

puts 'Creating tag categories...'

['Needs', 'Symptoms', 'Age group', 'Weight group'].each do |name|
  TagCategory.where(name: name).first_or_create
end

##### Tags ######

tags_attributes = File.open("#{Rails.root}/db/seeds/symptoms.txt").each_line.map do |tag_name|
  { name: tag_name, tag_category_id: TagCategory.find_by_name('Symptoms').id }
end

puts "Importing #{tags_attributes.count} tags, it could take a while..."

tags_attributes.each do |tag_attributes|
  Tag.where(name: tag_attributes[:name]).first || Tag.create!(tag_attributes)
end

##### Pages ######

puts 'Creating landing page'

Page.create!({
  title: "Home",
  content: "Home page <em>content</em>"
})

##### Resource Category ######

puts 'Creating resource categories...'

resource_categories = [
  'Advocacy',
  'Community Centre',
  'Counselling',
  'Info',
  'Disability & Chronic Illness',
  'Education',
  'Equipment',
  'Funding',
  'Other'
]

resource_categories.each { |name| ResourceCategory.where(name: name).first_or_create }

##### Resources #####

resources_attributes = []

CSV.foreach("#{Rails.root}/db/seeds/organisations.csv") do |category, name, url, phone, facebook, twitter|
  resources_attributes << { resource_category_id: ResourceCategory.find_by_name(category).id,
    name: name, url: url, phone: phone, facebook: facebook, twitter: twitter }
end

puts "Importing #{resources_attributes.count} resources, it could take a while..."

resources_attributes.each do |resource_attributes|
  Resource.where(name: resource_attributes[:name]).first || Resource.create!(resource_attributes)
end


##### Users #####

puts 'Creating patients...'

Patient.create!({
                  kidzcan_number: "1234",
                  hospital_ref_number: "12345",
                  firstname: "John",
                  lastname: "Doe",
                  sex: "M",
                  date_of_birth: "1987-04-23",
                  kidzcan_registration: "2004-03-11"
                })

Patient.create!({
  kidzcan_number: "123467",
  hospital_ref_number: "12345887",
  firstname: "Jane",
  lastname: "Smith",
  sex: "F",
  date_of_birth: "1997-04-23",
  date_of_death: "2014-05-02",
  kidzcan_registration: "2004-03-11",
  point_of_contact: "Morbi quis enim eget lectus suscipit rutrum.",
  diagnosis: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam nulla lectus, volutpat quis justo auctor."
})
