class SignupUser
  include Interactor

  def call
    user = User.create!(email: context.email, city: context.city, password: context.password)  
    token = Auth.create_token user 
    
    context.user = user 
    context.token = token 
  end
end
