RailsAdmin.config do |config|
  RailsAdmin::ApplicationController.class_eval do
    skip_before_action :verify_authenticity_token
  end
  config.authenticate_with do
    authenticate_or_request_with_http_basic('Site Message') do |username, password|
      username == 'ksu' && password == 'ncsystems'
    end
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
