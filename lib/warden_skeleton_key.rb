module WardenSkeletonKey
  # Middleware to automatically sign in users.
  #
  # NOTE: Only intended to run in test or development environments!
  #
  # user_finder - Required block that returns a user object to sign in.
  #
  # Example
  #
  #   # config/environments/development.rb
  #
  #   Application.configure do
  #     config.middleware.use WardenSkeletonKey do
  #       AdminUser.find_by email: 'admin@example.com'
  #     end
  #   end
  #
  def initialize(app, &user_finder)
    perform_safety_check
    @app, @user_finder = app, user_finder
  end

  def call(env)
    @env = env
    sign_in unless signed_in?
    @app.call(@env)
  end

  private

  def user
    @user_finder.call
  end

  def sign_in
    @env['warden'].set_user(user)
  end

  def signed_in?
    !@env['warden'].user.nil?
  end

  def perform_safety_check
    if defined? Rails
      fail 'This is probably a mistake, but you do NOT want this running in production.' if Rails.env.production?
    end
  end
end

