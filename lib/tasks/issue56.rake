require 'rest-client'
require_relative 'request_helpers'

task issue56: :environment do

  project = DubbingProject.find_or_create_by!(name: 'Project-Issue56')

  payload = JSON.dump({
    "data": {
      "type": "dubbings",
      "attributes": {
        "name": "Dubbing-Issue56"
      },
      "relationships": {
        "project": {
          "data": {
            "type": "dubbing_projects",
            "id": "#{project.id}",
            "method": "update"
          }
        }
      }
    },
    "included": [
      {
        "type": "dubbing_projects",
        "id": "#{project.id}"
      }
    ]
  })

  request = RestClient::Request.new(
    method: :post,
    url: 'http://localhost:3000/api/v1/dubbings',
    headers: {accept: :json, content_type: :json},
    payload: payload
  )
  execute_request request

end