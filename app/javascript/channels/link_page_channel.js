import consumer from "./consumer"

const createLinkPageChannel = (linkPageId, options) => {
  return consumer.subscriptions.create(
    { channel: "LinkPageChannel", link_page: linkPageId },
    options
  );
};

export default createLinkPageChannel;
