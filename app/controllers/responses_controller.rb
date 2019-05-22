class ResponsesController < ActionController::API

  # this url will be the one you create with ngrok
  NGROK_URL = ""

  POSSIBLE_RESPONSES = ["It is certain.", "It is decidedly so.", "Without a doubt.", "Yes, definitely.", "You may rely on it.", "As I see it, yes.", "Most likely.", "The outlook good.", "Yes.", "All signs point to yes.", "Sorry, but no.", "I really do not think it will work out.", " Don't count on it.", "That my sources say no.", "It is very doubtful."]

  def answer
    render json:
    [
      {
        :action => 'talk',
        :text => 'Welcome to the Magic Eightball hotline. Ask your question and then press 1.',
        :bargeIn => true
      },
      {
        :action => 'input',
        :eventUrl => ["#{NGROK_URL}/caller_input"],
        :timeOut => '10'
      }
    ].to_json
  end

  def caller_input
    dtmf = params['dtmf'] || parsed_body['dtmf']

    if dtmf == '1'
      render json:
      [
        {
          :action => 'talk',
          :text => "My answer is: #{POSSIBLE_RESPONSES.sample}. I hope that helps. Thanks for calling the Magic Eightball hotline. Please call again whenever you need help making a decision in life. Goodbye.",
        }
      ].to_json
    else
      render json:
      [{:action => 'talk', :text => 'I did not recognize your selection. Please call back and try again.'}].to_json
    end
  end

  def event
    puts params
  end
end
