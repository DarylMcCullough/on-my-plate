namespace :todo do
  desc "Delete items older than 7 days"
  
  task delete_items: :environment do
    flag = true
    Item.where("created_at <= ?", Time.now - 7.days).each do |item|
      user = item.user.username
      name = item.name
      if flag
        puts "Destroying tasks"
        flag = false
      end
      puts "task: #{name} of user: #{user}"
      item.destroy
    end
  end

end
