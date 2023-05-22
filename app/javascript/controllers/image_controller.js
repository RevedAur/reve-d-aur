import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    function handleFileSelect (evt) {
      const preview = document.getElementById('previewed-image')
      while (preview.firstChild) {
        preview.removeChild(preview.lastChild);
      }
      // Loop through the FileList and render image files as thumbnails.
      for (const file of evt.target.files) {

        // Render thumbnail.
        const span = document.createElement('span')
        const src = URL.createObjectURL(file)
        span.innerHTML = 
          `<img style="height: 75px; border: 1px solid #000; margin: 5px"` + 
          `src="${src}" title="${escape(file.name)}">`

        document.getElementById('previewed-image').insertBefore(span, null)
      }
    }

    document.getElementById('preview').addEventListener('change', handleFileSelect, false);
  }
}
