# Week 2 - Carousel

Submitted by: Marc Haumann

Time spent: X hours spent in total

## User Stories

The following **required** functionality is complete:
* [X] Static photo tiles on the initial screen
* [X] Tapping on email/password reveals the keyboard and shifts the scrollview and Sign In button up.
* [X] If the username or password fields are empty, user sees an error alert.
* [X] If credentials are incorrect, user sees a loading indicator for 2 seconds followed by an error alert.
* [X] If the credentials are correct, user sees a loading indicator for 2 seconds followed by a transition to the Sign In screens.
* [X] User can page between the tutorial screens
* [X] Display a scrollable view of images in the timeline
* [X] User can tap on the conversations button to see the conversations screen (push)
* [X] User can tap on the profile image to see the settings view (bottom modal)
* [X] User can dismiss the conversations screen
* [X] User can dismiss the settings screen
* [X] User can log out

The following **optional** features are implemented:
* [X] Photo tiles move, scale, and rotate with scrolling
* [X] When the keyboard is visible, if the user pulls down on the scrollview, it will dismiss the keyboard.
* [ ] On sign in form appear, scale the form up and fade it in.
* [ ] Create a Dropbox flow
 * [ ] Tapping in the form reveals the keyboard and shifts the scrollview and "Create a Dropbox" button up
 * [ ] Tapping the Agree to Terms checkbox selects the checkbox
 * [ ] Tapping on Terms shows a webview with the terms
 * [ ] User is taken to the tutorial screens upon tapping the "Create a Dropbox" button
* [X] Dots update on tutorial screen paging
* [X] Upon reaching the 4th tutorial page, hide the dots and show the "Take Carousel for a Spin" button.
* [ ] Learn more about Carousel
 * [ ] Show the "Learn more about Carousel" button in the photo timeline.
 * [ ] Tap the X to dismiss the banner
 * [ ] Track event 1: View a photo full screen
 * [ ] Track event 2: Swipe left and right
 * [ ] Track event 3: Share a photo
 * [ ] Upon completion of the events, mark them green.
 * [ ] When all events are completed, dismiss the banner.

The following **additional** features are implemented:
- [X] the photo tile transitions are done in a for loop ("EnumerateSequence") so that code doesn't appear repeated 6 times
- [X] On sign in success, the keyboard hides, the button text fades out and the spinner animates to the center of the screen
- [X] on the walkthrough slides, the dots fade out, and the button fades in (both triggered by different events, one connected directly to scroll position and one triggered by the page #)

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='https://github.com/marchaumann/Dropbox/blob/master/dropbox.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with LICECap.

## Notes



## License

    Copyright 2016 Marc Haumann

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
