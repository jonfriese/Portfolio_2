class ProjectPolicy < ApplicationPolicy
  attr_reader :user, :project

  def initialize(user, project)
    @user = user
    @project = project
  end

  def create?
    user.editor? || user.author? if user.present?
  end

  def destroy?
    project.authored_by?(user) || user.editor? if user.present?
  end

  def update?
    project.authored_by?(user) || user.editor? if user.present?
  end

  def publish?
    user.editor? if user.present?
  end

  def edit?
    project.authored_by?(user) || user.editor? if user.present?
  end

  Scope = Struct.new(:user, :scope)
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
