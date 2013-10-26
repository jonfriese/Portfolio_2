class CommentPolicy < ApplicationPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def destroy?
    user.present? && (user.editor? ||
    (user.author? && comment.commentable.author_id == user.id))
  end

  def approve?
    user.editor? if user.present?
  end

  def update?
    user.editor? if user.present?
  end


  Scope = Struct.new(:user, :scope) do
    def resolve
      if user.present? && user.editor?
        scope.all
      else
        scope.where(approved: true)
      end
    end
  end
end
