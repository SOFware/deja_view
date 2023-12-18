class DejaViewPolicy < ApplicationPolicy
  # Override to
  def default_authorization
    true
  end

  %i[
    new?
  ].each { |action| alias_method action, :default_authorization }
end
