class CategorySerializer < ActiveModel::Serializer
	include AttachmentsHelper
	
  attributes :id, :name, :productsCount, :images

  def productsCount
  	object.products.size
  end

  def images
  	get_attachment_url(object&.images)
  end
end