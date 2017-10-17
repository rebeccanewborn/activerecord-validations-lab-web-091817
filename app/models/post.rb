class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :summary, length: { maximum: 250 }
  validates :content, length: { minimum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}
  validate :is_clickbait?

  def is_clickbait?
    array = ["Won't Believe", "Secret", "Guess", "Top"]
    array.any? { |term| self.title.to_s.include?(term)} || errors.add(:title, "isn't clickbait")
  end
end
