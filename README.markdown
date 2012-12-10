# README

## TODO
* Better error handling/messages
* Image uploading: Edit Attachment component to just copy the image without resampling if it's already
  the proper width
* Push site title in Javascript dynamically

## Known Bugs
* Attachments: Certain validations on attachments don't display
* News: On first view of an edited post, the embed may fail to load.
* Venues: removing a field's contents on the editor removes whole page's contents (Probable CKEditor 4 bug).
* Embedded iframes will not load in inline editable content when logged in.
