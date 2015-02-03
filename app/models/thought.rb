class Thought < ActiveRecord::Base
	include SimpleHashtag::Hashtaggable
	include HashtagsHelper
	include SessionsHelper
	hashtaggable_attribute :content
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 250 }
  default_scope -> { order(created_at: :desc) }

  def linkify
  	linkify_hashtags(Thought.find(@thought.id))
  end
end
