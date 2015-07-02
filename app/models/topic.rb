class Topic < ActiveRecord::Base

  has_many :posts, dependent: :destroy

  scope :visible_to, -> (user) { user ? all : where(public: true) }
  scope :publicly_viewable, -> { visible_to.where() }
  scope :privately_viewable, -> { visible_to.where() }


  validates :name, length: { minimum: 5 }, presence: true


  self.per_page = 50

end

