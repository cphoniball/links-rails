import { Controller } from "stimulus"

import createLinkPageChannel from "../channels/link_page_channel"

export default class extends Controller {
  static targets = ["visitCount"];

  connect() {
    // TODO: Get the actual link page id from stimulus
    createLinkPageChannel(1, {
      received: (data) => {
        this.setVisitCount(data.visit_count);
      }
    });

    // TODO: Unsubscribe from the channel when this stimulus controller unmounts?
  }

  setVisitCount(count) {
    this.visitCountTarget.textContent = `Visited ${count} ${count === 1 ? 'time' : 'times'}`;
  }
}

