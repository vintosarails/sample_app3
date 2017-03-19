class Pin < ActiveRecord::Base
	acts_as_votable
	belongs_to :user
	has_attached_file :image, styles: {  }
 	#has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	#default_scope -> { order('created_at DESC') }
	#validates :description, presence: true, length: { maximum: 140 }
	#validates :user_id, presence: true
end