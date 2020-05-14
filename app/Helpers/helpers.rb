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

  end