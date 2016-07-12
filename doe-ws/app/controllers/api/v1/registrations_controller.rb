class Api::V1::RegistrationsController < Devise::RegistrationsController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  respond_to :json

  def create
    @user = User.create(params[:user])
    #build_resource
    #resource.skip_confirmation!
    if @user.save
      sign_in @user
      render :status => 200,
           :json => { :success => true,
                      :info => "Registered",
                      :data => { :user => @user,
                                 :auth_token => current_user.authentication_token, 
                                 :donations => current_user.donations } }
    else
      render :status => :unprocessable_entity,
             :json => { :success => false,
                        :info => @user.errors,
                        :data => {} }
    end
  end
end