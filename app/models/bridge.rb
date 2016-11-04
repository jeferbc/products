# == Schema Information
#
# Table name: bridges
#
#  id          :integer          not null, primary key
#  category_id :integer
#  product_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Bridge < ApplicationRecord
  belongs_to :category
  belongs_to :product
end
