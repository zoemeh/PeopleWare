# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    @user.group == "admins"  
  end

  def show?
    @user.group == "admins"  
  end

  def create?
    @user.group == "admins"  
  end

  def new?
    create?
  end

  def update?
    @user.group == "admins"  
  end

  def edit?
    update?
  end

  def destroy?
    @user.group == "admins"  
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end

    private

    attr_reader :user, :scope
  end
end
