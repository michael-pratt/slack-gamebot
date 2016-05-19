module SlackGamebot
  module Commands
    class Next < SlackRubyBot::Commands::Base
      def self.call(client, data, _match)
        reservation = ::Challenge.next(client.owner, data.channel, data.user)
        if reservation
          client.say(channel: data.channel, text: "#{data.user} has next game", gif: 'game')
        else
          client.say(channel: data.channel, text: '#{data.user} you already called next, calm down')
        end
      end
    end
  end
end
