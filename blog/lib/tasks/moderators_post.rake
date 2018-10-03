namespace :moderators_post do
  
  task moderators_post: :environment do
    p = Post.where(user: User.where(moderator:true))
    puts p.ids
  end
end