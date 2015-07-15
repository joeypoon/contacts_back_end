# Contacts API

get 'users/:lat/:lng/:id'<br>
get 'inbound/:id'<br>
get 'outbound/:id' => 'users#outbound'<br>
get 'contacts/:id'<br>
Example response:

    [
      {
        "id": 2,
        "name": "Maiya Yundt",
        "email": "branson.homenick@larson.info",
        "contact_info": {
          "id": 2,
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

get 'profile/:id'<br>
Example Response:

    {
      "id": 1,
      "name": "Micaela Dare V",
      "email": "jody@christiansen.org",
      "phone": "(182) 887-4266",
      "company": "Hessel LLC",
      "facebook": "http://facebook.com/demario-wilkinson-v/dakota_gusikowski",
      "instagram": "http://instagram.com/thea-davis-iv/elmira",
      "github": "http://github.com/maryam-goldner/kaandra.terry",
      "linkedin": "http://linkedin.com/dario-daniel/chanel",
      "twitter": "http://twitter.com/zola-schimmel/trisha.beier",
      "site": "http://willow-huel.com",
      "avatar": "https://s3.amazonaws.com/contacts-bee/default.png"
    }

get 'contacts/profile/:id/:user_id'<br>
Example Response:

    {
      "user": {
        "id": 1,
        "avatar": "https://s3.amazonaws.com/contacts-bee/default.png",
        "name": "Micaela Dare V",
        "company": "Hessel LLC",
        "email": "jody@christiansen.org"
      }
    }

post 'update' => 'users#update'<br>
Example Request:

    {
      "user": {
        "name": "blah",
        "email": "blah@gmail.com"
      }
    }

post 'share/:id/:user_id' => 'users#share'<br>
Example Request:

    {
      "share": {
        "phone": false,
        "facebook": false,
        "instagram": false,
        "github": true,
        "linkedin": true,
        "twitter": true,
        "site": true,
      }
    }

post 'login' => 'users#login'<br>
Example Request:

    {
      "user": {
        "email": "example@gmail.com",
        "password": "password"
      }
    }

post 'users' => 'users#create'<br>
Example Request:

    {
      "user": {
        "name": "Joey F. Poon",
        "email": "example@gmail.com",
        "password": "password",
        "password_confirmation": "password"
      }
    }

delete 'inbound/:id/:user_id' => 'users#destroy_inbound'<br>
delete 'outbound/:id/:user_id' => 'users#destroy_outbound'<br>
delete 'contacts/:user_id' => 'users#destroy_contact'<br>
