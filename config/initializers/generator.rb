# frozen_string_literal: true

Rails.application.config.generators do |g|
  g.helper = false
  g.assets = false
  g.orm :active_record, primary_key_type: :uuid
  g.test_framework :rspec,
                   view_specs: false,
                   request_specs: true,
                   controller_specs: false
end
