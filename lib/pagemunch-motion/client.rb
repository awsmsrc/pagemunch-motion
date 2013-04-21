module Pagemunch
  class Client
    def summary(url, onComplete:block)
      query('summary', forUrl:url, onComplete:block)
    end

    def classify(url, onComplete:block)
      query('classify', forUrl:url, onComplete:block)
    end

    private

    def urlForAction(action, withTargetUrl:targetUrl)
      "http://api.pagemunch.com/#{configuration[:version]}/#{action}.json?key=#{configuration[:key]}&url=#{targetUrl}"
    end

    def configuration
      Pagemunch.configuration
    end

    def query(action, forUrl:url, onComplete:block)
      target = urlForAction(action, withTargetUrl:url)
      Dispatch::Queue.concurrent.async do 
        json = nil
        begin
          json = JSONParser.parse_from_url(target)
        rescue RuntimeError => e
          presentError e.message
        end

        Dispatch::Queue.main.sync { block.call(json) }
      end
    end
  end
end
