class Url < ActiveRecord::Base
  belongs_to :user
  before_save :create_short_url

  private

  def create_short_url
    self.short_url ||= (0...8).map{(65+rand(26)).chr}.join 
  end
  
end
