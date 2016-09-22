module Onecloud
  # Server Images (templates)
  module Image
    # Get list of all available images
    def images
      get('Image')
    end

    # Create new Image
    # +Name+::string
    # +TechName+::number
    # +ServerID+::number
    def add_image(params)
      post('image', params)
    end

    # Delete Image
    def remove_image(id)
      delete("image/#{id}")
    end
  end
end
