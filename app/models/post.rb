class Post < ApplicationRecord

    [:title,
        #  :tent, :sleep, :lantan, :cook, :other, :advice, :number, :price, :about, :image, :tag_list
        ].each do |v|
        validates v, presence: true
    end

    belongs_to :user

    acts_as_taggable

    mount_uploader :image, ImageUploader

    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    has_many :comments, dependent: :destroy
end
