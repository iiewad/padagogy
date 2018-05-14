class App < ApplicationRecord
  acts_as_commentable
  belongs_to :padagogy_category
  belongs_to :subject_category
  belongs_to :grade_category

  ratyrate_rateable "score"

end
