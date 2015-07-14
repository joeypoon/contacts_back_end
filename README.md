# Contacts API

get 'users/:lat/:long/:id'
get '/:id/inbound' => 'users#inbound'
get '/:id/outbound' => 'users#outbound'

Example response:

    [
      {
        "id": 2,
        "contact_info": {
          "id": 2,
          "name": "Maiya Yundt",
          "email": "branson.homenick@larson.info",
          "phone": null,
          "company": null,
          "facebook": null,
          "instagram": null,
          "github": null,
          "linkedin": null,
          "twitter": null,
          "site": null,
          "user_id": "2",
          "created_at": "2015-07-10T00:55:41.126Z",
          "updated_at": "2015-07-10T00:55:41.126Z"
        }
      }
    ]

get '/:id/profile' => 'users#show'

post 'update' => 'users#update'

post 'share/:id/:user_id' => 'users#share'

Example Request:

  {
    "contact_info": {
      "email": "example@gmail.com",
      "phone": "123123123",
      "facebook": "facebook.com/username",
      "instagram": "instagram.com/username",
      "github": "github.com/username",
      "linkedin": "linkedin.com/in/username",
      "twitter": "twitter.com/username",
      "site": "username.com",
    }
  }

post 'login' => 'users#login'

Example Request:

  {
    "user": {
      "email": "example@gmail.com",
      "password": "password"
    }
  }

post 'users' => 'users#create'

Example Request

Example Request:

  {
    "user": {
      "name": "Joey F. Poon",
      "email": "example@gmail.com",
      "password": "password",
      "password_confirmation": "password"
    }
  }
