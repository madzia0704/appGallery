# appGallery

Here you have a simple gallery app. 
The list of 30 images data is fetching on app load and then all thumbnails are fetching too. After loading all initial data, Loading screen is replaced by Main app screen (Gallery of images). 
When user clicks on an image, dedicated detail screen is shown and full size image is downloading. “Send email” and “send MMS” buttons are disabled till the image is fetched.
Thumbnails and full size images are stored in the local cache.
User can send a photo via email or MMS.

## Loading app screen

 - Custom activity indicator is used

## Main app gallery screen

 Number of columns in the grid depends of screen size and orientation

## Detail screen
- When fetch full size image request is processed:
  - activity indicator is displayed 
  - buttons are disabled

## Unavailable services

I would like to present two different wayes of handling unavailable services:

###Send email:
send email button is disabled when email service is unavailable (for example when the app is run on simulator)

###Send MMS:
send MMS button is still active and popup message "Messages is unavailable" is displayed on click


##TO CONSIDER:
 - I’ve decided to fetch smaller images (thumbnails) at the first time, to reduce initial loading app time. The full size images are fetched  and stored on demand (when user open a detail screen).
 —There is possibility to fetch all full size images in the background thread -> no need to fetch full size image when user goes to the detail screen on the first time; increase stored data size ; store spare data
— There is possibility to fetch only list of images data (without thumbnail) on app start and show activity indicator in place of not fetched yet images -> Less data to fetch before going to the main (app gallery) screen

##TODO:
 - Pagination: Pre-fetch more data (next page data) when user scroll to the end of currently loaded list of images (for example: 30 images per page, start fetching the next page data when there is displayed the fifth element from the end of list (4 elements are still below the bottom line of the screen view).
 - Refresh data on swipedown at the top of grid (or empty screen when there is no images available)
 - Use variables to define some parameters e.g. itemsPerPage, image size, cache size, number of grid columns / max image size in the grid, urls
- Handle all errors and display error messages for user
- Tap on image in the detail screen to show full screen image view or full size of image (with scrolling possibility, zoom in / out)
- Add common style definition (font, colours, spacing ect.)
- Support VoiceOver, accessibility options, bigger font, higher contrast mode ( ect.
- Support internationalisation / translate
- Add offline mode support
- Handle synchronisation (if fetched data may be updated)
- Store the list of images data in local storage
- Add tests and coverage
- Add CI / CD
- Add info on loading screen: Fetched x / 30 images
- Re-fetch images, if failed
- Code refactoring and improvement (e.i. move all requests to services)

## MORE IDEAS
- Mark images as favourite and create favList
- Filter images by Author, size

