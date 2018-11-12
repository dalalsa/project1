# == Schema Information
#
# Table name: animals
#
#  id          :bigint(8)        not null, primary key
#  title       :string
#  image       :string
#  description :string
#  type        :string
#  sex         :string
#  dob         :date
#  city        :string
#  location    :string
#  status      :string
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Animal < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :comments
end
