class Api::V1::DocsController < Api::BaseController

  include Swagger::Blocks

  swagger_root do
    key :swagger, '2.0'
    info do
      key :version, '1.0'
      key :title, 'FriendsManagement Api Docs'
      key :description, 'FriendsManagement Api v1 (swagger-2.0 specification)'
      key :termsOfService, '#'
      contact do
        key :name, 'FriendsManagement API Team'
      end
    end
    security_definition :bearer, type: :apiKey do
      key :name, :authorization
      key :in, :header
    end
    key :basePath, '/api/v1'
    key :consumes, ['application/json']
    key :produces, ['application/json']
  end

  SWAGGERED_CLASSES = [
    Api::V1::UsersSwagger,
    self
  ].freeze

  def index
    render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
  end

end
