class RegistrationsController < Devise::RegistrationsController
    
  protected
  def update_resource(resource, params)
    if password_required?
      resource.update_with_password(params)
    else
      params.delete(:current_password)
      resource.update_without_password(params)
    end
  end
  
  private

  def password_required?
    (resource.email != params[:user][:email] if params[:user][:email].present?) || params[:user][:password].present?
  end
    
end