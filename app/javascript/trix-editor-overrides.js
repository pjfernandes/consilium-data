// app/javascript/trix-editor-overrides.js
window.addEventListener("trix-file-accept", function (event) {
  const acceptedTypes = ['image/jpg','image/jpeg', 'image/png']
  if (!acceptedTypes.includes(event.file.type)) {
    event.preventDefault()
    alert("Only support attachment of jpeg or png files")
  }
});
