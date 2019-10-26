import consumer from "./consumer"

const createLinkPageChannel = (linkPageId, options) => {
  // TODO: How to pass link page ID here
  return consumer.subscriptions.create("LinkPageChannel", options);
};

export default createLinkPageChannel;
