namespace :data do
  
  desc 'add users'
  task users: :environment do

      u = User.new()
      u.name = "Name1"
      u.email = "#{u.name}@email.com"
      u.moderator = true
     
      u.save
    
  end
  
end
