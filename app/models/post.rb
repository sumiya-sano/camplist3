class Post < ApplicationRecord

    [:title, :image, :number, :price, :tent, :sleep, :lantan, :cook, :other, :about ].each do |v|
        validates v, presence: true
    end

    belongs_to :user

    acts_as_taggable

    mount_uploader :image, ImageUploader

    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    has_many :comments, dependent: :destroy
end
