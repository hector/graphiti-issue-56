class Project < ApplicationRecord
  has_many :renderables, dependent: :destroy
end
