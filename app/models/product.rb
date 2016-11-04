# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  name       :string
#  price      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Product < ApplicationRecord
  has_many :bridges
  has_many :categories, through: :bridges
end
