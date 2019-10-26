class LinkService
  def self.visit(link)
    # TODO: Can we make the create call async so that users aren't waiting on the DB before they get
    # sent to their link?
    link.link_visits.create

    ActionCable.server.broadcast(
      "link_page_#{link.link_page.id}",
      { visit_count: link.link_page.visit_count }
    )

    # TODO: What's the best way to handle redirecting the user here?
    # Having a controller concern in this feels like too much
    link.url
  end
end
