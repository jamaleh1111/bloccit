class FavoriteMailer < ActionMailer::Base
  default from: "jamaleh@hotmail.com"

  def new_comment(user, post, comment)

    # New Headers
    headers["Message-ID"] = "<comments/#{comment.id}@jamaleh-bloccit.example>"
    headers["In-Reply-To"] = "<post/#{post.id}@jamaleh-bloccit.example>"
    headers["References"] = "<post/#{post.id}@jamaleh-bloccit.example>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
  end 
end