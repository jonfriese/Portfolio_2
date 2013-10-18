class PostPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      scope
    end
  end

  def create?
    user.editor? || user.author?
  end

  def destroy?
    user.editor?
  end
end
