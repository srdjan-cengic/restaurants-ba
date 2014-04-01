class SessionsController < Devise::SessionsController
end

#Devise already has the user_id stored in the session.current_user helper method can be used here.