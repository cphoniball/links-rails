import { Controller } from "stimulus";
import { get } from 'lodash';

export default class extends Controller {
  static targets = ["input", "fileName"];

    open() {
        this.inputTarget.click();
    }

    setUploadedFilename(event) {
      const fileName = get(event, 'target.files[0].name');

      if (fileName) {
        this.fileNameTarget.textContent = fileName;
      } else {
        this.fileNameTarget.textContent = "Choose a file";
      }
    }
}
