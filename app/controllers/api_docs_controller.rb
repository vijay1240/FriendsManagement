class ApiDocsController < ApplicationController

  def friends_management_swagger
    @api_version = 1
    render layout: 'swagger'
  end
  

end
