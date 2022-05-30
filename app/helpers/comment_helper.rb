module CommentHelper
  def error_message(comment)
    comment.errors.present? ? "<p>#{ t('errors.format', attribute: Comment.model_name.human, message: t('errors.messages.blank'))}</p>" : ''
  end
end
