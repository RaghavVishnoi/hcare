class Image < ActiveRecord::Base

  attr_accessor :skip_reverse_geocode 
  mount_uploader :image, ImageUploader
  
  belongs_to :imageable, :polymorphic => true

  validates :image, :presence => true
  validates :imageable_type, :presence => true
  validate  :lat
  validate  :long
  validate  :imageable_id
  validate  :model
 

  after_save :reverse_geocode, :unless => :skip_reverse_geocode
  after_save :save_url

  private
    def reverse_geocode
      begin
        if lat? && long?
          geocode = Geocoder.search([lat, long]).first
          self.skip_reverse_geocode = true
          self.update_attribute(:address, geocode.address) if geocode
        end
      rescue
        nil
      end
    end

    def save_url
      model = self.model
      type = self.imageable_type
      case model
      when 'Trainer'
        case type
        when 'Gallery'

        end         
      when 'Center'
        case type
        when 'Gallery'

        end
      when 'User'
        case type
        when 'Profile'
          User.where(id: self.imageable_id).update_all(photo_url: url)
        end       
      end     
    end

    def url
      image = ImageSerializer.new(self, :root => false)
      BASE_URL+image.image_url.to_s 
    end

    

end