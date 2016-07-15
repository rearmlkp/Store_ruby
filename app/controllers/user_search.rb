require_relative 'ElasticsearchClient'

class UserSearch

  def self.create_user(auth)
    #Create client
    client = ElasticsearchClient.new

    #Call search to elastic, then parse result as JSON
    user = JSON.parse(client.search index: 'store', type: 'user', body:
        {
            "query": {
                "filtered": {
                    "query": {
                        "match": {
                            "_id": auth['provider']+auth['uid']
                        }
                    },
                    "filter": {
                        "term": {
                            "provider": auth['provider']
                        }
                    }
                }
            }
        }
    )

    #2 case to create a user: have error ( index not found... ) or search not found ( new user )
    #id = auth['provider']+auth['uid'] for all case
    if user['error'] != nil || user['hits']['total'] == 0
      client.index index: 'store', type: 'user', id: auth['provider']+auth['uid'], body: auth
    end
  end


  def self.get_user(id)

    #Create client
    client = ElasticsearchClient.new

    #Return a hash, contain user info
    JSON.parse(client.get index: 'store', type: 'user', id: id)
  end

  def self.update(auth)
    #Create client
    client = ElasticsearchClient.new
    client.index index: 'store', type: 'user', id: auth['_id'], body: auth['_source']
  end

end