class Content < ApplicationRecord
    validates :steps, presence: true, on: :content_validation?
    validates :ingredients, presence: true, on: :content_validation?
    validates :title, presence: true
    validates :content_review_notes, presence: true
    belongs_to :user
 
    def content_validation?
        if content_type == "Recipe"
            return true
        else
            return false
        end
    end
end
