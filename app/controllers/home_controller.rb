class HomeController < ApplicationController
  
  def index
    
  
  if params[:tweet].present?
    @tweets = Tweet.where('tweet like ?', "%#{params[:tweet]}%").order('created_at DESC').page(params[:page])
  else
    
    @tweets = Tweet.order('created_at DESC').page(params[:page])
  end

end
end
