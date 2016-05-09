class Users::RegistrationsController < Devise::RegistrationsController
  layout 'signup'
  before_filter :configure_sign_up_params, only: [:create]
  before_filter :configure_account_update_params, only: [:update]


  # GET /resource/sign_up
  def new
    build_resource({})
    set_minimum_password_length
    yield resource if block_given?
    @plan = params[:plan]
    respond_with self.resource do |format|
      format.html { render layout: 'signup'}
    end
  end

  # POST /resource
  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        plan = Plan.find_by_name params[:plan]
        redirect_to "#{new_subscription_path}?plan=#{plan.id}"
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  # GET /resource/edit
  def edit
    unless current_user.active?
      flash[:alert] = 'Your YesInsights account is inactive. To resume your subscription, please <a href="billing">pick a plan.</a>'
    end

    render :edit, layout: 'yesinsights'
  end

  def cancel

  end

  def cancel_popup

  end

  # PUT /resource
  def update
    params = account_update_params
    params.delete(:password) if params[:password] == ''

    if current_user.update(params)
      flash[:success] = "Successfully updated your profile"
    end
    render 'devise/registrations/edit', layout: 'yesinsights'
  end

  # DELETE /resource
  def destroy
    super
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.for(:sign_up) << [:project_title, :name]
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.for(:account_update) << [:project_title, :name]
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    super(resource)
  end

  def after_update_path_for(resource)
    edit_user_registration_path
  end
  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    super(resource)
  end


end
