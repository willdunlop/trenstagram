class Post < ApplicationRecord
  belongs_to :user

  has_attached_file :image, styles: { medium: "500x500>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  acts_as_votable

  def score
    self.get_upvotes.size - self.get_downvotes.size
  end


end
