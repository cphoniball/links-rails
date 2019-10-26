class LinkPageChannel < ApplicationCable::Channel
  def subscribed
    # TODO: Stream from the specific link page that connected
    stream_from "link_page_#{params[:link_page]}"
    puts "Streaming from link_page_#{params[:link_page]}"
  end

  def unsubscribed
    # TODO: Do we need this method? Not sure if we'll have cleanup work to do when people
    # unsuscribe to this channel
  end
end
