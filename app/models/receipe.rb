class Receipe < ApplicationRecord
	has_many :ingredients, dependent: :destroy
	accepts_nested_attributes_for :ingredients

	has_many :receipe_photos, dependent: :destroy
	accepts_nested_attributes_for :receipe_photos

	validates :name, presence: true,
                    length: { minimum: 5 }

end
