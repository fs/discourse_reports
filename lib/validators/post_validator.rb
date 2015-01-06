module Validators; end
class Validators::PostValidator < ActiveModel::Validator
  def stripped_length(post)
    if post.topic.try(:private_message?)
      Validators::StrippedLengthValidator.validate(post, :raw, post.raw, SiteSetting.private_message_post_length)
    end
  end
end
