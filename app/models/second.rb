class Second < ActiveRecord::Base
  belongs_to :team
  has_one :pick
  has_one :mypicks
end