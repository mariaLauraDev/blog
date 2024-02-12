class BlogPost < ApplicationRecord
  has_rich_text :content

  validates :content, presence: true
  validates :content, presence: true

  scope :draft, -> { where(published_at: nil) }
  scope :published, -> { where("published_at <= ?", Time.current) }
  scope :scheduled, -> { where("published_at > ?", Time.current) }
  scope :recent, -> { order(published_at: :desc) }

  def publish
    update(published_at: Time.current)
  end

  def unpublish
    update(published_at: nil)
  end

  def draft?
    published_at.nil?
  end

  def published?
    published_at? && published_at <= Time.current
  end

  def scheduled?
    published_at? && published_at > Time.current
  end
end
