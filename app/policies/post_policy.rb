class PostPolicy < ApplicationPolicy

  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.editor?
        scope.all
      elsif user.author?
        scope.where(author_id: user.id, published: true)
      else
        scope.where(published: true)
      end
    end
  end

  def initialize(user, post)
    @user = user
    @post = post
  end

  def create?
    user.editor? || user.author?
  end

  def destroy?
    if user.present?
      return true if user.editor?
      user.id == post.author_id
    end
  end

  def publish?
    if user.present?
      user.editor?
    end
  end

  def edit?
    if user.present?
      return true if user.editor?
      user.id == post.author_id
    end
  end
end
