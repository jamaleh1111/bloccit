class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  belongs_to :topic

  default_scope { order('created_at DESC') }

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true

  def markdown_title
    @post.markdown_title
  end 

  def markdown_body
    @post.markdown_body
  end 

  private 

  def render_as_markdown
    markdown.require(:post).permit(:title, :body)
  end 
end
