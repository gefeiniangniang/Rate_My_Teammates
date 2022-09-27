class User < ActiveRecord::Base
  has_many :reviews
  has_many :skills
  has_many :endorsements
  validates :uni, presence: true, uniqueness: true
end
