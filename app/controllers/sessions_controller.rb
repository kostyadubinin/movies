class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    user = User.from_omniauth(auth_hash)

    if user.persisted?
      session[:user_id] = user.id
      flash[:success] = t('omniauth_callbacks.success', kind: auth_hash.provider)
    else
      flash[:danger] = t('omniauth_callbacks.failure', kind: auth_hash.provider, reason: user.errors.full_messages.to_sentence)
    end

    redirect_to root_url
  end

  def destroy
    if session[:user_id].present?
      session[:user_id] = nil
      flash[:success] = t('sessions.signed_out')
    end

    redirect_to root_url
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
