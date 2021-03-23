class Auth 
    # creates a new jwt token
    def self.create_token(user)
        payload = {user_id: user.id}
        JWT.encode(payload, ENV["JWT_SECRET"], 'HS256')
    end 

    # verifies the jwt payload 
    def self.verify_token(token)
        result = JWT.decode(token, ENV["JWT_SECRET"], true, algorithm: 'HS256')
        payload = result[0]
    end 
end 