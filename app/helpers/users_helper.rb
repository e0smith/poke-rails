module UsersHelper
    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end

    def logged_in?
        !!current_user
    end

    def redirect_if_not_logged_in
        if !logged_in?
            redirect_to :root
        end
    end

    def redirect_if_logged_in
        redirect_to users_path if logged_in?
    end

    def user_verify 
        if current_user != User.find_by_id(session[:user_id])
            redirect_to pokemons_path
        end
    end
end
