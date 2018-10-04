require 'json'

namespace :data do
  
  desc 'add users'
  task users: :environment do
    (1..50).each{ |i|
      mails = ['mail.ru', 'gmail.com', 'company.org', 'net.net', 'yandex.ru']

      u = User.create!(name:"Name#{i}", email:"Name#{i}@#{mails.sample}")

      (i%10 == 0)? u.moderator = true : u.moderator = false 
      
      (i%5 == 0)? u.creator = true : u.creator = false
      u.save
        }
  end
  
  desc 'add posts'
  task :posts, [:path] => [:environment] do |t,args|
    creators = User.where(creator:true)
    creators_id = []
    creators.all.each do |creators|
      creators_id.push(creators.id)
    end
    
    #    f = File.read('E:\!Geek\!Ruby\rails\blog\lib\tasks\posts.json')
    
    f = args[:path]
    file = File.read(f)
    data_hash = JSON.parse(file)
    
    20.times do |i|
      p = Post.new()
      p.user_id = creators_id.sample
      p.title = data_hash[i]['title']
      p.body = data_hash[i]['body']
      p.save
    end
  end
  
  desc 'add comments'
  task :comments, [:path] => [:environment] do |t,args|
    p = Post.ids
    u = User.ids
        
#    f = File.read('E:\!Geek\!Ruby\rails\blog\lib\tasks\comments.json')
    
    f = args[:path]
    file = File.read(f)
    data_hash = JSON.parse(file)
    
    200.times do |i|
      c = Comment.new()
      c.user_id = u.sample
      c.commentable_id = p.sample
      c.commentable_type = 'Post'
      c.body = data_hash[Random.rand(data_hash.length)]['body']
      c.save
    end
  end
  
  task destroy: :environment do
    Comment.destroy_all
    Post.destroy_all
    User.destroy_all
  end
  
  task :task_all => [:destroy, :users, :posts, :comments]
  
end
