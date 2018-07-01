module Api::V1::UsersSwagger
  include Swagger::Blocks
  swagger_path "/users/friend" do
    operation :post do
      key :description, 'API to create a friend connection between two email
addresses'
      key :operationId, 'users'
      key :tags, [
        'Add Friends'
      ]

      parameter do
        key :name, :user_email
        key :in, :formData
        key :description, 'User Email'
        key :type, :string
        key :required, true
      end

      parameter do
        key :name, :friend_email
        key :in, :formData
        key :description, 'User Email'
        key :type, :string
        key :required, true
      end

      response 200 do
        key :description, 'Users Response'
      end
      response 401 do
        key :description, 'Bad credentials, status: unauthorized'
      end
      response 404 do
        key :description, 'User Not found'
        key :error, :user_not_found
      end
      security bearer: []
    end
  end

  swagger_path "/users/unfriend" do
    operation :put do
      key :description, 'Disconnect two friends'
      key :operationId, 'users'
      key :tags, [
        'UnFriend'
      ]

      parameter do
        key :name, :user_email
        key :in, :formData
        key :description, 'User Email'
        key :type, :string
        key :required, true
      end

      parameter do
        key :name, :friend_email
        key :in, :formData
        key :description, 'User Email'
        key :type, :string
        key :required, true
      end

      response 200 do
        key :description, 'Users Response'
      end
      response 401 do
        key :description, 'Bad credentials, status: unauthorized'
      end
      response 404 do
        key :description, 'User Not found'
        key :error, :user_not_found
      end
      security bearer: []
    end
  end

  swagger_path "/users/friends_list" do
    operation :get do
      key :description, 'API to create a friend connection between two email
addresses'
      key :operationId, 'users'
      key :tags, [
        'Friends List'
      ]

      parameter do
        key :name, :email
        key :in, :query
        key :description, 'Users email'
        key :required, true
        key :type, :string
      end

      response 200 do
        key :description, 'Users Response'
      end
      response 401 do
        key :description, 'Bad credentials, status: unauthorized'
      end
      response 404 do
        key :description, 'User Not found'
        key :error, :user_not_found
      end
      security bearer: []
    end
  end

  swagger_path "/users/mutual_friends" do
    operation :get do
      key :description, 'API to retrieve the common friends list between two
email addresses'
      key :operationId, 'users'
      key :tags, [
        'Common Friends List'
      ]

      parameter do
        key :name, :user_email
        key :in, :query
        key :description, 'User email'
        key :required, true
        key :type, :string
      end

      parameter do
        key :name, :friend_email
        key :in, :query
        key :description, 'User email'
        key :required, true
        key :type, :string
      end

      response 200 do
        key :description, 'Users Response'
      end
      response 401 do
        key :description, 'Bad credentials, status: unauthorized'
      end
      response 404 do
        key :description, 'User Not found'
        key :error, :user_not_found
      end
      security bearer: []
    end
  end

  swagger_path "/users/subscribe_to_updates" do
    operation :post do
      key :description, 'API to subscribe to updates from an email address'
      key :operationId, 'users'
      key :tags, [
        'Subscribe To Updates'
      ]

      parameter do
        key :name, :requestor
        key :in, :formData
        key :description, 'User Email'
        key :type, :string
        key :required, true
      end

      parameter do
        key :name, :target
        key :in, :formData
        key :description, 'User Email'
        key :type, :string
        key :required, true
      end

      response 200 do
        key :description, 'Users Response'
      end
      response 401 do
        key :description, 'Bad credentials, status: unauthorized'
      end
      response 404 do
        key :description, 'User Not found'
        key :error, :user_not_found
      end
      security bearer: []
    end
  end

  swagger_path "/users/block_updates" do
    operation :put do
      key :description, 'API to block updates from an email address'
      key :operationId, 'users'
      key :tags, [
        'Block Updates'
      ]

      parameter do
        key :name, :requestor
        key :in, :formData
        key :description, 'User Email'
        key :type, :string
        key :required, true
      end

      parameter do
        key :name, :target
        key :in, :formData
        key :description, 'User Email'
        key :type, :string
        key :required, true
      end

      response 200 do
        key :description, 'Users Response'
      end
      response 401 do
        key :description, 'Bad credentials, status: unauthorized'
      end
      response 404 do
        key :description, 'User Not found'
        key :error, :user_not_found
      end
      security bearer: []
    end
  end

  swagger_path "/users/can_receive_updates" do
    operation :get do
      key :description, 'API to retrieve all email addresses that can receive
updates from an email address'
      key :operationId, 'users'
      key :tags, [
        'Can Receive Updates'
      ]

      parameter do
        key :name, :email
        key :in, :query
        key :description, 'User Email'
        key :type, :string
        key :required, true
      end

      parameter do
        key :name, :message
        key :in, :query
        key :description, 'text'
        key :type, :string
        key :required, true
      end

      response 200 do
        key :description, 'Users Response'
      end
      response 401 do
        key :description, 'Bad credentials, status: unauthorized'
      end
      response 404 do
        key :description, 'User Not found'
        key :error, :user_not_found
      end
      security bearer: []
    end
  end


end
