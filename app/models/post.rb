class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
  belongs_to :topic
  has_many :votes, dependent: :destroy

  mount_uploader :image, ImageUploader

  def up_votes
    votes.where(value: 1).count
  end 

  def down_votes
    votes.where(value: -1).count
  end 

  def points
    votes.sum(:value)
  end 
  
  
  default_scope { order('created_at DESC') }

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  # validates :topic, presence: true
  # validates :user, presence: true

  def markdown_title
    render_as_markdown(title)
  end 

  def markdown_body
    render_as_markdown(body)
  end 

  private 

  def render_as_markdown(markdown)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render markdown).html_safe
  end 
end
