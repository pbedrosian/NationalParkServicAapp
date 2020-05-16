class Helpers

    def self.current_user(session)
      if session[:user_id]
        User.find(session[:user_id])
      else
        nil
      end
    end
  
    def self.is_logged_in?(session)
      !!current_user(session)
    end

    def self.name(session)
      self.current_user(session).first_name
    end

    def self.get_email(params)
      User.all.exists?(email: params[:email])
    end

    def self.confirm_password(params)
      params[:password] == params[:verify_password]
    end

    def self.check_email(param)
    end


  end