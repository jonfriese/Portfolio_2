class PostPolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def create?
    user.editor? || user.author? if user.present?
  end

  def destroy?
    post.authored_by?(user) || user.editor? if user.present?
  end

  def update?
    post.authored_by?(user) || user.editor? if user.present?
  end

  def publish?
    user.editor? if user.present?
  end

  def edit?
    if user.present?
      return true if user.editor?
      user.id == post.author_id
    end
  end

  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.present? && user.editor?
        scope.all
      elsif user.present? && user.author?
        scope.where(author_id: user.id) | scope.published
      else
        scope.where(published: true)
      end
    end
  end
end
