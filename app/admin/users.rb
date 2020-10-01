ActiveAdmin.register User do
  
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  permit_params :email
 
  index do
    selectable_column
    
    column "Nombre", :email do |user|
      link_to user.email, admin_user_path(user)
    end
 
    column "tweets", :tweets_del_user do |user|
      link_to user.tweets.count, admin_user_tweets_path(user)
    end
  
    column "likes", :likes_del_user do |user|
      link_to user.likes.count, admin_user_likes_path(user)
    end
  
    column "following", :followings_del_user do |user|
      link_to user.friends.count, admin_user_friends_path(user)
    end

  actions
  end
 
  member_action :likes do
    @likes = User.find(params[:id]).likes
  end
end







