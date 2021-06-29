if Rails.env == "production"
Rails.application.config.session_store :cookie_store, key: "_HFNSW", domain: "jdh-HFNSW-app-api.herokuapp.com"
else 
  Rails.application.config.session_store :cookie_store, key: "_HFNSW"
end
