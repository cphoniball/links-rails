import { Controller } from "stimulus"

import createLinkPageChannel from "../channels/link_page_channel"

export default class extends Controller {
  static targets = ["visitCount"];

  connect() {
    this.channel = createLinkPageChannel(this.data.get('id'), {
      received: ({ visit_count }) => {
        this.setVisitCount(visit_count);
      }
    });
  }

  disconnect() {
    this.channel.unsubscribe();
  }

  setVisitCount(count) {
    this.visitCountTarget.textContent = `Visited ${count} ${count === 1 ? 'time' : 'times'}`;
  }
}

