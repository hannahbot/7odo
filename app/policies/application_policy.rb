class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def owner_of?
    record.user == user
  end

  def index?
    false
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    user.update? && (record.user == user)
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end

  def scope
    record.class
  end
end
