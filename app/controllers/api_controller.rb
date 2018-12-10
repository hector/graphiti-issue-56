class ApiController < ApplicationController
  ### Graphiti-api

  include Graphiti::Rails
  include Graphiti::Responders

  register_exception Graphiti::Errors::RecordNotFound,
                     status: 404

  unless Rails.env.development? # let exceptions crash when developing to get the stack trace
    rescue_from Exception do |e|
      handle_exception(e)
    end
  end

  ### END Graphiti-api

  # define the resource in the children controllers
  # do not use "resource_class" name since it clashes with devise-token-auth
  class_attribute :graphiti_resource_class

  def index
    resources = graphiti_resource_class.all(params)
    respond_with(resources)
  end

  def show
    resource = graphiti_resource_class.find(params)
    respond_with(resource)
  end

  def create
    resource = graphiti_resource_class.build(params)

    if resource.save
      render jsonapi: resource, status: 201
    else
      render jsonapi_errors: resource
    end
  end

  def update
    resource = graphiti_resource_class.find(params)

    if resource.update_attributes
      render jsonapi: resource
    else
      render jsonapi_errors: resource
    end
  end

  def destroy
    resource = graphiti_resource_class.find(params)

    if resource.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: resource
    end
  end

end