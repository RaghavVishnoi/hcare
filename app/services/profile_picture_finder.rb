class ProfilePictureFinder

	GRAPH_API = "http://graph.facebook.com/v2.3/"
    PROFILE_PICTURE_WIDTH = 500
    PROFILE_PICTURE_HEIGHT = 500

    def self.find_profile_picture(facebook_user_id)
    	GRAPH_API +
      "#{facebook_user_id}/picture" +
      "?height=#{PROFILE_PICTURE_HEIGHT}&width=#{PROFILE_PICTURE_WIDTH}"
    end
end