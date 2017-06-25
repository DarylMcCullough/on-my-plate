    require 'faker'
    # Create Users
    5.times do
        name = Faker::Name.name
        user = User.new(
        email: Faker::Internet.unique.email(name),
        username: Faker::Internet.user_name(name),
        #password: Faker::Internet.password
        password: "helloworld"
        )
        user.confirm
        user.skip_confirmation!
        user.save!
    end
    
    users = User.all
 
    users.each do |user|
        # create todos
        10.times do
            Item.create!(
                user: user,
                name: Faker::Lorem.sentence
            )
        end
    end

 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Item.count} items created"
 
