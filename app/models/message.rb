class Message < ActiveRecord::Base
  validates :email, :title, presence: true
end
