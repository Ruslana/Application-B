class Messages < Grape::API
  version "v1", using: :header, vendor: "Vendor"
  format :json

  desc 'Create a message.'
  resource "messages" do
    get "/keep" do
      conn = Bunny.new
      conn.start

      ch = conn.create_channel
      q  = ch.queue("messages_to_db")

      q.subscribe(:block => true) do |delivery_info, properties, body|
        title, text, user, email = body.split(",")
        Message.create(title: title, body: text, user: user, email: email)
        delivery_info.consumer.cancel
      end
      conn.close
    end
  end
end
