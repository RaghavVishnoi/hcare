class User < ActiveRecord::Base
  include Clearance::User

   before_create :default_values

   has_many :associated_roles,as: :object,dependent: :destroy
   has_many :roles,through: :associated_roles
   has_one :trainer

   validates :first_name, presence: true
   validate  :last_name
   validates :email, presence: true,uniqueness: true
   validate  :contact_number
   validate  :gender
   validate  :facebook_user_id
   validate  :facebook_user_token
   validate  :photo_url
   validate  :username


   def self.get_user(token)
      User.find_by(token: token)
   end

   def self.user_data(user)
      @user = {}
      @user[:first_name] = user.first_name
      @user[:last_name] = user.last_name
      @user[:contact_number] = user.contact_number
      @user[:email] = user.email
      @user[:token] = user.token
      @user[:created_at] = user.created_at
      @user[:role] = user.roles[0][:role]
      @user
   end

   def self.from_omniauth(auth)
      puts "aaa #{auth.to_json}" 
   end

   private
      def default_values
         if self.role_ids.length == 0
            self.role_ids = [2]
         end
      end

   
      

end
